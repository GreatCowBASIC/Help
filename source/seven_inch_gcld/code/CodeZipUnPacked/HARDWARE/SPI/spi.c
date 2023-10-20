#include "delay.h"
#include "stdlib.h"
#include "spi.h"
	 

void SPI_IO_Init(void)
	
{
	GPIO_InitTypeDef  GPIO_InitStructure;	
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD|RCC_AHB1Periph_GPIOF|RCC_AHB1Periph_GPIOG, ENABLE);//使能GPIOD,F,G时钟

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4|GPIO_Pin_5;//PD4,PD5设置为推挽输出
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;//输出模式
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOD, &GPIO_InitStructure);//初始化

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12;//PG12设置为推挽输出
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;//输出模式
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOG, &GPIO_InitStructure);//初始化	

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12;//PF12设置推挽输出
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;//输出模式
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOF, &GPIO_InitStructure);//初始化
								 
}



void SPI_SendByte(u8 buf)
{
	u8 count = 0;
	SDA_OUT();
	for(count = 0 ; count < 8 ; count++)
	{
		SCLK=0;
		if(buf&0x80)	SDA=1;
		else            SDA=0;
		SCLK=1;
		buf<<=1;
	}
	SCLK=0;
	SDA=0;
}

u8 SPI_ReadByte(void)
{
	u8 count = 0;
	u8 val = 0;
	SDA_IN();
	for(count = 0 ; count < 8 ; count++)
	{
		val<<=1;
		SCLK=1;
		__nop();
		__nop();
		if(SDA == 1)	val|=1;
		else		    val&=0xfe;
		SCLK=0;
	}
	SCLK=0;
	return val;
}



void LCD_CmdWrite(u8 cmd)
{
	SCS=0; 	      
	SPI_SendByte(0x00);
	SPI_SendByte(cmd);
	SCS=1;
}

void LCD_DataWrite(u8 data)
{
	SCS=0; 	      
	SPI_SendByte(0x80);
	SPI_SendByte(data);
	SCS=1;
}

void LCD_DataWrite1(u16 data)
{
	SCS=0; 	      
	SPI_SendByte(0x80);
	SPI_SendByte(data);
	SCS=1;
	
	SCS=0;
	SPI_SendByte(0x80);
	SPI_SendByte(data>>8);
	SCS=1;
}



u16 LCD_StatusRead(void)
{
	u8 temp = 0;
	SCS=0; 	      
	SPI_SendByte(0x40);
	temp = SPI_ReadByte();
	SCS=1;
	return temp;
}

u16 LCD_DataRead(void)
{
	u8 temp = 0;
	SCS=0; 	      
	SPI_SendByte(0xc0);
	temp = SPI_ReadByte();
	SCS=1;
	return temp;
}



void lcd_rst(void)
{
	RESET=0;
	delay_ms(5);					   
    RESET=1;		 	 
    delay_ms(10);	
}


void LCD_WriteRAM_Prepare(void)
{
  LCD_CmdWrite(0x04); //
}



/*******************************************************************************
* Function Name  : LCD_SetCursor
* Description    : Sets the cursor position.
* Input          : - Xpos: specifies the X position.
*                  - Ypos: specifies the Y position. 
* Output         : None
* Return         : None
*******************************************************************************/
void LCD_SetCursor(u16 Xpos, u16 Ypos)
{
    LCD_CmdWrite(0x5F);
      //delay_us(8);
	LCD_DataWrite(Xpos);  
      //delay_us(8);
    LCD_CmdWrite(0x60);	  
	//delay_us(8);      
	LCD_DataWrite(Xpos>>8);
      //delay_us(8);
    LCD_CmdWrite(0x61);
      //delay_us(8);
	LCD_DataWrite(Ypos);
      //delay_us(8);
    LCD_CmdWrite(0x62);	
	//delay_us(8);      
	LCD_DataWrite(Ypos>>8);
    // delay_us(8);
}	



/*******************************************************************************
* Function Name  : LCD_Clear
* Description    : Clears the hole LCD.
* Input          : Color: the color of the background.
* Output         : None
* Return         : None
*******************************************************************************/
void LCD_Clear(u16 Color)
{
  	u32 index = 0;
  
  	LCD_SetCursor(0,0); 	 //设置光标位置

  	LCD_WriteRAM_Prepare(); /* Prepare to write GRAM */

  	for(index = 0; index < 1572864; index++)	//1024*768
  	{
    	LCD_DataWrite1(Color);
  	}
 	// while(1);  
}


extern void delay_us(u32 Nus);
		 
void LCD_SetPoint(u16 x,u16 y,u16 point)
{
	
	LCD_SetCursor(x,y);	  	//行列地址
	//LCD_WriteRAM_Prepare();	//写命令
	LCD_CmdWrite(0x04); 
	//delay_us(8);
	LCD_DataWrite1(point);		//写数据
	//delay_us(8);
}




