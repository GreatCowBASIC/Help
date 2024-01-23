#include "gt911.h"
#include "LT768.h"
#include "stm32f10x_exti.h"
#include "stm32f10x.h"
#include "usart.h"
#include "if_port.h"

TP_INFO gTpInfo;             // TP information
unsigned char READ_BUFF[16]; // Data read buffer

void LT_I2C_Write_NByte(uint8_t slave_addr,uint16_t reg,uint16_t num, uint8_t *p)
{
	uint16_t i=0, j=0;
	
	LT768_I2CM_Transmit_Data(slave_addr & 0xFE);
	LT768_I2CM_Write_With_Start();
	while(LT768_I2CM_Check_Slave_ACK()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
	while(LT768_I2CM_transmit_Progress()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
	
	LT768_I2CM_Transmit_Data(reg>>8);
	LT768_I2CM_Write();
	while(LT768_I2CM_Check_Slave_ACK()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
	while(LT768_I2CM_transmit_Progress()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
	
	LT768_I2CM_Transmit_Data(reg);
	LT768_I2CM_Write();
	while(LT768_I2CM_Check_Slave_ACK()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
	while(LT768_I2CM_transmit_Progress()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
	
	for(i=0;i<num;i++)
	{
		LT768_I2CM_Transmit_Data(p[i]);
		LT768_I2CM_Write();
		while(LT768_I2CM_Check_Slave_ACK()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
		while(LT768_I2CM_transmit_Progress()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
	}

	LT768_I2CM_Stop();
	while(LT768_I2CM_Bus_Busy()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}		
}

void LT_I2C_Read_NByte(uint8_t slave_addr,uint16_t reg,uint16_t num, uint8_t *p)
{
	uint16_t j = 0;
	uint16_t i=0;
	LT768_I2CM_Transmit_Data(slave_addr & 0xFE);
	LT768_I2CM_Write_With_Start();
	while(LT768_I2CM_Check_Slave_ACK()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
	while(LT768_I2CM_transmit_Progress()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}

	LT768_I2CM_Transmit_Data(reg>>8);
	LT768_I2CM_Write();
	while(LT768_I2CM_Check_Slave_ACK()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
	while(LT768_I2CM_transmit_Progress()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}

	LT768_I2CM_Transmit_Data(reg);
	LT768_I2CM_Write();
	while(LT768_I2CM_Check_Slave_ACK()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
	while(LT768_I2CM_transmit_Progress()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}

	LT768_I2CM_Stop();
	while(LT768_I2CM_Bus_Busy()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
	
	LT768_I2CM_Transmit_Data(slave_addr | 0x01);
	LT768_I2CM_Write_With_Start();
	while(LT768_I2CM_Check_Slave_ACK()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
	while(LT768_I2CM_transmit_Progress()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}	
	
	for(;i<num;i++)
	{	
		if(i == num-1)
			LT768_I2CM_Read_With_Nack();
		else
			LT768_I2CM_Read_With_Ack();		
		
		while(LT768_I2CM_transmit_Progress()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
		p[i]=LT768_I2CM_Receiver_Data();
		
	}
	LT768_I2CM_Stop();
	while(LT768_I2CM_Bus_Busy()){
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
}

void CTP_io_Init(void)
{
	u8 i;
	u16 X_Output_Max,Y_Output_Max, j=0;
	unsigned int Product_ID;
	GPIO_InitTypeDef GPIO_InitStructure;    
	EXTI_InitTypeDef EXTI_InitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;
	
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB , ENABLE);
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;			    // INT pin connect to PB9
 	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP; 	
 	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
 	GPIO_Init(GPIOB, &GPIO_InitStructure);
	
	Set_GPIO_A_In_Out(0x00); //LT768x GPOA-7 RST pin
	

	
	INT_Low;       			 //INT = 0, For GT911 Addr = 0x28
	RST_Low;                 //RESET = 0;
	delay_ms(2);
	INT_High;                //INT  = 1;
	delay_ms(2);
	RST_High;
	delay_ms(10);
	INT_Low;
	delay_ms(60);
	
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);
	
	GPIO_InitStructure.GPIO_Pin  = GPIO_Pin_9;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
	GPIO_Init(GPIOB, &GPIO_InitStructure);
	GPIO_EXTILineConfig(GPIO_PortSourceGPIOB,GPIO_PinSource9);
	
	EXTI_InitStructure.EXTI_Line=EXTI_Line9; 
	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt; 
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
	EXTI_Init(&EXTI_InitStructure); 


    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	
    NVIC_InitStructure.NVIC_IRQChannel = EXTI9_5_IRQn;   
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0x02; //Set priority 2 
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0x02;        //Set sub-priority 2
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;              //Enable external interrupt
    NVIC_Init(&NVIC_InitStructure);
	
	NVIC_SetVectorTable(0x8008000, 0);       // Set interrupt vector address
	INTX_ENABLE();                           // Enable interrupt
	
	delay_ms(20);
	LT768_I2CM_Clock_Prescale(57);	
	LT768_I2CM_Enable();
	delay_ms(100);

	LT_I2C_Read_NByte(0x28,0x8140,6,READ_BUFF);

	Product_ID=READ_BUFF[3];
	Product_ID=Product_ID<<8|READ_BUFF[2];
	Product_ID=Product_ID<<8|READ_BUFF[1];
	Product_ID=Product_ID<<8|READ_BUFF[0];
	
	printf("ID:%x \r\n",Product_ID);

	
	
	LT768_I2CM_Transmit_Data(0x28);
	LT768_I2CM_Write_With_Start();
	while(LT768_I2CM_Check_Slave_ACK())
	{
		j++;
		delay_us(10);
		if(j > 1000)	
		{
			j = 0;
			break;
		}
	}
	
	while(LT768_I2CM_transmit_Progress())
	{
		j++;
		delay_us(10);
		if(j > 1000)	
		{
			j = 0;
			break;
		}
	}
	
	LT768_I2CM_Transmit_Data(0x81);
	LT768_I2CM_Write();
	while(LT768_I2CM_Check_Slave_ACK())
	{
		j++;
		delay_us(10);
		if(j > 1000)	
		{
			j = 0;
			break;
		}
	}
		
	while(LT768_I2CM_transmit_Progress())
	{
		j++;
		delay_us(10);
		if(j > 1000)	
		{
			j = 0;
			break;
		}
	}
	
	LT768_I2CM_Transmit_Data(0x46);
	LT768_I2CM_Write();
	while(LT768_I2CM_Check_Slave_ACK())
	{
		j++;
		delay_us(10);
		if(j > 1000)	
		{
			j = 0;
			break;
		}
	}
	
	while(LT768_I2CM_transmit_Progress())
	{
		j++;
		delay_us(10);
		if(j > 1000)	
		{
			j = 0;
			break;
		}
	}
	
	LT768_I2CM_Stop();
	while(LT768_I2CM_Bus_Busy())
	{
		j++;
		delay_us(10);
		if(j > 1000)	
		{
			j = 0;
			break;
		}
	}
	
	LT768_I2CM_Transmit_Data(0x29);
	LT768_I2CM_Write_With_Start();
	while(LT768_I2CM_Check_Slave_ACK())
	{
		j++;
		delay_us(10);
		if(j > 1000)	
		{
			j = 0;
			break;
		}
	}
	
	while(LT768_I2CM_transmit_Progress())
	{
		j++;
		delay_us(10);
		if(j > 1000)	
		{
			j = 0;
			break;
		}
	}
	
	for(i=0;i<4;i++)
	{	
		if(i == 4-1)
			LT768_I2CM_Read_With_Nack();
		else
			LT768_I2CM_Read_With_Ack();		
		
		while(LT768_I2CM_transmit_Progress())
		{
			j++;
			delay_us(10);
			if(j > 1000)	
			{
				j = 0;
				break;
			}
		}
		READ_BUFF[i]=LT768_I2CM_Receiver_Data();
		
	}
	
	LT768_I2CM_Stop();
	while(LT768_I2CM_Bus_Busy())
	{
		j++;
		delay_us(10);
		if(j > 1000)	
		{
			j = 0;
			break;
		}
	}
	
	X_Output_Max=(READ_BUFF[1] << 8 | READ_BUFF[0]);
	Y_Output_Max=(READ_BUFF[3] << 8 | READ_BUFF[2]);
	printf("X_Output_Max=%d Y_Output_Max=%d \r\n",X_Output_Max,Y_Output_Max);

}

u8 ctp_active_index=0;
void EXTI9_5_IRQHandler(void)
{		
	if(EXTI_GetITStatus(EXTI_Line9) != RESET)
	{
		ctp_active_index=1;
		EXTI_ClearITPendingBit(EXTI_Line9);  // Clear the pending bit
	}
	
}


u8 touch_flag=0;
u8 first=0;
u16 X_Pos,Y_Pos;
u8 num_flag=0;
void TP_read_XY(void)
{
	uint16_t j = 0;
	u16 x, y;
	u8 i = 0;
	u8 lineWidth=1;
	LT_I2C_Read_NByte(0x28, 0x814E, 6, READ_BUFF);
	
	if (READ_BUFF[0] & 0x80) //valid if buffer status == 1
	{

		x = READ_BUFF[3];
		x = x << 8 | READ_BUFF[2];
		
		y = READ_BUFF[5];
		y = y << 8 | READ_BUFF[4];
		x = x*LCD_XSIZE_TFT/800;       //x*LCD_XSIZE_TFT/1024;
		y = y*LCD_YSIZE_TFT/480;       //y*LCD_YSIZE_TFT/600;
		printf("x=%d y=%d \r\n",x,y);
		
		if(x!=0 &&y!=0)
		{
			if(first==0)
			{
					
					X_Pos=x;
					Y_Pos=y;
					first = 1;
					gTpInfo.sta = 0;
			}
			else
			{
					//LT768_DrawQuadrilateral_Fill(X_Pos,Y_Pos+lineWidth,X_Pos+lineWidth,Y_Pos,x+lineWidth,y,x,y+lineWidth,0xF800);
					X_Pos = x;
					Y_Pos = y;
				
					gTpInfo.sta = 1;
					gTpInfo.x = x;
					gTpInfo.y = y;				
			}
		}
		
		LT768_I2CM_Transmit_Data(0x28);
		LT768_I2CM_Write_With_Start();
		while(LT768_I2CM_Check_Slave_ACK())
		{
			j++;
			delay_us(5);
			if(j > 100)	
			{
				j = 0;
				break;
			}
		}
		while(LT768_I2CM_transmit_Progress()){
			j++;
			delay_us(5);
			if(j > 100)	
			{
				j = 0;
				break;
			}
		}
		LT768_I2CM_Transmit_Data(0x81);
		LT768_I2CM_Write();
		while(LT768_I2CM_Check_Slave_ACK()){
			j++;
			delay_us(5);
			if(j > 100)	
			{
				j = 0;
				break;
			}
		}
		while(LT768_I2CM_transmit_Progress()){
			j++;
			delay_us(5);
			if(j > 100)	
			{
				j = 0;
				break;
			}
		}
	
		LT768_I2CM_Transmit_Data(0x4e);
		LT768_I2CM_Write();
		while(LT768_I2CM_Check_Slave_ACK()){
			j++;
			delay_us(5);
			if(j > 100)	
			{
				j = 0;
				break;
			}
		}
		while(LT768_I2CM_transmit_Progress()){
			j++;
			delay_us(5);
			if(j > 100)	
			{
				j = 0;
				break;
			}
		}

		LT768_I2CM_Transmit_Data(0x00);
		
		LT768_I2CM_Write();
		while(LT768_I2CM_Check_Slave_ACK()){
			j++;
			delay_us(5);
			if(j > 100)	
			{
				j = 0;
				break;
			}
		}
		while(LT768_I2CM_transmit_Progress()){
			j++;
			delay_us(5);
			if(j > 100)	
			{
				j = 0;
				break;
			}
		}
		LT768_I2CM_Stop();
		while(LT768_I2CM_Bus_Busy()){
			j++;
			delay_us(5);
			if(j > 100)	
			{
				j = 0;
				break;
			}
		}
	}
	
	if(READ_BUFF[0] == 128) 
	{
		first = 0;
	}
}

u8 gt911_Scan(void)
{
	if (ctp_active_index == 1)
	{
		TP_read_XY();
		ctp_active_index = 0;
		return 1;
	}
	
	return 0;
}