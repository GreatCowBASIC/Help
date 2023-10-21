#include "sys.h"
#include "delay.h"  
#include "usart.h"   
#include "led.h"
#include "key.h"  
#include "LT768_Lib.h"
#include "LT768_Demo.h"
#include "touch.h" 

//extern void Parallel_Init(void);
//extern void LT768_Init(void);
const u16 POINT_COLOR_TBL[5]={Red,Green,Blue,Cyan,Magenta}; 

//清空屏幕并在右上角显示"RST"
void Load_Drow_Dialog(void)
{
	LT768_DrawSquare_Fill(0,0,1024,600,color16M_white);//清屏  
	LT768_Select_Internal_Font_Init(24,1,1,0,1);
	LT768_Print_Internal_Font_String(1024-40,0,Red,White,"RST");	
	//LCD_ShowString(lcddev.width-24,0,200,16,16,"RST");//显示清屏区域 
}
  
 
//画一条粗线
//(x1,y1),(x2,y2):线条的起始坐标
//size：线条的粗细程度
//color：线条的颜色
void lcd_draw_bline(u16 x1, u16 y1, u16 x2, u16 y2,u8 size,u16 color)
{
	u16 t; 
	int xerr=0,yerr=0,delta_x,delta_y,distance; 
	int incx,incy,uRow,uCol; 
	if(x1<size|| x2<size||y1<size|| y2<size)return; 
	delta_x=x2-x1; //计算坐标增量 
	delta_y=y2-y1; 
	uRow=x1; 
	uCol=y1; 
	if(delta_x>0)incx=1; //设置单步方向 
	else if(delta_x==0)incx=0;//垂直线 
	else {incx=-1;delta_x=-delta_x;} 
	if(delta_y>0)incy=1; 
	else if(delta_y==0)incy=0;//水平线 
	else{incy=-1;delta_y=-delta_y;} 
	if( delta_x>delta_y)distance=delta_x; //选取基本增量坐标轴 
	else distance=delta_y; 
	for(t=0;t<=distance+1;t++ )//画线输出 
	{  
		//gui_fill_circle(uRow,uCol,size,color);//画点 
		LT768_DrawCircle_Fill(uRow,uCol,size,color);
		xerr+=delta_x ; 
		yerr+=delta_y ; 
		if(xerr>distance) 
		{ 
			xerr-=distance; 
			uRow+=incx; 
		} 
		if(yerr>distance) 
		{ 
			yerr-=distance; 
			uCol+=incy; 
		} 
	}  
}   







void ctp_test(void)
{
	u8 t=0;
	u8 i=0;	  	    
 	u16 lastpos[5][2];		//最后一次的数据 
	Load_Drow_Dialog();
	while(1)
	{
		//tp_dev.scan(0);
		FT5206_Scan(0);
		for(t=0;t<5;t++)  //电容屏支持的点数,固定为5点
		{
			if((tp_dev.sta)&(1<<t))
			{
				if(tp_dev.x[t]<1024&&tp_dev.x[t]>0&&tp_dev.y[t]<600&&tp_dev.y[t]>0)
				{
					if(lastpos[t][0]==0XFFFF)
					{
						lastpos[t][0] = tp_dev.x[t];
						lastpos[t][1] = tp_dev.y[t];
					}
					lcd_draw_bline(lastpos[t][0],lastpos[t][1],tp_dev.x[t],tp_dev.y[t],2,POINT_COLOR_TBL[t]);//画线
					//LT768_DrawCircle_Fill(lastpos[t][0]+1,lastpos[t][1]+1,1,POINT_COLOR_TBL[t]);
					//LT768_DrawCircle_Fill(tp_dev.x[t]+1,tp_dev.y[t]+1,1,POINT_COLOR_TBL[t]);
					//LT768_DrawLine_Width(lastpos[t][0],lastpos[t][1],tp_dev.x[t],tp_dev.y[t],POINT_COLOR_TBL[t],3);
					lastpos[t][0]=tp_dev.x[t];
					lastpos[t][1]=tp_dev.y[t];
					if(tp_dev.x[t]>(1024-40)&&tp_dev.y[t]<24)
					{
						Load_Drow_Dialog();//清除
					}
				}
			}else lastpos[t][0]=0XFFFF;
		}
		
		delay_ms(5);i++;
		if(i%20==0)LED0=!LED0;
	}	
}

int main(void)
{ 

	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);//设置系统中断优先级分组2
	delay_init(168);         //初始化延时函数
	uart_init(115200);		 //初始化串口波特率为115200	
	LED_Init();				 //初始化LED 
	KEY_Init(); 			 //按键初始化 
	Parallel_Init();         // STM32驱动LT768的接口初始化
	LT768_Init();            // LT768初始化
	tp_dev.init();
	//Delay_ms(300);
	Display_ON();
	Select_SFI_Dual_Mode0();
	StartUp_picture();
	LT768_PWM1_Init(1,0,200,100,100);
	//WaitKey();
    //Load_Drow_Dialog();
	//ctp_test();
	
	/*
	Select_SFI_Dual_Mode0();
	StartUp_picture();
	Delay_ms(300);
	LT768_PWM1_Init(1,0,200,100,100);
	WaitKey();
	*/
	#if 1
	while(1)
	{
		//Color_Bar_ON();
		//WaitKey();
		LT768_DrawSquare_Fill(0,0,1024,600,color16M_red);
		//Delay_ms(300);
		//LT768_PWM1_Init(1,0,200,100,100);
		WaitKey();
		LT768_DrawSquare_Fill(0,0,1024,600,color16M_green);
		WaitKey();
		LT768_DrawSquare_Fill(0,0,1024,600,color16M_blue);
		WaitKey();
		LT768_DrawSquare_Fill(0,0,1024,600,color16M_gray);
		WaitKey();
		LT768_DrawSquare_Fill(0,0,1024,600,color16M_white);
		WaitKey();
		LT768_DrawSquare_Fill(0,0,1024,600,color16M_black);
		WaitKey();
		LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_1_Addr);
		WaitKey();
		LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_2_Addr);
		WaitKey();
		LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_3_Addr);
		WaitKey();
		LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_4_Addr);
		WaitKey();
		/*
		LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_5_Addr);
		WaitKey();
		LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_6_Addr);
		WaitKey();
		LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_7_Addr);
		WaitKey();
		LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_8_Addr);
		WaitKey();
		LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_9_Addr);
		WaitKey();
		*/
		//Load_Drow_Dialog();
	    ctp_test();

	}
    #endif
	

	
	
	
}
