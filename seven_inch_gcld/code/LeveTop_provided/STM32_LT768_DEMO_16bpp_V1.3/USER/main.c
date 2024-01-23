/********************* COPYRIGHT  **********************
* Author           : Levetop Electronics
* Version          : V1.3
* Date             : 2019-5-14
********************************************************/

#include "sys.h"
#include "delay.h"
#include "usart.h"
#include "key.h"
#include "LT768_Demo.h"
#include "LT768_Lib.h"

extern u8 PwmControl;

int main(void)
{
	SystemInit();								// STM32ϵͳʱ�ӳ�ʼ��
	delay_init();								// ��ʱ��ʼ��
	uart_init(115200);							// ���ڳ�ʼ��
	KEY_Init();									// ����IO��ʼ��
	Parallel_Init();							// STM32����LT768�Ľӿڳ�ʼ��
	LT768_Init();								// LT768��ʼ��
	Select_SFI_Dual_Mode0();					// ʹ�ÿ��ٶ�FLASH���3Bh�����ο�W25Q128�Ķ�ȡ����ָ��3Bh
	StartUp_picture();							// װ�ص�һ����ʾͼƬ
	LT768_PWM1_Init(1,0,200,100,PwmControl);	// PWM1ʹ�ܱ���
	Display_ON();								// ����RGB���
	Waiting_Key();								// �ȴ�����
	Main_GUI();									// ��ʾ���˵�
	
	while(1)
	{
		Select_Function();     // ����ѡ����չʾ
	}
}












