/******************** COPYRIGHT  ********************
* File Name        : LT768_Demo.h
* Author           : Levetop Electronics
* Version          : V1.0
* Date             : 2017-10-30
* Description      : TL768的测试程序
****************************************************/

#ifndef _LT768_Demo_h
#define _LT768_Demo_h
#include "delay.h"
#include "key.h"
#include "stdlib.h"// C的标准库，用来产生随机数
#include "LT768_Lib.h"

#define FLASH_ADDR_24	  0x00679740
#define FLASH_ADDR_32	  0x0070C440
#define FLASH_ADDR_72     0x00811440

#define SIZE_24_NUM     0x00092D00
#define SIZE_32_NUM     0x00105000

#define MEMORY_ADDR_32	1024*600*3*5
#define MEMORY_ADDR_24	(MEMORY_ADDR_32+0x00105000)
#define MEMORY_ADDR_72	(MEMORY_ADDR_24+0x00092D00)

/*
#define Picture_1_Addr	0
#define Picture_2_Addr	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*2)
#define Picture_3_Addr	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*4)
#define Picture_4_Addr	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*6)
#define Picture_5_Addr	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*8)
*/

#define Picture_1_Addr	0
#define Picture_2_Addr	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*3)
#define Picture_3_Addr	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*6)
#define Picture_4_Addr	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*9)
#define Picture_5_Addr	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*12)
#define Picture_6_Addr	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*15)
#define Picture_7_Addr	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*18)
#define Picture_8_Addr	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*21)
#define Picture_9_Addr	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*24)


#define Cartoon_Addr  0x00D5E718

#define layer1_start_addr 0
#define layer2_start_addr LCD_XSIZE_TFT*LCD_YSIZE_TFT*2
#define layer3_start_addr LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*2
#define layer4_start_addr LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*3
#define layer5_start_addr LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*4
#define layer6_start_addr LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*5
#define layer7_start_addr LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*6

#define Resolution	(LCD_XSIZE_TFT*LCD_YSIZE_TFT)   //分辨率

void StartUp_picture(void);
void Main_GUI(void);
unsigned char Select_Function(void);
void Display_Levetop(void);

#endif
