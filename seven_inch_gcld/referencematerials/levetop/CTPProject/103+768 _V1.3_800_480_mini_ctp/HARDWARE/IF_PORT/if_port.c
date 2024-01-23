/******************************************************************************
  * Copyright(c) 2023 Levetop Semiconductor Co., Ltd. All rights reserved
  * @file      if_port.c
  * @author    Levetop TFT Controller Application Team
  * @version   V1.0.0
  * @date      2023-02-24
  * @brief     Configure various communication interfaces 
*******************************************************************************/

#include "if_port.h"

// ------------------------------------------------------------ Software 8Bits 8080 Driver--------------------------------------------------------------
#if STM32_S_8080
void Init_S8080(void)
{	
	GPIO_InitTypeDef  GPIO_InitStructure;
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO|RCC_APB2Periph_GPIOA|RCC_APB2Periph_GPIOB|RCC_APB2Periph_GPIOC, ENABLE);
	GPIO_PinRemapConfig(GPIO_Remap_SWJ_JTAGDisable, ENABLE);     //Disable JTAG,use SWD
	
	//data line£¨D0~D7£©
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3|GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7;				
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 		
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;		
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	//  4 Control Line (PC5:RS/A0  PC4:CS  PA15:WR  PC6:RD)
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_6;				
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 		
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;		
	GPIO_Init(GPIOC, &GPIO_InitStructure);
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_15;				
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 		
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;		
	GPIO_Init(GPIOA, &GPIO_InitStructure);
	
	//Wait Pin
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;				
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;		
	GPIO_Init(GPIOA, &GPIO_InitStructure);
}

void DataPin_Out(void)
{
	GPIOB->CRL = 0x33333333; //Push-pull Output	
}

void DataPin_In(void)
{
	GPIOB->CRL = 0x88888888; //Pull-up Input
	GPIOB->BSRR = 0xFF;
}

void Dataout(uint8_t data)
{
	GPIOB->BSRR = data & 0xFF;
	GPIOB->BRR = ~data & 0xFF;
}

uint8_t Datain(void)
{
	return GPIOB->IDR & 0xFF;
}

void S8080_CmdWrite(uint8_t cmd)
{	
	LCD_RS_CLR; 
 	LCD_CS_CLR; 
	Dataout(cmd);
	LCD_WR_CLR; 
	LCD_WR_SET; 
	LCD_CS_SET;
}

void S8080_DataWrite(uint8_t data)
{	
	LCD_RS_SET;
	LCD_CS_CLR;
	Dataout(data);
	LCD_WR_CLR;
	LCD_WR_SET;
	LCD_CS_SET;
}

uint8_t S8080_DataRead(void)
{
	uint8_t temp = 0;

	DataPin_In();

	LCD_RS_SET;
	LCD_CS_CLR;
	LCD_RD_CLR;
	temp = Datain();	
	LCD_RD_SET;
	LCD_CS_SET;
	DataPin_Out();
	return temp;
	
}

uint8_t S8080_StatusRead(void)
{
	uint8_t temp = 0;

	DataPin_In();
	
	LCD_CS_CLR; 
	LCD_RS_CLR; 	
	LCD_RD_CLR;
	temp = Datain();
	LCD_RD_SET;
	LCD_CS_SET;
	DataPin_Out();
	delay_us(1);
	return temp;
}

void S8080_DataWrite_Pixel(uint16_t data)
{
	S8080_DataWrite(data);
	S8080_DataWrite(data>>8);
}
#endif


// ------------------------------------------------------------ Software 8Bits 6800 Driver--------------------------------------------------------------
#if STM32_S_6800

void Init_S6800(void)
{	
	GPIO_InitTypeDef  GPIO_InitStructure;
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO|RCC_APB2Periph_GPIOA|RCC_APB2Periph_GPIOB|RCC_APB2Periph_GPIOC, ENABLE);
	GPIO_PinRemapConfig(GPIO_Remap_SWJ_JTAGDisable, ENABLE);     //Disable JTAG,use SWD
	
	//data line£¨D0~D7£©
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_2|GPIO_Pin_3|GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_6|GPIO_Pin_7;				
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 		
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz; 		
	GPIO_Init(GPIOB, &GPIO_InitStructure);

    // 4 Control pins (PC4:CS  PC5:RS  PC6:EN)
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_6;				
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 		
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;		
	GPIO_Init(GPIOC, &GPIO_InitStructure);
	
	//PA15: RW 
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_15;				
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 		
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;		
	GPIO_Init(GPIOA, &GPIO_InitStructure);
	
	//Wait Pin
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;				
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;		
	GPIO_Init(GPIOA, &GPIO_InitStructure);

}

void DataPin_Out(void)
{
	GPIOB->CRL = 0x33333333; //Push-pull Output	
}

void DataPin_In(void)
{
	GPIOB->CRL = 0x88888888; //Pull-up Input
	GPIOB->BSRR = 0xFF;
}

void Dataout(uint8_t data)
{
	GPIOB->BSRR = data & 0xFF;
	GPIOB->BRR = ~data & 0xFF;
}

uint8_t Datain(void)
{
	return GPIOB->IDR & 0xFF;
}

void S6800_CmdWrite(uint8_t cmd)
{	
	while(WAIT==0);
	delay_us(5);
		
	LCD_CS_CLR; 
	LCD_RS_CLR; 
	Dataout(cmd);
	LCD_RW_CLR; 
	LCD_EN_SET; 
	LCD_EN_CLR; 
	LCD_CS_SET;
	delay_us(5);
}

void S6800_DataWrite(uint8_t data)
{	
	while(WAIT==0);
	delay_us(5);

	LCD_CS_CLR;
	LCD_RS_SET;
	//LCD_CS_CLR;	
	Dataout(data);
	LCD_RW_CLR;	
	LCD_EN_SET;
	LCD_EN_CLR;	
	LCD_CS_SET;
	delay_us(5);
}

uint8_t S6800_DataRead(void)
{
	uint8_t temp = 0;
	
	while(WAIT==0);
	delay_us(5);

	DataPin_In();

	LCD_CS_CLR;
	LCD_RS_SET;
	//LCD_CS_CLR;
	LCD_RW_SET;
	LCD_EN_SET;
	LCD_EN_CLR;
	temp = Datain(); 
	LCD_CS_SET; 
	delay_us(10);
	DataPin_Out();
	
	return temp;
	
}

uint8_t S6800_StatusRead(void)
{
	uint8_t temp = 0;
	
	while(WAIT==0);
	delay_us(5);

	DataPin_In();
	
	LCD_CS_CLR;
	LCD_RS_CLR; 
	//LCD_CS_CLR; 	
	LCD_RW_SET;
	LCD_EN_SET;
	LCD_EN_CLR;
	temp = Datain();
	LCD_CS_SET;   	
	delay_us(10);

	DataPin_Out();
	
	return temp;
}

void S6800_DataWrite_Pixel(uint16_t data)
{
	S6800_DataWrite(data);
	S6800_DataWrite(data>>8);
}

#endif

// ------------------------------------------------------------ Hardware 8Bits SPI  Driver --------------------------------------------------------------------

#if STM32_SPI_8

/*---------------------------------------------------------------------------------------*/
/* Function:    SPI_Init_8                                                               */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Initialize SPI -> interface between STM32 and LT768x                     */
/*---------------------------------------------------------------------------------------*/
void SPI2_Init_8(void)
{
	GPIO_InitTypeDef  GPIO_InitStructure;
	SPI_InitTypeDef  SPI_InitStructure;
 
	RCC_APB2PeriphClockCmd(	RCC_APB2Periph_GPIOB, ENABLE );                   // Enable PORTB clock
	RCC_APB1PeriphClockCmd(	RCC_APB1Periph_SPI2,  ENABLE );                   // Enable SPI2 clock
 
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;                           // PB13/14/15 multiplex 
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitStructure);                                    // Initialize GPIOB
 	GPIO_SetBits(GPIOB,GPIO_Pin_13|GPIO_Pin_14|GPIO_Pin_15);                  // PB13/14/15 pull-up
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12;                                // PB12 push pull  
 	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;                          // push pull output
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
 	GPIO_Init(GPIOB, &GPIO_InitStructure);
 	GPIO_SetBits(GPIOB,GPIO_Pin_12);

	SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;        // Set SPI to be full duplex
	SPI_InitStructure.SPI_Mode = SPI_Mode_Master;		                      // Set SPI mode -> master mode
	SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;	                      // Set SPI data size -> 8bits frame
	SPI_InitStructure.SPI_CPOL = SPI_CPOL_High;		                          // Set SPI CPOL High
	SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;	                          // Set sampling at 2nd rising/falling edge
	SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;		                          // Set NSS signal to be managed by code setting (SSI bit)
	SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_2;	  	  // Define baudrate prescaler: default value = 256
	SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;	                      // Set the first bit of a byte to be transmitted
	SPI_InitStructure.SPI_CRCPolynomial = 7;	                             
	SPI_Init(SPI2, &SPI_InitStructure);                                       // Initialize SPIx register
 
	SPI_Cmd(SPI2, ENABLE);                                                    // Enable SPI	
}

/*---------------------------------------------------------------------------------------*/
/* Function:    SPI2_ReadWriteByte                                                       */
/*                                                                                       */
/* Parameters:                                                                           */
/*              TxData: The data to be sent                                              */
/* Returns:                                                                              */
/*              uint16_t: Received data byte                                             */
/* Description: Read/Write data through SPI                                              */
/*---------------------------------------------------------------------------------------*/
uint16_t SPI2_ReadWriteByte(uint16_t TxData)
{		
	uint16_t retry=0;				 
	while((SPI2->SR&1<<1)==0)		// Wait till the sending area is empty	
	{
		retry++;
		if(retry>=0XFFFE)return 0; 	// Exit if timeout
	}			  
	SPI2->DR=TxData;	 	  		// Send one byte 
	retry=0;
	while((SPI2->SR&1<<0)==0) 		// Wait till a byte is received   
	{
		retry++;
		if(retry>=0XFFFE)return 0;	// Exit if timeout
	}	  						    
	return SPI2->DR;          		// Return the received data byte			
}

/*---------------------------------------------------------------------------------------*/
/* Function:    SPI_CmdWrite_8                                                           */
/*                                                                                       */
/* Parameters:                                                                           */
/*              Cmd: Command byte                                                        */
/* Returns:     None                                                                     */
/* Description: Write a command byte through SPI                                         */
/*---------------------------------------------------------------------------------------*/
void SPI_CmdWrite_8(uint8_t cmd)
{
	SS_RESET; 	      
	SPI2_ReadWriteByte(0x00);
	SPI2_ReadWriteByte(cmd);
	SS_SET;
}

/*---------------------------------------------------------------------------------------*/
/* Function:    SPI_DataWrite_8                                                          */
/*                                                                                       */
/* Parameters:                                                                           */
/*              data: Data byte                                                          */
/* Returns:     None                                                                     */
/* Description: Write a data byte through SPI                                            */
/*---------------------------------------------------------------------------------------*/
void SPI_DataWrite_8(uint8_t data)
{
	SS_RESET; 	      
	SPI2_ReadWriteByte(0x80);
	SPI2_ReadWriteByte(data);
	SS_SET;
}

/*---------------------------------------------------------------------------------------*/
/* Function:    SPI_DataWrite_Pixel_8                                                    */
/*                                                                                       */
/* Parameters:                                                                           */
/*              data: Data word                                                          */
/* Returns:     None                                                                     */
/* Description: Write two bytes of data through SPI                                      */
/*---------------------------------------------------------------------------------------*/
void SPI_DataWrite_Pixel_8(uint16_t data)
{
	SS_RESET; 	      
	SPI2_ReadWriteByte(0x80);
	SPI2_ReadWriteByte(data);
	SS_SET;
	
	SS_RESET;
	SPI2_ReadWriteByte(0x80);
	SPI2_ReadWriteByte(data>>8);
	SS_SET;
}

/*---------------------------------------------------------------------------------------*/
/* Function:    SPI_StatusRead_8                                                         */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:                                                                              */
/*              uint8_t: Status data byte                                                */
/* Description: Read status data byte through SPI                                        */
/*---------------------------------------------------------------------------------------*/
uint8_t SPI_StatusRead_8(void)
{
	uint8_t temp = 0;
	SS_RESET; 	      
	SPI2_ReadWriteByte(0x40);
	temp = SPI2_ReadWriteByte(0xff);
	SS_SET;
	return temp;
}

/*---------------------------------------------------------------------------------------*/
/* Function:    SPI_DataRead_8                                                           */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:                                                                              */
/*              uint16_t: Received data byte                                             */
/* Description: Read a data byte through SPI                                             */
/*---------------------------------------------------------------------------------------*/
uint16_t SPI_DataRead_8(void)
{
	uint16_t temp = 0;
	SS_RESET; 	      
	SPI2_ReadWriteByte(0xc0);
	temp = SPI2_ReadWriteByte(0xff);
	SS_SET;
	return temp;
}

#endif



//-----------------------------------------------------------------------------------------------------------------------------------

void LCD_CmdWrite(uint8_t cmd)
{
	#if STM32_S_8080
	S8080_CmdWrite(cmd);
	#endif
	
	#if STM32_S_6800
	S6800_CmdWrite(cmd);
	#endif
	
	#if STM32_SPI_8
	SPI_CmdWrite_8(cmd);
	#endif
}

void LCD_DataWrite(uint8_t data)
{
	#if STM32_S_8080
	S8080_DataWrite(data);
	#endif
	
	#if STM32_S_6800
	S6800_DataWrite(data);
	#endif
	
	#if STM32_SPI_8
	SPI_DataWrite_8(data);
	#endif
}

void LCD_DataWrite_Pixel(uint16_t data)
{
	#if STM32_S_8080
	S8080_DataWrite_Pixel(data);
	#endif
	
	#if STM32_S_6800
	S6800_DataWrite_Pixel(data);
	#endif
	
	#if STM32_SPI_8
	SPI_DataWrite_Pixel_8(data);
	#endif
}


uint8_t LCD_StatusRead(void)
{
	uint8_t temp = 0;
	
	#if STM32_S_8080
	temp = S8080_StatusRead();
	#endif

	#if STM32_S_6800
	temp = S6800_StatusRead();
	#endif
	
	#if STM32_SPI_8
	temp = SPI_StatusRead_8();
	#endif
    
	return temp;
}

uint8_t LCD_DataRead(void)
{
	uint8_t temp = 0;
	
	#if STM32_S_8080
	temp = S8080_DataRead();
	#endif
	
	#if STM32_S_6800
	temp = S6800_DataRead();
	#endif
	
	#if STM32_SPI_8
	temp = SPI_DataRead_8();
	#endif
	
	
	return temp;
}
	  
	 
void Parallel_Init(void)
{
	#if STM32_S_8080
		Init_S8080();
	#endif
	
	#if STM32_S_6800
		Init_S6800();
	#endif
			
	#if STM32_SPI_8
		SPI2_Init_8();
	#endif
}
















