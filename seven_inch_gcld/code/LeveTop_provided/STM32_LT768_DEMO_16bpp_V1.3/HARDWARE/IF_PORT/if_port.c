/********************* COPYRIGHT  **********************
* File Name        : if_port.c
* Author           : Levetop Electronics
* Version          : V1.0
* Date             : 2017-9-11
* Description      : 不同的驱动接口
********************************************************/

#include "if_port.h"

// -------------------------------------------------------- 8位的8080总线驱动 --------------------------------------------------------------

#if STM32_FSMC_8
	  
// 初始化FSMC
// FSMC是STM32F103系列中100引脚以上的才有的外设，该外设可硬件模拟8080总线接口。(8位)
void FSMC_Init_8(void)
{ 					
 	GPIO_InitTypeDef GPIO_InitStructure;
	FSMC_NORSRAMInitTypeDef  FSMC_NORSRAMInitStructure;
	FSMC_NORSRAMTimingInitTypeDef  readWriteTiming; 
	FSMC_NORSRAMTimingInitTypeDef  writeTiming;
	
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_FSMC,ENABLE);		 //使能FSMC时钟
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB|RCC_APB2Periph_GPIOD|RCC_APB2Periph_GPIOE|RCC_APB2Periph_GPIOG,ENABLE);//使能PORTB,D,E,G以及AFIO复用功能时钟
	
 	//PORTD复用推挽输出  		
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_14|GPIO_Pin_15;				 	//PORTD复用推挽输出  
 	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP; 		 //复用推挽输出   
 	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
 	GPIO_Init(GPIOD, &GPIO_InitStructure); 
  	 
	//PORTE复用推挽输出  
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7|GPIO_Pin_8|GPIO_Pin_9|GPIO_Pin_10;				 //	//PORTD复用推挽输出  
 	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP; 		 //复用推挽输出   
 	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
 	GPIO_Init(GPIOE, &GPIO_InitStructure);    	    	 

   	//PORTG12复用推挽输出 A0	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7|GPIO_Pin_11;	 //PORTD复用推挽输出  
 	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP; 		 //复用推挽输出   
 	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
 	GPIO_Init(GPIOD, &GPIO_InitStructure); 

	readWriteTiming.FSMC_AddressSetupTime = 0x01;	 //地址建立时间（ADDSET）为2个HCLK 1/36M=27ns
	readWriteTiming.FSMC_AddressHoldTime = 0x00;	 //地址保持时间（ADDHLD）模式A未用到	
	readWriteTiming.FSMC_DataSetupTime = 0x01;		 // 数据保存时间为16个HCLK,因为液晶驱动IC的读数据的时候，速度不能太快，尤其对1289这个IC。
	readWriteTiming.FSMC_BusTurnAroundDuration = 0x00;
	readWriteTiming.FSMC_CLKDivision = 0x00;
	readWriteTiming.FSMC_DataLatency = 0x00;
	readWriteTiming.FSMC_AccessMode = FSMC_AccessMode_A;	 //模式A 
    
	writeTiming.FSMC_AddressSetupTime = 0x01;	 //地址建立时间（ADDSET）为1个HCLK  
	writeTiming.FSMC_AddressHoldTime = 0x00;	 //地址保持时间（A		
	writeTiming.FSMC_DataSetupTime = 0x01;		 ////数据保存时间为4个HCLK	
	writeTiming.FSMC_BusTurnAroundDuration = 0x00;
	writeTiming.FSMC_CLKDivision = 0x00;
	writeTiming.FSMC_DataLatency = 0x00;
	writeTiming.FSMC_AccessMode = FSMC_AccessMode_A;	 //模式A 

	FSMC_NORSRAMInitStructure.FSMC_Bank = FSMC_Bank1_NORSRAM1;//  这里我们使用NE4 ，也就对应BTCR[6],[7]。
	FSMC_NORSRAMInitStructure.FSMC_DataAddressMux = FSMC_DataAddressMux_Disable; // 不复用数据地址
	FSMC_NORSRAMInitStructure.FSMC_MemoryType =FSMC_MemoryType_NOR;// FSMC_MemoryType_SRAM;  //SRAM   
	FSMC_NORSRAMInitStructure.FSMC_MemoryDataWidth = FSMC_MemoryDataWidth_8b;//存储器数据宽度为8bit   
	FSMC_NORSRAMInitStructure.FSMC_BurstAccessMode =FSMC_BurstAccessMode_Disable;// FSMC_BurstAccessMode_Disable; 
	FSMC_NORSRAMInitStructure.FSMC_WaitSignalPolarity = FSMC_WaitSignalPolarity_Low;
	FSMC_NORSRAMInitStructure.FSMC_AsynchronousWait=FSMC_AsynchronousWait_Disable;  //--------
	FSMC_NORSRAMInitStructure.FSMC_WrapMode = FSMC_WrapMode_Disable;   
	FSMC_NORSRAMInitStructure.FSMC_WaitSignalActive = FSMC_WaitSignalActive_DuringWaitState;  
	FSMC_NORSRAMInitStructure.FSMC_WriteOperation = FSMC_WriteOperation_Enable;	//  存储器写使能
	FSMC_NORSRAMInitStructure.FSMC_WaitSignal = FSMC_WaitSignal_Enable;   
	FSMC_NORSRAMInitStructure.FSMC_ExtendedMode = FSMC_ExtendedMode_Enable; // 读写使用不同的时序
	FSMC_NORSRAMInitStructure.FSMC_WriteBurst = FSMC_WriteBurst_Disable; 
	FSMC_NORSRAMInitStructure.FSMC_ReadWriteTimingStruct = &readWriteTiming; //读写时序
	FSMC_NORSRAMInitStructure.FSMC_WriteTimingStruct = &writeTiming;  //写时序

	FSMC_NORSRAMInit(&FSMC_NORSRAMInitStructure);  //初始化FSMC配置

 	FSMC_NORSRAMCmd(FSMC_Bank1_NORSRAM1, ENABLE);  // 使能BANK1 
}

void FMSC_8_CmdWrite(u8 cmd)
{
	*(vu8*) (LCD_BASE0)= (cmd);
}

void FMSC_8_DataWrite(u8 data)
{
	*(vu8*) (LCD_BASE1)= (data);
}

void FMSC_8_DataWrite_Pixel(u16 data)
{
	*(vu8*) (LCD_BASE1)= (data);
	*(vu8*) (LCD_BASE1)= (data>>8);
}

u8 FMSC_8_StatusRead(void)
{
	u8 temp = 0;
	temp = *(vu8*)(LCD_BASE0);
	return temp;
}

u16 FMSC_8_DataRead(void)
{
	u16 temp = 0;
	temp =  *(vu8*)(LCD_BASE1);
	return temp;
}


#endif
	  

// -------------------------------------------------------- 16位的8080总线驱动 -------------------------------------------------------------


#if STM32_FSMC_16
	  
// 初始化FSMC
// FSMC是STM32F103系列中100引脚以上的才有的外设，该外设可硬件模拟8080总线接口。(16位)
void FSMC_Init_16(void)
{ 					
 	GPIO_InitTypeDef GPIO_InitStructure;
	FSMC_NORSRAMInitTypeDef  FSMC_NORSRAMInitStructure;
	FSMC_NORSRAMTimingInitTypeDef  readWriteTiming; 
	FSMC_NORSRAMTimingInitTypeDef  writeTiming;
	
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_FSMC,ENABLE);	//使能FSMC时钟
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB|RCC_APB2Periph_GPIOD|RCC_APB2Periph_GPIOE|RCC_APB2Periph_GPIOG,ENABLE);//使能PORTB,D,E,G以及AFIO复用功能时钟
	
 	//PORTD复用推挽输出  
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1|GPIO_Pin_4|GPIO_Pin_5|GPIO_Pin_8|GPIO_Pin_9|GPIO_Pin_10|GPIO_Pin_14|GPIO_Pin_15;				 //	//PORTD复用推挽输出  
 	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP; 		 //复用推挽输出   
 	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
 	GPIO_Init(GPIOD, &GPIO_InitStructure); 
  	 
	//PORTE复用推挽输出  
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7|GPIO_Pin_8|GPIO_Pin_9|GPIO_Pin_10|GPIO_Pin_11|GPIO_Pin_12|GPIO_Pin_13|GPIO_Pin_14|GPIO_Pin_15;				 //	//PORTD复用推挽输出  
 	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP; 		 //复用推挽输出   
 	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
 	GPIO_Init(GPIOE, &GPIO_InitStructure);    	    	 											 

   	//PORTG12复用推挽输出 A0	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7|GPIO_Pin_11;	 //PORTD复用推挽输出  
 	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP; 		 //复用推挽输出   
 	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
 	GPIO_Init(GPIOD, &GPIO_InitStructure); 

	readWriteTiming.FSMC_AddressSetupTime = 0x01;	 //地址建立时间（ADDSET）为2个HCLK 1/36M=27ns
	readWriteTiming.FSMC_AddressHoldTime = 0x00;	 //地址保持时间（ADDHLD）模式A未用到	
	readWriteTiming.FSMC_DataSetupTime = 0x01;		 // 数据保存时间为16个HCLK,因为液晶驱动IC的读数据的时候，速度不能太快，尤其对1289这个IC。
	readWriteTiming.FSMC_BusTurnAroundDuration = 0x00;
	readWriteTiming.FSMC_CLKDivision = 0x00;
	readWriteTiming.FSMC_DataLatency = 0x00;
	readWriteTiming.FSMC_AccessMode = FSMC_AccessMode_A;	 //模式A 
    
	writeTiming.FSMC_AddressSetupTime = 0x01;	 //地址建立时间（ADDSET）为1个HCLK  
	writeTiming.FSMC_AddressHoldTime = 0x00;	 //地址保持时间（A		
	writeTiming.FSMC_DataSetupTime = 0x01;		 ////数据保存时间为4个HCLK	
	writeTiming.FSMC_BusTurnAroundDuration = 0x00;
	writeTiming.FSMC_CLKDivision = 0x00;
	writeTiming.FSMC_DataLatency = 0x00;
	writeTiming.FSMC_AccessMode = FSMC_AccessMode_A;	 //模式A 
 
	FSMC_NORSRAMInitStructure.FSMC_Bank = FSMC_Bank1_NORSRAM1;//  这里我们使用NE4 ，也就对应BTCR[6],[7]。
	FSMC_NORSRAMInitStructure.FSMC_DataAddressMux = FSMC_DataAddressMux_Disable; // 不复用数据地址
	FSMC_NORSRAMInitStructure.FSMC_MemoryType =FSMC_MemoryType_NOR;// FSMC_MemoryType_SRAM;  //SRAM   
	FSMC_NORSRAMInitStructure.FSMC_MemoryDataWidth = FSMC_MemoryDataWidth_16b;//存储器数据宽度为16bit   
	FSMC_NORSRAMInitStructure.FSMC_BurstAccessMode =FSMC_BurstAccessMode_Disable;// FSMC_BurstAccessMode_Disable; 
	FSMC_NORSRAMInitStructure.FSMC_WaitSignalPolarity = FSMC_WaitSignalPolarity_Low;
	FSMC_NORSRAMInitStructure.FSMC_AsynchronousWait=FSMC_AsynchronousWait_Disable;  //--------
	FSMC_NORSRAMInitStructure.FSMC_WrapMode = FSMC_WrapMode_Disable;   
	FSMC_NORSRAMInitStructure.FSMC_WaitSignalActive = FSMC_WaitSignalActive_DuringWaitState;  
	FSMC_NORSRAMInitStructure.FSMC_WriteOperation = FSMC_WriteOperation_Enable;	//  存储器写使能
	FSMC_NORSRAMInitStructure.FSMC_WaitSignal = FSMC_WaitSignal_Enable;   
	FSMC_NORSRAMInitStructure.FSMC_ExtendedMode = FSMC_ExtendedMode_Enable; // 读写使用不同的时序
	FSMC_NORSRAMInitStructure.FSMC_WriteBurst = FSMC_WriteBurst_Disable; 
	FSMC_NORSRAMInitStructure.FSMC_ReadWriteTimingStruct = &readWriteTiming; //读写时序
	FSMC_NORSRAMInitStructure.FSMC_WriteTimingStruct = &writeTiming;  //写时序

	FSMC_NORSRAMInit(&FSMC_NORSRAMInitStructure);  //初始化FSMC配置

 	FSMC_NORSRAMCmd(FSMC_Bank1_NORSRAM1, ENABLE);  // 使能BANK1 
}

void FMSC_16_CmdWrite(u8 cmd)
{
	*(vu16*) (LCD_BASE0)= (cmd);
}

void FMSC_16_DataWrite(u8 data)
{
	*(vu16*) (LCD_BASE1)= (data);
}

void FMSC_16_DataWrite_Pixel(u16 data)
{
	*(vu16*) (LCD_BASE1)= (data);
}

u8 FMSC_16_StatusRead(void)
{
	u8 temp = 0;
	temp = *(vu16*)(LCD_BASE0);
	return temp;
}

u16 FMSC_16_DataRead(void)
{
	u16 temp = 0;
	temp =  *(vu16*)(LCD_BASE1);
	return temp;
}
#endif


// ------------------------------------------------------------ SPI驱动 --------------------------------------------------------------------

#if STM32_SPI

void SPI2_Init(void)
{
	GPIO_InitTypeDef  GPIO_InitStructure;
	SPI_InitTypeDef  SPI_InitStructure;
 
	RCC_APB2PeriphClockCmd(	RCC_APB2Periph_GPIOB, ENABLE );//PORTB时钟使能 
	RCC_APB1PeriphClockCmd(	RCC_APB1Periph_SPI2,  ENABLE );//SPI2时钟使能 	
 
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13 | GPIO_Pin_14 | GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;  //PB13/14/15复用推挽输出 
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitStructure);//初始化GPIOB
 	GPIO_SetBits(GPIOB,GPIO_Pin_13|GPIO_Pin_14|GPIO_Pin_15);  //PB13/14/15上拉
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12;  // PB12 推挽 
 	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  //推挽输出
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
 	GPIO_Init(GPIOB, &GPIO_InitStructure);
 	GPIO_SetBits(GPIOB,GPIO_Pin_12);

	SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;  //设置SPI单向或者双向的数据模式:SPI设置为双线双向全双工
	SPI_InitStructure.SPI_Mode = SPI_Mode_Master;		//设置SPI工作模式:设置为主SPI
	SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;		//设置SPI的数据大小:SPI发送接收8位帧结构
	SPI_InitStructure.SPI_CPOL = SPI_CPOL_High;		//串行同步时钟的空闲状态为高电平
	SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;	//串行同步时钟的第二个跳变沿（上升或下降）数据被采样
	SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;		//NSS信号由硬件（NSS管脚）还是软件（使用SSI位）管理:内部NSS信号有SSI位控制
	SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_2;		//定义波特率预分频的值:波特率预分频值为256
	SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;	//指定数据传输从MSB位还是LSB位开始:数据传输从MSB位开始
	SPI_InitStructure.SPI_CRCPolynomial = 7;	//CRC值计算的多项式
	SPI_Init(SPI2, &SPI_InitStructure);  //根据SPI_InitStruct中指定的参数初始化外设SPIx寄存器
 
	SPI_Cmd(SPI2, ENABLE); //使能SPI外设	
}

u16 SPI2_ReadWriteByte(u16 TxData)
{		
	u16 retry=0;				 
	while((SPI2->SR&1<<1)==0)		//等待发送区空	
	{
		retry++;
		if(retry>=0XFFFE)return 0; 	//超时退出
	}			  
	SPI2->DR=TxData;	 	  		//发送一个byte 
	retry=0;
	while((SPI2->SR&1<<0)==0) 		//等待接收完一个byte  
	{
		retry++;
		if(retry>=0XFFFE)return 0;	//超时退出
	}	  						    
	return SPI2->DR;          		//返回收到的数据					    
}

void SPI_CmdWrite(u8 cmd)
{
	SS_RESET; 	      
	SPI2_ReadWriteByte(0x00);
	SPI2_ReadWriteByte(cmd);
	SS_SET;
}

void SPI_DataWrite(u8 data)
{
	SS_RESET; 	      
	SPI2_ReadWriteByte(0x80);
	SPI2_ReadWriteByte(data);
	SS_SET;
}

void SPI_DataWrite_Pixel(u16 data)
{
	SS_RESET; 	      
	SPI2_ReadWriteByte(0x80);
	SPI2_ReadWriteByte(data);
	SS_SET;
	
	SS_RESET;
	SPI2_ReadWriteByte(0x80);
	SPI2_ReadWriteByte(data>>8);
	SS_SET;
}

u8 SPI_StatusRead(void)
{
	u8 temp = 0;
	SS_RESET; 	      
	SPI2_ReadWriteByte(0x40);
	temp = SPI2_ReadWriteByte(0xff);
	SS_SET;
	return temp;
}

u16 SPI_DataRead(void)
{
	u16 temp = 0;
	SS_RESET; 	      
	SPI2_ReadWriteByte(0xc0);
	temp = SPI2_ReadWriteByte(0xff);
	SS_SET;
	return temp;
}
#endif


// ------------------------------------------------------------ IIC驱动 --------------------------------------------------------------------

#if STM32_IIC
void delay(void)
{
	__ASM("NOP");
}
 
//初始化IIC
void IIC_Init(void)
{					     
	GPIO_InitTypeDef GPIO_InitStructure;
	RCC_APB2PeriphClockCmd(	RCC_APB2Periph_GPIOB, ENABLE );	
	   
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12|GPIO_Pin_13;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP ; 
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(GPIOB, &GPIO_InitStructure);
	GPIO_SetBits(GPIOB,GPIO_Pin_12|GPIO_Pin_13); 	
}
//产生IIC起始信号
void IIC_Start(void)
{
	SDA_OUT();     //sda线输出
	IIC_SDA_SET;	  	  
	IIC_SCL_SET;
	delay();
 	IIC_SDA_RESET;//START:when CLK is high,DATA change form high to low 
	delay();
	IIC_SCL_RESET;//钳住I2C总线，准备发送或接收数据 
}	  
//产生IIC停止信号
void IIC_Stop(void)
{
	SDA_OUT();//sda线输出
	IIC_SCL_RESET;
	IIC_SDA_RESET;//STOP:when CLK is high DATA change form low to high
 	delay();
	IIC_SCL_SET; 
	IIC_SDA_SET;//发送I2C总线结束信号
	delay();							   	
}
//等待应答信号到来
//返回值：1，接收应答失败
//        0，接收应答成功
u8 IIC_Wait_Ack(void)
{
	u8 ucErrTime=0;
	SDA_IN();      //SDA设置为输入  
	IIC_SDA_SET;delay();   
	IIC_SCL_SET;delay();	 
	while(READ_SDA)
	{
		ucErrTime++;
		if(ucErrTime>250)
		{
			IIC_Stop();
			return 1;
		}
	}
	IIC_SCL_RESET;//时钟输出0 	   
	return 0;  
} 
//产生ACK应答
void IIC_Ack(void)
{
	IIC_SCL_RESET;
	SDA_OUT();
	IIC_SDA_RESET;
	delay();
	IIC_SCL_SET;
	delay();
	IIC_SCL_RESET;
}
//不产生ACK应答		    
void IIC_NAck(void)
{
	IIC_SCL_RESET;
	SDA_OUT();
	IIC_SDA_SET;
	delay();
	IIC_SCL_SET;
	delay();
	IIC_SCL_RESET;
}					 	

//IIC发送一个字节
//返回从机有无应答
//1，有应答
//0，无应答			  
void IIC_Send_Byte(u8 txd)
{                        
    u8 t;   
	SDA_OUT(); 	    
    IIC_SCL_RESET;//拉低时钟开始数据传输
    for(t=0;t<8;t++)
    {              
		if((txd&0x80)>>7)
			IIC_SDA_SET;
		else
			IIC_SDA_RESET;
		txd<<=1; 	  
		IIC_SCL_SET; 
		delay();
		IIC_SCL_RESET;	
		delay();
    }	 
} 	    
//读1个字节，ack=1时，发送ACK，ack=0，发送nACK   
u8 IIC_Read_Byte(unsigned char ack)
{
	unsigned char i,receive=0;
	SDA_IN();//SDA设置为输入
    for(i=0;i<8;i++ )
	{
        IIC_SCL_RESET; 
        delay();
		IIC_SCL_SET;
        receive<<=1;
        if(READ_SDA)receive++;   
		delay(); 
    }					 
    if (!ack)
        IIC_NAck();//发送nACK
    else
        IIC_Ack(); //发送ACK   
    return receive;
}

u8 IIC_CmdWrite(u8 cmd)
{
	IIC_Start(); 
	IIC_Send_Byte(LT_ADDR);
	if(IIC_Wait_Ack())	//等待应答
	{
		IIC_Stop();		 
		return 1;		
	}
    IIC_Send_Byte(cmd);	
	if(IIC_Wait_Ack())	//等待ACK
	{
		IIC_Stop();	 
		return 1;		 
	}		 
    IIC_Stop();	 
	return 0;
}

u8 IIC_DataWrite(u8 data)
{
	IIC_Start(); 
	IIC_Send_Byte(LT_ADDR|0x02);
	if(IIC_Wait_Ack())	//等待应答
	{
		IIC_Stop();		 
		return 1;		
	}
    IIC_Send_Byte(data);	
	if(IIC_Wait_Ack())	//等待ACK
	{
		IIC_Stop();	 
		return 1;		 
	}		 
    IIC_Stop();	 
	return 0;
}

void IIC_DataWrite_Pixel(u16 data)
{
	IIC_DataWrite(data);
	IIC_DataWrite(data>>8);
}

u8 IIC_StatusRead(void)
{
	u8 res;
    IIC_Start(); 
	IIC_Send_Byte(LT_ADDR|0x01);	
	IIC_Wait_Ack();			
	res=IIC_Read_Byte(0);
	IIC_NAck();
    IIC_Stop();		
	return res;		
}

u8 IIC_DataRead(void)
{
	u8 res;
    IIC_Start(); 
	IIC_Send_Byte(LT_ADDR|0x03);	
	IIC_Wait_Ack();			
	res=IIC_Read_Byte(0);
	IIC_NAck();
    IIC_Stop();		
	return res;
}
#endif


//-----------------------------------------------------------------------------------------------------------------------------------

void LCD_CmdWrite(u8 cmd)
{
	#if STM32_FSMC_8
	FMSC_8_CmdWrite(cmd);
	#endif
	
	#if STM32_FSMC_16
	FMSC_16_CmdWrite(cmd);
	#endif
	
	#if STM32_SPI
	SPI_CmdWrite(cmd);
	#endif
	
	#if STM32_IIC
	IIC_CmdWrite(cmd);
	#endif
}

void LCD_DataWrite(u8 data)
{
	#if STM32_FSMC_8
	FMSC_8_DataWrite(data);
	#endif
	
	#if STM32_FSMC_16
	FMSC_16_DataWrite(data);
	#endif
	
	#if STM32_SPI
	SPI_DataWrite(data);
	#endif
	
	#if STM32_IIC
	IIC_DataWrite(data);
	#endif
}

void LCD_DataWrite_Pixel(u16 data)
{
	#if STM32_FSMC_8
	FMSC_8_DataWrite_Pixel(data);
	#endif
	
	#if STM32_FSMC_16
	FMSC_16_DataWrite_Pixel(data);
	#endif
	
	#if STM32_SPI
	SPI_DataWrite_Pixel(data);
	#endif
	
	#if STM32_IIC
	IIC_DataWrite_Pixel(data);
	#endif
}


u8 LCD_StatusRead(void)
{
	u8 temp = 0;
	
	#if STM32_FSMC_8
	temp = FMSC_8_StatusRead();
	#endif
	
	#if STM32_FSMC_16
	temp = FMSC_16_StatusRead();
	#endif
	
	#if STM32_SPI
	temp = SPI_StatusRead();
	#endif
	
	#if STM32_IIC
	temp = IIC_StatusRead();
	#endif
	
	return temp;
}

u16 LCD_DataRead(void)
{
	u16 temp = 0;
	
	#if STM32_FSMC_8
	temp = FMSC_8_DataRead();
	#endif
	
	#if STM32_FSMC_16
	temp =  *(vu16*)(LCD_BASE1);
	#endif
	
	#if STM32_SPI
	temp = SPI_DataRead();
	#endif
	
	#if STM32_IIC
	temp = IIC_DataRead();
	#endif
	
	return temp;
}
	  
	 
void Delay_us(u16 time)
{    
   u16 i=0;  
   while(time--)
   {
      i=12;        //自己定义
      while(i--) ;    
   }
}

void Delay_ms(u16 time)
{    
   u16 i=0;  
   while(time--)
   {
      i=12000;    //自己定义
      while(i--) ;    
   }
}


void Parallel_Init(void)
{
	#if STM32_FSMC_8
		FSMC_Init_8();
	#endif
		
	#if STM32_FSMC_16
		FSMC_Init_16();
	#endif
	
	#if STM32_SPI
		SPI2_Init();
	#endif
	
	#if STM32_IIC
		IIC_Init();
	#endif
}
















