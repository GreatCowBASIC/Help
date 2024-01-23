/******************************************************************************
  * Copyright(c) 2023 Levetop Semiconductor Co., Ltd. All rights reserved
  * @file      key.c
  * @author    Levetop TFT Controller Application Team
  * @version   V1.0.0
  * @date      2023-02-24
  * @brief     Function codes for external keys (KEY0 & KEY1)
*******************************************************************************/

#include "key.h"

/*---------------------------------------------------------------------------------------*/
/* Function:    KEY_Init                                                                 */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Initialize the external keys (KEY0 & KEY1)                               */
/*---------------------------------------------------------------------------------------*/
void KEY_Init(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);	 
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10|GPIO_Pin_11;	
 	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;  
 	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
 	GPIO_Init(GPIOB, &GPIO_InitStructure); 
	
}

/*---------------------------------------------------------------------------------------*/
/* Function:    Scan_Key                                                                 */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:                                                                              */
/*              0: no key is pressed                                                     */
/*              1: KEY0 is pressed                                                       */
/*              2: KEY1 is pressed                                                       */
/* Description: Initialize the external keys (KEY0 & KEY1)                               */
/*---------------------------------------------------------------------------------------*/
unsigned char Scan_Key(void)       // Return value: 0-> no key is pressed; 1-> KEY0 is pressed; 2-> KEY1 is pressed
{
	static unsigned char key_up=1; // key_up = 1, meaning the key is in released state 
	if(key_up&&(KEY1==0||KEY2==0))
	{
		delay_ms(10);              // Eliminate noise 
		key_up=0;
		if(KEY1==0)			return KEY1_PRES;
		else if(KEY2==0)	return KEY2_PRES;
	}
	else if(KEY1==1&&KEY2==1)
	{
		key_up=1; 	    
	}
	
 	return 0;                     // No key is pressed
}

/*---------------------------------------------------------------------------------------*/
/* Function:    Waiting_Key                                                              */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Wait until any of the keys is pressed                                    */
/*---------------------------------------------------------------------------------------*/
void Waiting_Key(void)            
{
	unsigned char key = 0;
	do
	{
		__NOP();
		key = Scan_Key();
	}
	while(key == 0);
}


/*---------------------------------------------------------------------------------------*/
/* Function:    Scan_Key_delay                                                           */
/*                                                                                       */
/* Parameters:                                                                           */
/*              t: time gap                                                              */                                      
/* Returns:                                                                              */
/*              1: at least one of the keys is pressed                                   */
/* Description: Check if any of the key is pressed in designated time period             */
/*---------------------------------------------------------------------------------------*/
unsigned char Scan_Key_delay(unsigned int t) 
{
	unsigned char key = 0;
	unsigned int i = 0;
	for(i = 0 ; i < t ; i++)
	{
		delay_ms(1);
		key = Scan_Key();
		if(key == KEY1_PRES)	return 1;
		if(key == KEY2_PRES)	return 1;
	}
	return 0;
}



/*---------------------------------------------------------------------------------------*/
/* Function:    Scan_FunctionKey                                                         */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:                                                                              */
/*                   3: Long press                                                       */
/*              1 or 2: Short press                                                      */
/* Description: Check if any of the key is long pressed or short pressed                 */
/*---------------------------------------------------------------------------------------*/
unsigned char Scan_FunctionKey(void)         
{
	unsigned char key = 0;
	unsigned char state1 = 0;
	unsigned char state2 = 0;
	unsigned int key1_count = 0;
	unsigned int key2_count = 0;
	
	while(1)
	{
		delay_ms(1);
		key = Scan_Key();
		
		if((state1==0)&&(state2==0))
		{
			if((key == KEY1_PRES)||(key == KEY2_PRES))
			{
				if(key == KEY1_PRES)			state1 = 1;
				else if(key == KEY2_PRES)	state2 = 1;
			}
		}
		
		if(state1 == 1)
		{
			if(KEY1 == 0)
			{
				key1_count++;
			}
			else
			{
				break;
			}
		}
		else if(state2 == 1)
		{
			if(KEY2 == 0)
			{
				key2_count++;
			}
			else
			{
				break;
			}
		}
	}
	
	if(key1_count >= 500)												return 3;
	else if((key1_count>0) && (key1_count<500))	return 1;
	
	if(key2_count >= 500)												return 3;
	else if((key2_count>0) && (key2_count<500))	return 2;
	
	return 0;
}







