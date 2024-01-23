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


int main(void)
{
	SystemInit();                       // Initialize STM32 system clock 
	delay_init();                       // Initialize delay function
	uart_init(115200);                  // Initialize Uart port - for printf function
	printf("App Mode\r\n");
	
	Parallel_Init();                    // Initialize the interface between STM32 and LT768 - SPI/Parallel
	
	// (1) Initialize LT768x
	LT768_Init();                   

    // (2) Setup display window parameters --------------------
	Main_Image_Start_Address(0);				
	Main_Image_Width(LCD_XSIZE_TFT);
	Main_Window_Start_XY(0,0);
	Canvas_Image_Start_address(0);
	Canvas_image_width(LCD_XSIZE_TFT);
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);
	//---------------------------------------------------------
	
	// Draw full screen in black color
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT-1,LCD_YSIZE_TFT-1,Black); 
		
	// Intialize the PWM for LCD backlight control
	LT768_PWM1_Init(1,0,200,100,100);

	// Turn on the TFT display
    Display_ON();  

	// Initalize RTP interface - SPI
	LT_TpInit();
	
	// (3) Demo show
	Show();                             // Basic desmonstration
	//Draw_Demo_1();                    // Geometric drawing demo
	//BTE_Demo_Alpha_Blending_0();      // Dimming background
	//BTE_Demo_Alpha_Blending_1();      // Pop-up window with a dimming background
	//Meter_Pointer();                  // Make a meter pointer
	//Gif_Demo();                       // Plan a gif animation
	//CircularProgressBar();            // Circular progress bar
	//PIP_Demo();                       // Picture-in-Picture demonstration
	//Print_Unicode();                  // Print graphic text coded by unicode
    //Scrolling_Picture();              // Scrolling image	
	//MCU_Write_Flash();                // MCU write data to flash through LT768x	
    //MCU_Write_Memory();               // MCU write data to LT768x SDRAM memory	
	
	while(1)
	{	
		delay_ms(10);
	}
}



