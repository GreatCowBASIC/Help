#ifndef __KEY_H
#define __KEY_H	 
#include "sys.h"
#include "delay.h"

/*

#define KEY1 PBin(0)
#define KEY2 PBin(1)
#define KEY1_PRES 1
#define KEY2_PRES 2

*/

/*

#define KEY1 PEin(2)
#define KEY2 PEin(3)
#define KEY1_PRES 1
#define KEY2_PRES 2

*/

/*下面的方式是通过直接操作库函数方式读取IO*/
#define KEY0 		GPIO_ReadInputDataBit(GPIOE,GPIO_Pin_4) //PE4
#define KEY1 		GPIO_ReadInputDataBit(GPIOE,GPIO_Pin_3)	//PE3 
#define KEY2 		GPIO_ReadInputDataBit(GPIOE,GPIO_Pin_2) //PE2
#define WK_UP 		GPIO_ReadInputDataBit(GPIOA,GPIO_Pin_0)	//PA0


/*下面方式是通过位带操作方式读取IO*/
/*
#define KEY0 		PEin(4)   	//PE4
#define KEY1 		PEin(3)		//PE3 
#define KEY2 		PEin(2)		//P32
#define WK_UP 	PAin(0)		//PA0
*/


#define KEY0_PRES 	1
#define KEY1_PRES	2
#define KEY2_PRES	3
#define WKUP_PRES   4

void WaitKey(void);
void KEY_Init(void);
void Waiting_Key(void);
unsigned char Scan_Key(void);
unsigned char Scan_Key_delay(unsigned int t);

unsigned char Scan_FunctionKey(void);



#endif
