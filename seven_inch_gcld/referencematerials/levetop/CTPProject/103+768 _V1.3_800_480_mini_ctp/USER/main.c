/******************************************************************************
  * Copyright(c) 2023 Levetop Semiconductor Co., Ltd. All rights reserved
  * @file      main.c
  * @author    Levetop TFT Controller Application Team
  * @version   V1.0.0
  * @date      2023-02-24
  * @brief     This is the main function for LT768x demo program
               (1) Initialize LT768x 
			   (2) Setup display window parameters
			   (3) Demo show 
*******************************************************************************/

#include "sys.h"
#include "key.h"
#include "LT768_Demo.h"
#include "LT768_Lib.h"
#include "rtp.h"
#include "gt911.h"

extern u8 PwmControl;

int main(void)
{
	SystemInit();                              // Initialize STM32 system clock 
	delay_init();                              // Initialize delay function
	uart_init(115200);                         // Initialize Uart port - for printf function
	
	Parallel_Init();                           // Initialize the interface between STM32 and LT768 - SPI/Parallel
	LT768_Init();                              // Initialize LT768x
	
	CTP_io_Init();                             // Initialize CTP
	delay_ms(100);

    Select_SFI_Dual_Mode0();	  		       // Set Flash command (3Bh) to utilize fast read: refer to W25Q128 spec
	
	LT768_PWM1_Init(1,0,200,100,100);  		   // Intialize the PWM for LCD backlight control

	Display_ON();                              // Turn on the TFT display	
	
	StartUp_picture();					       // Load first picture
	
	Main_GUI();                      	       // Main operation picture
	

	while(1)
	{		
		Select_Function();
	}
}



