/******************************************************************************
  * Copyright(c) 2023 Levetop Semiconductor Co., Ltd. All rights reserved
  * @file      if_port.h
  * @author    Levetop TFT Controller Application Team
  * @version   V1.0.0
  * @date      2023-02-24
  * @brief     Configure various communication interfaces 
*******************************************************************************/


#ifndef _if_port_h
#define _if_port_h
#include "sys.h"            // head file for STM32

//-------- Select only one host interface ----------
#define STM32_S_8080  0     // STM32 drive LT768x through 8080 host interface
#define STM32_S_6800  0     // STM32 drive LT768x through 6800 host interface
#define STM32_SPI_8   1     // STM32 drive LT768x through SPI host interface

// Select 8bit 8080 host interface
#if STM32_S_8080

#define	LCD_CS_SET  GPIOC->BSRR |=1<<4    // chip select 	
#define	LCD_RS_SET	GPIOC->BSRR |=1<<5    // Data 			   
#define	LCD_WR_SET	GPIOA->BSRR |=1<<15   // Write 			
#define	LCD_RD_SET	GPIOC->BSRR |=1<<6    // Read 			
								    
#define	LCD_CS_CLR  GPIOC->BRR |=1<<4     // chip select 		
#define	LCD_RS_CLR	GPIOC->BRR |=1<<5     // Command		   
#define	LCD_WR_CLR	GPIOA->BRR |=1<<15    // Write			
#define	LCD_RD_CLR	GPIOC->BRR |=1<<6     // Read 		

#define WAIT  ((GPIOA->IDR >> 8) & 1)


//#define LCD_BASE0        	  ((u32)0x60000000)
//#define LCD_BASE1        	  ((u32)0x60010000)
#endif

// Select 8bit 6800 host interface
#if STM32_S_6800

#define	LCD_CS_SET  GPIOC->BSRR |=1<<4    // chip select 	
#define	LCD_RS_SET	GPIOC->BSRR |=1<<5    // Data 			   
#define	LCD_RW_SET	GPIOA->BSRR |=1<<15   // Read 			
#define	LCD_EN_SET	GPIOC->BSRR |=1<<6    // Enable			
								    
#define	LCD_CS_CLR  GPIOC->BRR |=1<<4     // chip select 		
#define	LCD_RS_CLR	GPIOC->BRR |=1<<5     // Command		   
#define	LCD_RW_CLR	GPIOA->BRR |=1<<15    // Write			
#define	LCD_EN_CLR	GPIOC->BRR |=1<<6     // Disable		

#define WAIT  ((GPIOA->IDR >> 8) & 1)

#endif

// Select SPI host interface
#if STM32_SPI_8
#define SS_RESET     (GPIOB->ODR &= ~(1<<12))
#define SS_SET       (GPIOB->ODR |= (1<<12))
#endif


void Parallel_Init(void);

void LCD_CmdWrite(u8 cmd);
void LCD_DataWrite(u8 data);
void LCD_DataWrite_Pixel(u16 data);
u8 LCD_StatusRead(void);
u8 LCD_DataRead(void);

uint16_t SPI2_ReadWriteByte(uint16_t TxData);
void SPI_CmdWrite_8(uint8_t cmd);
void SPI_DataWrite_8(uint8_t data);
uint16_t SPI_DataRead_8(void); 
void SPI2_Init_8(void);
#endif
