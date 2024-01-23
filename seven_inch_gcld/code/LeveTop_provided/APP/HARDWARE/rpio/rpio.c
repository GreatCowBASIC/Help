/******************************************************************************
  * Copyright(c) 2023 Levetop Semiconductor Co., Ltd. All rights reserved
  * @file      main.c
  * @author    Levetop TFT Controller Application Team
  * @version   V1.0.0
  * @date      2023-02-24
  * @brief     TP chip pins defination and related GPIO pins intialization
*******************************************************************************/

#include "rpio.h"

/*---------------------------------------------------------------------------------------*/
/* Function:    TP_io_init                                                               */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Initialize TP related GPIO pins                                          */
/*---------------------------------------------------------------------------------------*/
void TP_io_init(void)
{	
	GPIO_InitTypeDef  GPIO_InitStructure;

	// Enable PB port clock 
	// STM32 GPIO port operation will only be effective after the clock is enabled
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);	  
	
	// PEN   PB8 input
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;				
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU; 		 
	GPIO_Init(GPIOB, &GPIO_InitStructure);
	GPIO_SetBits(GPIOB,GPIO_Pin_8);		                    // Pull-up

	// Set LT768x GPIOA Input/Output 
    // TCLK: GPIOA[0] output
	// TDIN: GPIOA[1] output 
	// TCS:  GPIOA[2] output 
	// DOUT: GPIOA[3] input
	Set_GPIO_A_In_Out(0x08);      
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT_ReadGPIO_A                                                            */
/*                                                                                       */
/* Parameters:                                                                           */
/*              GPIO_pin: designated GPIO pin                                            */
/* Returns:                                                                              */
/*               uint8_t: return the GPIO value                                          */ 
/* Description: Read the value of the designated GPIO pin of LT768x (GPIOA)              */
/*---------------------------------------------------------------------------------------*/
uint8_t LT_Read_GPIO_A(uint8_t GPIO_pin)
{
	uint8_t bitstatus = GPIO_pin;                           // GPIOA[3]               
	
	if ( (Read_GPIO_A_7_0() & bitstatus) != Bit_RESET) 
	{
		bitstatus = Bit_SET;
	}
	else
	{
		bitstatus = Bit_RESET;
	}
	
	return bitstatus;
	
}

/*---------------------------------------------------------------------------------------*/
/* Function:    LT_Write_GPIO_A                                                          */
/*                                                                                       */
/* Parameters:                                                                           */
/*              GPIO_pin: designated GPIO pin                                            */
/*                bitVal: value to be written                                            */
/* Returns:                                                                              */
/*               uint8_t: return the GPIO value                                          */ 
/* Description: Write a value (1 or 0) to the designated GPIO pin                        */
/*---------------------------------------------------------------------------------------*/
void LT_Write_GPIO_A(uint8_t GPIO_pin, uint8_t bitVal)
{
	uint8_t temp = Read_GPIO_A_7_0();   // Retrieve the current GPIOA bits status
	
	if(bitVal == Bit_SET)
	{
		Write_GPIO_A_7_0( temp | GPIO_pin );
	}
	else
	{
		Write_GPIO_A_7_0( temp & ~GPIO_pin );
	}
}
