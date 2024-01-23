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
	SystemInit();								// STM32系统时钟初始化
	delay_init();								// 延时初始化
	uart_init(115200);							// 串口初始化
	KEY_Init();									// 按键IO初始化
	Parallel_Init();							// STM32驱动LT768的接口初始化
	LT768_Init();								// LT768初始化
	Select_SFI_Dual_Mode0();					// 使用快速读FLASH命令（3Bh）：参看W25Q128的读取数据指令3Bh
	StartUp_picture();							// 装载第一张显示图片
	LT768_PWM1_Init(1,0,200,100,PwmControl);	// PWM1使能背光
	Display_ON();								// 开启RGB输出
	Waiting_Key();								// 等待按键
	Main_GUI();									// 显示主菜单
	
	while(1)
	{
		Select_Function();     // 按键选择功能展示
	}
}












