/******************************************************************************
  * Copyright(c) 2023 Levetop Semiconductor Co., Ltd. All rights reserved
  * @file      LT768_Demo.h
  * @author    Levetop TFT Controller Application Team
  * @version   V1.0.0
  * @date      2023-02-24
  * @brief     LT768x demo program
*******************************************************************************/

#ifndef _LT768_Demo_h
#define _LT768_Demo_h
#include "key.h"
#include "stdlib.h"
#include "LT768_Lib.h"
#include <math.h>
#include <stdio.h>

// Define SDRAM LAYER
#define LAYER_0        0	
#define LAYER_1        LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*1
#define LAYER_2        LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*2
#define LAYER_3        LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*3
#define LAYER_4        LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*4
#define LAYER_5        LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*5
#define LAYER_6        LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*6
#define LAYER_7        LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*7

void Show(void);
void Draw_Demo_1(void);                   // Demo: draw line, circle, and rectangle
void BTE_Demo_Alpha_Blending_0(void);     // Demo: alpha blending example 1 -> show pictures in various opacity level
void BTE_Demo_Alpha_Blending_1(void);     // Demo: alpha blending example 2 -> pop-up window with dimming background
void TEST_DoubleTriangle(u16 x,u16 y,u16 h,u16 h1,u16 l,u16 a,u16 color1,u16 color2);  // Demo: draw two solid triangles to act as a pointer of a meter 
void Meter_Pointer(void);                 // Demo: draw dynamic pointer
void Gif_Demo(void);                      // Demo: display gif animation
void CircularProgressBar(void);           // Demo: display circular progress bar
void PIP_Demo(void);                      // Demo: picture-in-picture demonstration
void Print_Unicode(void);                 // Demo: print self-defined unicode font
void Scrolling_Picture(void);             // Demo: Scrolling image
void MCU_Write_Flash(void);               // Demo: MCU write data to flash through LT768x
void MCU_Write_Memory(void);              // Demo: MCU write data the LT768x SDRAM memory

#endif
