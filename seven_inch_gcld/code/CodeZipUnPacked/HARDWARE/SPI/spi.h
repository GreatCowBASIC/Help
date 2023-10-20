#ifndef __SPI_H__
#define __SPI_H__
#include "sys.h"
	    
#define SDA_IN()  {GPIOF->MODER&=~(3<<(2*12));GPIOF->MODER|=0<<2*12;}	//PF12输入模式
#define SDA_OUT() {GPIOF->MODER&=~(3<<(2*12));GPIOF->MODER|=1<<2*12;} 	//PF12输出模式	   

#define SCS  		PGout(12) 
#define SCLK  		PDout(5)
#define SDA  		PFout(12)
#define RESET  		PDout(4)

 
void SPI_IO_Init(void);
void SPI_SendByte(u8 buf);
u8 SPI_ReadByte(void);
u16 LCD_StatusRead(void);
u16 LCD_DataRead(void);
void LCD_CmdWrite(u8 cmd);
void LCD_DataWrite(u8 data);

 
#endif

















