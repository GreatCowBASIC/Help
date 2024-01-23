/******************************************************************************
  * Copyright(c) 2023 Levetop Semiconductor Co., Ltd. All rights reserved
  * @file      main.c
  * @author    Levetop TFT Controller Application Team
  * @version   V1.0.0
  * @date      2023-02-24
  * @brief     Operating functions for Resistive TP, using TSC2046 chip
*******************************************************************************/

#include "rtp.h"

/*---------------------------------------------------------------------------------------*/
/* Function:    LT_TpDelay                                                               */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Delay for ADC converter                                                  */
/*---------------------------------------------------------------------------------------*/
void LT_TpDelay(void)
{
	u8 t = 1;
	while(t--)
	{
		__NOP();
		__NOP();
		__NOP();
		__NOP();
		__NOP();
	}
}

#define CMD_RDX 0XD0      // TP chip command -> Read X coordinate 
#define CMD_RDY 0X90      // TP chip command -> Read Y coordinate

/*---------------------------------------------------------------------------------------*/
/* Function:    LT_TpInit                                                                */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     1                                                                        */
/* Description: Initialize related GPIO port                                             */
/*---------------------------------------------------------------------------------------*/
u8 LT_TpInit(void)
{
	TP_io_init();
	delay_ms(10);
	return 1;
}

/*---------------------------------------------------------------------------------------*/
/* Function:    TP_Write_Byte                                                            */
/*                                                                                       */
/* Parameters:                                                                           */
/*              num: Data to be written                                                  */
/* Returns:     None                                                                     */
/* Description: Write a command byte to the TP chip through simulated SPI                */
/*---------------------------------------------------------------------------------------*/
void TP_Write_Byte(u8 num)
{
	u8 count=0;
	for(count=0;count<8;count++)
	{
		if(num&0x80) TDIN(Bit_SET);
		else         TDIN(Bit_RESET);
		num<<=1;
		TCLK(Bit_RESET);
		LT_TpDelay();
		TCLK(Bit_SET);
	}
}

/*---------------------------------------------------------------------------------------*/
/* Function:    TP_Read_Data                                                             */
/*                                                                                       */
/* Parameters:                                                                           */
/*              CMD: the command to be written                                           */
/* Returns:                                                                              */
/*              u16: return read data                                                    */
/* Description: Write a command to the TP chip through simulated SPI                     */
/*---------------------------------------------------------------------------------------*/
u16 TP_Read_AD(u8 CMD)
{
	u8 count=0; 	  
	u16 Num=0; 
	TCLK(Bit_RESET);						// Pull-low clock 	 
	TDIN(Bit_RESET); 						// Pull-low data line
	TCS(Bit_RESET); 				     	// Select Touch IC
	TP_Write_Byte(CMD);						// Issue the read command
	LT_TpDelay();							// Converting time is 6us the most
	TCLK(Bit_RESET); 	     	    
	LT_TpDelay();    	   
	TCLK(Bit_SET);													
	LT_TpDelay();    
	TCLK(Bit_RESET); 	     	    
	for(count=0;count<16;count++)			// Read 16bit data -> only 12bits (MSB) are valid  
	{ 				  
		Num<<=1; 	 
		TCLK(Bit_RESET);					// Valid on the falling edge  	    	   
		LT_TpDelay();    
 		TCLK(Bit_SET);
 		if(DOUT)Num++; 		 
	}  	
	Num>>=4;   								// Only 12bits (MSB) data are valid
	TCS(Bit_SET);							// Deselect the Touch IC		
	return(Num);   
}

/*---------------------------------------------------------------------------------------*/
/* Function:    TP_Read_XOY                                                              */
/*                                                                                       */
/* Parameters:                                                                           */
/*               xy: the command to be written, CMD_RDX/CMD_RDY                          */
/* Returns:                                                                              */
/*              u16: return read value                                                   */
/* Description: Retrieve a coordinate (x or y)                                           */
/*              Get rid of the lowest and highest value, and calculate the average value */ 
/*---------------------------------------------------------------------------------------*/
#define READ_TIMES 8 	  								// Times for reading data
#define LOST_VAL 2	  									// The amount of data to be ignored
u16 TP_Read_XOY(u8 xy)
{
	u16 i, j;
	u16 buf[READ_TIMES];
	u16 sum=0;
	u16 temp;
	for(i=0;i<READ_TIMES;i++)buf[i]=TP_Read_AD(xy);
	for(i=0;i<READ_TIMES-1; i++)				        // Sorting
	{
		for(j=i+1;j<READ_TIMES;j++)
		{
			if(buf[i]>buf[j])					        // Ascending sorting
			{
				temp=buf[i];
				buf[i]=buf[j];
				buf[j]=temp;
			}
		}
	}
	sum=0;
	for(i=LOST_VAL;i<READ_TIMES-LOST_VAL;i++)sum+=buf[i];
	temp=sum/(READ_TIMES-2*LOST_VAL);
	return temp;
}

/*---------------------------------------------------------------------------------------*/
/* Function:    TP_Read_XY                                                               */
/*                                                                                       */
/* Parameters:                                                                           */
/*              *x: x coordinate                                                         */
/*              *y: y coordinate                                                         */
/* Returns:                                                                              */
/*              u8: 0 -> out of range, 1 -> OK                                           */
/* Description: Read x and y coordinate                                                  */
/*---------------------------------------------------------------------------------------*/
u8 TP_Read_XY(u16 *x,u16 *y)
{
	*x=TP_Read_XOY(CMD_RDX);
	*y=TP_Read_XOY(CMD_RDY);
	if(*x>4095||*y>4095)	return 0;			 // Out of range
	return 1;
}

/*---------------------------------------------------------------------------------------*/
/* Function:    TP_Read_XY2                                                              */
/*                                                                                       */
/* Parameters:                                                                           */
/*              *x: x coordinate                                                         */
/*              *y: y coordinate                                                         */
/* Returns:                                                                              */
/*              u8: 0 -> out of range, 1 -> OK                                           */
/* Description: Read x and y coordinate                                                  */
/*              Read TP chip twice, and the difference of the two values must not        */
/*              exceed ERR_RANGE. If the difference exceeds ERR_RANGE, then the value    */
/*              is incorrect                                                             */
/*---------------------------------------------------------------------------------------*/
#define ERR_RANGE 50 	 // Tolerence range
u8 TP_Read_XY2(u16 *x,u16 *y)
{
	u16 x1,y1;
 	u16 x2,y2;
 	u8 flag;
	flag=TP_Read_XY(&x1,&y1);
	if(flag==0)return(0);
	flag=TP_Read_XY(&x2,&y2);
	if(flag==0)return(0);
	if(((x2<=x1&&x1<x2+ERR_RANGE)||(x1<=x2&&x2<x1+ERR_RANGE))   // Check if within the tolerence range (+/- ERR_RANGE)
	&&((y2<=y1&&y1<y2+ERR_RANGE)||(y1<=y2&&y2<y1+ERR_RANGE)))
	{
		*x=(x1+x2)/2;
		*y=(y1+y2)/2;
		return 1;
	}
	else
	{
		return 0;
	}
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT_TpScan                                                                */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:                                                                              */
/*              1: TP is touched,    0: TP is untouched                                  */
/* Description: Scan the TP and check if it is touched                                   */
/*---------------------------------------------------------------------------------------*/
u8 LT_TpScan(void)
{
	u16 px,py;
	
	if(PEN==0)
	{
		if(TP_Read_XY2(&px,&py))
		
		printf("px:%d py:%d\r\n",px,py);

		return 1;
 	}
	else
	{
		return 0;
	}
}












