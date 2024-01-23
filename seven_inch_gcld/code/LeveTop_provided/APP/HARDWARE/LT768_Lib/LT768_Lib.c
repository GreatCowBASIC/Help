/******************************************************************************
  * Copyright(c) 2023 Levetop Semiconductor Co., Ltd. All rights reserved
  * @file      LT768_Lib.c
  * @author    Levetop TFT Controller Application Team
  * @version   V1.3
  * @date      2023-07-27
  * @brief     LT768x Function Libraries 
*******************************************************************************/

#include "LT768_Lib.h"
#include "usart.h"
#include "delay.h"
#include "if_port.h"
#include "LT768_Demo.h"

unsigned char CCLK;    // LT768 Core Clock    
unsigned char MCLK;    // SDRAM Clock
unsigned char SCLK;    // LCD Scan Clock

//---------------------------------------------------------------------------------------------------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_HW_Reset                                                           */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: LT768x Hardware                                                          */
/*---------------------------------------------------------------------------------------*/
void LT768_HW_Reset(void)
{	
	GPIO_InitTypeDef GPIO_InitStructure;
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_3;			
 	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 	
 	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
 	GPIO_Init(GPIOA, &GPIO_InitStructure);

	GPIO_ResetBits(GPIOA, GPIO_Pin_3);
	delay_ms(50);
    GPIO_SetBits(GPIOA, GPIO_Pin_3);
    delay_ms(100);
}

/*---------------------------------------------------------------------------------------*/
/* Function:    System_Check_Temp                                                        */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: LT768x System Check                                                      */
/*---------------------------------------------------------------------------------------*/
void System_Check_Temp(void)
{
	unsigned char i=0;
	unsigned char temp=0;
	unsigned char system_ok=0;
	do
	{
		//printf("LCD status: %x \r\n",LCD_StatusRead());
		if((LCD_StatusRead()&0x02)==0x00)    
		{
			delay_ms(1);                  
			LCD_CmdWrite(0x01);
			delay_ms(1);                  
			temp =LCD_DataRead();
			//printf("%x \r\n",temp);
			if((temp & 0x80)==0x80)       // Check if CCR register and PLL are ready
			{
				system_ok=1;
				i=0;
			}
			else
			{
				delay_ms(1); 
				LCD_CmdWrite(0x01);
				delay_ms(1); 
				LCD_DataWrite(0x80);
			}
		}
		else
		{
			system_ok=0;
			i++;
		}
		if(system_ok==0 && i==5)
		{
			LT768_HW_Reset(); 
			i=0;
		}
	}while(system_ok==0);
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_PLL_Initial                                                        */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Initialize PLL Clock                                                     */
/*---------------------------------------------------------------------------------------*/
void LT768_PLL_Initial(void) 
{    
	unsigned int  temp = 0,temp1 =0 ;
	
	unsigned short lpllOD_sclk, lpllOD_cclk, lpllOD_mclk;
	unsigned short lpllR_sclk, lpllR_cclk, lpllR_mclk;
	unsigned short lpllN_sclk, lpllN_cclk, lpllN_mclk;
	
	temp = (LCD_HBPD + LCD_HFPD + LCD_HSPW + LCD_XSIZE_TFT) * (LCD_VBPD + LCD_VFPD + LCD_VSPW+LCD_YSIZE_TFT) * 60;   
	
	temp1=(temp%1000000)/100000;
	if(temp1>=5) 
		 temp = temp / 1000000 + 1;
	else temp = temp / 1000000;
	
	SCLK = temp;
	MCLK = temp * 3;
	CCLK = temp * 3;
	
	if(CCLK > 100)	CCLK = 100;
	if(MCLK > 100)	MCLK = 100;
	if(SCLK > 65)	SCLK = 65;

	
#if XI_4M 	
	
	lpllOD_sclk = 3;
	lpllOD_cclk = 3;
	lpllOD_mclk = 3;
	lpllR_sclk  = 2;
	lpllR_cclk  = 2;
	lpllR_mclk  = 2;
	lpllN_mclk  = 2*MCLK;      
	lpllN_cclk  = 2*CCLK;    
	lpllN_sclk  = 2*SCLK; 
	
#endif

#if XI_8M 	
	
	lpllOD_sclk = 3;
	lpllOD_cclk = 3;
	lpllOD_mclk = 3;
	lpllR_sclk  = 2;
	lpllR_cclk  = 2;
	lpllR_mclk  = 2;
	lpllN_mclk  = MCLK;      
	lpllN_cclk  = CCLK;    
	lpllN_sclk  = SCLK; 
	
#endif

#if XI_10M 	
	
	lpllOD_sclk = 3;
	lpllOD_cclk = 3;
	lpllOD_mclk = 3;
	lpllR_sclk  = 5;
	lpllR_cclk  = 5;
	lpllR_mclk  = 5;
	lpllN_mclk  = 2*MCLK;      
	lpllN_cclk  = 2*CCLK;    
	lpllN_sclk  = 2*SCLK; 
	
#endif

#if XI_12M 	
	
	lpllOD_sclk = 3;
	lpllOD_cclk = 3;
	lpllOD_mclk = 3;
	lpllR_sclk  = 3;
	lpllR_cclk  = 3;
	lpllR_mclk  = 3;
	lpllN_mclk  = MCLK;      
	lpllN_cclk  = CCLK;    
	lpllN_sclk  = SCLK; 
	
#endif     
      
	LCD_CmdWrite(0x05);
	LCD_DataWrite((lpllOD_sclk<<6) | (lpllR_sclk<<1) | ((lpllN_sclk>>8)&0x1));
	LCD_CmdWrite(0x07);
	LCD_DataWrite((lpllOD_mclk<<6) | (lpllR_mclk<<1) | ((lpllN_mclk>>8)&0x1));
	LCD_CmdWrite(0x09);
	LCD_DataWrite((lpllOD_cclk<<6) | (lpllR_cclk<<1) | ((lpllN_cclk>>8)&0x1));

	LCD_CmdWrite(0x06);
	LCD_DataWrite(lpllN_sclk);
	LCD_CmdWrite(0x08);
	LCD_DataWrite(lpllN_mclk);
	LCD_CmdWrite(0x0a);
	LCD_DataWrite(lpllN_cclk);
      
	LCD_CmdWrite(0x00);
	delay_us(1);
	LCD_DataWrite(0x80);

	delay_ms(1);	
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_SDRAM_initial                                                      */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: LT768x Hardware                                                          */
/*---------------------------------------------------------------------------------------*/
void LT768_SDRAM_initail(unsigned char mclk)
{
	unsigned short sdram_itv;
	
	LCD_RegisterWrite(0xe0,0x29);      
	LCD_RegisterWrite(0xe1,0x03);	// CAS:2=0x02�ACAS:3=0x03
    sdram_itv = (64000000 / 8192) / (1000/mclk) ;
    sdram_itv-=2;

	LCD_RegisterWrite(0xe2,sdram_itv);
	LCD_RegisterWrite(0xe3,sdram_itv >>8);
	LCD_RegisterWrite(0xe4,0x01);
	Check_SDRAM_Ready();
	delay_ms(1);
}

/*---------------------------------------------------------------------------------------*/
/* Function:    Set_LCD_Panel                                                            */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Set LCD panel related parameters                                         */
/*---------------------------------------------------------------------------------------*/
void Set_LCD_Panel(void)
{
	#if STM32_S_8080
		Host_Bus_8bit();    // Host Bus 8bit
	#else
		Host_Bus_16bit();	// Host Bus 16bit
	#endif
	
	    
	PCLK_Falling();	       	// REG[12h]: Falling edge 
	//PCLK_Rising();
	
	HSYNC_Low_Active();     // REG[13h]:		  
	//HSYNC_High_Active();
	
	VSYNC_Low_Active();     // REG[13h]:			
	//VSYNC_High_Active();
	
	DE_High_Active();       // REG[13h]:	
	//DE_Low_Active();

	VSCAN_T_to_B();	        // REG[12h]: Scan from top to bottom
	//VSCAN_B_to_T();		// From bottom to top

	LCD_HorizontalWidth_VerticalHeight(LCD_XSIZE_TFT ,LCD_YSIZE_TFT);	
	LCD_Horizontal_Non_Display(LCD_HBPD);	                            
	LCD_HSYNC_Start_Position(LCD_HFPD);	                              
	LCD_HSYNC_Pulse_Width(LCD_HSPW);		                            	
	LCD_Vertical_Non_Display(LCD_VBPD);	                                
	LCD_VSYNC_Start_Position(LCD_VFPD);	                              
	LCD_VSYNC_Pulse_Width(LCD_VSPW);

	PDATA_Set_RGB();        // REG[12h]:Select RGB output
	//PDATA_Set_RBG();
	//PDATA_Set_GRB();
	//PDATA_Set_GBR();
	//PDATA_Set_BRG();
	//PDATA_Set_BGR();


#if  LCD_16bit
		TFT_16bit();
		RGB_16b_16bpp();
		Memory_16bpp_Mode();
		Select_Main_Window_16bpp();
#endif

#if  LCD_24bit
		TFT_24bit();
		RGB_16b_24bpp_mode1();
		Memory_24bpp_Mode();
		Select_Main_Window_24bpp();
#endif

	MemWrite_Left_Right_Top_Down();	
//	MemWrite_Down_Top_Left_Right();
     
	Graphic_Mode();
	Memory_Select_SDRAM();
 	Memory_XY_Mode();	          //Block mode (X-Y coordination addressing)

}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_initial                                                            */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Initialize LT768 PLL, SDRAM, and LCD panel related parameters            */
/*---------------------------------------------------------------------------------------*/
void LT768_initial(void)
{
	LT768_PLL_Initial();
	LT768_SDRAM_initail(MCLK);
	Set_LCD_Panel();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Init                                                               */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Initialize LT768                                                         */
/*---------------------------------------------------------------------------------------*/
void LT768_Init(void)
{
	delay_ms(100);                    // Delay for LT768 power on
	LT768_HW_Reset();                 // LT768 hardware reset
	System_Check_Temp();	          // Check if reset is successfully done
	delay_ms(100);
	while(LCD_StatusRead()&0x02);	  // Initial_Display_test and set SW2 pin2 = 1
	LT768_initial();
}



//--------------------------------------------------------------------------------------------------------------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    MPU8_8bpp_Memory_Write                                                   */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                  x: x coordinate                                                      */
/*                  y: y coordinate                                                      */
/*                  w: data width                                                        */
/*                  h: data height                                                       */
/*              *data: the first data address                                            */
/* Returns:     None                                                                     */
/* Description: MCU writes 8bpp data to LT768x SDRAM by sending 8bits data at a time     */
/*---------------------------------------------------------------------------------------*/
void MPU8_8bpp_Memory_Write
(
 unsigned short x           
,unsigned short y           
,unsigned short w           
,unsigned short h           
,const unsigned char *data  
)
{														  
	unsigned short i,j;
	Graphic_Mode();
    Active_Window_XY(x,y);
	Active_Window_WH(w,h); 					
	Goto_Pixel_XY(x,y);
	LCD_CmdWrite(0x04);	
	for(i=0;i< h;i++)
	{	
		for(j=0;j< w;j++)
		{	   
			Check_Mem_WR_FIFO_not_Full();
			LCD_DataWrite(*data);
			data++;
		}
	}
	Check_Mem_WR_FIFO_Empty();
}	 

/*---------------------------------------------------------------------------------------*/
/* Function:    MPU8_16bpp_Memory_Write                                                  */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                  x: x coordinate                                                      */
/*                  y: y coordinate                                                      */
/*                  w: data width                                                        */
/*                  h: data height                                                       */
/*              *data: the first data address                                            */
/* Returns:     None                                                                     */
/* Description: MCU writes 16bpp data to LT768x SDRAM by sending 8bits data at a time    */
/*---------------------------------------------------------------------------------------*/			
void MPU8_16bpp_Memory_Write
(
 unsigned short x           
,unsigned short y           
,unsigned short w           
,unsigned short h           
,const unsigned char *data  
)
{
	unsigned short i,j;
	Graphic_Mode();
    Active_Window_XY(x,y);
	Active_Window_WH(w,h); 					
	Goto_Pixel_XY(x,y);
	LCD_CmdWrite(0x04);
	for(i=0;i< h;i++)
	{	
		for(j=0;j< w;j++)
		{
			Check_Mem_WR_FIFO_not_Full();
			LCD_DataWrite(*data);
			data++;
			Check_Mem_WR_FIFO_not_Full();
			LCD_DataWrite(*data);
			data++;
		}
	}
	Check_Mem_WR_FIFO_Empty();
}


/*---------------------------------------------------------------------------------------*/
/* Function:    MPU8_16bpp_Memory_Write_Continuous                                       */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                  x: x coordinate                                                      */
/*                  y: y coordinate                                                      */
/*                  w: data width                                                        */
/*                  h: data height                                                       */
/*              *data: the first data address                                            */
/* Returns:     None                                                                     */
/* Description: MCU continuously writes 16bpp data to LT768x SDRAM by sending 8bits data */
/*              at a time                                                                */
/*---------------------------------------------------------------------------------------*/			
void MPU8_16bpp_Memory_Write_Continuous
(
 unsigned short x           
,unsigned short y           
,unsigned short w           
,unsigned short h           
,const unsigned char *data  
)
{
	unsigned short i,j;
	Graphic_Mode();
    Active_Window_XY(x,y);
	Active_Window_WH(w,h); 					
	Goto_Pixel_XY(x,y);
	LCD_CmdWrite(0x04);
	
#if	STM32_SPI_8
	
	SS_RESET;                      // CS pin is only toggled once
	SPI2_ReadWriteByte(0x80);
	for(i=0;i< h;i++)              // Continuous data write 
	{	
		for(j=0;j< w;j++)
		{
			SPI2_ReadWriteByte(*data);
			data++;
			SPI2_ReadWriteByte(*data);
			data++;
		}
	}
	SS_SET;
	Check_Mem_WR_FIFO_not_Full();
	Check_Mem_WR_FIFO_Empty();

#endif

#if STM32_S_8080
	
	for(i=0;i< h;i++)              // Continuous data write 
	{	
		for(j=0;j< w;j++)
		{
			LCD_DataWrite(*data);
			data++;
			LCD_DataWrite(*data);
			data++;
		}
	}

	Check_Mem_WR_FIFO_not_Full();
	Check_Mem_WR_FIFO_Empty();
#endif


}		 


/*---------------------------------------------------------------------------------------*/
/* Function:    MPU8_24bpp_Memory_Write                                                  */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                  x: x coordinate                                                      */
/*                  y: y coordinate                                                      */
/*                  w: data width                                                        */
/*                  h: data height                                                       */
/*              *data: the first data addrs                                              */
/* Returns:     None                                                                     */
/* Description: MCU writes 24bpp data to LT768x SDRAM by sending 8bits data at a time    */
/*---------------------------------------------------------------------------------------*/	
void MPU8_24bpp_Memory_Write 
(
 unsigned short x           
,unsigned short y           
,unsigned short w           
,unsigned short h           
,const unsigned char *data  
)

{
	unsigned short i,j;
	Graphic_Mode();
    Active_Window_XY(x,y);
	Active_Window_WH(w,h); 					
	Goto_Pixel_XY(x,y);
	LCD_CmdWrite(0x04);
	for(i=0;i< h;i++)
	{	
		for(j=0;j< w;j++)
		{
			Check_Mem_WR_FIFO_not_Full();
			LCD_DataWrite(*data);
			data++;
			Check_Mem_WR_FIFO_not_Full();
			LCD_DataWrite(*data);
			data++;
			Check_Mem_WR_FIFO_not_Full();
			LCD_DataWrite(*data);
			data++;
		}
	}
	Check_Mem_WR_FIFO_Empty();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    MPU16_16bpp_Memory_Write                                                 */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                  x: x coordinate                                                      */
/*                  y: y coordinate                                                      */
/*                  w: data width                                                        */
/*                  h: data height                                                       */
/*              *data: the first data address                                            */
/* Returns:     None                                                                     */
/* Description: MCU writes 16bpp data to LT768x SDRAM by sending 16bits data at a time   */
/*---------------------------------------------------------------------------------------*/	
void MPU16_16bpp_Memory_Write 
(
 unsigned short x            
,unsigned short y            
,unsigned short w            
,unsigned short h            
,const unsigned short *data  
)			
{
	unsigned short i,j;
	Graphic_Mode();
    Active_Window_XY(x,y);
	Active_Window_WH(w,h); 					
	Goto_Pixel_XY(x,y);
	LCD_CmdWrite(0x04);
	for(i=0;i< h;i++)
	{	
		for(j=0;j< w;j++)
		{
			Check_Mem_WR_FIFO_not_Full();
			LCD_DataWrite(*data);
			data++;
		}
	}
	Check_Mem_WR_FIFO_Empty();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    MPU16_24bpp_Mode1_Memory_Write                                           */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                  x: x coordinate                                                      */
/*                  y: y coordinate                                                      */
/*                  w: data width                                                        */
/*                  h: data height                                                       */
/*              *data: the first data aress                                              */
/* Returns:     None                                                                     */
/* Description: MCU writes 24bpp data to LT768x SDRAM by sending 16bits data at a time   */
/*              -> Mode1                                                                 */
/*---------------------------------------------------------------------------------------*/
void MPU16_24bpp_Mode1_Memory_Write 
(
 unsigned short x            
,unsigned short y            
,unsigned short w            
,unsigned short h            
,const unsigned short *data  
)	
{
	unsigned short i,j;
	Graphic_Mode();
    Active_Window_XY(x,y);
	Active_Window_WH(w,h); 					
	Goto_Pixel_XY(x,y);
	LCD_CmdWrite(0x04);
	for(i=0;i< h;i++)
	{	
		for(j=0;j< w/2;j++)
		{
			LCD_DataWrite(*data);
			Check_Mem_WR_FIFO_not_Full();
			data++;
			LCD_DataWrite(*data);
			Check_Mem_WR_FIFO_not_Full();
			data++;
			LCD_DataWrite(*data);
			Check_Mem_WR_FIFO_not_Full();
			data++;
		}
	}
	Check_Mem_WR_FIFO_Empty();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    MPU16_24bpp_Mode2_Memory_Write                                           */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                  x: x coordinate                                                      */
/*                  y: y coordinate                                                      */
/*                  w: data width                                                        */
/*                  h: data height                                                       */
/*              *data: the first data address                                            */
/* Returns:     None                                                                     */
/* Description: MCU writes 24bpp data to LT768x SDRAM by sending 16bits data at a time   */
/*              -> Mode2                                                                 */
/*---------------------------------------------------------------------------------------*/	
void MPU16_24bpp_Mode2_Memory_Write
(
 unsigned short x            
,unsigned short y            
,unsigned short w            
,unsigned short h            
,const unsigned short *data  
)	
{
	unsigned short i,j;
	Graphic_Mode();
    Active_Window_XY(x,y);
	Active_Window_WH(w,h); 					
	Goto_Pixel_XY(x,y);
	LCD_CmdWrite(0x04);
	for(i=0;i< h;i++)
	{	
		for(j=0;j< w;j++)
		{
			Check_Mem_WR_FIFO_not_Full();
			LCD_DataWrite(*data);
			data++;
			Check_Mem_WR_FIFO_not_Full();
			LCD_DataWrite(*data);
			data++;
		}
	}
	Check_Mem_WR_FIFO_Empty();
}


//--------------------------------------------------------------------------------------------------------------------------------------------

//------------------------------------- Draw Line -----------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawLine                                                           */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                X1: X1 coordinate                                                      */
/*                Y1: Y1 coordinate                                                      */
/*                X2: X2 coordinate                                                      */
/*                Y2: Y2 coordinate                                                      */
/*              LineColor: Line color                                                    */
/* Returns:     None                                                                     */
/* Description: Draw a line to connect (X1, Y1) and (X2, Y2) in designated color         */
/*---------------------------------------------------------------------------------------*/	
void LT768_DrawLine
(
 unsigned short X1        
,unsigned short Y1        
,unsigned short X2        
,unsigned short Y2        
,unsigned long  LineColor 
)
{
#if  LCD_16bit
	Foreground_color_65k(LineColor);
#endif

#if  LCD_24bit
	Foreground_color_16M(LineColor);
#endif
	Line_Start_XY(X1,Y1);
	Line_End_XY(X2,Y2);
	Start_Line();
	Check_2D_Busy();
}

/*------------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawLine_Width                                                        */
/*                                                                                          */
/* Parameters:                                                                              */ 
/*                X1: X1 coordinate                                                         */
/*                Y1: Y1 coordinate                                                         */
/*                X2: X2 coordinate                                                         */
/*                Y2: Y2 coordinate                                                         */
/*              LineColor: Line color                                                       */
/*                  Width: Line width                                                       */
/* Returns:     None                                                                        */
/* Description: Draw a line to connect (X1, Y1) and (X2, Y2) in designated color and width  */
/*------------------------------------------------------------------------------------------*/	
void LT768_DrawLine_Width
(
 unsigned short X1        
,unsigned short Y1        
,unsigned short X2        
,unsigned short Y2        
,unsigned long  LineColor 
,unsigned short Width     
)
{
	unsigned short  i = 0;
	signed  short x = 0, y = 0;
	double temp = 0;
	x = X2 - X1;
	y = Y2 - Y1;
	if(x == 0) temp = 2;
	else temp = -((double)y/(double)x);
	if(temp>=-1&&temp<=1)
	{
			while(Width--)
		{
			LT768_DrawLine(X1,Y1+i,X2,Y2+i,LineColor);
			i++;
		}	
	}
		
	else 
	{
			while(Width--)
		{
			LT768_DrawLine(X1+i,Y1,X2+i,Y2,LineColor);
			i++;
		}	
	}
}


//------------------------------------- Draw Circle -----------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawCircle                                                         */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                  XCenter: Circle center X coordinate                                  */
/*                  YCenter: Circle center Y coordinate                                  */
/*                        R: Radius                                                      */
/*              CircleColor: Circle color                                                */
/* Returns:     None                                                                     */
/* Description: Draw a circle at the center of (XCenter, YCenter) with R radius and      */
/*              designated color                                                         */
/*---------------------------------------------------------------------------------------*/	
void LT768_DrawCircle
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short R                 
,unsigned long CircleColor        
)
{
#if  LCD_16bit
	Foreground_color_65k(CircleColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(CircleColor);
#endif
	Circle_Center_XY(XCenter,YCenter);
	Circle_Radius_R(R);
	Start_Circle_or_Ellipse();
	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawCircle_Fill                                                    */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                  XCenter: Circle center X coordinate                                  */
/*                  YCenter: Circle center Y coordinate                                  */
/*                        R: Radius                                                      */
/*              ForegroundColor: Filled color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid circle at the center of (XCenter, YCenter) with R radius    */
/*              and designated color                                                     */
/*---------------------------------------------------------------------------------------*/	
void LT768_DrawCircle_Fill
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short R                 
,unsigned long ForegroundColor    
)
{
#if  LCD_16bit
	Foreground_color_65k(ForegroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(ForegroundColor);
#endif
	Circle_Center_XY(XCenter,YCenter);
	Circle_Radius_R(R);
	Start_Circle_or_Ellipse_Fill();
	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawCircle_Width                                                   */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                  XCenter: Circle center X coordinate                                  */
/*                  YCenter: Circle center Y coordinate                                  */
/*                        R: Radius                                                      */
/*              CircleColor: Circle color                                                */
/*          ForegroundColor: Filled color                                                */
/*                    Width: Line width                                                  */
/* Returns:     None                                                                     */
/* Description: Draw a circle at the center of (XCenter, YCenter) with R radius,         */
/*              designated line color, line width, and filled color                      */
/*---------------------------------------------------------------------------------------*/	
void LT768_DrawCircle_Width
(
 unsigned short XCenter          
,unsigned short YCenter          
,unsigned short R                
,unsigned long CircleColor       
,unsigned long ForegroundColor   
,unsigned short Width            
)
{
	LT768_DrawCircle_Fill(XCenter,YCenter,R+Width,CircleColor);
	LT768_DrawCircle_Fill(XCenter,YCenter,R,ForegroundColor);
}


//------------------------------------- Draw Ellipse -----------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawEllipse                                                        */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                  XCenter: Circle center X coordinate                                  */
/*                  YCenter: Circle center Y coordinate                                  */
/*                      X_R: x Radius                                                    */
/*                      Y_R: y Radius                                                    */
/*              EllipseColor: Ellipse line color                                         */
/* Returns:     None                                                                     */
/* Description: Draw an ellipse at the center of (XCenter,YCenter) with radius           */
/*              (X_R, Y_R) and designated line color                                     */
/*---------------------------------------------------------------------------------------*/	
void LT768_DrawEllipse
(
 unsigned short XCenter          
,unsigned short YCenter          
,unsigned short X_R              
,unsigned short Y_R              
,unsigned long EllipseColor      
)
{
#if  LCD_16bit
	Foreground_color_65k(EllipseColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(EllipseColor);
#endif
	Ellipse_Center_XY(XCenter,YCenter);
	Ellipse_Radius_RxRy(X_R,Y_R);
	Start_Circle_or_Ellipse();
	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawEllipse_Fill                                                   */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                      XCenter: Circle center X coordinate                              */
/*                      YCenter: Circle center Y coordinate                              */
/*                          X_R: x Radius                                                */
/*                          Y_R: y Radius                                                */
/*              ForegroundColor: Filled color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid ellipse at the center of (XCenter,YCenter), with radius     */ 
/*              (X_R, Y_R) and designated filled color                                   */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawEllipse_Fill
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long ForegroundColor    
)
{
#if  LCD_16bit
	Foreground_color_65k(ForegroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(ForegroundColor);
#endif	
	Ellipse_Center_XY(XCenter,YCenter);
	Ellipse_Radius_RxRy(X_R,Y_R);
	Start_Circle_or_Ellipse_Fill();
	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawEllipse_Width                                                  */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                      XCenter: Circle center X coordinate                              */
/*                      YCenter: Circle center Y coordinate                              */
/*                          X_R: x Radius                                                */
/*                          Y_R: y Radius                                                */
/*                 EllipseColor: Line color                                              */
/*              ForegroundColor: Filled color                                            */
/*                        Width: Line width                                              */
/* Returns:     None                                                                     */
/* Description: Draw a solid ellipse at the center of (XCenter,YCenter),with radius      */
/*              (X_R, Y_R), designated filled color, line width, and line color          */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawEllipse_Width
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long EllipseColor       
,unsigned long ForegroundColor    
,unsigned short Width             
)
{
	LT768_DrawEllipse_Fill(XCenter,YCenter,X_R+Width,Y_R+Width,EllipseColor);
	LT768_DrawEllipse_Fill(XCenter,YCenter,X_R,Y_R,ForegroundColor);
}



//------------------------------------- Draw Square -----------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawSquare                                                         */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                       X1: Left-top X1 coordinate                                      */
/*                       Y1: Left-top Y1 coordinate                                      */
/*                       X2: Right-bottom X2 coordinate                                  */
/*                       Y2: Right-bottom Y2 coordinate                                  */
/*              SquareColor: Line color                                                  */
/* Returns:     None                                                                     */
/* Description: Draw a hollow square from left-top (X1, Y1) to right-bottom (X2, Y2)     */
/*              in designated line color                                                 */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawSquare
(
 unsigned short X1                
,unsigned short Y1                
,unsigned short X2                
,unsigned short Y2                
,unsigned long SquareColor        
)
{
#if  LCD_16bit
	Foreground_color_65k(SquareColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(SquareColor);
#endif	
	Square_Start_XY(X1,Y1);
	Square_End_XY(X2,Y2);
	Start_Square();
	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawSquare_Fill                                                    */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                           X1: Left-top X1 coordinate                                  */
/*                           Y1: Left-top Y1 coordinate                                  */
/*                           X2: Right-bottom X2 coordinate                              */
/*                           Y2: Right-bottom Y2 coordinate                              */
/*              ForegroundColor: Filled color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid square from left-top (X1, Y1) to right-bottom (X2, Y2)      */
/*              in designated filled color                                               */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawSquare_Fill
(
 unsigned short X1                
,unsigned short Y1                
,unsigned short X2                
,unsigned short Y2                
,unsigned long ForegroundColor    
)
{
#if  LCD_16bit
	Foreground_color_65k(ForegroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(ForegroundColor);
#endif
	Square_Start_XY(X1,Y1);
	Square_End_XY(X2,Y2);
	Start_Square_Fill();
	Check_2D_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawSquare_Width                                                   */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                           X1: Left-top X1 coordinate                                  */
/*                           Y1: Left-top Y1 coordinate                                  */
/*                           X2: Right-bottom X2 coordinate                              */
/*                           Y2: Right-bottom Y2 coordinate                              */
/*                  SquareColor: Line color                                              */
/*              ForegroundColor: Filled color                                            */
/*                        Width: Line width                                              */
/* Returns:     None                                                                     */
/* Description: Draw a solid square with frame from left-top (X1, Y1) to right-bottom    */
/*              (X2, Y2) in designated filled color and line color&width                 */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawSquare_Width
(
 unsigned short X1                
,unsigned short Y1                
,unsigned short X2                
,unsigned short Y2                
,unsigned long SquareColor        
,unsigned long ForegroundColor    
,unsigned short Width             
)
{
	LT768_DrawSquare_Fill(X1-Width,Y1-Width,X2+Width,Y2+Width,SquareColor);
	LT768_DrawSquare_Fill(X1,Y1,X2,Y2,ForegroundColor);
}


//------------------------------------- Draw Rounded Square -----------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawCircleSquare                                                   */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                           X1: Left-top X1 coordinate                                  */
/*                           Y1: Left-top Y1 coordinate                                  */
/*                           X2: Right-bottom X2 coordinate                              */
/*                           Y2: Right-bottom Y2 coordinate                              */
/*                          X_R: X radius                                                */     
/*                          Y_R: Y radius                                                */
/*              CircleSquareColor: Line color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a hollow rounded square from left-top (X1, Y1) to right-bottom      */
/*              (X2, Y2) in designated line color                                        */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawCircleSquare
(
 unsigned short X1                
,unsigned short Y1                
,unsigned short X2                
,unsigned short Y2                
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long CircleSquareColor  
)
{
#if  LCD_16bit
	Foreground_color_65k(CircleSquareColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(CircleSquareColor);
#endif
	Square_Start_XY(X1,Y1);
	Square_End_XY(X2,Y2); 
	Circle_Square_Radius_RxRy(X_R,Y_R);
	Start_Circle_Square();
	Check_2D_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawCircleSquare_Fill                                              */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                           X1: Left-top X1 coordinate                                  */
/*                           Y1: Left-top Y1 coordinate                                  */
/*                           X2: Right-bottom X2 coordinate                              */
/*                           Y2: Right-bottom Y2 coordinate                              */
/*                          X_R: X radius                                                */     
/*                          Y_R: Y radius                                                */
/*              ForegroundColor: Filled color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid rounded square from left-top (X1, Y1) to right-bottom       */
/*              (X2, Y2) in designated filled color                                      */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawCircleSquare_Fill
(
 unsigned short X1                
,unsigned short Y1                
,unsigned short X2                
,unsigned short Y2                
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long ForegroundColor  
)
{
#if  LCD_16bit
	Foreground_color_65k(ForegroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(ForegroundColor);
#endif
	
	Square_Start_XY(X1,Y1);
	Square_End_XY(X2,Y2); 
	Circle_Square_Radius_RxRy(X_R,Y_R);
	Start_Circle_Square_Fill();
	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawCircleSquare_Width                                             */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                             X1: Left-top X1 coordinate                                */
/*                             Y1: Left-top Y1 coordinate                                */
/*                             X2: Right-bottom X2 coordinate                            */
/*                             Y2: Right-bottom Y2 coordinate                            */
/*                            X_R: X radius                                              */     
/*                            Y_R: Y radius                                              */
/*              CircleSquareColor: Line color                                            */
/*                ForegroundColor: Filled color                                          */
/*                          Width: Line width                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid rounded square with frame from left-top (X1, Y1) to         */
/*              right-bottom (X2, Y2) in designated filled color and line color&width    */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawCircleSquare_Width
(
 unsigned short X1                
,unsigned short Y1                
,unsigned short X2                
,unsigned short Y2                
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long CircleSquareColor  
,unsigned long ForegroundColor    
,unsigned short Width             
)
{
	LT768_DrawCircleSquare_Fill(X1-Width,Y1-Width,X2+Width,Y2+Width,X_R,Y_R,CircleSquareColor);
	LT768_DrawCircleSquare_Fill(X1,Y1,X2,Y2,X_R,Y_R,ForegroundColor);
}


//------------------------------------- Draw Triangle -----------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawTriangle                                                       */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                           X1: 1st point, X1 coordinate                                */
/*                           Y1: 1st point, Y1 coordinate                                */
/*                           X2: 2nd point, X2 coordinate                                */
/*                           Y2: 2nd point, Y2 coordinate                                */
/*                           X3: 3rd point, X3 coordinate                                */
/*                           Y3: 3rd point, Y3 coordinate                                */
/*                TriangleColor: Line color                                              */
/* Returns:     None                                                                     */
/* Description: Draw a hollow triangle with 3 designated points in designated line color */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawTriangle
(
 unsigned short X1              
,unsigned short Y1              
,unsigned short X2              
,unsigned short Y2              
,unsigned short X3              
,unsigned short Y3              
,unsigned long TriangleColor    
)
{
#if  LCD_16bit
	Foreground_color_65k(TriangleColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(TriangleColor);
#endif
	Triangle_Point1_XY(X1,Y1);
	Triangle_Point2_XY(X2,Y2);
	Triangle_Point3_XY(X3,Y3);
	Start_Triangle();
	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawTriangle_Fill                                                  */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                           X1: 1st point, X1 coordinate                                */
/*                           Y1: 1st point, Y1 coordinate                                */
/*                           X2: 2nd point, X2 coordinate                                */
/*                           Y2: 2nd point, Y2 coordinate                                */
/*                           X3: 3rd point, X3 coordinate                                */
/*                           Y3: 3rd point, Y3 coordinate                                */
/*              ForegroundColor: Filled color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid triangle with 3 designated points in designated filled color*/
/*---------------------------------------------------------------------------------------*/
void LT768_DrawTriangle_Fill
(
 unsigned short X1              
,unsigned short Y1              
,unsigned short X2              
,unsigned short Y2              
,unsigned short X3              
,unsigned short Y3              
,unsigned long ForegroundColor  
)
{
#if  LCD_16bit
	Foreground_color_65k(ForegroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(ForegroundColor);
#endif
	Triangle_Point1_XY(X1,Y1);
	Triangle_Point2_XY(X2,Y2);
	Triangle_Point3_XY(X3,Y3);
	Start_Triangle_Fill();
	Check_2D_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawTriangle_Frame                                                 */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                           X1: 1st point, X1 coordinate                                */
/*                           Y1: 1st point, Y1 coordinate                                */
/*                           X2: 2nd point, X2 coordinate                                */
/*                           Y2: 2nd point, Y2 coordinate                                */
/*                           X3: 3rd point, X3 coordinate                                */
/*                           Y3: 3rd point, Y3 coordinate                                */
/*                TriangleColor: Line color                                              */
/*              ForegroundColor: Filled color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid triangle with frame by 3 designated points in designated    */
/*              line color and filled color                                              */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawTriangle_Frame
(
 unsigned short X1              
,unsigned short Y1              
,unsigned short X2              
,unsigned short Y2              
,unsigned short X3              
,unsigned short Y3              
,unsigned long TriangleColor    
,unsigned long ForegroundColor  
)
{
	LT768_DrawTriangle_Fill(X1,Y1,X2,Y2,X3,Y3,ForegroundColor);
	LT768_DrawTriangle(X1,Y1,X2,Y2,X3,Y3,TriangleColor);
}



//------------------------------------- Draw Curve -----------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawLeftUpCurve                                                    */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                 XCenter: Curve center X coordinate                                    */
/*                 YCenter: Curve center Y coordinate                                    */
/*                     X_R: X radius                                                     */     
/*                     Y_R: Y radius                                                     */
/*              CurveColor: Line color                                                   */
/* Returns:     None                                                                     */
/* Description: Draw a hollow curve on the left-up side with center point                */
/*              (XCenter, YCenter) and radius of X_R and Y_R, in designated line color   */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawLeftUpCurve
( 
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long CurveColor         
)
{
	
#if  LCD_16bit
	Foreground_color_65k(CurveColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(CurveColor);
#endif
	
	Ellipse_Center_XY(XCenter,YCenter);
	Ellipse_Radius_RxRy(X_R,Y_R);
	Start_Left_Up_Curve();
	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawLeftDownCurve                                                  */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                 XCenter: Curve center X coordinate                                    */
/*                 YCenter: Curve center Y coordinate                                    */
/*                     X_R: X radius                                                     */     
/*                     Y_R: Y radius                                                     */
/*              CurveColor: Line color                                                   */
/* Returns:     None                                                                     */
/* Description: Draw a hollow curve on the left-down side with center point              */
/*              (XCenter, YCenter) and radius of X_R and Y_R, in designated line color   */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawLeftDownCurve
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long CurveColor         
)
{
#if  LCD_16bit
	Foreground_color_65k(CurveColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(CurveColor);
#endif
	
	Foreground_color_65k(CurveColor);
	Ellipse_Center_XY(XCenter,YCenter);
	Ellipse_Radius_RxRy(X_R,Y_R);
	Start_Left_Down_Curve();
	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawRightUpCurve                                                   */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                 XCenter: Curve center X coordinate                                    */
/*                 YCenter: Curve center Y coordinate                                    */
/*                     X_R: X radius                                                     */     
/*                     Y_R: Y radius                                                     */
/*              CurveColor: Line color                                                   */
/* Returns:     None                                                                     */
/* Description: Draw a hollow curve on the right-up side with center point               */
/*              (XCenter, YCenter) and radius of X_R and Y_R, in designated line color   */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawRightUpCurve
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long CurveColor         
)
{
#if  LCD_16bit
	Foreground_color_65k(CurveColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(CurveColor);
#endif
	
  Ellipse_Center_XY(XCenter,YCenter);
  Ellipse_Radius_RxRy(X_R,Y_R);
  Start_Right_Up_Curve();
  Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawRightDownCurve                                                 */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                 XCenter: Curve center X coordinate                                    */
/*                 YCenter: Curve center Y coordinate                                    */
/*                     X_R: X radius                                                     */     
/*                     Y_R: Y radius                                                     */
/*              CurveColor: Line color                                                   */
/* Returns:     None                                                                     */
/* Description: Draw a hollow curve on the right-down side with center point             */
/*              (XCenter, YCenter) and radius of X_R and Y_R, in designated line color   */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawRightDownCurve
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long CurveColor         
)
{
#if  LCD_16bit
	Foreground_color_65k(CurveColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(CurveColor);
#endif
	Ellipse_Center_XY(XCenter,YCenter);
	Ellipse_Radius_RxRy(X_R,Y_R);
	Start_Right_Down_Curve();
	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_SelectDrawCurve                                                    */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                 XCenter: Curve center X coordinate                                    */
/*                 YCenter: Curve center Y coordinate                                    */
/*                     X_R: X radius                                                     */     
/*                     Y_R: Y radius                                                     */
/*              CurveColor: Line color                                                   */
/*                     Dir: Curve direction                                              */
/* Returns:     None                                                                     */
/* Description: Draw a hollow curve of designated direction with center point            */
/*              (XCenter, YCenter) and radius of X_R and Y_R, in designated line color   */
/*---------------------------------------------------------------------------------------*/
void LT768_SelectDrawCurve
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long CurveColor         
,unsigned short  Dir              
)
{
	switch(Dir)
	{
		case 0:LT768_DrawLeftDownCurve(XCenter,YCenter,X_R,Y_R,CurveColor);		break;
		case 1:LT768_DrawLeftUpCurve(XCenter,YCenter,X_R,Y_R,CurveColor);		break;
		case 2:LT768_DrawRightUpCurve(XCenter,YCenter,X_R,Y_R,CurveColor);		break;
		case 3:LT768_DrawRightDownCurve(XCenter,YCenter,X_R,Y_R,CurveColor);	break;
		default:																break;
	}
}


//------------------------------------- Draw Solid Curve -----------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawLeftUpCurve_Fill                                               */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                      XCenter: Curve center X coordinate                               */
/*                      YCenter: Curve center Y coordinate                               */
/*                          X_R: X radius                                                */     
/*                          Y_R: Y radius                                                */
/*              ForegroundColor: Filled color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid curve on the left-up side with center point                 */
/*              (XCenter, YCenter) and radius of X_R and Y_R, in designated filled color */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawLeftUpCurve_Fill
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long ForegroundColor    
)
{
#if  LCD_16bit
	Foreground_color_65k(ForegroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(ForegroundColor);
#endif
	Ellipse_Center_XY(XCenter,YCenter);
	Ellipse_Radius_RxRy(X_R,Y_R);
	Start_Left_Up_Curve_Fill();
	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawLeftDownCurve_Fill                                             */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                      XCenter: Curve center X coordinate                               */
/*                      YCenter: Curve center Y coordinate                               */
/*                          X_R: X radius                                                */     
/*                          Y_R: Y radius                                                */
/*              ForegroundColor: Filled color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid curve on the left-down side with center point               */
/*              (XCenter, YCenter) and radius of X_R and Y_R, in designated filled color */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawLeftDownCurve_Fill
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long ForegroundColor    
)
{
#if  LCD_16bit
	Foreground_color_65k(ForegroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(ForegroundColor);
#endif

  Ellipse_Center_XY(XCenter,YCenter);
  Ellipse_Radius_RxRy(X_R,Y_R);
  Start_Left_Down_Curve_Fill();
  Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawRightUpCurve_Fill                                              */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                      XCenter: Curve center X coordinate                               */
/*                      YCenter: Curve center Y coordinate                               */
/*                          X_R: X radius                                                */     
/*                          Y_R: Y radius                                                */
/*              ForegroundColor: Filled color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid curve on the right-up side with center point                */
/*              (XCenter, YCenter) and radius of X_R and Y_R, in designated filled color */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawRightUpCurve_Fill
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long ForegroundColor    
)
{
#if  LCD_16bit
	Foreground_color_65k(ForegroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(ForegroundColor);
#endif
	
	Ellipse_Center_XY(XCenter,YCenter);
	Ellipse_Radius_RxRy(X_R,Y_R);
	Start_Right_Up_Curve_Fill();
	Check_2D_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawRightDownCurve_Fill                                            */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                      XCenter: Curve center X coordinate                               */
/*                      YCenter: Curve center Y coordinate                               */
/*                          X_R: X radius                                                */     
/*                          Y_R: Y radius                                                */
/*              ForegroundColor: Filled color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid curve on the right-down side with center point              */
/*              (XCenter, YCenter) and radius of X_R and Y_R, in designated filled color */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawRightDownCurve_Fill
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long ForegroundColor    
)
{
#if  LCD_16bit
	Foreground_color_65k(ForegroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(ForegroundColor);
#endif

	Ellipse_Center_XY(XCenter,YCenter);
	Ellipse_Radius_RxRy(X_R,Y_R);
	Start_Right_Down_Curve_Fill();
	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_SelectDrawCurve_Fill                                               */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                 XCenter: Curve center X coordinate                                    */
/*                 YCenter: Curve center Y coordinate                                    */
/*                     X_R: X radius                                                     */     
/*                     Y_R: Y radius                                                     */
/*              CurveColor: Line color                                                   */
/*                     Dir: Curve direction                                              */
/* Returns:     None                                                                     */
/* Description: Draw a solid curve of designated direction with center point             */
/*              (XCenter, YCenter) and radius of X_R and Y_R, in designated filled color */
/*---------------------------------------------------------------------------------------*/
void LT768_SelectDrawCurve_Fill
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short X_R               
,unsigned short Y_R               
,unsigned long CurveColor         
,unsigned short  Dir              
)
{
	switch(Dir)
	{
		case 0:LT768_DrawLeftDownCurve_Fill(XCenter,YCenter,X_R,Y_R,CurveColor);		break;
		case 1:LT768_DrawLeftUpCurve_Fill(XCenter,YCenter,X_R,Y_R,CurveColor);			break;
		case 2:LT768_DrawRightUpCurve_Fill(XCenter,YCenter,X_R,Y_R,CurveColor);			break;
		case 3:LT768_DrawRightDownCurve_Fill(XCenter,YCenter,X_R,Y_R,CurveColor);		break;
		default:																		break;
	}
}



//------------------------------------- Draw Quadrilateral -----------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawQuadrilateral                                                  */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                           X1: 1st point, X1 coordinate                                */
/*                           Y1: 1st point, Y1 coordinate                                */
/*                           X2: 2nd point, X2 coordinate                                */
/*                           Y2: 2nd point, Y2 coordinate                                */
/*                           X3: 3rd point, X3 coordinate                                */
/*                           Y3: 3rd point, Y3 coordinate                                */
/*                           X4: 4th point, X4 coordinate                                */
/*                           Y4: 4th point, Y4 coordinate                                */
/*              ForegroundColor: Line color                                              */
/* Returns:     None                                                                     */
/* Description: Draw a hollow quadrilateral by 4 designated points in designated         */
/*              line color                                                               */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawQuadrilateral
(
 unsigned short X1              
,unsigned short Y1              
,unsigned short X2              
,unsigned short Y2              
,unsigned short X3              
,unsigned short Y3              
,unsigned short X4              
,unsigned short Y4              
,unsigned long ForegroundColor  
)
{
#if  LCD_16bit
	Foreground_color_65k(ForegroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(ForegroundColor);
#endif
	
	Triangle_Point1_XY(X1,Y1);
	Triangle_Point2_XY(X2,Y2);
	Triangle_Point3_XY(X3,Y3);
	Ellipse_Radius_RxRy(X4,Y4);

	LCD_CmdWrite(0x67);
	LCD_DataWrite(0x8d);
	Check_Busy_Draw();

	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawQuadrilateral_Fill                                             */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                           X1: 1st point, X1 coordinate                                */
/*                           Y1: 1st point, Y1 coordinate                                */
/*                           X2: 2nd point, X2 coordinate                                */
/*                           Y2: 2nd point, Y2 coordinate                                */
/*                           X3: 3rd point, X3 coordinate                                */
/*                           Y3: 3rd point, Y3 coordinate                                */
/*                           X4: 4th point, X4 coordinate                                */
/*                           Y4: 4th point, Y4 coordinate                                */
/*              ForegroundColor: Filled color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid quadrilateral by 4 designated points in designated          */
/*              filled color                                                             */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawQuadrilateral_Fill
(
 unsigned short X1              
,unsigned short Y1              
,unsigned short X2              
,unsigned short Y2              
,unsigned short X3              
,unsigned short Y3              
,unsigned short X4              
,unsigned short Y4              
,unsigned long ForegroundColor  
)
{
#if  LCD_16bit
	Foreground_color_65k(ForegroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(ForegroundColor);
#endif
	Triangle_Point1_XY(X1,Y1);
	Triangle_Point2_XY(X2,Y2);
	Triangle_Point3_XY(X3,Y3);
	Ellipse_Radius_RxRy(X4,Y4);

	LCD_CmdWrite(0x67);
	LCD_DataWrite(0xa7);
	Check_Busy_Draw();

	Check_2D_Busy(); 
}


//------------------------------------- Draw Pentagon -----------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawPentagon                                                       */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                           X1: 1st point, X1 coordinate                                */
/*                           Y1: 1st point, Y1 coordinate                                */
/*                           X2: 2nd point, X2 coordinate                                */
/*                           Y2: 2nd point, Y2 coordinate                                */
/*                           X3: 3rd point, X3 coordinate                                */
/*                           Y3: 3rd point, Y3 coordinate                                */
/*                           X4: 4th point, X4 coordinate                                */
/*                           Y4: 4th point, Y4 coordinate                                */
/*                           X4: 5th point, X5 coordinate                                */
/*                           Y4: 5th point, Y5 coordinate                                */
/*              ForegroundColor: Line color                                              */
/* Returns:     None                                                                     */
/* Description: Draw a hollow pentagon by 5 designated points in designated line color   */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawPentagon
(
 unsigned short X1              
,unsigned short Y1              
,unsigned short X2              
,unsigned short Y2              
,unsigned short X3              
,unsigned short Y3              
,unsigned short X4              
,unsigned short Y4              
,unsigned short X5              
,unsigned short Y5              
,unsigned long ForegroundColor  
)
{
#if  LCD_16bit
	Foreground_color_65k(ForegroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(ForegroundColor);
#endif
	Triangle_Point1_XY(X1,Y1);
	Triangle_Point2_XY(X2,Y2);
	Triangle_Point3_XY(X3,Y3);
	Ellipse_Radius_RxRy(X4,Y4);
	Ellipse_Center_XY(X5,Y5);
	
	LCD_CmdWrite(0x67);
	LCD_DataWrite(0x8F);
	Check_Busy_Draw();
	
	Check_2D_Busy(); 
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawPentagon_Fill                                                  */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                           X1: 1st point, X1 coordinate                                */
/*                           Y1: 1st point, Y1 coordinate                                */
/*                           X2: 2nd point, X2 coordinate                                */
/*                           Y2: 2nd point, Y2 coordinate                                */
/*                           X3: 3rd point, X3 coordinate                                */
/*                           Y3: 3rd point, Y3 coordinate                                */
/*                           X4: 4th point, X4 coordinate                                */
/*                           Y4: 4th point, Y4 coordinate                                */
/*                           X5: 5th point, X5 coordinate                                */
/*                           Y5: 5th point, Y5 coordinate                                */
/*              ForegroundColor: Filled color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid pentagon by 5 designated points in designated filled color  */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawPentagon_Fill
(
 unsigned short X1              
,unsigned short Y1              
,unsigned short X2              
,unsigned short Y2              
,unsigned short X3              
,unsigned short Y3              
,unsigned short X4              
,unsigned short Y4              
,unsigned short X5              
,unsigned short Y5              
,unsigned long ForegroundColor  
)
{
#if  LCD_16bit
	Foreground_color_65k(ForegroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(ForegroundColor);
#endif
	Triangle_Point1_XY(X1,Y1);
	Triangle_Point2_XY(X2,Y2);
	Triangle_Point3_XY(X3,Y3);
	Ellipse_Radius_RxRy(X4,Y4);
	Ellipse_Center_XY(X5,Y5);

	LCD_CmdWrite(0x67);
	LCD_DataWrite(0xa9);
	Check_Busy_Draw();

	Check_2D_Busy(); 
}


//------------------------------------- Draw Cylinder -----------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawCylinder                                                       */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                      XCenter: Ellipse center X coordinate                             */
/*                      YCenter: Ellipse center Y coordinate                             */
/*                          X_R: X radius                                                */     
/*                          Y_R: Y radius                                                */
/*                            H: Height                                                  */
/*                CylinderColor: Line color                                              */
/*              ForegroundColor: Filled color                                            */
/* Returns:     None                                                                     */
/* Description: Draw a solid framed cylinder with ellipse center point (XCenter, YCenter)*/
/*              and radius of X_R and Y_R, in designated filled color and line color     */
/*---------------------------------------------------------------------------------------*/
unsigned char LT768_DrawCylinder
(
 unsigned short XCenter           
,unsigned short YCenter           
,unsigned short X_R               
,unsigned short Y_R               
,unsigned short H                 
,unsigned long CylinderColor      
,unsigned long ForegroundColor    
)
{
	if(YCenter < H)	return 1;
	
	// Ellipse - bottom
	LT768_DrawEllipse_Fill(XCenter,YCenter,X_R,Y_R,ForegroundColor);
	LT768_DrawEllipse(XCenter,YCenter,X_R,Y_R,CylinderColor);
	
	// Rectangle - middle
	LT768_DrawSquare_Fill(XCenter-X_R,YCenter-H,XCenter+X_R,YCenter,ForegroundColor);
	
	// Ellipse - top
	LT768_DrawEllipse_Fill(XCenter,YCenter-H,X_R,Y_R,ForegroundColor);
	LT768_DrawEllipse(XCenter,YCenter-H,X_R,Y_R,CylinderColor);
	
	LT768_DrawLine(XCenter-X_R,YCenter,XCenter-X_R,YCenter-H,CylinderColor);
	LT768_DrawLine(XCenter+X_R,YCenter,XCenter+X_R,YCenter-H,CylinderColor);
	
	return 0;
}


//------------------------------------- Draw Cube -----------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DrawQuadrangular                                                   */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                             X1: 1st point, X1 coordinate                              */
/*                             Y1: 1st point, Y1 coordinate                              */
/*                             X2: 2nd point, X2 coordinate                              */
/*                             Y2: 2nd point, Y2 coordinate                              */
/*                             X3: 3rd point, X3 coordinate                              */
/*                             Y3: 3rd point, Y3 coordinate                              */
/*                             X4: 4th point, X4 coordinate                              */
/*                             Y4: 4th point, Y4 coordinate                              */
/*                             X5: 5th point, X5 coordinate                              */
/*                             Y5: 5th point, Y5 coordinate                              */
/*                             X6: 6th point, X6 coordinate                              */
/*                             Y6: 6th point, Y6 coordinate                              */
/*              QuadrangularColor: Line color                                            */
/*                ForegroundColor: Filled color                                          */
/* Returns:     None                                                                     */
/* Description: Draw a solid cube by 6 designated points in designated filled color and  */
/*              line color                                                               */
/*---------------------------------------------------------------------------------------*/
void LT768_DrawQuadrangular
(
 unsigned short X1
,unsigned short Y1
,unsigned short X2
,unsigned short Y2
,unsigned short X3
,unsigned short Y3
,unsigned short X4
,unsigned short Y4
,unsigned short X5
,unsigned short Y5
,unsigned short X6
,unsigned short Y6
,unsigned long QuadrangularColor   
,unsigned long ForegroundColor     
)
{
	LT768_DrawSquare_Fill(X1,Y1,X5,Y5,ForegroundColor);
	LT768_DrawSquare(X1,Y1,X5,Y5,QuadrangularColor);
	
	LT768_DrawQuadrilateral_Fill(X1,Y1,X2,Y2,X3,Y3,X4,Y4,ForegroundColor);
	LT768_DrawQuadrilateral(X1,Y1,X2,Y2,X3,Y3,X4,Y4,QuadrangularColor);
	
	LT768_DrawQuadrilateral_Fill(X3,Y3,X4,Y4,X5,Y5,X6,Y6,ForegroundColor);
	LT768_DrawQuadrilateral(X3,Y3,X4,Y4,X5,Y5,X6,Y6,QuadrangularColor);
}


//--------------------------------------------------------------- Make Table -------------------------------------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_MakeTable                                                          */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*                           X1: Starting point, X1 coordinate                           */
/*                           Y1: Starting point, Y1 coordinate                           */
/*                            W: Width                                                   */
/*                            H: Height                                                  */
/*                         Line: Number of column                                        */
/*                          Row: Number of row                                           */
/*                   TableColor: frame color                      C1                     */
/*                    ItemColor: Filled color for item column     C2                     */
/*              ForegroundColor: Filled color for content column  C3                     */
/*                       width1: Inner frame width                                       */
/*                       width2: Outer frame width                                       */
/*                         mode: 0: Vertical; 1: Horizontal                              */
/* Returns:     None                                                                     */
/* Description: Draw a table - refer to "LT768x_AP-Note_V12_ENG.pdf", Chapter 9.13       */
/*---------------------------------------------------------------------------------------*/
void LT768_MakeTable
(
	unsigned short X1,                  
	unsigned short Y1,                  
	unsigned short W,                   
	unsigned short H,                   
	unsigned short Line,                
	unsigned short Row,                 
	unsigned long  TableColor,          
	unsigned long  ItemColor,  			
	unsigned long  ForegroundColor,     
	unsigned short width1,              
	unsigned short width2,              
	unsigned char  mode                  
)
{
	unsigned short i = 0;
	unsigned short x2,y2;
	x2 = X1 + W * Row;
	y2 = Y1 + H * Line;
	
	LT768_DrawSquare_Width(X1,Y1,x2,y2,TableColor,ForegroundColor,width2);  
	
	if(mode == 0)	      LT768_DrawSquare_Fill(X1,Y1,X1+W,y2,ItemColor);  
	else if(mode == 1)	LT768_DrawSquare_Fill(X1,Y1,x2,Y1+H,ItemColor); 
	
	for(i = 0 ; i < Line ; i++)
	{
		LT768_DrawLine_Width(X1,Y1+i*H,x2,Y1+i*H,TableColor,width1);
	}
	
	for(i = 0 ; i < Row ; i++)
	{
		LT768_DrawLine_Width(X1+i*W,Y1,X1+i*W,y2,TableColor,width1);
	}
}


//--------------------------------------------------------------------------------------------------------------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Color_Bar_ON                                                       */
/*                                                                                       */
/* Parameters:  None                                                                     */ 
/* Returns:     None                                                                     */
/* Description: Color bar display enable                                                 */
/*---------------------------------------------------------------------------------------*/
void LT768_Color_Bar_ON(void)
{
	Color_Bar_ON();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Color_Bar_OFF                                                      */
/*                                                                                       */
/* Parameters:  None                                                                     */ 
/* Returns:     None                                                                     */
/* Description: Color bar display disable                                                */
/*---------------------------------------------------------------------------------------*/
void LT768_Color_Bar_OFF(void)
{
	Color_Bar_OFF();
}


//--------------------------------------------------------------------------------------------------------------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DMA_24bit_Linear                                                   */
/*                                                                                       */
/* Parameters:                                                                           */
/*                      SCS: Select SPI Flash:  SCS: 0       SCS: 1                      */
/*                      Clk: SPI Clock = System Clock /{(Clk+1)*2}, Clk: 0 ~ 3           */
/*               flash_addr: Starting address in Flash (to retrieve the data)            */
/*              memory_addr: Starting address in SDRAM (to save the data)                */
/*                 data_num: Data amount                                                 */
/* Returns:     None                                                                     */
/* Description: To retrieve data from SPI Flash and transmit them to designated SDRAM    */ 
/*              address, using linear mode, and 24bit address mode                       */
/*---------------------------------------------------------------------------------------*/
void LT768_DMA_24bit_Linear
(
 unsigned char SCS              
,unsigned char Clk              
,unsigned long flash_addr         
,unsigned long memory_addr      
,unsigned long data_num         
)
{
	
	Enable_SFlash_SPI();									// Enable SPI interface
  if(SCS == 0)		Select_SFI_0();							// Select SPI0
  if(SCS == 1)		Select_SFI_1();							// Select SPI1
	
	Memory_Linear_Mode();
	Select_SFI_DMA_Mode();								    // Select DMA mode of SPI
	
	SPI_Clock_Period(Clk);                                  // Set SPI clock
	SFI_DMA_Destination_Start_Address(memory_addr);  	    // Set starting address of SDRAM
	SFI_DMA_Transfer_Number(data_num);                      // Set the amount of data to be transmitted
	SFI_DMA_Source_Start_Address(flash_addr);               // Set starting address of flash
	Check_Busy_SFI_DMA(); 
	Start_SFI_DMA();
	Check_Busy_SFI_DMA();
	Memory_XY_Mode();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DMA_32bit_Linear                                                   */
/*                                                                                       */
/* Parameters:                                                                           */
/*                      SCS: Select SPI Flash:  SCS: 0       SCS: 1                      */
/*                      Clk: SPI Clock = System Clock /{(Clk+1)*2}, Clk: 0 ~ 3           */
/*               flash_addr: Starting address in Flash (to retrieve the data)            */
/*              memory_addr: Starting address in SDRAM (to save the data)                */
/*                 data_num: Data amount                                                 */
/* Returns:     None                                                                     */
/* Description: To retrieve data from SPI Flash and transfer them to designated SDRAM    */ 
/*              address, using linear mode, and 32bit address mode                       */
/*---------------------------------------------------------------------------------------*/
void LT768_DMA_32bit_Linear
(
 unsigned char SCS              
,unsigned char Clk              
,unsigned long flash_addr          
,unsigned long memory_addr      
,unsigned long data_num         
)
{
	Enable_SFlash_SPI();								    // Enable SPI interface
  if(SCS == 0)		Select_SFI_0();							// Select SPI0
  if(SCS == 1)		Select_SFI_1();							// Select SPI1
	
	Memory_Linear_Mode();
	Select_SFI_DMA_Mode();								    // Select DMA mode of SPI
	Select_SFI_32bit_Address();
	
	SPI_Clock_Period(Clk);                                  // Set SPI clock
	SFI_DMA_Destination_Start_Address(memory_addr);  	    // Set starting address of SDRAM
	SFI_DMA_Transfer_Number(data_num);                      // Set the amount of data to be transmitted
	SFI_DMA_Source_Start_Address(flash_addr);               // Set starting address of flash
	Check_Busy_SFI_DMA(); 
	Start_SFI_DMA();
	Check_Busy_SFI_DMA();
	Memory_XY_Mode();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DMA_24bit_Block                                                    */
/*                                                                                       */
/* Parameters:                                                                           */
/*               SCS: Select SPI Flash:  SCS: 0    SCS: 1                                */
/*               Clk: SPI Clock = System Clock /{(Clk+1)*2}, Clk: 0 ~ 3                  */
/*                X1: Starting X coordinate in SDRAM layer                               */
/*                Y1: Starting Y coordinate in SDRAM layer                               */
/*               X_W: Width of the data to be transmitted, e.g. picture width            */
/*               Y_H: Height of the data to be transmitted, e.g. picture height          */
/*               P_W: Picture width                                                      */
/*              Addr: Starting address in Flash (to retrieve the data)                   */
/* Returns:     None                                                                     */
/* Description: To retrieve data from SPI Flash and transmit them to designated SDRAM    */ 
/*              address, using block mode, and 24bit address mode                        */
/*---------------------------------------------------------------------------------------*/
void LT768_DMA_24bit_Block
(
 unsigned char SCS         
,unsigned char Clk         
,unsigned short X1         
,unsigned short Y1         
,unsigned short X_W        
,unsigned short Y_H        
,unsigned short P_W        
,unsigned long Addr        
)
{  

  Enable_SFlash_SPI();									    // Enable SPI interface
  if(SCS == 0)	Select_SFI_0();								// Select SPI0
  if(SCS == 1)	Select_SFI_1();								// Select SPI1
 
										   
  Select_SFI_DMA_Mode();								    // Select DMA mode of SPI
  SPI_Clock_Period(Clk);                                    // Set SPI clock

  Goto_Pixel_XY(X1,Y1);									    // Set the starting point of SDRAM in Graphic mode
  SFI_DMA_Destination_Upper_Left_Corner(X1,Y1);		        // Set the DMA transmition destination (starting point in SDRAM)
  SFI_DMA_Transfer_Width_Height(X_W,Y_H);				    // Set the width and height of the transmitted data
  SFI_DMA_Source_Width(P_W);							    // Set the picture width
  SFI_DMA_Source_Start_Address(Addr); 					    // Set the starting address in SPI Flash


  Start_SFI_DMA();									        // Start DMA transmition
  Check_Busy_SFI_DMA();								        // Check if the transmition is done
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_DMA_32bit_Block                                                    */
/*                                                                                       */
/* Parameters:                                                                           */
/*               SCS: Select SPI Flash:  SCS: 0    SCS: 1                                */
/*               Clk: SPI Clock = System Clock /{(Clk+1)*2}, Clk: 0 ~ 3                  */
/*                X1: Starting X coordinate in SDRAM layer                               */
/*                Y1: Starting Y coordinate in SDRAM layer                               */
/*               X_W: Width of the data to be transmitted, e.g. picture width            */
/*               Y_H: Height of the data to be transmitted, e.g. picture height          */
/*               P_W: Picture width                                                      */
/*              Addr: Starting address in Flash (to retrieve the data)                   */
/* Returns:     None                                                                     */
/* Description: To retrieve data from SPI Flash and transmit them to designated SDRAM    */ 
/*              address, using block mode, and 32bit address mode                        */
/*---------------------------------------------------------------------------------------*/
void LT768_DMA_32bit_Block
(
 unsigned char SCS         
,unsigned char Clk         
,unsigned short X1         
,unsigned short Y1         
,unsigned short X_W        
,unsigned short Y_H        
,unsigned short P_W        
,unsigned long Addr        
)
{  

  Enable_SFlash_SPI();									
  if(SCS == 0)	Select_SFI_0();										       
  if(SCS == 1)	Select_SFI_1();										      
   
  Select_SFI_DMA_Mode();								  
  SPI_Clock_Period(Clk);

  Select_SFI_32bit_Address();							  

  Goto_Pixel_XY(X1,Y1);									  
  SFI_DMA_Destination_Upper_Left_Corner(X1,Y1);			
  SFI_DMA_Transfer_Width_Height(X_W,Y_H);				  
  SFI_DMA_Source_Width(P_W);							  
  SFI_DMA_Source_Start_Address(Addr); 						 

  Start_SFI_DMA();									  
  Check_Busy_SFI_DMA();								 
  Select_SFI_24bit_Address();
}


//--------------------------------------------------------------------------------------------------------------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Select_Internal_Font_Init                                          */
/*                                                                                       */
/* Parameters:                                                                           */
/*                   Size: Font size  16: 16*16   24: 24*24    32: 32*32                 */
/*                    XxN: Width magnification: 1~4                                      */
/*                    YxN: Height magnification: 1~4                                     */
/*              ChromaKey: 0: Background color transparent; 1: Background color          */
/*              Alignment: 0: Non-alignment; 1: Alignment                                */
/* Returns:     None                                                                     */
/* Description: Initialize the internal font                                             */ 
/*---------------------------------------------------------------------------------------*/
void LT768_Select_Internal_Font_Init
(
 unsigned char Size         
,unsigned char XxN          
,unsigned char YxN          
,unsigned char ChromaKey    
,unsigned char Alignment    
)
{
	if(Size==16)	Font_Select_8x16_16x16();
	if(Size==24)	Font_Select_12x24_24x24();
	if(Size==32)	Font_Select_16x32_32x32();

	//(*)
	if(XxN==1)	Font_Width_X1();
	if(XxN==2)	Font_Width_X2();
	if(XxN==3)	Font_Width_X3();
	if(XxN==4)	Font_Width_X4();

	//(*)	
	if(YxN==1)	Font_Height_X1();
	if(YxN==2)	Font_Height_X2();
	if(YxN==3)	Font_Height_X3();
	if(YxN==4)	Font_Height_X4();

	//(*)
	if(ChromaKey==0)	Font_Background_select_Color();	
	if(ChromaKey==1)	Font_Background_select_Transparency();	

	//(*)
	if(Alignment==0)	Disable_Font_Alignment();
	if(Alignment==1)	Enable_Font_Alignment();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Print_Internal_Font_String                                         */
/*                                                                                       */
/* Parameters:                                                                           */
/*                            x: Start position X                                        */
/*                            y: Start position Y                                        */
/*                    FontColor: Font color                                              */
/*              BackGroundColor: Background color of the font                            */
/*                           *c: Starting address of the string to be printed            */
/* Returns:     None                                                                     */
/* Description: Print out internal font                                                  */ 
/*---------------------------------------------------------------------------------------*/
void LT768_Print_Internal_Font_String
(
 unsigned short x               
,unsigned short y               
,unsigned long FontColor        
,unsigned long BackGroundColor  
,char *c                        
)
{
	Text_Mode();
	CGROM_Select_Internal_CGROM();
	
#if  LCD_16bit
	Foreground_color_65k(FontColor);
	Background_color_65k(BackGroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(FontColor);
	Background_color_16M(BackGroundColor);
#endif
	Goto_Text_XY(x,y);
	Show_String(c);
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Select_Outside_Font_Init                                           */
/*                                                                                       */
/* Parameters:                                                                           */
/*                     SCS: Select SPI Flash:  SCS: 0    SCS: 1                          */
/*                     Clk: SPI Clock = System Clock /{(Clk+1)*2}                        */
/*               FlashAddr: Starting address in SPI Falsh                                */
/*              MemoryAddr: Starting address in SDRAM (destination)                      */ 
/*                     Num: Data amount of the font                                      */
/*                    Size: Font size  16: 16*16   24: 24*24    32: 32*32                */
/*                     XxN: Width magnification: 1~4                                     */
/*                     YxN: Height magnification: 1~4                                    */
/*               ChromaKey: 0: Background color transparent; 1: Background color         */
/*               Alignment: 0: Non-alignment; 1: Alignment                               */
/* Returns:     None                                                                     */
/* Description: Initialize the external font                                             */ 
/*---------------------------------------------------------------------------------------*/
void LT768_Select_Outside_Font_Init
(
 unsigned char SCS           
,unsigned char Clk           
,unsigned long FlashAddr     
,unsigned long MemoryAddr    
,unsigned long Num           
,unsigned char Size          
,unsigned char XxN           
,unsigned char YxN           
,unsigned char ChromaKey     
,unsigned char Alignment     
)
{
	if(Size==16)	Font_Select_8x16_16x16();
	if(Size==24)	Font_Select_12x24_24x24();
	if(Size==32)	Font_Select_16x32_32x32();

	//(*)
	if(XxN==1)	Font_Width_X1();
	if(XxN==2)	Font_Width_X2();
	if(XxN==3)	Font_Width_X3();
	if(XxN==4)	Font_Width_X4();

	//(*)	
	if(YxN==1)	Font_Height_X1();
	if(YxN==2)	Font_Height_X2();
	if(YxN==3)	Font_Height_X3();
	if(YxN==4)	Font_Height_X4();

	//(*)
	if(ChromaKey==0)	Font_Background_select_Color();	
	if(ChromaKey==1)	Font_Background_select_Transparency();	

	//(*)
	if(Alignment==0)	Disable_Font_Alignment();
	if(Alignment==1)	Enable_Font_Alignment();	
	
	LT768_DMA_24bit_Linear(SCS,Clk,FlashAddr,MemoryAddr,Num);
	CGRAM_Start_address(MemoryAddr);        
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Print_Outside_Font_String                                          */
/*                                                                                       */
/* Parameters:                                                                           */
/*                            x: Start position X                                        */
/*                            y: Start position Y                                        */
/*                    FontColor: Font color                                              */
/*              BackGroundColor: Background color of the font                            */
/*                           *c: Starting address of the string to be printed            */
/* Returns:     None                                                                     */
/* Description: Print out internal and external font                                     */ 
/*---------------------------------------------------------------------------------------*/
void LT768_Print_Outside_Font_String
(
 unsigned short x               
,unsigned short y               
,unsigned long FontColor        
,unsigned long BackGroundColor  
,unsigned char *c 
              
)
{
	unsigned short temp_H = 0;
	unsigned short temp_L = 0;
	unsigned short temp = 0;
	unsigned long i = 0;
	
	Text_Mode();
	Font_Select_UserDefine_Mode();
	
#if  LCD_16bit
	Foreground_color_65k(FontColor);
	Background_color_65k(BackGroundColor);
#endif
	
#if  LCD_24bit
	Foreground_color_16M(FontColor);
	Background_color_16M(BackGroundColor);
#endif
	
	Goto_Text_XY(x,y);
	
	while(c[i] != '\0')
  { 
		if(c[i] < 0xa1)
		{
			CGROM_Select_Internal_CGROM();   // using internal CGROM as the source of the character
			LCD_CmdWrite(0x04);
			LCD_DataWrite(c[i]);
			Check_Mem_WR_FIFO_not_Full();  
			i += 1;
		}
		else
		{
			Font_Select_UserDefine_Mode();   // User-defined font
			LCD_CmdWrite(0x04);
			temp_H = ((c[i] - 0xa1) & 0x00ff) * 94;
			temp_L = c[i+1] - 0xa1;
			temp = temp_H + temp_L + 0x8000;
			LCD_DataWrite((temp>>8)&0xff);
			Check_Mem_WR_FIFO_not_Full();
			LCD_DataWrite(temp&0xff);
			Check_Mem_WR_FIFO_not_Full();
			i += 2;		
		}
	}
	
  Check_2D_Busy();

  Graphic_Mode(); //back to graphic mode
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_BTE_Memory_Copy_ColorExpansion_8                                   */
/*                                                                                       */
/* Parameters:                                                                           */
/*                       S0_Addr: Starting address of S0 picture                         */
/*                           YS0: Left-top Y coordniate of S0 picture                    */
/*                      Des_Addr: Starting address in SDRAM (destination)                */
/*                         Des_W: Width of the destination picture                       */ 
/*                          XDes: Left-top X coordinate of the destination picture       */
/*                          YDes: Left-top Y coordinate of the destination picture       */
/*                           X_W: Width of the diplay window                             */
/*                           X_H: Height of the display window                           */
/*              Foreground_color: Foreground color                                       */
/*              Background_color: Background color                                       */
/* Returns:     None                                                                     */
/* Description: Memory copy with color expansion                                         */ 
/*---------------------------------------------------------------------------------------*/
void LT768_BTE_Memory_Copy_ColorExpansion_8
(
 unsigned long S0_Addr             
,unsigned short YS0                
,unsigned long Des_Addr            
,unsigned short Des_W              
,unsigned short XDes              
,unsigned short YDes               
,unsigned short X_W                
,unsigned short Y_H                
,unsigned long Foreground_color
,unsigned long Background_color
)
{

	BTE_ROP_Code(0x0C);
	
#if  LCD_16bit
		Foreground_color_65k(Foreground_color);
		Background_color_65k(Background_color);
		BTE_Destination_Color_16bpp();

#endif

#if  LCD_24bit
		Foreground_color_16M(Foreground_color);
		Background_color_16M(Background_color);
		BTE_Destination_Color_24bpp();
	
#endif	
	
	BTE_S0_Color_8bpp();
	BTE_S0_Memory_Start_Address(S0_Addr);
	BTE_S0_Image_Width(Des_W);
	BTE_S0_Window_Start_XY(0,YS0);	

	
	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes,YDes);
   
	BTE_Operation_Code(0x0e);	//BTE Operation: Memory copy (move) with chroma keying (w/o ROP)
	BTE_Window_Size(X_W,Y_H); 
	BTE_Enable();
	Check_BTE_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_BTE_Memory_Copy_ColorExpansion_Chroma_key_8                        */
/*                                                                                       */
/* Parameters:                                                                           */
/*                       S0_Addr: Starting address of S0 picture                         */
/*                           YS0: Left-top Y coordniate of S0 picture                    */
/*                      Des_Addr: Starting address in SDRAM (destination)                */
/*                         Des_W: Width of the destination picture                       */ 
/*                          XDes: Left-top X coordinate of the destination picture       */
/*                          YDes: Left-top Y coordinate of the destination picture       */
/*                           X_W: Width of the diplay window                             */
/*                           X_H: Height of the display window                           */
/*              Foreground_color: Foreground color                                       */
/* Returns:     None                                                                     */
/* Description: Memory copy with color expansion and chroma key                          */ 
/*---------------------------------------------------------------------------------------*/
void LT768_BTE_Memory_Copy_ColorExpansion_Chroma_key_8
(
 unsigned long S0_Addr             
,unsigned short YS0                
,unsigned long Des_Addr            
,unsigned short Des_W              
,unsigned short XDes               
,unsigned short YDes               
,unsigned short X_W                
,unsigned short Y_H                
,unsigned long Foreground_color
)
{
	
#if  LCD_16bit
		Foreground_color_65k(Foreground_color);
		BTE_Destination_Color_16bpp();

#endif

#if  LCD_24bit
		Foreground_color_16M(Foreground_color);
		BTE_Destination_Color_24bpp();
	
#endif
	
	BTE_ROP_Code(7);
	
	BTE_S0_Color_8bpp();
	BTE_S0_Memory_Start_Address(S0_Addr);
	BTE_S0_Image_Width(Des_W);
	BTE_S0_Window_Start_XY(0,YS0);	

	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes,YDes);
   
	BTE_Operation_Code(0x0f);	//BTE Operation: Memory copy (move) with chroma keying (w/o ROP)
	BTE_Window_Size(X_W,Y_H); 
	BTE_Enable();
	Check_BTE_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Print_Outside_Font_GB2312_48_72                                    */
/*                                                                                       */
/* Parameters:                                                                           */
/*                          SCS: Select SPI Flash:  SCS: 0    SCS: 1                     */
/*                          Clk: SPI Clock = System Clock /{(Clk+1)*2}                   */
/*                    FlashAddr: Starting address in SPI Falsh                           */
/*                   MemoryAddr: Starting address in SDRAM (destination)                 */ 
/*                     ShowAddr: Address of the display layer                            */
/*                        width: Width of the display layer                              */
/*                         Size: Font size  48: 48*48   72: 72*72                        */
/*                    ChromaKey: 0: Background color transparent; 1: Background color    */
/*                            x: String position, starting x coordinate                  */
/*                            y: String position, starting y coordinate                  */
/*                    FontColor: Font color                                              */
/*              BackGroundColor: Font background color                                   */     
/*                            w: Bold Level Setting, 0:normal  1:bolder  2:boldest       */
/*                            s: Line gap                                                */
/*                           *c: Starting address of the string to be printed            */
/* Returns:     None                                                                     */
/* Description: Print outside font                                                       */ 
/*---------------------------------------------------------------------------------------*/
void LT768_Print_Outside_Font_GB2312_48_72
(
 unsigned char SCS           		
,unsigned char Clk           		
,unsigned long FlashAddr     		
,unsigned long MemoryAddr    		
,unsigned long ShowAddr             
,unsigned short width              
,unsigned char Size          		
,unsigned char ChromaKey     		
,unsigned short x                   
,unsigned short y                   
,unsigned long FontColor            
,unsigned long BackGroundColor      
,unsigned short w				    
,unsigned short s                   
,unsigned char *c                   
)
{
	unsigned short temp_H = 0;
	unsigned short temp_L = 0;
	unsigned short temp = 0;
	unsigned long i = 0;
	unsigned short j = 0;
	unsigned short k = 0;
	unsigned short h = 0;
	unsigned short n = 0;
	unsigned short m = 0;
	unsigned short g = 0;
	unsigned short f = 0;
	
	h = x; k = y;
	Memory_8bpp_Mode();// Set to 8bit color depth
 	Canvas_Image_Start_address(MemoryAddr);
 	Canvas_image_width(width);
	while(c[i] != '\0')
	{
		temp_H = (c[i] - 0xa1) * 94;
		temp_L = c[i+1] - 0xa1;
		temp = temp_H + temp_L;
		LT768_DMA_24bit_Block(SCS,Clk,0,Size*j,Size/8,Size,Size/8,FlashAddr+temp*((Size*Size)/8));
		i+=2;
		j++;
	}
	
#if LCD_16bit	
	Memory_16bpp_Mode();
#endif
	
#if LCD_24bit
	Memory_24bpp_Mode();
#endif
	
	Canvas_Image_Start_address(ShowAddr);
	Canvas_image_width(width);
	j = 0; i = 0;
	
	if(w>2)	w = 2;
	for(g=0;g<w+1;g++)
	{
		while(c[i] != '\0')
		{
			if((f == m)&&((x+Size*j+Size)>(width*(n+1)))) {m++;n++;y=y+Size-1+s;x = x+((width*n)-(x+Size*j))+g;f=n;}
				
			if(ChromaKey==1)
			{
				LT768_BTE_Memory_Copy_ColorExpansion_8(MemoryAddr,Size*j,
										   ShowAddr,width,x+Size*j,y,
										   Size,Size,FontColor,BackGroundColor
										   );
			}
			if(ChromaKey==0)
			{
				LT768_BTE_Memory_Copy_ColorExpansion_Chroma_key_8(MemoryAddr,Size*j,   
												  ShowAddr,width,x+Size*j,y,
													Size,Size,FontColor
													);
			}
			i+=2;
			j++;
		}
		ChromaKey=0;i=0;j=0;m=0;n=0;f=0;x=h+g+1;y=k+g+1;
	}
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Print_Outside_Font_BIG5_48_72                                      */
/*                                                                                       */
/* Parameters:                                                                           */
/*                          SCS: Select SPI Flash:  SCS: 0    SCS: 1                     */
/*                          Clk: SPI Clock = System Clock /{(Clk+1)*2}                   */
/*                    FlashAddr: Starting address in SPI Falsh                           */
/*                   MemoryAddr: Starting address in SDRAM (destination)                 */ 
/*                     ShowAddr: Address of the display layer                            */
/*                        width: Width of the display layer                              */
/*                         Size: Font size  48: 48*48   72: 72*72                        */
/*                    ChromaKey: 0: Background color transparent; 1: Background color    */
/*                            x: String position, starting x coordinate                  */
/*                            y: String position, starting y coordinate                  */
/*                    FontColor: Font color                                              */
/*              BackGroundColor: Font background color                                   */     
/*                            w: Bold Level Setting, 0:normal  1:bolder  2:boldest       */
/*                            s: Line gap                                                */
/*                           *c: Starting address of the string to be printed            */
/* Returns:     None                                                                     */
/* Description: Print outside font                                                       */ 
/*---------------------------------------------------------------------------------------*/
void LT768_Print_Outside_Font_BIG5_48_72
(
 unsigned char SCS           		    
,unsigned char Clk           		    
,unsigned long FlashAddr     		    
,unsigned long MemoryAddr    		    
,unsigned long ShowAddr              	
,unsigned short width              		
,unsigned char Size          		    
,unsigned char ChromaKey     		    
,unsigned short x                       
,unsigned short y                       
,unsigned long FontColor                
,unsigned long BackGroundColor          
,unsigned short w				        
,unsigned short s                       
,unsigned char *c                       
)
{
	unsigned short temp_H = 0;
	unsigned short temp_L = 0;
	unsigned short temp = 0;
	unsigned long i = 0;
	unsigned short j = 0;
	unsigned short k = 0;
	unsigned short h = 0;
	unsigned short n = 0;
	unsigned short m = 0;
	unsigned short g = 0;
	unsigned short f = 0;
	h = x; k = y;
	Memory_8bpp_Mode();// Set to 8bit color depth
 	Canvas_Image_Start_address(MemoryAddr);
 	Canvas_image_width(width);
	while(c[i] != '\0')
	{
		temp_H = (c[i] - 0xa1) * 160;
		if(c[i+1]<0x7f)
		{
			temp_L = c[i+1] - 0x40;
		}
		else
		{
			temp_L = c[i+1] - 0xa0 + 0x40;
		}
		temp = temp_H + temp_L;
		LT768_DMA_24bit_Block(SCS,Clk,0,Size*j,Size/8,Size,Size/8,FlashAddr+temp*((Size*Size)/8));
		i+=2;
		j++;
	}
	
#if LCD_16bit	
	Memory_16bpp_Mode();
#endif
	
#if LCD_24bit
	Memory_24bpp_Mode();
#endif
	
	Canvas_Image_Start_address(ShowAddr);
	Canvas_image_width(width);
	j = 0; i = 0;
	for(g=0;g<w;g++)
	{
		while(c[i] != '\0')
		{
			if((f == m)&&((x+Size*j+Size)>(1024*(n+1)))) {m++;n++;y=y+Size-1+s;x = x+((1024*n)-(x+Size*j))+g;f=n;}
			if(ChromaKey==1)
			{
				LT768_BTE_Memory_Copy_ColorExpansion_8(MemoryAddr,Size*j,
										 ShowAddr,LCD_XSIZE_TFT,x+Size*j,y,
										 Size,Size,FontColor,BackGroundColor
										);
			}
			if(ChromaKey==0)
			{
				LT768_BTE_Memory_Copy_ColorExpansion_Chroma_key_8(MemoryAddr,Size*j,   
												 ShowAddr,LCD_XSIZE_TFT,x+Size*j,y,
												 Size,Size,FontColor
												);
			}
			i+=2;
			j++;
		}
		ChromaKey=0;i=0;j=0;m=0;n=0;f=0;x=h+g+1;y=k+g+1;
	}
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Text_cursor_Init                                                   */
/*                                                                                       */
/* Parameters:                                                                           */
/*              On_Off_Blinking: Cursor blinking, 0: disable   1: enable                 */
/*                Blinking_Time: Set the cursor blinking time                            */
/*                          X_W: Cursor width                                            */
/*                          Y_W: Cursor height                                           */
/* Returns:     None                                                                     */
/* Description: Initialize text cursor -                                                 */
/*              refer to "LT768x_AP-Note_V12_ENG.pdf" Chapter 12.1 for more detail       */
/*---------------------------------------------------------------------------------------*/
void LT768_Text_cursor_Init
(
 unsigned char On_Off_Blinking         
,unsigned short Blinking_Time          
,unsigned short X_W                    
,unsigned short Y_W                    
)
{
	if(On_Off_Blinking == 0)	Disable_Text_Cursor_Blinking();
	if(On_Off_Blinking == 1)	Enable_Text_Cursor_Blinking();

  Blinking_Time_Frames(Blinking_Time); 
	
  //[3E][3Fh]
  Text_Cursor_H_V(X_W,Y_W);
	
	Enable_Text_Cursor();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Enable_Text_cursor                                                 */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Enable text cursor                                                       */
/*---------------------------------------------------------------------------------------*/
void LT768_Enable_Text_Cursor(void)
{
	Enable_Text_Cursor();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Disable_Text_cursor                                                 */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Disable text cursor                                                       */
/*---------------------------------------------------------------------------------------*/
void LT768_Disable_Text_Cursor(void)
{
	Disable_Text_Cursor();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Graphic_cursor_Init                                                */
/*                                                                                       */
/* Parameters:                                                                           */
/*                 Cursor_N: Select cursor: 1 ~ 4                                        */
/*                   Color1: Color 1                                                     */
/*                   Color2: Color 2                                                     */                                                     
/*                    X_Pos: X coordinate of the cursor                                  */
/*                    Y_Pos: Y coordinate of the cursor                                  */
/*              *Cursor_Buf: First address of the cursor data                            */
/* Returns:     None                                                                     */
/* Description: Initialize text cursor -                                                 */
/*              refer to "LT768x_AP-Note_V12_ENG.pdf" Chapter 12.2 for more detail       */
/*---------------------------------------------------------------------------------------*/
void LT768_Graphic_cursor_Init
(
 unsigned char Cursor_N                  
,unsigned char Color1                    
,unsigned char Color2                    
,unsigned short X_Pos                    
,unsigned short Y_Pos                    
,unsigned char *Cursor_Buf               
)
{
	unsigned int i ;
	
	Memory_Select_Graphic_Cursor_RAM(); 
	Graphic_Mode();
	
	switch(Cursor_N)
	{
		case 1:	Select_Graphic_Cursor_1();	break;
		case 2:	Select_Graphic_Cursor_2();	break;
		case 3:	Select_Graphic_Cursor_3();	break;
		case 4:	Select_Graphic_Cursor_4();	break;
		default:break;
	}
	
	LCD_CmdWrite(0x04);
  for(i=0;i<256;i++)
  {					 
		LCD_DataWrite(Cursor_Buf[i]);
  }
	
	Memory_Select_SDRAM();
	Set_Graphic_Cursor_Color_1(Color1);
	Set_Graphic_Cursor_Color_2(Color2);
	Graphic_Cursor_XY(X_Pos,Y_Pos);
	
	Enable_Graphic_Cursor();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Set_Graphic_cursor_Pos                                             */
/*                                                                                       */
/* Parameters:                                                                           */
/*              Cursor_N: Select cursor: 1 ~ 4                                           */                                         
/*                 X_Pos: X coordinate of the cursor                                     */
/*                 Y_Pos: Y coordinate of the cursor                                     */
/* Returns:     None                                                                     */
/* Description: Set graphic cursor position                                              */
/*---------------------------------------------------------------------------------------*/
void LT768_Set_Graphic_cursor_Pos
(
 unsigned char Cursor_N                  
,unsigned short X_Pos                    
,unsigned short Y_Pos                    
)
{
	Graphic_Cursor_XY(X_Pos,Y_Pos);
	switch(Cursor_N)
	{
		case 1:	Select_Graphic_Cursor_1();	break;
		case 2:	Select_Graphic_Cursor_2();	break;
		case 3:	Select_Graphic_Cursor_3();	break;
		case 4:	Select_Graphic_Cursor_4();	break;
		default:
		break;
	}
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Enable_Graphic_cursor                                              */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Enable graphic cursor                                                    */
/*---------------------------------------------------------------------------------------*/
void LT768_Enable_Graphic_Cursor(void)
{
	Enable_Graphic_Cursor();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Disable_Graphic_cursor                                             */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Disable graphic cursor                                                   */
/*---------------------------------------------------------------------------------------*/
void LT768_Disable_Graphic_Cursor(void)
{
	Disable_Graphic_Cursor();
}


//-----------------------------------------------------------------------------------------------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_PIP_Init                                                           */
/*                                                                                       */
/* Parameters:                                                                           */
/*                  On_Off: 0: Disable   1: Eanble   2: Keep state                       */
/*              Select_PIP: 1: Use PIP1  2: Use PIP2                                     */
/*                   PAddr: Starting address of the PIP                                  */ 
/*                      XP: X coordinate of the PIP, must be divisable by 4              */
/*                      YP: Y coordinate of the PIP, must be divisable by 4              */
/*              ImageWidth: Width of the base image                                      */
/*                   X_Dis: X coordinate of the display window                           */
/*                   Y_Dis: Y coordinate of the display window                           */
/*                     X_W: Width of the display window, must be divisable by 4          */
/*                     Y_H: Height of the display window, must be divisable by 4         */
/* Returns:     None                                                                     */
/* Description: Initialize Picture-In-Picture fucntion                                   */
/*---------------------------------------------------------------------------------------*/
void LT768_PIP_Init
(
 unsigned char On_Off         
,unsigned char Select_PIP     
,unsigned long PAddr          
,unsigned short XP            
,unsigned short YP            
,unsigned long ImageWidth     
,unsigned short X_Dis         
,unsigned short Y_Dis         
,unsigned short X_W           
,unsigned short Y_H           
)
{
	if(Select_PIP == 1 )  
	{
#if LCD_16bit
		Select_PIP1_Window_16bpp();
#endif
		
#if LCD_24bit
		Select_PIP1_Window_24bpp();
#endif
		Select_PIP1_Parameter();
	}
	if(Select_PIP == 2 )  
	{
#if LCD_16bit
		Select_PIP1_Window_16bpp();
#endif
		
#if LCD_24bit
		Select_PIP1_Window_24bpp();
#endif
		Select_PIP2_Parameter();
	}
	
	PIP_Display_Start_XY(X_Dis,Y_Dis);
	PIP_Image_Start_Address(PAddr);
	PIP_Image_Width(ImageWidth);
	PIP_Window_Image_Start_XY(XP,YP);
	PIP_Window_Width_Height(X_W,Y_H);
	

	if(On_Off == 0)
  {
  	if(Select_PIP == 1 )  Disable_PIP1();	
		if(Select_PIP == 2 )  Disable_PIP2();
	}

  if(On_Off == 1)
  {
		if(Select_PIP == 1 )  Enable_PIP1();	
		if(Select_PIP == 2 )  Enable_PIP2();
	}
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Set_DisWindowPos                                                   */
/*                                                                                       */
/* Parameters:                                                                           */
/*                  On_Off: 0: Disable   1: Eanble   2: Keep state                       */
/*              Select_PIP: 1: Use PIP1  2: Use PIP2                                     */
/*                   X_Dis: X coordinate of the display window                           */
/*                   Y_Dis: Y coordinate of the display window                           */
/* Returns:     None                                                                     */
/* Description: Set the PIP display position                                             */
/*---------------------------------------------------------------------------------------*/
void LT768_Set_DisWindowPos
(
 unsigned char On_Off         
,unsigned char Select_PIP    
,unsigned short X_Dis         
,unsigned short Y_Dis         
)
{
	if(Select_PIP == 1 )  Select_PIP1_Parameter();
	if(Select_PIP == 2 )  Select_PIP2_Parameter();
	
	if(On_Off == 0)
  {
  	if(Select_PIP == 1 )  Disable_PIP1();	
		if(Select_PIP == 2 )  Disable_PIP2();
	}

  if(On_Off == 1)
  {
		if(Select_PIP == 1 )  Enable_PIP1();	
		if(Select_PIP == 2 )  Enable_PIP2();
	}
	
	PIP_Display_Start_XY(X_Dis,Y_Dis);
	
}


//-----------------------------------------------------------------------------------------------------------------------------


/*---------------------------------------------------------------------------------------*/
/* Function:    BTE_Solid_Fill                                                           */
/*                                                                                       */
/* Parameters:                                                                           */
/*              Des_Addr: DT layer address for the fill operation (DT: Destination)      */
/*                 Des_W: Max. width of the DT layer - usually as panel x resolution     */
/*                  XDes: Left-top X coordinate of the DT layer                          */ 
/*                  YDES: Left-top Y coordinate of the DT layer                          */
/*                 color: Filled color                                                   */
/*                   X_W: Width of the fill operation                                    */
/*                   Y_H: Height of the fill operation                                   */
/* Returns:     None                                                                     */
/* Description: Fill a rectangle area with a specified color                             */
/*---------------------------------------------------------------------------------------*/
void BTE_Solid_Fill
(
 unsigned long Des_Addr           
,unsigned short Des_W            
,unsigned short XDes              
,unsigned short YDes              
,unsigned short color              
,unsigned short X_W                
,unsigned short Y_H                
)            
{

#if LCD_16bit
	Foreground_color_65k(color);
	BTE_Destination_Color_16bpp();
#endif
	
#if LCD_24bit
	Foreground_color_16M(color);
	BTE_Destination_Color_24bpp();
#endif
	

	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes,YDes);
	BTE_Window_Size(X_W,Y_H);

	
	BTE_Operation_Code(0x0c);
	BTE_Enable();
	Check_BTE_Busy();     
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_BTE_Memory_Copy                                                    */
/*                                                                                       */
/* Parameters:                                                                           */
/*               S0_Addr: Starting address (SDRAM) of S0 picture                         */
/*                  S0_W: Width of the S0 picture                                        */
/*                   XS0: Left-top X coordinate of the S0 picture                        */ 
/*                   YS0: Left-top Y coordinate of the S0 picture                        */
/*               S1_Addr: Starting address (SDRAM) of S1 picture                         */
/*                  S1_W: Width of the S1 picture                                        */
/*                   XS1: Left-top X coordinate of the S1 picture                        */ 
/*                   YS1: Left-top Y coordinate of the S1 picture                        */
/*              Des_Addr: Starting address (SDRAM) of DT picture (DT: Destination)       */
/*                 Des_W: Width of the DT picture                                        */
/*                  XDes: Left-top X coordinate of the DT picture                        */ 
/*                  YDes: Left-top Y coordinate of the DT picture                        */
/*              ROP_Code:                                                                */
/*                        0000b		0(Blackness)                                         */
/*                        0001b		~S0.~S1 or ~(S0+S1)                                  */
/*                        0010b		~S0.S1                                               */
/*                        0011b		~S0                                                  */
/*                        0100b		S0.~S1                                               */
/*                        0101b		~S1                                                  */
/*                        0110b		S0^S1                                                */
/*                        0111b		~S0 + ~S1 or ~(S0 . S1)                              */
/*                        1000b		S0.S1                                                */
/*                        1001b		~(S0^S1)                                             */
/*                        1010b		S1                                                   */
/*                        1011b		~S0+S1                                               */
/*                        1100b		S0                                                   */
/*                        1101b		S0+~S1                                               */
/*                        1110b		S0+S1                                                */
/*                        1111b		1(whiteness)                                         */
/*                   X_W: Width of the active window                                     */
/*                   Y_H: Height of the active window                                    */
/* Returns:     None                                                                     */
/* Description: BTE memory copy with ROP                                                 */
/*---------------------------------------------------------------------------------------*/
void LT768_BTE_Memory_Copy
(
 unsigned long S0_Addr     
,unsigned short S0_W       
,unsigned short XS0        
,unsigned short YS0        
,unsigned long S1_Addr     
,unsigned short S1_W       
,unsigned short XS1        
,unsigned short YS1        
,unsigned long Des_Addr    
,unsigned short Des_W      
,unsigned short XDes       
,unsigned short YDes       
,unsigned int ROP_Code     
,unsigned short X_W       
,unsigned short Y_H       
)
{

#if LCD_16bit
		BTE_S0_Color_16bpp();
		BTE_S1_Color_16bpp();
		BTE_Destination_Color_16bpp();
#endif
	
#if LCD_24bit
		BTE_S0_Color_24bpp();
		BTE_S1_Color_24bpp();
		BTE_Destination_Color_24bpp();	
#endif	
	
	BTE_S0_Memory_Start_Address(S0_Addr);
	BTE_S0_Image_Width(S0_W);
	BTE_S0_Window_Start_XY(XS0,YS0);

	
	BTE_S1_Memory_Start_Address(S1_Addr);
	BTE_S1_Image_Width(S1_W); 
	BTE_S1_Window_Start_XY(XS1,YS1);

	
	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes,YDes);	

	BTE_ROP_Code(ROP_Code);	
	BTE_Operation_Code(0x02); //BTE Operation: Memory copy (move) with ROP.
	BTE_Window_Size(X_W,Y_H); 
	BTE_Enable();
	Check_BTE_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_BTE_Memory_Copy_Chroma_key                                         */
/*                                                                                       */
/* Parameters:                                                                           */
/*                       S0_Addr: Starting address (SDRAM) of S0 picture                 */
/*                          S0_W: Width of the S0 picture                                */
/*                           XS0: Left-top X coordinate of the S0 picture                */ 
/*                           YS0: Left-top Y coordinate of the S0 picture                */
/*                      Des_Addr: Starting address (SDRAM) of DT picture (DT:Destination)*/
/*                         Des_W: Width of the DT picture                                */
/*                          XDes: Left-top X coordinate of the DT picture                */ 
/*                          YDes: Left-top Y coordinate of the DT picture                */
/*              Background_color: Color (chroma key) to be taken as transparent          */
/*                           X_W: Width of the active window                             */
/*                           Y_H: Height of the active window                            */
/* Returns:     None                                                                     */
/* Description: BTE memory copy with Chroma Key (w/o ROP)                                */
/*---------------------------------------------------------------------------------------*/
void LT768_BTE_Memory_Copy_Chroma_key
(
 unsigned long S0_Addr             
,unsigned short S0_W               
,unsigned short XS0                
,unsigned short YS0                
,unsigned long Des_Addr            
,unsigned short Des_W              
,unsigned short XDes               
,unsigned short YDes               
,unsigned long Background_color    
,unsigned short X_W                
,unsigned short Y_H                
)
{
#if LCD_16bit
	Background_color_65k(Background_color);
	BTE_S0_Color_16bpp();
	BTE_Destination_Color_16bpp();
#endif

#if LCD_24bit
	Background_color_16M(Background_color);
	BTE_S0_Color_24bpp();
	BTE_Destination_Color_24bpp();
#endif
	
	BTE_S0_Memory_Start_Address(S0_Addr);
	BTE_S0_Image_Width(S0_W);
	BTE_S0_Window_Start_XY(XS0,YS0);	

	
	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes,YDes);

	BTE_Operation_Code(0x05);	//BTE Operation: Memory copy (move) with chroma keying (w/o ROP)
	BTE_Window_Size(X_W,Y_H); 
	BTE_Enable();
	Check_BTE_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_BTE_Pattern_Fill                                                   */
/*                                                                                       */
/* Parameters:                                                                           */
/*             P_8x8_or_16x16: 0: use 8x8 icon   1: use 16x16 icon                       */
/*                    S0_Addr: Starting address (SDRAM) of S0 picture                    */
/*                       S0_W: Width of the S0 picture                                   */
/*                        XS0: Left-top X coordinate of the S0 picture                   */ 
/*                        YS0: Left-top Y coordinate of the S0 picture                   */
/*                   Des_Addr: Starting address (SDRAM) of DT picture (DT: Destination)  */
/*                      Des_W: Width of the DT picture                                   */
/*                      XDes: Left-top X coordinate of the DT picture                    */ 
/*                      YDes: Left-top Y coordinate of the DT picture                    */
/*                  ROP_Code:                                                            */
/*                            0000b		0(Blackness)                                     */
/*                            0001b		~S0.~S1 or ~(S0+S1)                              */
/*                            0010b		~S0.S1                                           */
/*                            0011b		~S0                                              */
/*                            0100b		S0.~S1                                           */
/*                            0101b		~S1                                              */
/*                            0110b		S0^S1                                            */
/*                            0111b		~S0 + ~S1 or ~(S0 . S1)                          */
/*                            1000b		S0.S1                                            */
/*                            1001b		~(S0^S1)                                         */
/*                            1010b		S1                                               */
/*                            1011b		~S0+S1                                           */
/*                            1100b		S0                                               */
/*                            1101b		S0+~S1                                           */
/*                            1110b		S0+S1                                            */
/*                            1111b		1(whiteness)                                     */
/*                       X_W: Width of the active window                                 */
/*                       Y_H: Height of the active window                                */
/* Returns:     None                                                                     */
/* Description: BTE pattern fill operation with ROP                                      */
/*---------------------------------------------------------------------------------------*/
void LT768_BTE_Pattern_Fill
(
 unsigned char P_8x8_or_16x16      
,unsigned long S0_Addr             
,unsigned short S0_W               
,unsigned short XS0                
,unsigned short YS0                
,unsigned long Des_Addr            
,unsigned short Des_W              
, unsigned short XDes              
,unsigned short YDes               
,unsigned int ROP_Code             
,unsigned short X_W                
,unsigned short Y_H                
)
{
	if(P_8x8_or_16x16 == 0)
  {
		Pattern_Format_8X8();
  }
  if(P_8x8_or_16x16 == 1)
  {														    
		Pattern_Format_16X16();
  }	
	
#if LCD_16bit
	BTE_S0_Color_16bpp();
	BTE_Destination_Color_16bpp();
#endif
  
#if LCD_24bit
	BTE_S0_Color_24bpp();
	BTE_Destination_Color_24bpp();
#endif
	
	BTE_S0_Memory_Start_Address(S0_Addr);
	BTE_S0_Image_Width(S0_W);
	BTE_S0_Window_Start_XY(XS0,YS0);

	
	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes,YDes);	

	BTE_ROP_Code(ROP_Code);	
	BTE_Operation_Code(0x06); //BTE Operation: Pattern Fill with ROP.
	BTE_Window_Size(X_W,Y_H); 
	BTE_Enable();
	Check_BTE_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_BTE_Pattern_Fill_With_Chroma_key                                   */
/*                                                                                       */
/* Parameters:                                                                           */
/*               P_8x8_or_16x16: 0: use 8x8 icon   1: use 16x16 icon                     */
/*                      S0_Addr: Starting address (SDRAM) of S0 picture                  */
/*                         S0_W: Width of the S0 picture                                 */
/*                          XS0: Left-top X coordinate of the S0 picture                 */ 
/*                          YS0: Left-top Y coordinate of the S0 picture                 */
/*                     Des_Addr: Starting address (SDRAM) of DT picture (DT:Destination) */
/*                        Des_W: Width of the DT picture                                 */
/*                         XDes: Left-top X coordinate of the DT picture                 */ 
/*                         YDes: Left-top Y coordinate of the DT picture                 */
/*                     ROP_Code:                                                         */
/*                                0000b		0(Blackness)                                 */
/*                                0001b		~S0.~S1 or ~(S0+S1)                          */
/*                                0010b		~S0.S1                                       */
/*                                0011b		~S0                                          */
/*                                0100b		S0.~S1                                       */
/*                                0101b		~S1                                          */
/*                                0110b		S0^S1                                        */
/*                                0111b		~S0 + ~S1 or ~(S0 . S1)                      */
/*                                1000b		S0.S1                                        */
/*                                1001b		~(S0^S1)                                     */
/*                                1010b		S1                                           */
/*                                1011b		~S0+S1                                       */
/*                                1100b		S0                                           */
/*                                1101b		S0+~S1                                       */
/*                                1110b		S0+S1                                        */
/*                                1111b		1(whiteness)                                 */
/*              Background_color: Color (chroma key) to be taken as transparent          */
/*                           X_W: Width of the active window                             */
/*                           Y_H: Height of the active window                            */
/* Returns:     None                                                                     */
/* Description: BTE pattern fill operation with chroma key and ROP                       */
/*---------------------------------------------------------------------------------------*/
void LT768_BTE_Pattern_Fill_With_Chroma_key
(
 unsigned char P_8x8_or_16x16      
,unsigned long S0_Addr             
,unsigned short S0_W               
,unsigned short XS0                
,unsigned short YS0                
,unsigned long Des_Addr            
,unsigned short Des_W              
,unsigned short XDes               
,unsigned short YDes               
,unsigned int ROP_Code             
,unsigned long Background_color   
,unsigned short X_W               
,unsigned short Y_H               
)
{
	
	if(P_8x8_or_16x16 == 0)
	{
	Pattern_Format_8X8();
	}
	if(P_8x8_or_16x16 == 1)
	{														    
	Pattern_Format_16X16();
	}	  
	
#if LCD_16bit
	BTE_S0_Color_16bpp();
	BTE_Destination_Color_16bpp();
	Background_color_65k(Background_color);
#endif
	
#if LCD_24bit
	BTE_S0_Color_24bpp();
	BTE_Destination_Color_24bpp();
	Background_color_16M(Background_color);
#endif
	
	BTE_S0_Memory_Start_Address(S0_Addr);
	BTE_S0_Image_Width(S0_W);
	BTE_S0_Window_Start_XY(XS0,YS0);

	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes,YDes);	

	BTE_ROP_Code(ROP_Code);	
	BTE_Operation_Code(0x07); //BTE Operation: Pattern Fill with Chroma key.
	BTE_Window_Size(X_W,Y_H); 
	BTE_Enable();
	Check_BTE_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_BTE_MCU_Write_MCU_16bit                                            */
/*                                                                                       */
/* Parameters:                                                                           */
/*               S1_Addr: Starting address (SDRAM) of S1 picture                         */
/*                  S1_W: Width of the S1 picture                                        */
/*                   XS1: Left-top X coordinate of the S1 picture                        */ 
/*                   YS1: Left-top Y coordinate of the S1 picture                        */
/*              Des_Addr: Starting address (SDRAM) of DT picture (DT:Destination)        */
/*                 Des_W: Width of the DT picture                                        */
/*                  XDes: Left-top X coordinate of the DT picture                        */ 
/*                  YDes: Left-top Y coordinate of the DT picture                        */
/*              ROP_Code:                                                                */
/*                        0000b		0(Blackness)                                         */
/*                        0001b		~S0.~S1 or ~(S0+S1)                                  */
/*                        0010b		~S0.S1                                               */
/*                        0011b		~S0                                                  */
/*                        0100b		S0.~S1                                               */
/*                        0101b		~S1                                                  */
/*                        0110b		S0^S1                                                */
/*                        0111b		~S0 + ~S1 or ~(S0 . S1)                              */
/*                        1000b		S0.S1                                                */
/*                        1001b		~(S0^S1)                                             */
/*                        1010b		S1                                                   */
/*                        1011b		~S0+S1                                               */
/*                        1100b		S0                                                   */
/*                        1101b		S0+~S1                                               */
/*                        1110b		S0+S1                                                */
/*                        1111b		1(whiteness)                                         */
/*                  X_W: Width of the active window                                      */
/*                  Y_H: Height of the active window                                     */
/*                *data: Starting address of S0 picture                                  */
/* Returns:     None                                                                     */
/* Description: MCU write S0 data to DT with ROP                                         */
/*---------------------------------------------------------------------------------------*/
void LT768_BTE_MCU_Write_MCU_16bit
(
 unsigned long S1_Addr              
,unsigned short S1_W                
,unsigned short XS1                 
,unsigned short YS1                 
,unsigned long Des_Addr             
,unsigned short Des_W               
,unsigned short XDes                
,unsigned short YDes                
,unsigned int ROP_Code              
,unsigned short X_W                 
,unsigned short Y_H                 
,const unsigned short *data         
)
{
	unsigned short i,j;

	BTE_S1_Memory_Start_Address(S1_Addr);
	BTE_S1_Image_Width(S1_W); 
	BTE_S1_Window_Start_XY(XS1,YS1);

	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes,YDes);

	BTE_Window_Size(X_W,Y_H);
	BTE_ROP_Code(ROP_Code);
	BTE_Operation_Code(0x00);		//BTE Operation: MPU Write with ROP.
	BTE_Enable();
	
#if LCD_16bit
		BTE_S0_Color_16bpp();
		BTE_S1_Color_16bpp();
		BTE_Destination_Color_16bpp();	
		LCD_CmdWrite(0x04);
		
		for(i=0;i< Y_H;i++)
		{	
			for(j=0;j< (X_W);j++)
		  {
				Check_Mem_WR_FIFO_not_Full();
				LCD_DataWrite(*(data++));
				LCD_DataWrite(*(data++));
		  }
		}
#endif
		
#if LCD_24bit
		BTE_S0_Color_24bpp();
		BTE_S1_Color_24bpp();
		BTE_Destination_Color_24bpp();	
		LCD_CmdWrite(0x04);
		
		for(i=0;i< Y_H;i++)
		{	
			for(j=0;j< (X_W);j++)
		  {
				Check_Mem_WR_FIFO_not_Full();
				LCD_DataWrite(*(data++));
				LCD_DataWrite(*(data++));
				LCD_DataWrite(*(data++));
		  }
		}
#endif

	Check_Mem_WR_FIFO_Empty();
	Check_BTE_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_BTE_MCU_Write_Chroma_key_MCU_16bit                                 */
/*                                                                                       */
/* Parameters:                                                                           */
/*                      Des_Addr: Starting address (SDRAM) of DT picture (DT:Destination)*/
/*                         Des_W: Width of the DT picture                                */
/*                          XDes: Left-top X coordinate of the DT picture                */ 
/*                          YDes: Left-top Y coordinate of the DT picture                */
/*              Background_color: Color (chroma key) to be taken as transparent          */
/*                           X_W: Width of the active window                             */
/*                           Y_H: Height of the active window                            */
/*                         *data: Starting address of S0 picture                         */
/* Returns:     None                                                                     */
/* Description: MCU write S0 data to DT with chroma key                                  */
/*---------------------------------------------------------------------------------------*/
void LT768_BTE_MCU_Write_Chroma_key_MCU_16bit
(
 unsigned long Des_Addr                 
,unsigned short Des_W                   
,unsigned short XDes                    
,unsigned short YDes                    
,unsigned long Background_color         
,unsigned short X_W                     
,unsigned short Y_H                     
,const unsigned short *data             
)
{
	unsigned int i,j;
	
	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes,YDes);

	BTE_Window_Size(X_W,Y_H);
	BTE_Operation_Code(0x04);	//BTE Operation: MPU Write with chroma keying (w/o ROP)
	BTE_Enable();


	LCD_CmdWrite(0x04);			//Memory Data Read/Write Port

#if LCD_16bit
		Background_color_65k(Background_color);
		BTE_S0_Color_16bpp();
		BTE_S1_Color_16bpp();
		BTE_Destination_Color_16bpp();	
		LCD_CmdWrite(0x04);
		
		for(i=0;i< Y_H;i++)
		{	
			for(j=0;j< (X_W);j++)
		  {
				Check_Mem_WR_FIFO_not_Full();
				LCD_DataWrite(*(data++));
				LCD_DataWrite(*(data++));
		  }
		}
#endif

#if LCD_24bit
		Background_color_16M(Background_color);
		BTE_S0_Color_24bpp();
		BTE_S1_Color_24bpp();
		BTE_Destination_Color_24bpp();	
		LCD_CmdWrite(0x04);
		
		for(i=0;i< Y_H;i++)
		{	
			for(j=0;j< (X_W);j++)
		  {
				Check_Mem_WR_FIFO_not_Full();
				LCD_DataWrite(*(data++));
				LCD_DataWrite(*(data++));
				LCD_DataWrite(*(data++));
		  }
		}
#endif
  Check_Mem_WR_FIFO_Empty();
  Check_BTE_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_BTE_MCU_Write_ColorExpansion_MCU_16bit                             */
/*                                                                                       */
/* Parameters:                                                                           */
/*                      Des_Addr: Starting address (SDRAM) of DT picture (DT:Destination)*/
/*                         Des_W: Width of the DT picture                                */
/*                          XDes: Left-top X coordinate of the DT picture                */ 
/*                          YDes: Left-top Y coordinate of the DT picture                */
/*                           X_W: Width of the active window                             */
/*                           Y_H: Height of the active window                            */
/*              Foreground_color: Foreground color                                       */
/*              Background_color: Background color                                       */
/*                         *data: Starting address of the written data                   */
/* Returns:     None                                                                     */
/* Description: MCU write data to DT with color expansion                                */
/*---------------------------------------------------------------------------------------*/
void LT768_BTE_MCU_Write_ColorExpansion_MCU_16bit
(
 unsigned long Des_Addr               
,unsigned short Des_W                 
,unsigned short XDes                  
,unsigned short YDes                 
,unsigned short X_W                   
,unsigned short Y_H                   
,unsigned long Foreground_color       
/*Foreground_color : The source (1bit map picture) map data 1 translate to Foreground color by color expansion*/
,unsigned long Background_color       
/*Background_color : The source (1bit map picture) map data 0 translate to Background color by color expansion*/
,const unsigned short *data           
)
{
	unsigned short i,j;
	
#if LCD_16bit
	Foreground_color_65k(Foreground_color);
	Background_color_65k(Background_color);
	BTE_Destination_Color_16bpp();
#endif	
	
#if LCD_24bit
	Foreground_color_16M(Foreground_color);
	Background_color_16M(Background_color);
	BTE_Destination_Color_24bpp();
#endif	

	

	
	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes,YDes);

	BTE_ROP_Code(15);
	BTE_Window_Size(X_W,Y_H);
	BTE_Operation_Code(0x8);		//BTE Operation: MPU Write with Color Expansion (w/o ROP)
	BTE_Enable();
	
	LCD_CmdWrite(0x04);		 		//Memory Data Read/Write Port  
	for(i=0;i< Y_H;i++)
	  {	
		  for(j=0;j< X_W/8;j++)
		  {
			Check_Mem_WR_FIFO_not_Full();
			LCD_DataWrite(*data++);  
		  }
	  }
	Check_Mem_WR_FIFO_Empty();
	Check_BTE_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_BTE_MCU_Write_ColorExpansion_Chroma_key_MCU_16bit                  */
/*                                                                                       */
/* Parameters:                                                                           */
/*                      Des_Addr: Starting address (SDRAM) of DT picture (DT:Destination)*/
/*                         Des_W: Width of the DT picture                                */
/*                          XDes: Left-top X coordinate of the DT picture                */ 
/*                          YDes: Left-top Y coordinate of the DT picture                */
/*                           X_W: Width of the active window                             */
/*                           Y_H: Height of the active window                            */
/*              Foreground_color: Foreground color                                       */
/*                         *data: Starting address of the written data                   */
/* Returns:     None                                                                     */
/* Description: MCU write data to DT with color expansion and ignore background color    */
/*---------------------------------------------------------------------------------------*/
void LT768_BTE_MCU_Write_ColorExpansion_Chroma_key_MCU_16bit
(
 unsigned long Des_Addr            
,unsigned short Des_W              
,unsigned short XDes               
,unsigned short YDes               
,unsigned short X_W                
,unsigned short Y_H                
,unsigned long Foreground_color    
/*Foreground_color : The source (1bit map picture) map data 1 translate to Foreground color by color expansion*/
,const unsigned short *data        
)
{
	unsigned short i,j;
	
#if LCD_16bit
	Foreground_color_65k(Foreground_color);
	BTE_Destination_Color_16bpp();
#endif
	
#if LCD_24bit
	Foreground_color_16M(Foreground_color);
	BTE_Destination_Color_24bpp();
#endif
	
	
	BTE_ROP_Code(15);
	
	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes,YDes);


	BTE_Window_Size(X_W,Y_H);
	BTE_Operation_Code(0x9);		//BTE Operation: MPU Write with Color Expansion and chroma keying (w/o ROP)
	BTE_Enable();
	
	LCD_CmdWrite(0x04);				//Memory Data Read/Write Port  
	for(i=0;i< Y_H;i++)
	{	
	  for(j=0;j< X_W/8;j++)
	  {
		Check_Mem_WR_FIFO_not_Full();
		LCD_DataWrite(*data++);
	  }
	}
	Check_Mem_WR_FIFO_Empty();
	Check_BTE_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    BTE_Alplha_Blending                                                      */
/*                                                                                       */
/* Parameters:                                                                           */
/*               S0_Addr: Starting address (SDRAM) of S0 picture                         */
/*                  S0_W: Width of the S0 picture                                        */
/*                   XS0: Left-top X coordinate of the S0 picture                        */ 
/*                   YS0: Left-top Y coordinate of the S0 picture                        */
/*               S1_Addr: Starting address (SDRAM) of S1 picture                         */
/*                  S1_W: Width of the S1 picture                                        */
/*                   XS1: Left-top X coordinate of the S1 picture                        */ 
/*                   YS1: Left-top Y coordinate of the S1 picture                        */
/*              Des_Addr: Starting address (SDRAM) of DT picture (DT: Destination)       */
/*                 Des_W: Width of the DT picture                                        */
/*                  XDes: Left-top X coordinate of the DT picture                        */ 
/*                  YDes: Left-top Y coordinate of the DT picture                        */
/*                   X_W: Width of the active window                                     */
/*                   Y_H: Height of the active window                                    */
/*                 alpha: Alpha blending level (0~31 levels)                             */
/* Returns:     None                                                                     */
/* Description: BTE memory copy with opacity setting -                                   */
/*              refer to "LT768x_AP-Note_V12_ENG.pdf" Chapter 10.2.9 for more detail     */
/*---------------------------------------------------------------------------------------*/
void BTE_Alpha_Blending
(
 unsigned long S0_Addr         
 ,unsigned short S0_W          
 ,unsigned short XS0           
 ,unsigned short YS0           
 ,unsigned long S1_Addr        
 ,unsigned short S1_W          
 ,unsigned short XS1           
 ,unsigned short YS1           
 ,unsigned long Des_Addr       
 ,unsigned short Des_W         
 ,unsigned short XDes          
 ,unsigned short YDes          
 ,unsigned short X_W           
 ,unsigned short Y_H           
 ,unsigned char alpha          
)
{	

#if LCD_16bit
	BTE_S0_Color_16bpp();
	BTE_S1_Color_16bpp();
	BTE_Destination_Color_16bpp();
#endif

#if LCD_24bit
	BTE_S0_Color_24bpp();
	BTE_S1_Color_24bpp();
	BTE_Destination_Color_24bpp();
#endif
	
	BTE_S0_Memory_Start_Address(S0_Addr);
	BTE_S0_Image_Width(S0_W);
	BTE_S0_Window_Start_XY(XS0,YS0);
	
	BTE_S1_Memory_Start_Address(S1_Addr);
	BTE_S1_Image_Width(S1_W); 
	BTE_S1_Window_Start_XY(XS1,YS1);
	
	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes,YDes);

	BTE_Window_Size(X_W,Y_H);
	BTE_Operation_Code(0x0A);		//BTE Operation: Memory write with opacity (w/o ROP)
	BTE_Alpha_Blending_Effect(alpha);
	BTE_Enable();
	Check_BTE_Busy();
}


//----------------------------------------------------------------------------------------------------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_PWM0_Init                                                          */
/*                                                                                       */
/* Parameters:                                                                           */
/*                      on_off: 0: disable PWM0    1: enable PWM0                        */
/*               Clock_Divided: PWM clock, setting range 0~3(1,1/2,1/4,1/8)              */
/*                   Prescalar: Clock scaling, setting range 1~256                       */
/*                Count_Buffer: PWM output cycle                                         */
/*              Compare_Buffer: Duty cycle                                               */
/* Returns:     None                                                                     */
/* Description: Initialize PWM0                                                          */
/*---------------------------------------------------------------------------------------*/
void LT768_PWM0_Init
(
 unsigned char on_off                       
,unsigned char Clock_Divided                
,unsigned char Prescalar                    
,unsigned short Count_Buffer                
,unsigned short Compare_Buffer              
)
{
	 Select_PWM0();
   Set_PWM_Prescaler_1_to_256(Prescalar);

	if(Clock_Divided ==0)	Select_PWM0_Clock_Divided_By_1();
	if(Clock_Divided ==1)	Select_PWM0_Clock_Divided_By_2();
	if(Clock_Divided ==2)	Select_PWM0_Clock_Divided_By_4();
	if(Clock_Divided ==3) Select_PWM0_Clock_Divided_By_8();

	Set_Timer0_Count_Buffer(Count_Buffer);  
	Set_Timer0_Compare_Buffer(Compare_Buffer);	
		
	if (on_off == 1)	Start_PWM0(); 
	if (on_off == 0)	Stop_PWM0();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_PWM0_Duty                                                          */
/*                                                                                       */
/* Parameters:                                                                           */
/*              Compare_Buffer: Duty cycle                                               */
/* Returns:     None                                                                     */
/* Description: Set PWM0 duty cycle                                                      */
/*---------------------------------------------------------------------------------------*/
void LT768_PWM0_Duty(unsigned short Compare_Buffer)
{
	Set_Timer0_Compare_Buffer(Compare_Buffer);
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_PWM1_Init                                                          */
/*                                                                                       */
/* Parameters:                                                                           */
/*                      on_off: 0: disable PWM0    1: enable PWM0                        */
/*               Clock_Divided: PWM clock, setting range 0~3(1,1/2,1/4,1/8)              */
/*                   Prescalar: Clock scaling, setting range 1~256                       */
/*                Count_Buffer: PWM output cycle                                         */
/*              Compare_Buffer: Duty cycle                                               */
/* Returns:     None                                                                     */
/* Description: Initialize PWM1                                                          */
/*---------------------------------------------------------------------------------------*/
void LT768_PWM1_Init
(
 unsigned char on_off                       
,unsigned char Clock_Divided                
,unsigned char Prescalar                    
,unsigned short Count_Buffer                
,unsigned short Compare_Buffer              
)
{
	Select_PWM1();
	Set_PWM_Prescaler_1_to_256(Prescalar);
 
	if(Clock_Divided ==0)	Select_PWM1_Clock_Divided_By_1();
	if(Clock_Divided ==1)	Select_PWM1_Clock_Divided_By_2();
	if(Clock_Divided ==2)   Select_PWM1_Clock_Divided_By_4();
	if(Clock_Divided ==3)	Select_PWM1_Clock_Divided_By_8();

	Set_Timer1_Count_Buffer(Count_Buffer); 
	Set_Timer1_Compare_Buffer(Compare_Buffer); 

	if (on_off == 1)	Start_PWM1(); 
	if (on_off == 0)	Stop_PWM1();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_PWM1_Duty                                                          */
/*                                                                                       */
/* Parameters:                                                                           */
/*              Compare_Buffer: Duty cycle                                               */
/* Returns:     None                                                                     */
/* Description: Set PWM1 duty cycle                                                      */
/*---------------------------------------------------------------------------------------*/
void LT768_PWM1_Duty(unsigned short Compare_Buffer)
{
	Set_Timer1_Compare_Buffer(Compare_Buffer);
}


//--------------------------------------------------- Print Unicode ---------------------------------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT_W25qxx_Read                                                           */
/*                                                                                       */
/* Parameters:                                                                           */
/*                    pBuffer: Buffer for storing read data                              */
/*                   ReadAddr: Starting flash address to read data                       */
/*              NumByteToRead: Amount of data to read                                    */
/* Returns:     None                                                                     */
/* Description: To retrieve data from Flash                                               */
/*---------------------------------------------------------------------------------------*/
void LT_W25qxx_Read(u8 *pBuffer, u32 ReadAddr, u16 NumByteToRead)
{
	u16 i;
	nSS_Active();
	SPI_Master_FIFO_Data_Put(0x03);    // W25X read command

	// 24bits address
	SPI_Master_FIFO_Data_Put((uint8_t)((ReadAddr) >> 16));
	SPI_Master_FIFO_Data_Put((uint8_t)((ReadAddr) >> 8));
	SPI_Master_FIFO_Data_Put((uint8_t)ReadAddr);
	
	LCD_CmdWrite(0xB8); 

	for (i = 0; i < NumByteToRead; i++)
	{
		LCD_DataWrite(0xFF);
		pBuffer[i] = LCD_DataRead(); 
	}
	
	nSS_Inactive();
	
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT_ReadFlash                                                             */
/*                                                                                       */
/* Parameters:                                                                           */
/*                    pBuffer: Buffer for storing read data                              */
/*                   ReadAddr: Starting flash address to read data                       */
/*              NumByteToRead: Amount of data to read                                    */
/* Returns:     None                                                                     */
/* Description: To retrieve data from Flash (Maximum: 65KB)                              */
/*---------------------------------------------------------------------------------------*/
void LT_ReadFlash(u8 *pBuffer, u32 ReadAddr, u16 NumByteToRead)
{
	SPI_Clock_Period(1);

	LT_W25qxx_Read(pBuffer, ReadAddr, NumByteToRead);
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Draw_16bit                                                         */
/*                                                                                       */
/* Parameters:                                                                           */
/*                       SCS: Select SPI device   0: SPI0, 1: SPI1                       */
/*                       Clk: SPI Clock - System Clock /{(Clk+1)*2}                      */
/*                        X1: X start coordinate of the destination                      */ 
/*                        Y1: Y start coordinate of the destination                      */
/*                       X_W: Data width                                                 */
/*                       Y_H: Data height                                                */
/*                       P_W: Picture width                                              */ 
/*                   F_Color: Font color                                                 */
/*                   B_Color: Background color                                           */
/*               transparent: 1: remove background    0: show background color           */
/*              pixel_format: Options: 1/2/4 bits                                        */
/*                      Addr: Starting address to retrieve data from flash               */ 
/*                      lay0: SDRAM layer address to write to                            */
/*                  canvas_w: Layer width                                                */
/* Returns:     None                                                                     */
/* Description: To draw one unicode symbol/character (PNG picture)                       */
/*---------------------------------------------------------------------------------------*/
u8 cSetb[8] = {cSetb0, cSetb1, cSetb2, cSetb3, cSetb4, cSetb5, cSetb6, cSetb7};
u8 cSetb_2bit[4] = {0xc0, 0x30, 0x0c, 0x03};
u8 cSetb_4bit[2] = {0xF0, 0x0F};
void LT768_Draw_16bit
(
 unsigned char SCS 
,unsigned char Clk 
,unsigned short X1 
,unsigned short Y1 
,unsigned short X_W 
,unsigned short Y_H 
,unsigned short P_W 
,unsigned long F_Color 
,unsigned long B_Color 
,unsigned short transparent 
,unsigned short pixel_format
,unsigned long Addr      
,unsigned long lay0       
,unsigned short canvas_w 
)
{
	unsigned short a, b, c, d;
	u16 color_temp , bcolor_temp;
	u16 temp;
	u8 fdata[8 * 128 * 2];

	LT768_SPI_Init(SCS, Clk);               // Intialize selected SPI (for Flash)
	
	LT_ReadFlash(fdata, Addr, X_W * Y_H );  // Retrieve data from SPI Flash
	
	if (F_Color == 0)
		F_Color += 1;
	if (B_Color == 0)
		B_Color += 1;
	
	if(transparent == 1) bcolor_temp = 0;
	else if(transparent == 0) 
	{
		bcolor_temp = B_Color;		
	}
	
	Graphic_Mode();
	Canvas_Image_Start_address(lay0);
	Canvas_image_width(canvas_w);
	Active_Window_XY(X1, Y1);
	Active_Window_WH(P_W, Y_H);
		
	Goto_Pixel_XY(X1, Y1);
	LCD_CmdWrite(0x04);
	
#if STM32_SPI_8	                     //Using SPI continuous DataWrite mechanism
	
	SS_RESET;
	SPI2_ReadWriteByte(0x80);
	
	if(pixel_format == 1)            // For 1bit unicode font
	{		
		for (a = 0; a < Y_H; a++)
		{
			for (c = 0; c < X_W; c++)
			{
				for (b = 0; b < 8; b++)
				{
					if (fdata[X_W * a + c] & cSetb[7 - b])
					{
						SPI2_ReadWriteByte(F_Color);
						SPI2_ReadWriteByte(F_Color >> 8);
					}
					else
					{
						SPI2_ReadWriteByte(bcolor_temp);
						SPI2_ReadWriteByte(bcolor_temp >> 8);
					}
				}
			}
		}
	}
	else if(pixel_format == 2)     // for 2bits unicode font
	{
		for (a = 0; a < Y_H; a++)
		{
			for (c = 0; c < X_W; c++)
			{
				for (b = 0; b < 4; b++)
				{
					temp = (fdata[X_W * a  + c]  & cSetb_2bit[b]);
					if( b == 0) temp = temp >> 6 ;
					else if( b == 1) temp = temp >> 4 ;
					else if( b == 2) temp = temp >> 2 ;
					if (temp>0)
					{
						if(temp == 1) color_temp = F_Color | (0x04<<12) ;
						else if(temp == 2) color_temp = F_Color | (0x08<<12) ;
						else if(temp == 3) color_temp = F_Color | (0x0F<<12) ;							
						SPI2_ReadWriteByte(color_temp);
						SPI2_ReadWriteByte(color_temp >> 8);
					}
					else
					{
						SPI2_ReadWriteByte(bcolor_temp);
						SPI2_ReadWriteByte(bcolor_temp >> 8);
					}
				}			
			}
		}
	}
	else if(pixel_format == 4)     // for 4bits unicode font
	{
		for (a = 0; a < Y_H; a++)
		{
			for (c = 0; c < X_W; c++)
			{
				for (b = 0; b < 2; b++)
				{
					temp = (fdata[X_W * a  + c]  & cSetb_4bit[b]);
					if( b == 0) temp = temp >> 4 ;
					if (temp>0)
					{
						color_temp = F_Color | (temp<<12) ;
						SPI2_ReadWriteByte(color_temp);
						SPI2_ReadWriteByte(color_temp >> 8);
					}
					else
					{
						SPI2_ReadWriteByte(bcolor_temp);
						SPI2_ReadWriteByte(bcolor_temp >> 8);
					}
				}			
			}
		}
	}

	SS_SET;
#endif
	
#if STM32_S_8080
	
	if(pixel_format == 1)            // For 1bit unicode font
	{		
		for (a = 0; a < Y_H; a++)
		{
			for (c = 0; c < X_W; c++)
			{
				for (b = 0; b < 8; b++)
				{
					if (fdata[X_W * a + c] & cSetb[7 - b])
					{
						LCD_DataWrite_Pixel(F_Color);
					}
					else
					{
					    LCD_DataWrite_Pixel(bcolor_temp);
					}
				}
			}
		}
	}
	else if(pixel_format == 2)     // for 2bits unicode font
	{
		for (a = 0; a < Y_H; a++)
		{
			for (c = 0; c < X_W; c++)
			{
				for (b = 0; b < 4; b++)
				{
					temp = (fdata[X_W * a  + c]  & cSetb_2bit[b]);
					if( b == 0) temp = temp >> 6 ;
					else if( b == 1) temp = temp >> 4 ;
					else if( b == 2) temp = temp >> 2 ;
					if (temp>0)
					{
						if(temp == 1) color_temp = F_Color | (0x04<<12) ;
						else if(temp == 2) color_temp = F_Color | (0x08<<12) ;
						else if(temp == 3) color_temp = F_Color | (0x0F<<12) ;							
						
						LCD_DataWrite_Pixel(color_temp);
					}
					else
					{
						LCD_DataWrite_Pixel(bcolor_temp);
					}
				}			
			}
		}
	}
	else if(pixel_format == 4)     // for 4bits unicode font
	{
		for (a = 0; a < Y_H; a++)
		{
			for (c = 0; c < X_W; c++)
			{
				for (b = 0; b < 2; b++)
				{
					temp = (fdata[X_W * a  + c]  & cSetb_4bit[b]);
					if( b == 0) temp = temp >> 4 ;
					if (temp>0)
					{
						color_temp = F_Color | (temp<<12) ;
					
						LCD_DataWrite_Pixel(color_temp);
					}
					else
					{
						LCD_DataWrite_Pixel(bcolor_temp);
					}
				}
			}
		}
	}
	
#endif
	
}

/*---------------------------------------------------------------------------------------*/
/* Function:    BTE_Pixel_16bpp_Alplha_Blending                                          */
/*                                                                                       */
/* Parameters:                                                                           */
/*               S0_Addr: Starting address (SDRAM) of S0 picture                         */
/*                  S0_W: Width of the S0 picture                                        */
/*                   XS0: Left-top X coordinate of the S0 picture                        */ 
/*                   YS0: Left-top Y coordinate of the S0 picture                        */
/*               S1_Addr: Starting address (SDRAM) of S1 picture                         */
/*                  S1_W: Width of the S1 picture                                        */
/*                   XS1: Left-top X coordinate of the S1 picture                        */ 
/*                   YS1: Left-top Y coordinate of the S1 picture                        */
/*              Des_Addr: Starting address (SDRAM) of DT picture (DT: Destination)       */
/*                 Des_W: Width of the DT picture                                        */
/*                  XDes: Left-top X coordinate of the DT picture                        */ 
/*                  YDes: Left-top Y coordinate of the DT picture                        */
/*                   X_W: Width of the active window                                     */
/*                   Y_H: Height of the active window                                    */
/*                 alpha: Alpha blending level (0~31 levels)                             */
/* Returns:     None                                                                     */
/* Description: BTE memory copy with opacity setting - Only support 16bpp PNG picture    */
/*              refer to "LT768x_AP-Note_V12_ENG.pdf" Chapter 10.2.9 for more detail     */
/*---------------------------------------------------------------------------------------*/
void BTE_Pixel_16bpp_Alpha_Blending 
(
 unsigned long S0_Addr 
,unsigned short S0_W 
,unsigned short XS0 
,unsigned short YS0 
,unsigned long S1_Addr 														 	
,unsigned short S1_W 
,unsigned short XS1 
,unsigned short YS1 
,unsigned long Des_Addr 													
,unsigned short Des_W 
,unsigned short XDes 
,unsigned short YDes 
,unsigned short X_W 
,unsigned short Y_H 
)
{
	BTE_S0_Color_16bpp();
	BTE_S0_Memory_Start_Address(S0_Addr);
	BTE_S0_Image_Width(S0_W);
	BTE_S0_Window_Start_XY(XS0, YS0);

	BTE_S1_Color_16bit_Alpha();
	BTE_S1_Memory_Start_Address(S1_Addr);
	BTE_S1_Image_Width(S1_W);
	BTE_S1_Window_Start_XY(XS1, YS1);

	BTE_Destination_Color_16bpp();
	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes, YDes);

	BTE_Window_Size(X_W, Y_H);
	BTE_Operation_Code(0x0A); //BTE Operation: Memory write with opacity (w/o ROP)
	BTE_Enable();
	Check_BTE_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Print_Font_Unicode                                                 */
/*                                                                                       */
/* Parameters:                                                                           */
/*                    FlashAddr: Font address in the Flash                               */
/*                            x: x coordinate to start displaying unicode                */ 
/*                            y: y coordinate to start displaying unicode                */
/*                            w: String display length                                   */
/*                    FontColor: Font color                                              */
/*              BackGroundColor: Background color                                        */ 
/*                  transparent: Flag for removing background                            */
/*                String_Length: String length - the amount of the code (unit: byte)     */
/*                           *c: Starting address of the string                          */
/* Returns:     None                                                                     */
/* Description: Print out unicode fonts                                                  */
/*---------------------------------------------------------------------------------------*/
u8 ASCII_W[95] = {0};   // For decoding bin file's header     
void LT768_Print_Font_Unicode
(
 unsigned long FlashAddr 
,unsigned short x 
,unsigned short y 
,unsigned short w 
,unsigned long FontColor 
,unsigned long BackGroundColor
,unsigned short transparent 
,unsigned short String_Length 
,char *c 
)
{
	unsigned short temp = 0;               // For Unicode index
	unsigned long i = 0;                   // For input string index
	unsigned short width_Hor = 0;          // For actual width of the unicode
	u16 size_w,size_h;                     // For original font width and height
	u16 unicode = 0;                       // For unicode 
	u16 start_code = 0, end_code = 0;      // For the start/end code of the Unicode
	u16 temp_x = x;                        // The x coordinate to print out the font
	u16 temp_y = y;                        // The y coordinate to print out the font
	u8 Ascii_temp;                         // Ascii code index 
	u8 gray = 0;                           // Grayscale
	u8 temp_pixel;                         // Pixel amount per byte
	u8 pixel_format;                       // Represent 1/2/4bits grayscale
	
	u8 error_flag = 0;                     // 0: the code value is within the code range
	                                       // 1: if the read code is outside of the code range
	
	/*************************** Unicode Header List *************************** 
	  byte0                      'U'--0x55
	  byte1                      'N'--0x4E
	  byte2                       Font width
	  byte3                       Font height
	  byte4                       StartCode & 0xFF            LSB
	  byte5                       (StartCode<<8) & 0xFF       MSB
	  byte6                       EndCode & 0xFF              LSB
	  byte7                       (EndCode<<8) & 0xFF         MSB
    ----------------------------------------------------------------------------   
      byte8                       Grayscale of pixel
	                              0 -- 1bit
				                  1 -- 2bits
				                  2 -- 4bits
				                  3 -- 8bits
	----------------------------------------------------------------------------  
	  byte9~103                   Width of each Ascii code 
	                              (0x20~0x7E)
	----------------------------------------------------------------------------  
	  byte104                     ASCII graphic data          1bit: bitsData=8
	  to                                                      2bits:bitsData=4 
	  byte(104+W*H*95/bitsData-1)                             4bits:bitsData=2
															  8bits:bitsData=1 
	----------------------------------------------------------------------------														  
	  byte(104+W*H*95/bitsData)~  Unicode Font graphic data
	                              (start position)
	*****************************************************************************/
	
	LT768_SPI_Init(1,1);                                      // Initialzie & enable SPI Flash
	
	LT_ReadFlash(ASCII_W , FlashAddr + 2 , 7);                // Retrieve byte2 ~ 8 from flash
	size_w = ASCII_W[0];                                      // byte2: font width
	size_h = ASCII_W[1];                                      // byte3: font height
	start_code = ASCII_W[2] + (ASCII_W[3] << 8);              // byte4 and byte 5: Start code of the unicode 
	end_code = ASCII_W[4] + (ASCII_W[5] << 8);                // byte6 and byte 7: End code of the unicode
	gray = ASCII_W[6];                                        // byte8: Grayscale of pixel

    if(gray == 0)      { temp_pixel = 8;  pixel_format = 1;}  // pixel_format -> 1/2/4 bits (Grayscale) 
	else if(gray == 1) { temp_pixel = 4;  pixel_format = 2;}
	else if(gray == 2) { temp_pixel = 2;  pixel_format = 4;}
	
	if ( size_w%temp_pixel != 0)                                       
		width_Hor = size_w / temp_pixel + 1;
	else
		width_Hor = size_w / temp_pixel;
	
	LT_ReadFlash(ASCII_W, FlashAddr + 9, 95);                 // Retrieve Ascii code widths and store them to ASCII_W array

	while(String_Length)
	{
		unicode = (c[i]<<8) + c[i+1];                          // Reassemble the code

		if (unicode < 128 && unicode > 0x00)                   // Print ASCII 
		{
			Ascii_temp = unicode - 0x20;                       // Ascii code index
			
			// Draw Ascii by its png data
			LT768_Draw_16bit(1, 0, temp_x, temp_y, width_Hor, size_h, width_Hor * temp_pixel, FontColor, BackGroundColor, transparent, pixel_format, FlashAddr + 104 + Ascii_temp * width_Hor * size_h, LAYER_2, LCD_XSIZE_TFT);
			
			i += 2;                                            
			String_Length -= 2;                                
			temp_x = temp_x + ASCII_W[Ascii_temp] + 1;          // ASCII_W[Ascii_temp] = the width of the current Ascii code -> 
			                                                    // This line is to calculate the x coordinate of the next Ascii code
		}
		else if (unicode >= start_code && unicode <= end_code)  // Print Unicode 
		{
			temp = unicode - start_code;                        // Unicode index start with start_code

			// Draw Unicode by its png data
			LT768_Draw_16bit(1, 0, temp_x, temp_y, width_Hor, size_h, width_Hor * temp_pixel, FontColor, BackGroundColor, transparent, pixel_format, FlashAddr + 104 + (temp + 95) * width_Hor * size_h, LAYER_2, LCD_XSIZE_TFT);

			i += 2;
			String_Length -= 2;
			temp_x = temp_x + size_w;                           // size_w = the width of each Unicode character ->
			                                                    // This line is to calculate the x coordinate of the next Unicode
		}
		else
		{
			error_flag = 1;
			break;
		}
		if(error_flag == 0)
		{
			// Reset Active window parameters
			Active_Window_XY(0, 0); 
			Active_Window_WH(LCD_XSIZE_TFT, LCD_YSIZE_TFT);
			
			// Reset the text buffer area by the basemap image
			LT768_BTE_Memory_Copy(LAYER_3, LCD_XSIZE_TFT, x, temp_y, 
								  LAYER_3, LCD_XSIZE_TFT, x, temp_y,
								  LAYER_1, LCD_XSIZE_TFT, x, temp_y,
								  0x0c, w, size_h);					
		
							
			if(gray == 0)                   // 1bit font - directly output the result
			{
				LT768_BTE_Memory_Copy_Chroma_key(LAYER_2, LCD_XSIZE_TFT, x, temp_y,
												 LAYER_1, LCD_XSIZE_TFT, x, temp_y,
												 Black, temp_x - x, size_h);
			}
			else if(gray == 1 || gray == 2) // 2bits or 4bits font - perform alpha blending to enhance the display effects
			{
				if(transparent == 0)
				{
					Canvas_Image_Start_address(LAYER_1);
					Canvas_image_width(LCD_XSIZE_TFT);
					LT768_DrawSquare_Fill(x, temp_y, temp_x, temp_y+size_h,  BackGroundColor);
				}
				BTE_Pixel_16bpp_Alpha_Blending(LAYER_1, LCD_XSIZE_TFT, x, temp_y,
											   LAYER_2, LCD_XSIZE_TFT, x, temp_y,
											   LAYER_1, LCD_XSIZE_TFT, x, temp_y,
											   temp_x - x, size_h);
			}
			
			// Move the final data to the display layer
			LT768_BTE_Memory_Copy(LAYER_1, LCD_XSIZE_TFT, x, y,
								  LAYER_1, LCD_XSIZE_TFT, x, y,
								  LAYER_0, LCD_XSIZE_TFT, x, y,
								  0x0c, w, size_h);
		}
	}
}
//---------------------------------------------------------------------------------------------------------------------------------


//--------------------------------------------------- MCU write Flash -------------------------------------------------------------
// Flash Instruction Table
#define W25X_WriteEnable		0x06       
#define W25X_WriteDisable		0x04 
#define W25X_ReadStatusReg		0x05 
#define W25X_WriteStatusReg		0x01 
#define W25X_ReadData			0x03 
#define W25X_FastReadData		0x0B 
#define W25X_FastReadDual		0x3B 
#define W25X_PageProgram		0x02
#define W25X_BlockErase32KB		0x52
#define W25X_BlockErase64KB		0xD8 
#define W25X_SectorErase		0x20 
#define W25X_ChipErase			0xC7 
#define W25X_PowerDown			0xB9 
#define W25X_ReleasePowerDown	0xAB 
#define W25X_DeviceID			0xAB 
#define W25X_ManufactDeviceID	0x90 
#define W25X_JedecDeviceID		0x9F


/*---------------------------------------------------------------------------------------*/
/* Function:    W25QXX_ReadSR                                                            */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     Byte                                                                     */
/*              BIT 7   6   5    4    3    2    1    0                                   */
/*                 SPR  RV  TB  BP2  BP1  BP0  WEL  BUSY                                 */
/*              Default: 0x00                                                            */
/* Description: Read Status Register of the SPI Flash                                    */
/*---------------------------------------------------------------------------------------*/
uint8_t W25QXX_ReadSR(void)   
{  
	uint8_t byte=0;   
	nSS_Active();                            		// Select device   
	SPI_Master_FIFO_Data_Put(W25X_ReadStatusReg); 	// Issue the "read status register" insturction    
	byte=SPI_Master_FIFO_Data_Put(0xff);          	// Read a byte  
	nSS_Inactive();                            		// Disselect device     
	return byte;   
} 

/*---------------------------------------------------------------------------------------*/
/* Function:    W25QXX_Write_Enable                                                      */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Enable "Write to Flash"                                                  */
/*---------------------------------------------------------------------------------------*/
void W25QXX_Write_Enable(void)   
{
	nSS_Active();                          			// Select device   
    SPI_Master_FIFO_Data_Put(W25X_WriteEnable); 	// Issue "Enable Write to Flash" instruction  
	nSS_Inactive();                           		// Disselect device     	      
} 

/*---------------------------------------------------------------------------------------*/
/* Function:    W25QXX_Wait_Busy                                                         */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Wait while the flash is busy                                             */
/*---------------------------------------------------------------------------------------*/
void W25QXX_Wait_Busy(void)   		
{   
	while((W25QXX_ReadSR()&0x01)==0x01) ;  		// Wait while the flash is busy
}  

/*---------------------------------------------------------------------------------------*/
/* Function:    W25QXX_Erase_Chip                                                        */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Erase the whole flash chip                                               */
/*---------------------------------------------------------------------------------------*/
void W25QXX_Erase_Chip(void)   
{                                   
    W25QXX_Write_Enable();                 	 	// Enable "write to flash" 
    W25QXX_Wait_Busy();                         // Wait while the flash is busy
    nSS_Active();                            	// Select device   
    SPI_Master_FIFO_Data_Put(W25X_ChipErase);   // Issue "Erase Chip" instruction  
    nSS_Inactive();                            	// Disselect device     
	W25QXX_Wait_Busy();   				   		// Wait till the "erase" operation is done				   		       
} 

/*---------------------------------------------------------------------------------------*/
/* Function:    W25QXX_Write_Page                                                        */
/*                                                                                       */
/* Parameters:                                                                           */
/*                     pBuffer: Buffer for the data to be written to the flash           */
/*                   WriteAddr: Starting flash address to wirte data                     */
/*              NumByteToWrite: Amount of data to write                                  */
/* Returns:     None                                                                     */
/* Description: To write data to Flah                                                    */
/*---------------------------------------------------------------------------------------*/
void W25QXX_Write_Page(uint8_t* pBuffer,uint32_t WriteAddr,uint16_t NumByteToWrite)
{
 	uint16_t i;  
    W25QXX_Write_Enable();                  				// Enable "write to flash" 
	nSS_Active();                            				// Select device   
    SPI_Master_FIFO_Data_Put(W25X_PageProgram);      		// Issue the "write page" instruction 
	
    SPI_Master_FIFO_Data_Put((uint8_t)((WriteAddr)>>16)); 	// Issue the 24bit address    
    SPI_Master_FIFO_Data_Put((uint8_t)((WriteAddr)>>8));   
    SPI_Master_FIFO_Data_Put((uint8_t)WriteAddr);
	
	
	#if STM32_SPI_8
		LCD_CmdWrite(0xB8);
		SS_RESET; 	      
		SPI2_ReadWriteByte(0x80);
	#endif
    for(i=0;i<NumByteToWrite;i++)
	{
			
		#if STM32_SPI_8
			SPI2_ReadWriteByte(pBuffer[i]);
		#else
			LCD_CmdWrite(0xB8);
			LCD_DataWrite(pBuffer[i]);
		#endif		
		
	}
	#if STM32_SPI_8
		SS_SET; 	      
	#endif
	nSS_Inactive();                            				// Disselect device 
	W25QXX_Wait_Busy();					   					// Wait till the "write" operation is done
} 

//---------------------------------------------------------------------------------------------------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Standby                                                            */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Set LT768x enter standby mode                                            */
/*---------------------------------------------------------------------------------------*/
void LT768_Standby(void)
{
	Power_Saving_Standby_Mode();
	Check_Power_is_Saving();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Wkup_Standby                                                       */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Wake up LT768x from standby mode                                         */
/*---------------------------------------------------------------------------------------*/
void LT768_Wkup_Standby(void)
{
	Power_Normal_Mode();
	Check_Power_is_Normal();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Suspend                                                            */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Set LT768x enter suspend mode                                            */
/*---------------------------------------------------------------------------------------*/
void LT768_Suspend(void)
{
	LT768_SDRAM_initail(10);
	Power_Saving_Suspend_Mode();
	Check_Power_is_Saving();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Wkup_Suspend                                                       */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Wake up LT768x from suspend mode                                         */
/*---------------------------------------------------------------------------------------*/
void LT768_Wkup_Suspend(void)
{
	Power_Normal_Mode();
	Check_Power_is_Normal();
	LT768_SDRAM_initail(MCLK);
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_SleepMode                                                          */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Set LT768x enter sleep mode                                              */
/*---------------------------------------------------------------------------------------*/
void LT768_SleepMode(void)
{
	Power_Saving_Sleep_Mode();
	Check_Power_is_Saving();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Wkup_Sleep                                                         */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Wake up LT768x from sleep mode                                           */
/*---------------------------------------------------------------------------------------*/
void LT768_Wkup_Sleep(void)
{
	Power_Normal_Mode();
	Check_Power_is_Normal();
}
//-------------------------------------------------------------------------------------------------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_SPI_Init                                                           */
/*                                                                                       */
/* Parameters:                                                                           */ 
/*               cs: 0: SPI0    1: SPI1                                                  */
/*              div: Set clock period                                                    */
/* Returns:     None                                                                     */
/* Description: Initialize LT768x SPI (e.g. to SPI Flash)                                */
/*---------------------------------------------------------------------------------------*/
void LT768_SPI_Init(u8 cs,u8 div)
{
	if(cs == 0)
	{
		Select_SFI_0();
		Select_nSS_drive_on_xnsfcs0();
	}
	else
	{
		Select_SFI_1();
		Select_nSS_drive_on_xnsfcs1();
	}
	SPI_Clock_Period(div);
	Enable_SFlash_SPI();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    W25QXX_Enter_4Byte_AddressMode                                           */
/*                                                                                       */
/* Parameters:  None                                                                     */ 
/* Returns:     None                                                                     */
/* Description: Set 4Byte addressing mode for Winbond flash                              */
/*---------------------------------------------------------------------------------------*/
void W25QXX_Enter_4Byte_AddressMode(void)
{
	nSS_Active();
	SPI_Master_FIFO_Data_Put(0xB7);
	nSS_Inactive();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    W25N01GV_ReadSR                                                          */
/*                                                                                       */
/* Parameters:                                                                           */
/*              reg: register index                                                      */ 
/* Returns:                                                                              */
/*              register status                                                          */
/* Description: Read register value                                                      */
/*---------------------------------------------------------------------------------------*/
u8 W25N01GV_ReadSR(u8 reg)
{
	u8 byte = 0;
	nSS_Active();
	SPI_Master_FIFO_Data_Put(0x0f);
	SPI_Master_FIFO_Data_Put(reg);
	byte = SPI_Master_FIFO_Data_Put(0Xff);
	nSS_Inactive();
	return byte;
}

/*---------------------------------------------------------------------------------------*/
/* Function:    W25N01GV_Write_SR                                                        */
/*                                                                                       */
/* Parameters:                                                                           */
/*              reg: register index                                                      */ 
/*              val: value to be written                                                 */
/* Returns:     None                                                                     */
/* Description: Write a value to the designated register                                 */
/*---------------------------------------------------------------------------------------*/
void W25N01GV_Write_SR(u8 reg,u8 val)   
{
	nSS_Active();
	SPI_Master_FIFO_Data_Put(0x1f);
	SPI_Master_FIFO_Data_Put(reg);
	SPI_Master_FIFO_Data_Put(val);
	nSS_Inactive();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    W25N01GV_Wait_Busy                                                       */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Wait until the read status process done                                  */
/*---------------------------------------------------------------------------------------*/
void W25N01GV_Wait_Busy(void)   
{   
	while((W25N01GV_ReadSR(0xC0)&0x01)==0x01);
} 

/*---------------------------------------------------------------------------------------*/
/* Function:    W25N01GV_ContinuousRead_Mode                                             */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Set continuous read mode                                                 */
/*---------------------------------------------------------------------------------------*/
void W25N01GV_ContinuousRead_Mode(void)
{
	u8 statut = 0;
	statut = W25N01GV_ReadSR(0xb0);
	statut &= cClrb3;
	statut &= cClrb4;
	statut |= cSetb4;
	W25N01GV_Write_SR(0xb0,statut);
}

/*---------------------------------------------------------------------------------------*/
/* Function:    W25N01GV_Write_Page                                                      */
/*                                                                                       */
/* Parameters:                                                                           */
/*              page: page index                                                         */
/* Returns:     None                                                                     */
/* Description: Write to the designated page                                             */
/*---------------------------------------------------------------------------------------*/
void W25N01GV_Write_Page(u16 page)
{
	nSS_Active();
	SPI_Master_FIFO_Data_Put(0x13);
	SPI_Master_FIFO_Data_Put(0x00);
	SPI_Master_FIFO_Data_Put((u8)(page>>8));
	SPI_Master_FIFO_Data_Put((u8)page);
	nSS_Inactive();
	W25N01GV_Wait_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    W25N01GV_ReadPageAddr_Data                                               */
/*                                                                                       */
/* Parameters:                                                                           */
/*                    pBuffer: The buffer to store the read data                         */
/*                    PageNum: Page index                                                */
/*                   PageAddr: Starting address of the data in the designate page        */
/*              NumByteToRead: The amount of data to be read                             */
/* Returns:     None                                                                     */
/* Description: Retrieve data form flash, and store them to designated buffer            */
/*---------------------------------------------------------------------------------------*/
void W25N01GV_ReadPageAddr_Data(u8* pBuffer,u32 PageNum,u32 PageAddr,u16 NumByteToRead)
{ 
	u16 i; 

	//------ Retrieve data from flash, and store the data to BUFF-----	
	nSS_Active();                            	    // Enable flash   
	SPI_Master_FIFO_Data_Put(0x13);
	SPI_Master_FIFO_Data_Put(0x00);
	SPI_Master_FIFO_Data_Put((u8)((PageNum)>>8));  	// Sending 16bit address   
	SPI_Master_FIFO_Data_Put((u8)(PageNum));   
	nSS_Inactive();  	
	W25N01GV_Wait_Busy();
	W25N01GV_Write_SR(0xb0,W25N01GV_ReadSR(0xb0) | 0x08);	// Set the starting address to read the data

	//------ Get the BUFF data and write to pBuffer ------
	nSS_Active();   	
	SPI_Master_FIFO_Data_Put(0x03); 
	SPI_Master_FIFO_Data_Put((PageAddr)>>8);  
	SPI_Master_FIFO_Data_Put(PageAddr); 	
	SPI_Master_FIFO_Data_Put(0x00);
	for(i=0;i<NumByteToRead;i++)
	{ 
		pBuffer[i]=SPI_Master_FIFO_Data_Put(0XFF);   	// read the data in loop  
	}
	nSS_Active();
	W25N01GV_Wait_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT_W25N01GV_Read                                                         */
/*                                                                                       */
/* Parameters:                                                                           */
/*                    pBuffer: The buffer to store the read data                         */
/*                   PageAddr: Starting address of the data in the designate page        */
/*              NumByteToRead: The amount of data to be read                             */
/* Returns:     None                                                                     */
/* Description: Read designated amount of data from flash                                */
/*---------------------------------------------------------------------------------------*/
void LT_W25N01GV_Read(u8* pBuffer,u32 ReadAddr,u16 NumByteToRead) // Read less than 2k of data at a time, starting from page 0
{
	unsigned short page,endpage,remainder;
	remainder = ReadAddr%2048;  // Starting address of the picture in a page
	page = (ReadAddr/2048);     // The page number of the starting address of the picture
	endpage = ((ReadAddr+NumByteToRead)/2048); // The page number of the ending address of the picture
	LT768_SPI_Init(1,1);
	if(page == endpage)
	{
		W25N01GV_ReadPageAddr_Data(pBuffer,page,remainder,NumByteToRead);
	}
	else
	{
		W25N01GV_ReadPageAddr_Data(pBuffer,page,remainder,2048 - remainder);
		W25N01GV_ReadPageAddr_Data(&pBuffer[2048 - remainder],endpage,0,NumByteToRead - (2048 - remainder));
	}
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Nand_Pic                                                           */
/*                                                                                       */
/* Parameters:                                                                           */
/*               SCS: 0: SPI0    1: SPI1                                                 */
/*                X1: Left-top X coordinate to display the picture                       */
/*                Y1: Left-top Y coordinate to display the picture                       */
/*               X_W: Picture width                                                      */
/*               Y_H: Picture height                                                     */
/*              Addr: Picture starting address in the flash                              */
/*              lay0: Display layer                                                      */
/*              lay1: For buffering the picture                                          */
/* Returns:     None                                                                     */
/* Description: Retrieve picture data from nand flash and display it                     */
/*---------------------------------------------------------------------------------------*/
void LT768_Nand_Pic
(
 unsigned char SCS
,unsigned short X1
,unsigned short Y1
,unsigned short X_W
,unsigned short Y_H
,unsigned long Addr
,unsigned long lay0
,unsigned long lay1
)
{
	unsigned short page,endpage,remainder,X_W4 = 0;
	remainder = Addr%2048;// Picture starting address in the page
	page = (Addr/2048);   // The page numer of the picture starting address 
	if(X_W % 4 != 0)
	{
		X_W4 = (X_W / 4) * 4 + 4;
	}
	else
	{
		X_W4 = X_W;
	}
	
	#if  LCD_16bit
		endpage = ((Addr+X_W4 * Y_H * 2)/2048);// Ending page address based on 16bpp (2bytes)
	#endif
	
	#if LCD_24bit
		endpage = ((Addr+X_W4 * Y_H * 3)/2048);// Ending page address based on 24bpp (3 bytes)
	#endif
	
	LT768_SPI_Init(SCS,1);
	W25N01GV_ContinuousRead_Mode();
	W25N01GV_Write_Page(page);
	LT768_DMA_24bit_Linear(1,1,0,lay1 - remainder,((endpage-page+1)*2048));
	Canvas_Image_Start_address(lay0);
	Canvas_image_width(LCD_XSIZE_TFT);
	LT768_BTE_Memory_Copy(lay1,X_W4,0,0,
							lay1,X_W4,0,0,
							lay0,LCD_XSIZE_TFT,X1,Y1,
							0x0c,X_W,Y_H);
}

/*---------------------------------------------------------------------------------------*/
/* Function:    NandFlash_Select_Outside_Font_Init                                       */
/*                                                                                       */
/* Parameters:                                                                           */
/*                    SCS: 0: SPI0    1: SPI1                                            */
/*                    Clk: SPI Clock = System Clock/ {{Clk+1}*2}                         */
/*              FlashAddr: Start address in the flash                                    */
/*             MemoryAddr: Destination address of the SDRAM                              */
/*                    Num: The amount of the font                                        */
/*                   Size: Font size: 16:16*16   24:24*24  32:32*32                      */
/*                    XxN: Width magnification: 1~4                                      */
/*                    YxN: Height magnification: 1~4                                     */
/*              ChromaKey: 0: Background color transparent; 1: Background color          */
/*              Alignment: 0: Non-alignment; 1: Alignment                                */
/* Returns:     None                                                                     */
/* Description: Initialize outside font - NandFlash                                      */
/*---------------------------------------------------------------------------------------*/
void NandFlash_Select_Outside_Font_Init
(
 unsigned char SCS           
,unsigned char Clk           
,unsigned long FlashAddr     
,unsigned long MemoryAddr    
,unsigned long Num           
,unsigned char Size          
,unsigned char XxN           
,unsigned char YxN           
,unsigned char ChromaKey     
,unsigned char Alignment     
)
{
	u16 page,endpage,remainder;
	remainder = FlashAddr%2048;// Font starting address in a page
	page = (FlashAddr/2048);   // The page number of the font starting address
	endpage = ((FlashAddr+Num)/2048);// The page number of the font ending address
	LT768_SPI_Init(1,1);
	W25N01GV_ContinuousRead_Mode();
	W25N01GV_Write_Page(page);
	
	if(Size==16)	Font_Select_8x16_16x16();
	if(Size==24)	Font_Select_12x24_24x24();
	if(Size==32)	Font_Select_16x32_32x32();

	//(*)
	if(XxN==1)	Font_Width_X1();
	if(XxN==2)	Font_Width_X2();
	if(XxN==3)	Font_Width_X3();
	if(XxN==4)	Font_Width_X4();

	//(*)	
	if(YxN==1)	Font_Height_X1();
	if(YxN==2)	Font_Height_X2();
	if(YxN==3)	Font_Height_X3();
	if(YxN==4)	Font_Height_X4();

	//(*)
	if(ChromaKey==0)	Font_Background_select_Color();	
	if(ChromaKey==1)	Font_Background_select_Transparency();	

	//(*)
	if(Alignment==0)	Disable_Font_Alignment();
	if(Alignment==1)	Enable_Font_Alignment();	
	
	LT768_DMA_24bit_Linear(SCS,Clk,FlashAddr,MemoryAddr,(endpage-page+1)*2048);
	CGRAM_Start_address(MemoryAddr+remainder);
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_BTE_Memory_Copy_8                                                  */
/*                                                                                       */
/* Parameters:                                                                           */
/*               S0_Addr: Starting address (SDRAM) of S0 picture                         */
/*                  S0_W: Width of the S0 picture                                        */
/*                   XS0: Left-top X coordinate of the S0 picture                        */ 
/*                   YS0: Left-top Y coordinate of the S0 picture                        */
/*               S1_Addr: Starting address (SDRAM) of S1 picture                         */
/*                  S1_W: Width of the S1 picture                                        */
/*                   XS1: Left-top X coordinate of the S1 picture                        */ 
/*                   YS1: Left-top Y coordinate of the S1 picture                        */
/*              Des_Addr: Starting address (SDRAM) of DT picture (DT: Destination)       */
/*                 Des_W: Width of the DT picture                                        */
/*                  XDes: Left-top X coordinate of the DT picture                        */ 
/*                  YDes: Left-top Y coordinate of the DT picture                        */
/*              ROP_Code:                                                                */
/*                        0000b		0(Blackness)                                         */
/*                        0001b		~S0.~S1 or ~(S0+S1)                                  */
/*                        0010b		~S0.S1                                               */
/*                        0011b		~S0                                                  */
/*                        0100b		S0.~S1                                               */
/*                        0101b		~S1                                                  */
/*                        0110b		S0^S1                                                */
/*                        0111b		~S0 + ~S1 or ~(S0 . S1)                              */
/*                        1000b		S0.S1                                                */
/*                        1001b		~(S0^S1)                                             */
/*                        1010b		S1                                                   */
/*                        1011b		~S0+S1                                               */
/*                        1100b		S0                                                   */
/*                        1101b		S0+~S1                                               */
/*                        1110b		S0+S1                                                */
/*                        1111b		1(whiteness)                                         */
/*                   X_W: Width of the active window                                     */
/*                   Y_H: Height of the active window                                    */
/* Returns:     None                                                                     */
/* Description: BTE memory copy with ROP - 8bpp                                          */
/*---------------------------------------------------------------------------------------*/
void LT768_BTE_Memory_Copy_8
(
 unsigned long S0_Addr		
,unsigned short S0_W		
,unsigned short XS0			
,unsigned short YS0			
,unsigned long S1_Addr		
,unsigned short S1_W		
,unsigned short XS1			
,unsigned short YS1			
,unsigned long Des_Addr		
,unsigned short Des_W		
,unsigned short XDes		
,unsigned short YDes		
,unsigned int ROP_Code		
,unsigned short X_W			
,unsigned short Y_H			
)
{
	BTE_S0_Color_8bpp();
	BTE_S0_Memory_Start_Address(S0_Addr);
	BTE_S0_Image_Width(S0_W);
	BTE_S0_Window_Start_XY(XS0,YS0);

	BTE_S1_Color_8bpp();
	BTE_S1_Memory_Start_Address(S1_Addr);
	BTE_S1_Image_Width(S1_W); 
	BTE_S1_Window_Start_XY(XS1,YS1);

	BTE_Destination_Color_8bpp();
	BTE_Destination_Memory_Start_Address(Des_Addr);
	BTE_Destination_Image_Width(Des_W);
	BTE_Destination_Window_Start_XY(XDes,YDes);	

	BTE_ROP_Code(ROP_Code);	
	BTE_Operation_Code(0x02); //BTE Operation: Memory copy (move) with ROP.
	BTE_Window_Size(X_W,Y_H); 
	BTE_Enable();
	Check_BTE_Busy();
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Nand_8bpp_font                                                     */
/*                                                                                       */
/* Parameters:                                                                           */
/*               SCS: 0: SPI0    1: SPI1                                                 */
/*               Clk: SPI Clock = System Clock /{(Clk+1)*2}                              */
/*                X1: X coordinate of the designated layer                               */
/*                Y1: Y coordinate of the designated layer                               */
/*               X_W: Data width                                                         */
/*               Y_H: Data height                                                        */
/*              Addr: Starting address in the flash                                      */
/*              lay0: Buffer layer1                                                      */
/*              lay1: Buffer layer2                                                      */
/* Returns:     None                                                                     */
/* Description: Display 8bpp font                                                        */
/*---------------------------------------------------------------------------------------*/
void LT768_Nand_8bpp_font
(
 unsigned char SCS         
,unsigned char Clk         
,unsigned short X1          
,unsigned short Y1          
,unsigned short X_W        
,unsigned short Y_H        
,unsigned long Addr        
,unsigned long lay1        
,unsigned long lay2        
)
{
	unsigned short i,page,endpage,remainder,x1,y1;
	remainder = Addr%2048;            // Picture starting address in a page
	page = (Addr/2048);               // The page number of the picture starting address
	endpage = ((Addr+X_W * Y_H)/2048);// The page number of the picture ending address
	LT768_SPI_Init(1,1);
	W25N01GV_ContinuousRead_Mode();
	W25N01GV_Write_Page(page);
	LT768_DMA_24bit_Linear(1,1,0,lay1,((endpage-page+1)*2048)); // Retrieving data
	x1 = (remainder) % LCD_XSIZE_TFT;
	y1 = (remainder) / LCD_XSIZE_TFT;
	// Reassemble
	for(i = 0 ; i < Y_H ; i++)
	{
		LT768_BTE_Memory_Copy_8(lay1,LCD_XSIZE_TFT,x1,y1,
								lay1,LCD_XSIZE_TFT,x1,y1,
								lay2,LCD_XSIZE_TFT,X1,i,
								0x0c,X_W,1);
		x1=x1+X_W;
		if(x1>LCD_XSIZE_TFT)
		{
			x1 = x1-LCD_XSIZE_TFT;
			y1++;
		}
	}
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Print_Outside_Font_GB2312_48_72_Nand                               */
/*                                                                                       */
/* Parameters:                                                                           */
/*                          SCS: Select SPI Flash:  SCS: 0    SCS: 1                     */
/*                          Clk: SPI Clock = System Clock /{(Clk+1)*2}                   */
/*                    FlashAddr: Starting address in SPI Falsh                           */
/*                  MemoryAddr1: Starting address of the buffer layer1 (SDRAM)           */
/*                  MemoryAddr2: Starting address of the buffer layer2 (SDRAM)           */ 
/*                     ShowAddr: Address of the display layer                            */
/*                        width: Width of the display layer                              */
/*                         Size: Font size  48: 48*48   72: 72*72                        */
/*                    ChromaKey: 0: Background color transparent; 1: Background color    */
/*                            x: String position, starting x coordinate                  */
/*                            y: String position, starting y coordinate                  */
/*                    FontColor: Font color                                              */
/*              BackGroundColor: Font background color                                   */     
/*                            w: Bold Level Setting, 0:normal  1:bolder  2:boldest       */
/*                            s: Line gap                                                */
/*                           *c: Starting address of the string to be printed            */
/* Returns:     None                                                                     */
/* Description: Print outside font - Nand                                                */ 
/*---------------------------------------------------------------------------------------*/
void LT768_Print_Outside_Font_GB2312_48_72_Nand
(
 unsigned char SCS           		    
,unsigned char Clk           		    
,unsigned long FlashAddr     		    
,unsigned long MemoryAddr1    		    
,unsigned long MemoryAddr2    		   
,unsigned long ShowAddr             
,unsigned short width               
,unsigned char Size          		
,unsigned char ChromaKey     		    
,unsigned short x                   
,unsigned short y                   
,unsigned long FontColor            
,unsigned long BackGroundColor      
,unsigned short w				    
,unsigned short s                   
,unsigned char *c                   
)
{
	unsigned short temp_H = 0;
	unsigned short temp_L = 0;
	unsigned short temp = 0;
	unsigned long i = 0;
	unsigned short j = 0;
	unsigned short k = 0;
	unsigned short h = 0;
	unsigned short n = 0;
	unsigned short m = 0;
	unsigned short g = 0;
	unsigned short f = 0;
	
	h = x; k = y;
	Memory_8bpp_Mode();		                       // using 8bits color depth to store the picture
 	Canvas_Image_Start_address(MemoryAddr1);
 	Canvas_image_width(width);
	while((c[i] != '\0')&&(c[i]>=0xa0))            // Exit if not Chinese codes
	{
		temp_H = (c[i] - 0xa1) * 94;
		temp_L = c[i+1] - 0xa1;
		temp = temp_H + temp_L;
		LT768_Nand_8bpp_font(1,0,Size*j/8,0,Size/8,Size,FlashAddr+temp*((Size*Size)/8),MemoryAddr1,MemoryAddr2);				//2019
		i+=2;
		j++;
	}
	
	Memory_16bpp_Mode();   
	Canvas_Image_Start_address(ShowAddr);
	Canvas_image_width(width);
	j = 0; i = 0;
	
	if(w>2)	w = 2;
	for(g=0;g<w+1;g++)
	{
		while((c[i] != '\0')&&(c[i]>=0xa0))   // Exit if not Chinese codes
		{
			if((f == m)&&((x+Size*j+Size)>(width*(n+1)))) {m++;n++;y=y+Size-1+s;x = x+((width*n)-(x+Size*j))+g;f=n;}
				
			if(ChromaKey==0)
			{
				LT768_BTE_Memory_Copy_ColorExpansion_8(MemoryAddr2,Size*j/8,
										                           ShowAddr,width,x+Size*j,y,
										                           Size,Size,FontColor,BackGroundColor
										                          );
			}
			if(ChromaKey==1)
			{
				  LT768_BTE_Memory_Copy_ColorExpansion_Chroma_key_8(MemoryAddr2,Size*j/8,
																	ShowAddr,width,x+Size*j,y,
																	Size,Size,FontColor);
			}
			i+=2;
			j++;
		}
		i=0;j=0;m=0;n=0;f=0;x=h+g+1;y=k+g+1;
	}
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT768_Print_Outside_Font_GBK_48_72_Nand                               */
/*                                                                                       */
/* Parameters:                                                                           */
/*                          SCS: Select SPI Flash:  SCS: 0    SCS: 1                     */
/*                          Clk: SPI Clock = System Clock /{(Clk+1)*2}                   */
/*                    FlashAddr: Starting address in SPI Falsh                           */
/*                  MemoryAddr1: Starting address of the buffer layer1 (SDRAM)           */
/*                  MemoryAddr2: Starting address of the buffer layer2 (SDRAM)           */ 
/*                     ShowAddr: Address of the display layer                            */
/*                        width: Width of the display layer                              */
/*                         Size: Font size  48: 48*48   72: 72*72                        */
/*                    ChromaKey: 0: Background color transparent; 1: Background color    */
/*                            x: String position, starting x coordinate                  */
/*                            y: String position, starting y coordinate                  */
/*                    FontColor: Font color                                              */
/*              BackGroundColor: Font background color                                   */     
/*                            w: Bold Level Setting, 0:normal  1:bolder  2:boldest       */
/*                            s: Line gap                                                */
/*                           *c: Starting address of the string to be printed            */
/* Returns:     None                                                                     */
/* Description: Print outside font - Nand                                                */ 
/*---------------------------------------------------------------------------------------*/
void LT768_Print_Outside_Font_GBK_48_72_Nand
(
 unsigned char SCS           		    
,unsigned char Clk           		    
,unsigned long FlashAddr     		    
,unsigned long MemoryAddr1    		    
,unsigned long MemoryAddr2    		    
,unsigned long ShowAddr             
,unsigned short width               
,unsigned char Size          		    
,unsigned char ChromaKey     		  
,unsigned short x                   
,unsigned short y                   
,unsigned long FontColor            
,unsigned long BackGroundColor      
,unsigned short w				     
,unsigned short s                   
,unsigned char *c                   
)
{
	unsigned short temp_H = 0;
	unsigned short temp_L = 0;
	unsigned short temp = 0;
	unsigned long i = 0;
	unsigned short j = 0;
	unsigned short k = 0;
	unsigned short h = 0;
	unsigned short n = 0;
	unsigned short m = 0;
	unsigned short g = 0;
	unsigned short f = 0;
	
	h = x; k = y;
	Memory_8bpp_Mode();		                       // Using 8bits color depth to store the picture
 	Canvas_Image_Start_address(MemoryAddr1);
 	Canvas_image_width(width);
	while((c[i] != '\0')&&(c[i]>=0xa0))            // Exit if not Chinese codes
	{
		temp_H = (c[i] - 0x81) * 191;
		temp_L = c[i+1] - 0x40;
		temp = temp_H + temp_L;
		LT768_Nand_8bpp_font(1,0,Size*j/8,0,Size/8,Size,FlashAddr+temp*((Size*Size)/8),MemoryAddr1,MemoryAddr2);				//2019
		i+=2;
		j++;
	}
	
	Memory_16bpp_Mode();   
	Canvas_Image_Start_address(ShowAddr);
	Canvas_image_width(width);
	j = 0; i = 0;
	
	if(w>2)	w = 2;
	for(g=0;g<w+1;g++)
	{
		while((c[i] != '\0')&&(c[i]>=0xa0))   // Exit if not Chinese codes
		{
			if((f == m)&&((x+Size*j+Size)>(width*(n+1)))) {m++;n++;y=y+Size-1+s;x = x+((width*n)-(x+Size*j))+g;f=n;}
				
			if(ChromaKey==0)
			{
				LT768_BTE_Memory_Copy_ColorExpansion_8(MemoryAddr2,Size*j/8,
										                           ShowAddr,width,x+Size*j,y,
										                           Size,Size,FontColor,BackGroundColor
										                          );
			}
			if(ChromaKey==1)
			{
				  LT768_BTE_Memory_Copy_ColorExpansion_Chroma_key_8(MemoryAddr2,Size*j/8,
																	ShowAddr,width,x+Size*j,y,
																	Size,Size,FontColor);
			}
			i+=2;
			j++;
		}
		i=0;j=0;m=0;n=0;f=0;x=h+g+1;y=k+g+1;
	}
}

//-------------------------------------------------------------------------------------------------------------------------------

