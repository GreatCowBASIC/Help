/********************* COPYRIGHT  **********************
* File Name        : if_port.h
* Author           : Levetop Electronics
* Version          : V1.0
* Date             : 2017-9-11
* Description      : ѡ��ͬ�������ӿ�
********************************************************/

#ifndef _if_port_h
#define _if_port_h
#include "sys.h"      // STM32��ͷ�ļ�

//-------- ֻ�ܿ���һ������ ----------
#define STM32_FSMC_8  0     // ʹ��STM32������FSMC����LT768(STM32Ӳ��ģ��8080����(8λ))
#define STM32_FSMC_16 1     // ʹ��STM32������FSMC����LT768(STM32Ӳ��ģ��8080����(16λ))
#define STM32_SPI     0     // ʹ��STM32��SPI����LT768
#define STM32_IIC     0     // ʹ��STM32��IIC����LT768


//ѡ��8λ8080��������
#if STM32_FSMC_8
#define LCD_BASE0        	  ((u32)0x60000000)
#define LCD_BASE1        	  ((u32)0x60010000)
#endif

//ѡ��16λ8080��������
#if STM32_FSMC_16
#define LCD_BASE0        	  ((u32)0x60000000)
#define LCD_BASE1        	  ((u32)0x60020000)
#endif

//ѡ��SPI����
#if STM32_SPI
#define SS_RESET     (GPIOB->ODR &= ~(1<<12))
#define SS_SET       (GPIOB->ODR |= (1<<12))
#endif


//ѡ��IIC����
#if STM32_IIC

#define LT_ADDR 0x3C  // LT768��Ϊ���豸����Ӧ��IIC��ַ��IIC�ĵ�ַ��LT768������I2CA[0~5]��������������I2CA[0~5]��ƽ��001111

#define SDA_IN()  {GPIOB->CRH&=0XFF0FFFFF;GPIOB->CRH|=(u32)8<<20;}
#define SDA_OUT() {GPIOB->CRH&=0XFF0FFFFF;GPIOB->CRH|=(u32)3<<20;}
#define IIC_SCL_SET    (GPIOB->ODR |= (1<<12))
#define IIC_SCL_RESET  (GPIOB->ODR &= ~(1<<12))
#define IIC_SDA_SET    (GPIOB->ODR |= (1<<13))
#define IIC_SDA_RESET  (GPIOB->ODR &= ~(1<<13))
#define READ_SDA   	   ((GPIOB->IDR >> 13) & 1)
#endif



void Parallel_Init(void);

void LCD_CmdWrite(u8 cmd);
void LCD_DataWrite(u8 data);
void LCD_DataWrite_Pixel(u16 data);
u8 LCD_StatusRead(void);
u16 LCD_DataRead(void);
	 
void Delay_us(u16 time);     // ��ʱ����us��
void Delay_ms(u16 time);     // ��ʱ����ms��






#endif
