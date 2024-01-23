/******************************************************************************
  * Copyright(c) 2023 Levetop Semiconductor Co., Ltd. All rights reserved
  * @file      main.c
  * @author    Levetop TFT Controller Application Team
  * @version   V1.0.0
  * @date      2023-02-24
  * @brief     TP chip pins defination and related GPIO pins intialization
*******************************************************************************/

#ifndef _rpio_h
#define _rpio_h
#include "stm32f10x.h"
#include "LT768.h"

// TP chip pins defination - correspondent to LT768x GPIO pins and STM32 GPIO pin  
#define 	PEN  		GPIO_ReadInputDataBit(GPIOB,GPIO_Pin_8)   // PB8       INT
#define 	DOUT 		LT_Read_GPIO_A(0x08)                      // GPIOA[3]  MISO
#define 	TDIN(n) 	LT_Write_GPIO_A(0x04, n)           	      // GPIOA[2]  MOSI
#define 	TCLK(n) 	LT_Write_GPIO_A(0x01, n)  	     		  // GPIOA[0]  SCLK
#define 	TCS(n)  	LT_Write_GPIO_A(0x02, n)                  // GPIOA[1]  CS

// Initialize RTP chip pins
void TP_io_init(void);

// Read GPIOA[3] - MISO
uint8_t LT_Read_GPIO_A(uint8_t GPIO_pin);

// Write a value to the designated pin
void LT_Write_GPIO_A(uint8_t GPIO_pin, uint8_t bitVal);

#endif
