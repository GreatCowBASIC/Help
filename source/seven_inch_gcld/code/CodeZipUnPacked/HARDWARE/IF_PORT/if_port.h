/********************* COPYRIGHT  **********************
* File Name        : if_port.h
* Author           : Levetop Electronics
* Version          : V1.0
* Date             : 2017-9-11
* Description      : 选择不同的驱动接口
********************************************************/

#ifndef _if_port_h
#define _if_port_h
#include "sys.h"      // STM32的头文件

/*

//-------- 只能开启一个外设 ----------
#define STM32_FSMC_8  0     // 使用STM32的外设FSMC驱动LT768(STM32硬件模拟8080总线(8位))
#define STM32_FSMC_16 0     // 使用STM32的外设FSMC驱动LT768(STM32硬件模拟8080总线(16位))
#define STM32_SPI     1     // 使用STM32的SPI驱动LT768
#define STM32_IIC     0     // 使用STM32的IIC驱动LT768

*/
//#define STM32_SPI     1




#if 0 //3wire SPI

#define SDA_IN()  {GPIOF->MODER&=~(3<<(2*12));GPIOF->MODER|=0<<2*12;} //PF12输入模式
#define SDA_OUT() {GPIOF->MODER&=~(3<<(2*12));GPIOF->MODER|=1<<2*12;} //PF12输出模式

#define CS  		PGout(12) 
#define SCL  		PDout(5)
#define SDA  		PFout(12)
#define READ_SDA    PFin(12)
#define RESET  		PDout(4)

#endif 



#if 1 //4wire SPI

#define SDA_IN()  {GPIOB->MODER&=~(3<<(2*15));GPIOB->MODER|=0<<2*15;}//PB15输入模式
//#define SDA_OUT() {GPIOF->MODER&=~(3<<(2*12));GPIOF->MODER|=1<<2*12;}//PF12输出模式


#define CS  		PGout(12) 
#define SCL  		PDout(5)
//#define SDI  		PFin(11)
#define SDI  		PBin(15)
#define SDO    		PFout(12)
#define RESET  		PDout(4)


#endif








void Parallel_Init(void);
void SPI_IO_Init(void);

void LCD_CmdWrite(u8 cmd);
void LCD_DataWrite(u8 data);
void LCD_DataWrite_Pixel(u16 data);
u8 LCD_StatusRead(void);
u16 LCD_DataRead(void);
	 
void Delay_us(u16 time); //延时函数us级
void Delay_ms(u16 time); //延时函数ms级

void test_SPIIO(void);



#endif
