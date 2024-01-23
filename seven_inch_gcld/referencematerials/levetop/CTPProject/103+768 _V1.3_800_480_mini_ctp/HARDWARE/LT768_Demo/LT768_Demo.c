/******************** COPYRIGHT  ********************
* File Name        : LT768_Demo.c
* Author           : Levetop Electronics
* Version          : V1.2
* Date             : 2018-9-19
* Description      : LT768x的测试程序
****************************************************/

#include "LT768_Demo.h"
#include "Image.h"
#include "gt911.h"

extern TP_INFO gTpInfo;

unsigned char Waiting_ClickScreen(void)
{
	unsigned char state = 0;
	
	while (1)
	{
		gt911_Scan();
		if (gTpInfo.sta == 1 && state == 0)
		{
			state = 1;
		}
		else if (gTpInfo.sta == 0 && state == 1)
		{
			return 1;
		}
	}
	return 1;
}

unsigned int Scan_Count = 0;
unsigned char Scan_State = 0;

/*有改动*/
unsigned char Scan_Screen_Delay_1ms(void)
{
	delay_ms(1);
	
	gt911_Scan();
	if (Scan_State == 0 && gTpInfo.sta == 1)
	{
		Scan_State = 1;
	}
	else if(Scan_State == 1 && gTpInfo.sta == 0)
	{
		Scan_State = 0;
		return 1;
	}		
	return 0;
}

unsigned char Screen_delay_Count(unsigned int t)
{
	while (t--)
	{
		if (Scan_Screen_Delay_1ms())
			return 1;
	}
	return 0;
}

#if 1
void StartUp_picture(void)
{
	Select_Main_Window_16bpp();						//选择显示颜色深度
	Main_Image_Start_Address(layer1_start_addr);	//设定主窗口起始地址（SDRAM中显示到屏幕的内容的起始地址）
	Main_Image_Width(LCD_XSIZE_TFT);				//设定主窗口的宽度
	Main_Window_Start_XY(0,0);						//设定主窗口显示的起始坐标
	Canvas_Image_Start_address(layer1_start_addr);	//设定写入到SDRAM的起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				//设定写入SDRAM的宽度（必须为4的倍数）
	Active_Window_XY(0,0);							//设定工作窗口的坐标
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);	//设定工作窗口的宽度（必须为4的倍数）和高度
	
	//清空背景
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Black);
	
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,0);  
	
	Waiting_ClickScreen();
}


void Display_Levetop(void)
{
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			          
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	            
	Canvas_image_width(LCD_XSIZE_TFT);				         
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);     
	Main_Window_Start_XY(0,0);				

	//清空背景
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Black);
	
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_2_Addr);
	
	Waiting_ClickScreen();
	
//	while(1)
//	{
//		if(Screen_delay_Count(100)) break;
//	}
	
}

unsigned char Draw_Circle_Ellipse(void)
{
	unsigned long i,j,h,c,z;
	unsigned long resx1,resy1;

	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 1;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标
	
	while(1)
	{
		//--------------------- 圆 ------------------------
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		h=0;
		do
		{
			i=rand()%65536;                  // 颜色
			resx1=rand()%LCD_XSIZE_TFT;      // 圆心x轴
			resy1=rand()%(LCD_YSIZE_TFT-20/*24*/); // 圆心y轴
			z=rand()%160/*200*/;                    // 半径
			j=rand()%3;
			if(j)	LT768_DrawCircle(resx1,resy1,z,i);        // 无填充色圆
			else	LT768_DrawCircle_Fill(resx1,resy1,z,i);   // 填充色圆
			h++;
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		while(h<20);

		h=0;
		do
		{
			i=rand()%65536;                  // 颜色
			resx1=rand()%LCD_XSIZE_TFT;      // 圆心x轴
			resy1=rand()%(LCD_YSIZE_TFT-20/*24*/); // 圆心y轴
			z=rand()%160/*200*/;                    // 半径
			j=rand()%3;
			if(j)	LT768_DrawCircle(resx1,resy1,z,i);        // 无填充色圆
			else	LT768_DrawCircle_Fill(resx1,resy1,z,i);   // 填充色圆
			h++;
			delay_ms(1);
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		while(h<2500);

		//--------------------- 椭圆 ------------------------
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		h=0;
		do
		{
			i=rand()%65536;                  // 颜色
			resx1=rand()%LCD_XSIZE_TFT;      // 圆心x轴
			resy1=rand()%(LCD_YSIZE_TFT-20/*24*/); // 圆心y轴
			z=rand()%160/*200*/;                    // 长半径
			c=rand()%160/*200*/;                    // 短半径
			j=rand()%3;
			if(j)	LT768_DrawEllipse(resx1,resy1,z,c,i);        // 无填充色圆
			else	LT768_DrawEllipse_Fill(resx1,resy1,z,c,i);   // 填充色圆
			h++;
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		while(h<20);

		do
		{
			i=rand()%65536;                  // 颜色
			resx1=rand()%LCD_XSIZE_TFT;      // 圆心x轴
			resy1=rand()%(LCD_YSIZE_TFT-20/*24*/); // 圆心y轴
			z=rand()%160/*200*/;                    // 长半径
			c=rand()%160/*200*/;                    // 短半径
			j=rand()%3;
			if(j)	LT768_DrawEllipse(resx1,resy1,z,c,i);        // 无填充色圆
			else	LT768_DrawEllipse_Fill(resx1,resy1,z,c,i);   // 填充色圆
			h++;
			delay_ms(1);
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		while(h<2500);
	}
}

unsigned char Draw_Line_Curve(void)
{
	unsigned long i,j,h,z,d,w;
	unsigned long resx1,resy1,resx2,resy2;

	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标

	while(1)
	{
		//----------------------- 线段 ------------------------
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		h=0;
		do
		{
			resx1=rand()%LCD_XSIZE_TFT;       // 起点的x轴
			resy1=rand()%(LCD_YSIZE_TFT);     // 起点的y轴
			resx2=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy2=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			i=rand()%65536;                   // 颜色
			w=rand()%20;

			LT768_DrawLine_Width(resx1,resy1+w,resx2,resy2+w,i,w);

			h++;
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		while(h<20);

		h=0;
		do
		{
			resx1=rand()%LCD_XSIZE_TFT;       // 起点的x轴
			resy1=rand()%(LCD_YSIZE_TFT);     // 起点的y轴
			resx2=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy2=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			i=rand()%65536;                   // 颜色
			w=rand()%20;

			LT768_DrawLine_Width(resx1,resy1+w,resx2,resy2+w,i,w);

			h++;
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		while(h<2500);
		
		//----------------------- 曲线 ------------------------
		
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		
		h=0;
		do
		{
			i=rand()%65536;                  // 颜色
			resx1=rand()%LCD_XSIZE_TFT;      // 区心的x轴
			resy1=rand()%(LCD_YSIZE_TFT);    // 区心的y轴
			z=rand()%120/*150*/;                    // 长短半径
			d=rand()%4;                      // 方向
			j=rand()%3;

			switch(d)
			{
				case 0:
						if(z>resx1)	resx1 = 120;
						if(z>(LCD_YSIZE_TFT-resy1))	resy1 = 360;
						break;
				case 1:
						if(z>resx1)	resx1 = 120;
						if(z>resy1)	resy1 = 120;
						break;
				case 2:
						if(z>(LCD_XSIZE_TFT-resx1))	resx1 = 680;
						if(z>resy1)	resy1 = 120;
						break;
				case 3:
						if(z>(LCD_XSIZE_TFT-resx1))	resx1 = 680;
						if(z>(LCD_YSIZE_TFT-resy1))	resy1 = 360;
						break;
				default:
						break;
			}

			if(j)   LT768_SelectDrawCurve(resx1,resy1,z,z,i,d);      // 硬件画曲线（无填充）
			else	  LT768_SelectDrawCurve_Fill(resx1,resy1,z,z,i,d); // 硬件画曲线（填充）
			h++;
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		while(h<20);

		h=0;
		do
		{
			i=rand()%65536;                   // 颜色
			resx1=rand()%(LCD_XSIZE_TFT-150); // 区心的x轴
			resy1=rand()%(LCD_YSIZE_TFT-150); // 区心的y轴
			z=rand()%120/*150*/;                     // 长短半径
			d=rand()%4;                       // 方向
			j=rand()%3;

			switch(d)
			{
				case 0:
						if(z>resx1)	resx1 = 120;
						if(z>(LCD_YSIZE_TFT-resy1))	resy1 = 360;
						break;
				case 1:
						if(z>resx1)	resx1 = 120;
						if(z>resy1)	resy1 = 120;
						break;
				case 2:
						if(z>(LCD_XSIZE_TFT-resx1))	resx1 = 680;
						if(z>resy1)	resy1 = 120;
						break;
				case 3:
						if(z>(LCD_XSIZE_TFT-resx1))	resx1 = 680;
						if(z>(LCD_YSIZE_TFT-resy1))	resy1 = 360;
						break;
				default:
						break;
			}

			if(j)   LT768_SelectDrawCurve(resx1,resy1,z,z,i,d);      // 硬件画曲线（无填充）
			else	  LT768_SelectDrawCurve_Fill(resx1,resy1,z,z,i,d); // 硬件画曲线（填充）
			h++;
			delay_ms(1);
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		while(h<2500);
	}
}


unsigned short abs1(int val)
{
	if(val<0)	val = -val;
	return val;
}

unsigned char Draw_Rectangle(void)
{
	unsigned long i,j,h,z;
	unsigned long resx1,resy1,resx2,resy2;

	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标

	while(1)
	{
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		h=0;
		do
		{
			resx1=rand()%LCD_XSIZE_TFT;       // 起点的x轴
			resy1=rand()%(LCD_YSIZE_TFT);  // 起点的y轴
			resx2=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy2=rand()%(LCD_YSIZE_TFT);  // 终点的y轴
			i=rand()%65536;                   // 颜色
			j=rand()%3;
			if(j)	LT768_DrawSquare(resx1,resy1,resx2,resy2,i);        // 无填充色矩形
			else	LT768_DrawSquare_Fill(resx1,resy1,resx2,resy2,i);   // 填充色矩形
			h++;
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		while(h<20);

		h=0;
		do
		{
			resx1=rand()%LCD_XSIZE_TFT;       // 起点的x轴
			resy1=rand()%(LCD_YSIZE_TFT);     // 起点的y轴
			resx2=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy2=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			i=rand()%65536;                   // 颜色
			j=rand()%3;
			if(j)	LT768_DrawSquare(resx1,resy1,resx2,resy2,i);        // 无填充色矩形
			else	LT768_DrawSquare_Fill(resx1,resy1,resx2,resy2,i);   // 填充色矩形
			h++;
			delay_ms(1);
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		while(h<2500);
		
		// ---------------------------- 圆角矩形 -----------------------------
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		h=0;
		do
		{
			resx1=rand()%(LCD_XSIZE_TFT-10);        // 点1的x轴
			resy1=rand()%(LCD_YSIZE_TFT-10);  	    // 点1的y轴
			resx2=rand()%(LCD_XSIZE_TFT-10);        // 点2的x轴
			resy2=rand()%(LCD_YSIZE_TFT-10);  	    // 点2的y轴
			i=rand()%65536;                         // 颜色
			j=rand()%3;
			z=rand()%50;                            // 长半径

			if(abs1(resx2-resx1)<(2*z))	z = 0;
			if(abs1(resy2-resy1)<(2*z))	z = 0;

			if(j)	LT768_DrawCircleSquare(resx1,resy1,resx2,resy2,z,z,i);
			else	LT768_DrawCircleSquare_Fill(resx1,resy1,resx2,resy2,z,z,i);
			h++;
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		while(h<20);

		h=0;
		do
		{
			resx1=rand()%(LCD_XSIZE_TFT-10);        // 点1的x轴
			resy1=rand()%(LCD_YSIZE_TFT-10);  	    // 点1的y轴
			resx2=rand()%(LCD_XSIZE_TFT-10);        // 点2的x轴
			resy2=rand()%(LCD_YSIZE_TFT-10);  	    // 点2的y轴
			i=rand()%65536;                         // 颜色
			j=rand()%3;
			z=rand()%50;                            // 长半径

			if(abs1(resx2-resx1)<(2*z))	z = 0;
			if(abs1(resy2-resy1)<(2*z))	z = 0;

			if(j)	LT768_DrawCircleSquare(resx1,resy1,resx2,resy2,z,z,i);
			else	LT768_DrawCircleSquare_Fill(resx1,resy1,resx2,resy2,z,z,i);
			h++;
			delay_ms(1);
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		while(h<2500);
	}
}




unsigned char Draw_Pentagon(void)
{
	u8 j = 0;
	unsigned long i,h;
	unsigned long resx1,resy1,resx2,resy2,resx3,resy3,resx4,resy4,resx5,resy5;
	
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标

	while(1)
	{
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		h=0;
		do
		{
			resx1=rand()%LCD_XSIZE_TFT;       // 起点的x轴
			resy1=rand()%(LCD_YSIZE_TFT);     // 起点的y轴
			resx2=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy2=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			resx3=rand()%LCD_XSIZE_TFT;       // 起点的x轴
			resy3=rand()%(LCD_YSIZE_TFT);     // 起点的y轴
			resx4=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy4=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			resx5=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy5=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			i=rand()%65536;                   // 颜色
			j=rand()%3;

		  if(j)	LT768_DrawPentagon(resx1,resy1,resx2,resy2,resx3,resy3,resx4,resy4,resx5,resy5,i);        // 无填充色矩形
			else	LT768_DrawPentagon_Fill(resx1,resy1,resx2,resy2,resx3,resy3,resx4,resy4,resx5,resy5,i);   // 填充色矩形

			h++;
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		while(h<20);

		h=0;
		do
		{
			resx1=rand()%LCD_XSIZE_TFT;       // 起点的x轴
			resy1=rand()%(LCD_YSIZE_TFT);     // 起点的y轴
			resx2=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy2=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			resx3=rand()%LCD_XSIZE_TFT;       // 起点的x轴
			resy3=rand()%(LCD_YSIZE_TFT);     // 起点的y轴
			resx4=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy4=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			resx5=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy5=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			i=rand()%65536;                   // 颜色
			j=rand()%3;

		  if(j)	LT768_DrawPentagon(resx1,resy1,resx2,resy2,resx3,resy3,resx4,resy4,resx5,resy5,i);        // 无填充色矩形
			else	LT768_DrawPentagon_Fill(resx1,resy1,resx2,resy2,resx3,resy3,resx4,resy4,resx5,resy5,i);   // 填充色矩形

			h++;
			delay_ms(1);
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		while(h<2500);
	}
}



unsigned char Draw_Triangle(void)
{
	unsigned long i,j,h;
	unsigned long resx1,resy1,resx2,resy2,resx3,resy3;

	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标

	while(1)
	{
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		h=0;
		do
		{
			resx1=rand()%LCD_XSIZE_TFT;       // 点1的x轴
			resy1=rand()%(LCD_YSIZE_TFT);     // 点1的y轴
			resx2=rand()%LCD_XSIZE_TFT;       // 点2的x轴
			resy2=rand()%(LCD_YSIZE_TFT);     // 点2的y轴
			resx3=rand()%LCD_XSIZE_TFT;       // 点3的x轴
			resy3=rand()%(LCD_YSIZE_TFT);     // 点3的y轴
			i=rand()%65536;                   // 颜色
			j=rand()%3;
			if(j)	LT768_DrawTriangle(resx1,resy1,resx2,resy2,resx3,resy3,i);      // 无填充色三角形
			else	LT768_DrawTriangle_Fill(resx1,resy1,resx2,resy2,resx3,resy3,i); // 填充色三角形
			h++;
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		while(h<20);

		h=0;
		do
		{
			resx1=rand()%LCD_XSIZE_TFT;       // 点1的x轴
			resy1=rand()%(LCD_YSIZE_TFT);     // 点1的y轴
			resx2=rand()%LCD_XSIZE_TFT;       // 点2的x轴
			resy2=rand()%(LCD_YSIZE_TFT);     // 点2的y轴
			resx3=rand()%LCD_XSIZE_TFT;       // 点3的x轴
			resy3=rand()%(LCD_YSIZE_TFT);     // 点3的y轴
			i=rand()%65536;                   // 颜色
			j=rand()%3;
			if(j)	LT768_DrawTriangle(resx1,resy1,resx2,resy2,resx3,resy3,i);      // 无填充色三角形
			else	LT768_DrawTriangle_Fill(resx1,resy1,resx2,resy2,resx3,resy3,i); // 填充色三角形
			h++;
			delay_ms(1);
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		while(h<2500);

	}
}


u8 Draw_Polygon(void)
{
	u8 j = 0;
	unsigned long i,h;
	unsigned long resx1,resy1,resx2,resy2,resx3,resy3,resx4,resy4,resx5,resy5;
	
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标

	while(1)
	{
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		h=0;
		do
		{
			resx1=rand()%LCD_XSIZE_TFT;       // 起点的x轴
			resy1=rand()%(LCD_YSIZE_TFT);     // 起点的y轴
			resx2=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy2=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			resx3=rand()%LCD_XSIZE_TFT;       // 起点的x轴
			resy3=rand()%(LCD_YSIZE_TFT);     // 起点的y轴
			resx4=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy4=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			resx5=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy5=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			i=rand()%65536;                   // 颜色
			j=rand()%3;

		  if(j)	LT768_DrawPentagon(resx1,resy1,resx2,resy2,resx3,resy3,resx4,resy4,resx5,resy5,i);        // 无填充色矩形
			else	LT768_DrawPentagon_Fill(resx1,resy1,resx2,resy2,resx3,resy3,resx4,resy4,resx5,resy5,i);   // 填充色矩形

			h++;
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		while(h<20);

		h=0;
		do
		{
			resx1=rand()%LCD_XSIZE_TFT;       // 起点的x轴
			resy1=rand()%(LCD_YSIZE_TFT);     // 起点的y轴
			resx2=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy2=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			resx3=rand()%LCD_XSIZE_TFT;       // 起点的x轴
			resy3=rand()%(LCD_YSIZE_TFT);     // 起点的y轴
			resx4=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy4=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			resx5=rand()%LCD_XSIZE_TFT;       // 终点的x轴
			resy5=rand()%(LCD_YSIZE_TFT);     // 终点的y轴
			i=rand()%65536;                   // 颜色
			j=rand()%3;

		  if(j)	LT768_DrawPentagon(resx1,resy1,resx2,resy2,resx3,resy3,resx4,resy4,resx5,resy5,i);        // 无填充色矩形
			else	LT768_DrawPentagon_Fill(resx1,resy1,resx2,resy2,resx3,resy3,resx4,resy4,resx5,resy5,i);   // 填充色矩形

			h++;
			delay_ms(1);
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		while(h<1500);
		
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		h=0;
		do
		{
			resx1=rand()%LCD_XSIZE_TFT;       // 点1的x轴
			resy1=rand()%(LCD_YSIZE_TFT);     // 点1的y轴
			resx2=rand()%LCD_XSIZE_TFT;       // 点2的x轴
			resy2=rand()%(LCD_YSIZE_TFT);     // 点2的y轴
			resx3=rand()%LCD_XSIZE_TFT;       // 点3的x轴
			resy3=rand()%(LCD_YSIZE_TFT);     // 点3的y轴
			i=rand()%65536;                   // 颜色
			j=rand()%3;
			if(j)	LT768_DrawTriangle(resx1,resy1,resx2,resy2,resx3,resy3,i);      // 无填充色三角形
			else	LT768_DrawTriangle_Fill(resx1,resy1,resx2,resy2,resx3,resy3,i); // 填充色三角形
			h++;
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		while(h<20);

		h=0;
		do
		{
			resx1=rand()%LCD_XSIZE_TFT;       // 点1的x轴
			resy1=rand()%(LCD_YSIZE_TFT);     // 点1的y轴
			resx2=rand()%LCD_XSIZE_TFT;       // 点2的x轴
			resy2=rand()%(LCD_YSIZE_TFT);     // 点2的y轴
			resx3=rand()%LCD_XSIZE_TFT;       // 点3的x轴
			resy3=rand()%(LCD_YSIZE_TFT);     // 点3的y轴
			i=rand()%65536;                   // 颜色
			j=rand()%3;
			if(j)	LT768_DrawTriangle(resx1,resy1,resx2,resy2,resx3,resy3,i);      // 无填充色三角形
			else	LT768_DrawTriangle_Fill(resx1,resy1,resx2,resy2,resx3,resy3,i); // 填充色三角形
			h++;
			delay_ms(1);
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		while(h<1500);
	}
}


u8 NUM[20][3] = {{'0','\0'},{'1','\0'},{'2','\0'},{'3','\0'},{'4','\0'},{'5','\0'},{'6','\0'},{'7','\0'},{'8','\0'},{'9','\0'},
	               {'1','0','\0'},{'1','0','\0'},{'1','2','\0'},{'1','3','\0'},{'1','4','\0'},{'1','5','\0'},{'1','6','\0'},{'1','7','\0'},{'1','8','\0'},{'1','9','\0'}};


u8 Draw_Table(void)
{
	unsigned char i1 = 0;
	unsigned char i2 = 1;
	unsigned char i3 = 2;
	unsigned char i4 = 3;
	unsigned char count = 0;

	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标

	//清空背景
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Black);
	
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_4_Addr);
	
	Font_Background_select_Transparency();
	
	Canvas_Image_Start_address(layer5_start_addr);
	Canvas_image_width(LCD_XSIZE_TFT);
	LT768_MakeTable(5,5,60,30,6,3,Cyan,Blue2,Yellow,1,4,0);
		
		
	Canvas_Image_Start_address(layer6_start_addr);
	Canvas_image_width(LCD_XSIZE_TFT);
	LT768_MakeTable(5,5,60,30,10,3,Magenta,Blue,Yellow,1,4,1);
	
	LT768_BTE_Memory_Copy(layer5_start_addr,LCD_XSIZE_TFT,1,1,
		                    layer5_start_addr,LCD_XSIZE_TFT,1,1,
		                    layer2_start_addr,LCD_XSIZE_TFT,20,100,
											  0x0c,60*3+9,30*6+9
											 );
												 
	LT768_BTE_Memory_Copy(layer6_start_addr,LCD_XSIZE_TFT,1,1,
		                    layer6_start_addr,LCD_XSIZE_TFT,1,1,
		                    layer2_start_addr,LCD_XSIZE_TFT,600,50,
											  0x0c,60*3+9,30*10+9
											 );
	
	while(1)
	{
		
		Canvas_Image_Start_address(layer3_start_addr);
		Canvas_image_width(LCD_XSIZE_TFT);
		LT768_MakeTable(5,5,70,40,3,4,Black,Red,Yellow,1,4,1);
		LT768_Print_Outside_Font_String(10,10,Black,Yellow,(u8*)"Temp.");
		LT768_Print_Outside_Font_String(80,10,Black,Yellow,(u8*)"Dist.");
		LT768_Print_Outside_Font_String(150,10,Black,Yellow,(u8*)"Volt");
		LT768_Print_Outside_Font_String(220,10,Black,Yellow,(u8*)"Diff.");
		
		LT768_Print_Outside_Font_String(30,95,Blue2,Yellow,"℃");
		LT768_Print_Outside_Font_String(100,95,Blue2,Yellow,"cm");
		LT768_Print_Outside_Font_String(175,95,Blue2,Yellow,"V");
		LT768_Print_Outside_Font_String(240,95,Blue2,Yellow,"℃");
		LT768_Print_Outside_Font_String(35,55,Blue2,Yellow,&NUM[i1][0]);
		LT768_Print_Outside_Font_String(105,55,Blue2,Yellow,&NUM[i2][0]);
		LT768_Print_Outside_Font_String(175,55,Blue2,Yellow,&NUM[i3][0]);
		LT768_Print_Outside_Font_String(245,55,Blue2,Yellow,&NUM[i4][0]);
		
		Canvas_Image_Start_address(layer4_start_addr);
		Canvas_image_width(LCD_XSIZE_TFT);
		LT768_MakeTable(5,5,70,40,4,3,Red,Blue2,Yellow,1,4,0);
		LT768_Print_Outside_Font_String(10,15,Red,Blue2,(u8*)"Humi.");   //%HR
		LT768_Print_Outside_Font_String(10,55,Red,Blue2,(u8*)"Curr.");
		LT768_Print_Outside_Font_String(10,95,Red,Blue2,(u8*)"Power");
		LT768_Print_Outside_Font_String(10,135,Red,Blue2,(u8*)"Sec.");
		
		LT768_Print_Outside_Font_String(162,15,Black,Blue2,"%RH");
		LT768_Print_Outside_Font_String(168,55,Black,Blue2,"mA");
		LT768_Print_Outside_Font_String(175,95,Black,Blue2,"kW");
		LT768_Print_Outside_Font_String(175,135,Black,Blue2,"S");
		LT768_Print_Outside_Font_String(105,15,Black,Blue2,&NUM[i1][0]);
		LT768_Print_Outside_Font_String(105,55,Black,Blue2,&NUM[i2][0]);
		LT768_Print_Outside_Font_String(105,95,Black,Blue2,&NUM[i3][0]);
		LT768_Print_Outside_Font_String(105,135,Black,Blue2,&NUM[i4][0]);
		
		
		LT768_BTE_Memory_Copy(layer3_start_addr,LCD_XSIZE_TFT,1,1,
		                      layer3_start_addr,LCD_XSIZE_TFT,1,1,
		                      layer2_start_addr,LCD_XSIZE_TFT,220,20,
													0x0c,70*4+9,40*3+9
												 );
		
		LT768_BTE_Memory_Copy(layer4_start_addr,LCD_XSIZE_TFT,1,1,
		                      layer4_start_addr,LCD_XSIZE_TFT,1,1,
		                      layer2_start_addr,LCD_XSIZE_TFT,220,150,
													0x0c,70*3+9,40*4+9
												 );
											
		i1++;
		i2++;
		i3++;
		if(i1 > 19)	i1 = 0;
		if(i2 > 19)	i2 = 0;
		if(i3 > 19)	i3 = 0;
		
		count++;
		if(count == 2)
		{
			count = 0;
			i4++;
			if(i4 > 19)	i4 = 0;
		}
		
		if (Screen_delay_Count(100) == 1)
				return 1; 
	}
}



u8 Draw_Pillar_Demo(void)
{
	u8 i = 0;
	u16 j1 = 0 , z1 = 0;
	u16 j2 = 0 , z2 = 0;
	u16 h1 = 0, h2 = 0;
	
	u16 count = 0;
	
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 1;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);	     //设置工作窗口大小

	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Blue2);
	
	while(1)
	{
		count = 1;
		while(count--)
		{
			for(i = 0 ; i < 11 ; i++)
			{
				j1 = rand() % 65536;                   // 颜色
				z1 = rand() % 65536;                   // 颜色
				j2 = rand() % 65536;                   // 颜色
				z2 = rand() % 65536;                   // 颜色
				h1 = rand() % 400;
				h2 = rand() % 400;
				
				BTE_Solid_Fill(LCD_XSIZE_TFT*LCD_YSIZE_TFT*2,LCD_XSIZE_TFT,30*(i+1)-15,0,Blue2,30,LCD_YSIZE_TFT);
				LT768_DrawCylinder(30*(i+1),450,14,7,h1,j1,z1);
				
				BTE_Solid_Fill(LCD_XSIZE_TFT*LCD_YSIZE_TFT*2,LCD_XSIZE_TFT,760-i*30-12,0,Blue2,31,LCD_YSIZE_TFT);
				LT768_DrawQuadrangular(760-i*30-12,449-h2,    // 1
															 760-i*30-5,439-h2,    // 2
															 774-i*30,439-h2,       // 3
															 760-i*30,449-h2,       // 4
															 760-i*30,449,          // 5
															 774-i*30,439,          // 6
															 j2,z2);
				
				if (Screen_delay_Count(100) == 1)
				return 1; 
			}
		
			for(i = 11 ; i > 0 ; i--)
			{
				j1 = rand() % 65536;                   // 颜色
				z1 = rand() % 65536;                   // 颜色
				j2 = rand() % 65536;                   // 颜色
				z2 = rand() % 65536;                   // 颜色
				h1 = rand() % 400;
				h2 = rand() % 400;
				
				BTE_Solid_Fill(LCD_XSIZE_TFT*LCD_YSIZE_TFT*2,LCD_XSIZE_TFT,30*(i+1)-15,0,Blue2,30,LCD_YSIZE_TFT);
				LT768_DrawCylinder(30*(i+1),450,14,7,h1,j1,z1);
				
				BTE_Solid_Fill(LCD_XSIZE_TFT*LCD_YSIZE_TFT*2,LCD_XSIZE_TFT,760-i*30-12,0,Blue2,31,LCD_YSIZE_TFT);
				LT768_DrawQuadrangular(760-i*30-12,449-h2,    // 1
															 760-i*30-5,439-h2,    // 2
															 774-i*30,439-h2,       // 3
															 760-i*30,449-h2,       // 4
															 760-i*30,449,          // 5
															 774-i*30,439,          // 6
															 j2,z2);
					
				if (Screen_delay_Count(100) == 1)
				return 1; 
			}
		}

		count = 10;
		while(count--)
		{
			for(i = 0 ; i < 11 ; i++)
			{
				j1 = rand() % 65536;                   // 颜色
				z1 = rand() % 65536;                   // 颜色
				j2 = rand() % 65536;                   // 颜色
				z2 = rand() % 65536;                   // 颜色
				h1 = rand() % 400;
				h2 = rand() % 400;
				
				BTE_Solid_Fill(LCD_XSIZE_TFT*LCD_YSIZE_TFT*2,LCD_XSIZE_TFT,30*(i+1)-15,0,Blue2,30,LCD_YSIZE_TFT);
				LT768_DrawCylinder(30*(i+1),450,14,7,h1,j1,z1);
				
				BTE_Solid_Fill(LCD_XSIZE_TFT*LCD_YSIZE_TFT*2,LCD_XSIZE_TFT,760-i*30-12,0,Blue2,31,LCD_YSIZE_TFT);
				LT768_DrawQuadrangular(760-i*30-12,449-h2,    // 1
															 760-i*30-5,439-h2,    // 2
															 774-i*30,439-h2,       // 3
															 760-i*30,449-h2,       // 4
															 760-i*30,449,          // 5
															 774-i*30,439,          // 6
															 j2,z2);
				
				if(Scan_Key_delay(10))	return 1;
			}
		
			for(i = 11 ; i > 0 ; i--)
			{
				j1 = rand() % 65536;                   // 颜色
				z1 = rand() % 65536;                   // 颜色
				j2 = rand() % 65536;                   // 颜色
				z2 = rand() % 65536;                   // 颜色
				h1 = rand() % 400;
				h2 = rand() % 400;
				
				BTE_Solid_Fill(LCD_XSIZE_TFT*LCD_YSIZE_TFT*2,LCD_XSIZE_TFT,30*(i+1)-15,0,Blue2,30,LCD_YSIZE_TFT);
				LT768_DrawCylinder(30*(i+1),450,14,7,h1,j1,z1);
				
				BTE_Solid_Fill(LCD_XSIZE_TFT*LCD_YSIZE_TFT*2,LCD_XSIZE_TFT,760-i*30-12,0,Blue2,31,LCD_YSIZE_TFT);
				LT768_DrawQuadrangular(760-i*30-12,449-h2,    // 1
															 760-i*30-5,439-h2,    // 2
															 774-i*30,439-h2,       // 3
															 760-i*30,449-h2,       // 4
															 760-i*30,449,          // 5
															 774-i*30,439,          // 6
															 j2,z2);
					
				if (Screen_delay_Count(1) == 1)
				return 1; 
			}
		}
	}
}




//演示直接访问串行闪存显示图片
u8 DMA_Demo(void)
{
  unsigned int i;
    
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标

	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);

	//execute DMA to show 1024x600 picture
	while(1)
	{	
		for(i=0;i<4;i++)
		{
			switch(i)
			{
				
				case 0:LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_1_Addr);break;
				case 1:LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_2_Addr);break;
				case 2:LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_3_Addr);break;
				case 3:LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_4_Addr);break;
				default:	break;
			}
			
			if (Screen_delay_Count(100) == 1)
				return 1; 			
		}
  }
}


unsigned char Text_Demo(void)
{
	char c[2] = "0";
  unsigned int i = 0;
	unsigned int x = 0;
	unsigned int y = 0;
	unsigned int z = 0;
	
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标
	

  while(1)
  {
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Blue2);
		
		LT768_Select_Internal_Font_Init(16,1,1,0,0);
		LT768_Print_Internal_Font_String(10,10,Black,Blue2,"Embedded 8x16 ASCII Character");
		
		LT768_Select_Internal_Font_Init(24,1,1,0,0);
		LT768_Print_Internal_Font_String(10,30,Blue,Blue2,"Embedded 12x24 ASCII Character");
		
		LT768_Select_Internal_Font_Init(32,1,1,0,0);
		LT768_Print_Internal_Font_String(10,55,Green,Blue2,"Embedded 16x32 ASCII Character");
		
		LT768_Print_Internal_Font_String(10,95,Red,Blue2,"The Text Cursor");
		
		for(i = 0 ; i < 14 ; i++)
		{
			delay_ms(100);
			LT768_Text_cursor_Init(1,15,1+i,15-i);
		}
		delay_ms(100);
		LT768_Text_cursor_Init(1,15,10,2);
		
		
		c[0] = '0';
		for(i = 0 ; i < 10 ; i++)
		{
			if (Screen_delay_Count(40) == 1)
				return 1; 
			LT768_Print_Internal_Font_String(10+16*i,135,Red,Blue2,&c[0]);
			c[0]++;
		}

		c[0] = 0;
		x = 0;
		y = 175;
		z = 0;
		for(i = 0 ; i < 127 ; i++)
		{
			if (Screen_delay_Count(40) == 1)
				return 1; 
			
			x = z * 16;
			z++;
			if(x>=LCD_XSIZE_TFT)
			{
				y = y + 40;
				x = 0;
				z = 1;
			}
			
			LT768_Print_Internal_Font_String(x,y,Red,Blue2,&c[0]);
			c[0]++;
		}
		
		i = 0;
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"T");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"h");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"e");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2," ");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"G");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"r");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"a");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"p");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"h");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"i");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"c");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2," ");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"C");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"u");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"r");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"s");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"o");
		if (Screen_delay_Count(40) == 1)	return 1; 
		LT768_Print_Internal_Font_String(10+16*i++,285,Red,Blue2,"r");
		if (Screen_delay_Count(40) == 1)	return 1; 
		
		LT768_DMA_24bit_Block(1,0,450,250,300,180,LCD_XSIZE_TFT,Picture_4_Addr);
		
		LT768_Graphic_cursor_Init(1,0xff,0x00,0,0,(unsigned char*)gImage_pen_il);
		LT768_Graphic_cursor_Init(2,0xff,0x00,0,0,(unsigned char*)gImage_arrow_il);
		LT768_Graphic_cursor_Init(3,0xff,0x00,0,0,(unsigned char*)gImage_busy_im);
		LT768_Graphic_cursor_Init(4,0xff,0x00,0,0,(unsigned char*)gImage_no_im);
	
		LT768_Set_Graphic_cursor_Pos(1,100,310);
		if (Screen_delay_Count(100) == 1)	return 1; 
		LT768_Set_Graphic_cursor_Pos(2,100,310);
		if (Screen_delay_Count(100) == 1)	return 1;
		LT768_Set_Graphic_cursor_Pos(3,100,310);
		if (Screen_delay_Count(100) == 1)	return 1;
		LT768_Set_Graphic_cursor_Pos(4,100,310);
		if (Screen_delay_Count(100) == 1)	return 1;
		LT768_Set_Graphic_cursor_Pos(1,100,310);
		
		for(i = 50 ; i < 750 ; i++)
		{
			LT768_Set_Graphic_cursor_Pos(1,i,90);
			if (Screen_delay_Count(1) == 1)	return 1;
		}
		
		for(i = 150 ; i < 750 ; i++)
		{
			LT768_Set_Graphic_cursor_Pos(2,i,i-200);
			if (Screen_delay_Count(1) == 1)	return 1;
		}
		
		for(i = 500 ; i > 100 ; i--)
		{
			LT768_Set_Graphic_cursor_Pos(3,i,500-i);
			if (Screen_delay_Count(1) == 1)	return 1; 
		}
		
		for(i = 750 ; i > 50 ; i--)
		{
			LT768_Set_Graphic_cursor_Pos(4,i,400);
			if (Screen_delay_Count(1) == 1)	return 1;
		}
		
		if (Screen_delay_Count(100) == 1)	return 1; 
		
		LT768_Disable_Text_Cursor();	
		LT768_Disable_Graphic_Cursor();
  }
}




unsigned char Outside_Font(void)
{
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标
	
	while(1)
	{
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		LT768_Select_Outside_Font_Init(1,0,FLASH_ADDR_24,MEMORY_ADDR_24,SIZE_24_NUM,24,1,1,0,0);
		if (Screen_delay_Count(100) == 1)	return 1;
		LT768_Print_Outside_Font_String(345,55,Red,White,(u8*)"24X24楷体");
		if (Screen_delay_Count(100) == 1)	return 1;
		Font_Width_X2();
		Font_Height_X2();
		LT768_Print_Outside_Font_String(160,115,Green,White,(u8*)"24X24楷体长宽各扩1倍");
		if (Screen_delay_Count(100) == 1)	return 1;
		Font_Width_X3();
		Font_Height_X3();
		LT768_Print_Outside_Font_String(50,205,Cyan,White,(u8*)"24X24楷体长宽各扩2倍");
		if (Screen_delay_Count(100) == 1)	return 1;
		Font_Width_X4();
		Font_Height_X4();
		LT768_Print_Outside_Font_String(10,300,Yellow,White,(u8*)"24X24楷体长宽各扩3倍");

		LT768_Select_Outside_Font_Init(1,0,FLASH_ADDR_32,MEMORY_ADDR_32,SIZE_32_NUM,32,1,1,0,0);
		if (Screen_delay_Count(1000) == 1)	return 1;
		
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		LT768_Print_Outside_Font_String(345,55,Red,White,(u8*)"32X32隶书");
		if (Screen_delay_Count(100) == 1)	return 1;
		Font_Width_X2();
		Font_Height_X2();
		LT768_Print_Outside_Font_String(200,115,Green,White,(u8*)"32X32隶书");
		if (Screen_delay_Count(100) == 1)	return 1;
		Font_Width_X3();
		Font_Height_X3();
		LT768_Print_Outside_Font_String(100,205,Blue,White,(u8*)"32X32隶书");
		if (Screen_delay_Count(100) == 1)	return 1;
		Font_Width_X4();
		Font_Height_X4();
		LT768_Print_Outside_Font_String(50,300,Yellow,White,(u8*)"32X32隶书");
		
		if (Screen_delay_Count(1000) == 1)	return 1;
		Font_Width_X1();
		Font_Height_X1();
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		LT768_Print_Outside_Font_String(350,5,Red,White,(u8*)"32X32隶书");
		LT768_Print_Outside_Font_String(64,35,Blue,White,(u8*)"LT768 可以让使用者创建字形或符号，可以创建半角（8*16、12*24、16*32 dots）或是全角（16*16、24*24、32*32 dots）的字形或符号，此功能支持 32768 半角字或 32768 全角字，半角字形编码范围是在 0000h ~ 7FFFh，而全角字形编码范围则是 8000h ~ FFFFh。当使用者输入字符码，则 LT768 将会将其索引至外部 SDRAM 字符空间，并且将字形或符号数据存到显示内存的区间。");
		LT768_Print_Outside_Font_String(64,260,Red,White,(u8*)"LT768的文字有以下几个功能：");
		LT768_Print_Outside_Font_String(0,290,Green,White,(u8*)"1、LT768 支持文字旋转功能，让显示字符可以逆时针旋转 90 度。");
		LT768_Print_Outside_Font_String(0,320,Green,White,(u8*)"2、LT768 提供字体线性放大的功能。");
		LT768_Print_Outside_Font_String(0,350,Green,White,(u8*)"3、LT768 提供字体透明功能。");
		LT768_Print_Outside_Font_String(0,380,Green,White,(u8*)"4、LT768 提供文字自动换行功能，在遇到工作视窗边缘时会自动换行。");
		LT768_Print_Outside_Font_String(0,410,Green,White,(u8*)"5、LT768提供文字对齐功能，让LCD在半形字、全形字交错的情况下可以显示的比较整齐。");

		if (Screen_delay_Count(2000) == 1)	return 1;
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
		LT768_Print_Outside_Font_GB2312_48_72(1,0,FLASH_ADDR_72,MEMORY_ADDR_72,layer2_start_addr,LCD_XSIZE_TFT,72,0,50,50,color256_red,color256_green,1,0,(u8*)"７２＊７２微软雅黑");
		LT768_Print_Outside_Font_GB2312_48_72(1,0,FLASH_ADDR_72,MEMORY_ADDR_72,layer2_start_addr,LCD_XSIZE_TFT,72,1,50,170,color256_purple,color256_green,2,0,(u8*)"７２＊７２微软雅黑");
		LT768_Print_Outside_Font_GB2312_48_72(1,0,FLASH_ADDR_72,MEMORY_ADDR_72,layer2_start_addr,LCD_XSIZE_TFT,72,1,50,290,color256_blue,color256_yellow,3,0,(u8*)"７２＊７２微软雅黑");
		if (Screen_delay_Count(2000) == 1)	return 1;
	}
}




unsigned char PIP_Demo(void)
{
	unsigned char flag = 0;
	unsigned int i = 0;
	unsigned int lay1 = layer3_start_addr;
	unsigned int lay2 = layer4_start_addr;
	unsigned int lay3 = layer5_start_addr;
	unsigned int lay4 = layer6_start_addr;
	unsigned int lay5 = layer7_start_addr;
	unsigned int lay6 = lay5 + 250*250*2;
	
	unsigned int lay7 = lay6 + 300*300*2;
	unsigned int lay8 = lay7 + 250*250*2;
	
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标

	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_2_Addr);
	
	Canvas_Image_Start_address(lay1);
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Red);
	
	Canvas_Image_Start_address(lay2);
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Blue);
	
	Canvas_Image_Start_address(lay3);
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_3_Addr);
	
	Canvas_Image_Start_address(lay4);
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_4_Addr);
	
	Canvas_image_width(250);
	Canvas_Image_Start_address(lay5);

	Canvas_image_width(300);
	Canvas_Image_Start_address(lay6);
	
	Canvas_image_width(250);
	Canvas_Image_Start_address(lay7);
	
	Canvas_image_width(300);
	Canvas_Image_Start_address(lay8);
	
	#define tt 10

	while(1)
	{	
		
		for(i=0;i<448;i=i+4)
		{			
			flag++;
			if(flag == 1)
			{
				
				BTE_Alpha_Blending(lay1,LCD_XSIZE_TFT,0,0,
												 Picture_2_Addr,LCD_XSIZE_TFT,i,175,
												 lay5,250,0,0,
												 250,250,16
												);
				BTE_Alpha_Blending(lay2,LCD_XSIZE_TFT,0,0,
													 Picture_2_Addr,LCD_XSIZE_TFT,500-i,150,
													 lay6,300,0,0,
													 300,300,16
													);

				LT768_PIP_Init(1,1,lay5,0,0,250,i,175,250,250);			
				LT768_PIP_Init(1,2,lay6,0,0,300,500-i,150,300,300);
				delay_ms(tt);
			}
			else if(flag == 2)
			{
				flag = 0;
				BTE_Alpha_Blending(lay1,LCD_XSIZE_TFT,0,0,
												 Picture_2_Addr,LCD_XSIZE_TFT,i,175,
												 lay7,250,0,0,
												 250,250,16
												);
				BTE_Alpha_Blending(lay2,LCD_XSIZE_TFT,0,0,
													 Picture_2_Addr,LCD_XSIZE_TFT,500-i,150,
													 lay8,300,0,0,
													 300,300,16
													);
				
				LT768_PIP_Init(1,1,lay7,0,0,250,i,175,250,250);
				LT768_PIP_Init(1,2,lay8,0,0,300,500-i,150,300,300);
				delay_ms(tt);
			}

			if (Screen_delay_Count(1) == 1)	return 1;
		}

		flag = 0;
		for(i=0;i<448;i=i+4)
		{				
			flag++;
			if(flag == 1)
			{
				BTE_Alpha_Blending(lay1,LCD_XSIZE_TFT,0,0,
													 Picture_2_Addr,LCD_XSIZE_TFT,448-i,175,
													 lay5,250,0,0,
													 250,250,16
													);
						
				BTE_Alpha_Blending(lay2,LCD_XSIZE_TFT,0,0,
													 Picture_2_Addr,LCD_XSIZE_TFT,500-448+i,150,
													 lay6,300,0,0,
													 300,300,16
													);
				
				LT768_PIP_Init(1,1,lay5,0,0,250,448-i,175,250,250);
				LT768_PIP_Init(1,2,lay6,0,0,300,500-448+i,150,300,300);
				delay_ms(tt);
			}
			else if(flag == 2)
			{
				flag = 0;
				BTE_Alpha_Blending(lay1,LCD_XSIZE_TFT,0,0,
													 Picture_2_Addr,LCD_XSIZE_TFT,448-i,175,
													 lay7,250,0,0,
													 250,250,16
													);
						
				BTE_Alpha_Blending(lay2,LCD_XSIZE_TFT,0,0,
													 Picture_2_Addr,LCD_XSIZE_TFT,500-448+i,150,
													 lay8,300,0,0,
													 300,300,16
													);
				
				LT768_PIP_Init(1,1,lay7,0,0,250,448-i,175,250,250);
				LT768_PIP_Init(1,2,lay8,0,0,300,500-448+i,150,300,300);
				delay_ms(tt);
			}
			
			if (Screen_delay_Count(1) == 1)	return 1;
		}
		
		if (Screen_delay_Count(500) == 1)	return 1;

		LT768_BTE_Memory_Copy(lay3,LCD_XSIZE_TFT,0,0,
		                      lay3,LCD_XSIZE_TFT,0,0,
		                      lay5,250,0,0,
		                      0x0c,250,250
		                     );
		
		LT768_BTE_Memory_Copy(lay4,LCD_XSIZE_TFT,0,0,
		                      lay4,LCD_XSIZE_TFT,0,0,
		                      lay6,300,0,0,
		                      0x0c,300,300
		                     );
		
		LT768_PIP_Init(1,1,lay5,0,0,250,0,175,250,250);
	  LT768_PIP_Init(1,2,lay6,0,0,300,500,150,300,300);
		
		for(i=0;i<448;i=i+2)
		{			
			LT768_Set_DisWindowPos(1,1,i,175);
			LT768_Set_DisWindowPos(1,2,490-i,150);
			delay_ms(8);
			
			if (Screen_delay_Count(1) == 1)	return 1;
		}

		for(i=0;i<448;i=i+2)
		{
			LT768_Set_DisWindowPos(1,1,448-i,175);
			LT768_Set_DisWindowPos(1,2,490-448+i,150);
			delay_ms(8);
			
			if (Screen_delay_Count(1) == 1)	return 1;
		}

		if (Screen_delay_Count(500) == 1)	return 1;
	}
}

#define grid_width 401
#define grid_high  480
#define grid_gap   50

unsigned char App_Demo_BTE(void)
{
  unsigned int i,h;

	unsigned int point1y,point2y;
	unsigned int point21y,point22y;
	unsigned int point31y,point32y;
	point2y = 0;  //initial value
	point22y = 0; //initial value
	point32y = 0; //initial value
	
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标
	
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Blue2);

	//creat grid 500*400 to layer2 used geometric draw 
	Canvas_Image_Start_address(layer3_start_addr);  //Layer 3
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Black);

  for(i=0;i<=grid_width;i+=grid_gap)
	{
    	LT768_DrawLine(i,0,i,grid_high-1,color65k_grayscale12);
	}

	for(i=0;i<=grid_high;i+=grid_gap)
	{
		 LT768_DrawLine(0,i,grid_width-1,i,color65k_grayscale12);
	}
	
	Canvas_Image_Start_address(layer4_start_addr);  //Layer 4
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_3_Addr);
	
	Canvas_Image_Start_address(layer5_start_addr);  //Layer 5
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_4_Addr);
	
	Canvas_Image_Start_address(layer6_start_addr);  //Layer 6
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_1_Addr);
	
	LT768_BTE_Memory_Copy(layer3_start_addr,LCD_XSIZE_TFT,0,0,layer3_start_addr,LCD_XSIZE_TFT,0,0,layer2_start_addr,LCD_XSIZE_TFT,112,0,0x0c,grid_width,grid_high);

  Canvas_Image_Start_address(layer2_start_addr);//Layer 2
	
	while(1)
	{
		h=0;
		while(h<5)
		{
			for(i=0;i<400;i+=2)
			{
				LT768_BTE_Memory_Copy(layer3_start_addr,LCD_XSIZE_TFT,i,0,layer3_start_addr,LCD_XSIZE_TFT,0,0,layer2_start_addr,LCD_XSIZE_TFT,112+i,0,0x0c,2,LCD_YSIZE_TFT);

				point1y = point2y;
				point2y = rand()%90;//

				point21y = point22y;
				point22y = rand()%99;//

				point31y = point32y;
				point32y = rand()%67;//

				LT768_DrawLine(i+112,point1y+30,i+1+112,point2y+30,color65k_yellow);
				LT768_DrawLine(i+112,point21y+210,i+1+112,point22y+210,color65k_purple);
				LT768_DrawLine(i+112,point31y+390,i+1+112,point32y+390,color65k_green);

				delay_us(100);

				if (Screen_delay_Count(1) == 1)	return 1;
			}
				
			h++;
		}
		
		
		for(i = 0 ; i < 16 ; i+=2)
		{
			LT768_BTE_Memory_Copy(layer4_start_addr,LCD_XSIZE_TFT,i*50,0,layer4_start_addr,LCD_XSIZE_TFT,0,0,layer2_start_addr,LCD_XSIZE_TFT,i*50,0,0x0c,50,LCD_YSIZE_TFT);
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		for(i = 0 ; i < 16 ; i+=2)
		{
			LT768_BTE_Memory_Copy(layer4_start_addr,LCD_XSIZE_TFT,i*50+50,0,layer4_start_addr,LCD_XSIZE_TFT,0,0,layer2_start_addr,LCD_XSIZE_TFT,i*50+50,0,0x0c,50,LCD_YSIZE_TFT);
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		
		for(i = 1 ; i < 17 ; i++)
		{
			LT768_BTE_Memory_Copy(layer5_start_addr,LCD_XSIZE_TFT,LCD_XSIZE_TFT-i*50,0,layer5_start_addr,LCD_XSIZE_TFT,0,0,layer2_start_addr,LCD_XSIZE_TFT,LCD_XSIZE_TFT-i*50,0,0x0c,50,LCD_YSIZE_TFT);
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		
		for(i = 0 ; i < 16 ; i++)
		{
			if(i%2==0)	LT768_BTE_Memory_Copy(layer4_start_addr,LCD_XSIZE_TFT,i*50,0,layer4_start_addr,LCD_XSIZE_TFT,0,0,layer2_start_addr,LCD_XSIZE_TFT,i*50,0,0x0c,50,LCD_YSIZE_TFT);
			else				LT768_BTE_Memory_Copy(layer6_start_addr,LCD_XSIZE_TFT,i*50,0,layer6_start_addr,LCD_XSIZE_TFT,0,0,layer2_start_addr,LCD_XSIZE_TFT,i*50,0,0x0c,50,LCD_YSIZE_TFT);
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		
		for(i = 0 ; i < 10 ; i++)
		{
			if(i%2==0)	LT768_BTE_Memory_Copy(layer5_start_addr,LCD_XSIZE_TFT,0,i*48,layer5_start_addr,LCD_XSIZE_TFT,0,0,layer2_start_addr,LCD_XSIZE_TFT,0,i*50,0x0c,LCD_XSIZE_TFT,48);
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		
		if (Screen_delay_Count(100) == 1)
				return 1; 
		LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Blue2);
    LT768_BTE_Memory_Copy(layer3_start_addr,LCD_XSIZE_TFT,0,0,layer3_start_addr,LCD_XSIZE_TFT,0,0,layer2_start_addr,LCD_XSIZE_TFT,112,0,0x0c,grid_width,grid_high);
	}
	
}


unsigned char App_Demo_Alpha_Blending(void)
{
  unsigned int i;

	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);
	Main_Image_Width(LCD_XSIZE_TFT);
	Main_Window_Start_XY(0,0);

	Canvas_Image_Start_address(layer2_start_addr);
	Canvas_image_width(LCD_XSIZE_TFT);
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);
	
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Blue2);
	
	LT768_DMA_24bit_Block(1,0,0,LCD_YSIZE_TFT*1,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_3_Addr);
	LT768_DMA_24bit_Block(1,0,0,LCD_YSIZE_TFT*2,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_4_Addr);
	
  while(1)
  {
		for(i=0;i<32;i++)
		{
			BTE_Alpha_Blending(LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*2,LCD_XSIZE_TFT,0,0,
												 LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*3,LCD_XSIZE_TFT,0,0,
												 LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*1,LCD_XSIZE_TFT,0,0,
												 LCD_XSIZE_TFT,LCD_YSIZE_TFT,i);
				
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		if (Screen_delay_Count(100) == 1)
				return 1; 

		for(i=32;i>0;i--)
		{
			BTE_Alpha_Blending(LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*2,LCD_XSIZE_TFT,0,0,
												 LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*3,LCD_XSIZE_TFT,0,0,
												 LCD_XSIZE_TFT*LCD_YSIZE_TFT*2*1,LCD_XSIZE_TFT,0,0,
												 LCD_XSIZE_TFT,LCD_YSIZE_TFT,i);
			if (Screen_delay_Count(100) == 1)
				return 1; 
		}
		if (Screen_delay_Count(100) == 1)
				return 1; 
	}
}


unsigned char App_Demo_slide_frame_buffer(void)
{
	unsigned int i,j;

	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT*2);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT*2);				         //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标
	
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Blue2);
	
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_1_Addr);
	LT768_DMA_24bit_Block(1,0,LCD_XSIZE_TFT,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_2_Addr);
	LT768_DMA_24bit_Block(1,0,0,LCD_YSIZE_TFT,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_3_Addr);
	LT768_DMA_24bit_Block(1,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_4_Addr);

	while(1)
	{
		Main_Window_Start_XY(0,0);
		if (Screen_delay_Count(100) == 1)	return 1;
		Main_Window_Start_XY(LCD_XSIZE_TFT,0);
		if (Screen_delay_Count(100) == 1)	return 1;
		Main_Window_Start_XY(0,LCD_YSIZE_TFT);
		if (Screen_delay_Count(100) == 1)	return 1;
		Main_Window_Start_XY(LCD_XSIZE_TFT,LCD_YSIZE_TFT);
		if (Screen_delay_Count(100) == 1)	return 1;
		Main_Window_Start_XY(0,0);
		if (Screen_delay_Count(100) == 1)	return 1;

		for(i=0;i<LCD_XSIZE_TFT+1;i++)
		{
			Main_Window_Start_XY(i,0);
			delay_ms(1);
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		
		if(Scan_Key_delay(200))	return 1;

		for(j=0;j<LCD_YSIZE_TFT+1;j++)
		{
			Main_Window_Start_XY(LCD_XSIZE_TFT,j);
			delay_ms(1);
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		
		if(Scan_Key_delay(200))	return 1;

		for(i=LCD_XSIZE_TFT;i>0;i--)
		{
			Main_Window_Start_XY(i,LCD_YSIZE_TFT);
			delay_ms(1);
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		Main_Window_Start_XY(0,LCD_YSIZE_TFT);
		
		if (Screen_delay_Count(1) == 1)
				return 1; 

		for(j=LCD_YSIZE_TFT;j>0;j--)
		{
			Main_Window_Start_XY(0,j);
			delay_ms(1);
			if (Screen_delay_Count(1) == 1)
				return 1; 
		}
		Main_Window_Start_XY(0,0);
		
		if (Screen_delay_Count(1) == 1)
				return 1; 
	}
}





void Show_Temperature(int val)
{
	int len,aLen;
	unsigned int rV,bV,cV;

	len = 447 - 293;
	aLen = (len*val)/100;

	LT768_DrawSquare_Fill(719,293,738,447 - aLen,0xDEDB);

	rV = val/3;
	if(rV>31) rV = 31;

	bV = 31- rV;

	cV = ((rV<<11)&0xF800)|((bV<<5)&0x07E0);

	LT768_DrawSquare_Fill(719,447 - aLen,738,447,cV);
}

void Show_Progress1(int val)
{
	int i;

	for(i=0;i<val;i++)
	{
		LT768_DrawSquare_Fill(34+i*23 ,71,50+i*23,103,0xFCCD);
	}

	for(i=val;i<10;i++)
	{
		LT768_DrawSquare_Fill(34+i*23 ,71,50+i*23,103,0x5ACB);
	}
}

void Show_Progress2(int val)
{
	int i;

	for(i=0;i<val;i++)
	{
		LT768_DrawSquare_Fill(34+i*23,169,50+i*23,201,0xFFE0);
	}

	for(i=val;i<10;i++)
	{
		LT768_DrawSquare_Fill(34+i*23,169,50+i*23,201,0x5ACB);
	}
}

void Button_ON_OFF(int val)
{
	if(val)
	{
		// 开关亮
		LT768_DrawCircle_Fill(90,360,40,0xF800);  // 硬件画圆
		
		LT768_BTE_Memory_Copy(layer4_start_addr,70,0,0,layer4_start_addr,70,0,0,layer2_start_addr,LCD_XSIZE_TFT,54,415,0x0c,70,48);
	}
	else
	{
		// 开关暗
		LT768_DrawCircle_Fill(90,360,40,0x3800);  // 硬件画圆
		
		
		LT768_BTE_Memory_Copy(layer4_start_addr,70,0,48,layer4_start_addr,70,0,0,layer2_start_addr,LCD_XSIZE_TFT,54,415,0x0c,70,48);
	}
}

void Show_Text(int index)
{
	CGROM_Select_Internal_CGROM();
	Foreground_color_65k(0x001F);
	Background_color_65k(0xF79E);
	Font_Select_8x16_16x16();
	Goto_Text_XY(538+3,40+index*20);
	switch(index)
	{
		case 1: Show_String("AM07:50 Level=10"); break;
		case 2: Show_String("AM07:50 Level=20"); break;
		case 3: Show_String("AM07:50 Level=30"); break;
		case 4: Show_String("AM07:50 Level=40"); break;
		case 5: Show_String("AM07:50 Level=50"); break;
		case 6: Show_String("AM07:50 Level=60"); break;
		case 7: Show_String("AM07:50 Level=70"); break;
		case 8: Show_String("AM07:50 Level=80"); break;
		case 9: Show_String("AM07:50 Level=90"); break;
		default: break;
	}
}



#define FanW 182 //228
#define FanH 182 //228
#define DLTIME 60

#include <math.h>

void TEST_DoubleTriangle(u16 x,u16 y,u16 h,u16 h1,u16 l,u16 a,u16 color1,u16 color2)
{	
	float cos_x = 0;
	float sin_y = 0;
	
	u16 x1,y1,x2,y2,x3,y3,x4,y4;
	
	if(a<=90)     // 1
	{
		cos_x = cos(a*(3.1415926/180));
		sin_y = sin(a*(3.1415926/180));
		x1 = x - h*cos_x;
		y1 = y - h*sin_y;
		
		x2 = x - l*sin_y;
		y2 = y + l*cos_x;
		
		x3 = x + l*sin_y;
		y3 = y - l*cos_x;
		
		x4 = x + h1*cos_x;
		y4 = y + h1*sin_y;
	}
	
	else if((a>90)&&(a<180))  // 2
	{
		a = 180 - a;
		cos_x = cos(a*(3.1415926/180));
		sin_y = sin(a*(3.1415926/180));
		
		x1 = x + h*cos_x;
		y1 = y - h*sin_y;

		x2 = x - l*sin_y;
		y2 = y - l*cos_x;
		
		x3 = x + l*sin_y;
		y3 = y + l*cos_x;
		
		x4 = x - h1*cos_x;
		y4 = y + h1*sin_y;
	}
	 
	else if((a>=180)&&(a<270))  // 3
	{
		a = a - 180;
		cos_x = cos(a*(3.1415926/180));
		sin_y = sin(a*(3.1415926/180));
		
		x1 = x + h*cos_x;
		y1 = y + h*sin_y;

		x2 = x + l*sin_y;
		y2 = y - l*cos_x;
		
		x3 = x - l*sin_y;
		y3 = y + l*cos_x;
		
		x4 = x - h1*cos_x;
		y4 = y - h1*sin_y;
	}
	
	else if((a>=270)&&(a<360))  // 4
	{
		a = 360 - a;
		cos_x = cos(a*(3.1415926/180));
		sin_y = sin(a*(3.1415926/180));
		
		x1 = x - h*cos_x;
		y1 = y + h*sin_y;

		x2 = x + l*sin_y;
		y2 = y + l*cos_x;
		
		x3 = x - l*sin_y;
		y3 = y - l*cos_x;
		
		x4 = x + h1*cos_x;
		y4 = y - h1*sin_y;
	}
	
	LT768_DrawTriangle_Fill(x1,y1,x2,y2,x4,y4,color1);
	LT768_DrawTriangle_Fill(x1,y1,x3,y3,x4,y4,color2);
	
	LT768_DrawCircle_Fill(x,y,3,Red);
}



void Pointer_Show(u16 a)
{
	u16 a1 = 0;
	u16 a2 = 0;
	
	if(a < 13)
	{
		a1 = 320 + 3 * a;
	}
	else
	{
		a1 = (a - 13) * 3;
	}
	
	a2 = (a * 70) / 90 + 12;
	
	Canvas_Image_Start_address(layer6_start_addr);//
	Canvas_image_width(442);
	
	LT768_BTE_Memory_Copy(layer5_start_addr,LCD_XSIZE_TFT,195,280,
												layer5_start_addr,LCD_XSIZE_TFT,195,280,
												layer6_start_addr,442,0,0,
												0x0c,442,200
											 );
	TEST_DoubleTriangle(100,75,70,15,7,a1,0x001f,0x031f); 
			
	TEST_DoubleTriangle(330,100,65,15,7,2*a2,0x001f,0x031f); 
			
	LT768_BTE_Memory_Copy(layer6_start_addr,442,0,0,
												layer6_start_addr,442,0,0,
												layer2_start_addr,LCD_XSIZE_TFT,195,280,
												0x0c,442,200
											 );
	
	Canvas_Image_Start_address(layer2_start_addr);//
	Canvas_image_width(LCD_XSIZE_TFT);
}


void Controller_Demo(void)
{
	int  fanIndex = 0,proIndex1 = 0, proIndex2 = 0,tempIndex = 0;
	int  totalIndex = 0 , on_off_index = 1;
	int  textIndex = 0;

	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_5_Addr);
	

	//从Flash读取风扇的数据
	Canvas_Image_Start_address(layer3_start_addr);//
	Canvas_image_width(FanW);
	LT768_DMA_24bit_Block(1,0,0,0,FanW,FanH*6,FanW,5*LCD_XSIZE_TFT*LCD_YSIZE_TFT*2);   //风扇图片有6个，用来做动画

	//从Flash读取ON/OFF的数据
	Canvas_Image_Start_address(layer4_start_addr);//
	Canvas_image_width(70);
	LT768_DMA_24bit_Block(1,0,0,0,70,48*2,70,5*LCD_XSIZE_TFT*LCD_YSIZE_TFT*2+FanW*FanH*2*6);   //ON图片+OFF图片，共2张
	
	
	
  Canvas_Image_Start_address(layer5_start_addr);//
	Canvas_image_width(LCD_XSIZE_TFT);
	
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_5_Addr);
	//LT768_DMA_24bit_Block(1,0,0,0,1024,600,1024,Picture_5_Addr);
	
	
	

	Canvas_Image_Start_address(layer2_start_addr);				//Layer 1
	Canvas_image_width(LCD_XSIZE_TFT);//
	Active_Window_XY(0,0);

	//Progress
	Show_Progress1(proIndex1);   //初始化进度条1
	Show_Progress2(proIndex2);   //初始化进度条2

	//Temperature
	Show_Temperature(tempIndex); //初始化温度条

	//POWER Button
	LT768_DrawCircle(90,360,50,0x8DBC); // 硬件画圆

	Button_ON_OFF(on_off_index);

	while(1)     //等待按键按下退出
	{
		LT768_BTE_Memory_Copy(layer3_start_addr,FanW,0,FanH*fanIndex,layer3_start_addr,FanW,0,FanH*fanIndex,layer2_start_addr,LCD_XSIZE_TFT,319,40,0X0C,FanW,FanH);

		delay_ms(DLTIME);
		if(on_off_index==0) delay_ms(DLTIME);
		fanIndex++;
		if(fanIndex>=6) fanIndex = 0;
		totalIndex++;

		textIndex = totalIndex/10;	//文字显示
		if(textIndex==0)			      //清空文字显示区
		{
			LT768_DrawSquare_Fill(538,56,766,214,0xF79E);  // 硬件画矩形
		}
		else Show_Text(textIndex);//增加一行文字

		Show_Progress1(totalIndex/10);	//进度条1

		proIndex2++;
		if(proIndex2>18) proIndex2 =0 ;

		Show_Progress2(proIndex2 /2);//进度条2

		//Temperature
		Show_Temperature(totalIndex);//温度显示
		
		Pointer_Show(totalIndex);

		if(totalIndex>=90)
		{
			 totalIndex = 0;
			 if(on_off_index==1) on_off_index = 0;
			 else on_off_index = 1;
			 Button_ON_OFF(on_off_index);//ON-OFF开关，指针，圆点
		}
		
		if (Screen_delay_Count(1) == 1)	break;
	}
}



unsigned char Cartoon_Show(void)
{
	u8 i = 0;
	u8 temp = 0;
	
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 1;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);	     //设置工作窗口大小
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Blue2);
	
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_4_Addr);
	
	Canvas_image_width(224);
	Canvas_Image_Start_address(layer3_start_addr);
	LT768_DMA_24bit_Block(1,0,0,0,223,134*30,223,Cartoon_Addr);
	
	while(1)
	{
		for(i = 0 ; i < 30 ; i++)
		{
			LT768_BTE_Memory_Copy(layer3_start_addr,224,0,134*i,
							layer3_start_addr,224,0,134*i,
							layer2_start_addr,LCD_XSIZE_TFT,80,50,0X0C,223,134);
			
			LT768_BTE_Memory_Copy(layer3_start_addr,224,0,134*i,
							layer3_start_addr,224,0,134*i,
							layer2_start_addr,LCD_XSIZE_TFT,80,300,0X0C,223,134);
			
			temp = i + 10;
			if(temp > 29)	temp = temp - 29;
			
			LT768_BTE_Memory_Copy(layer3_start_addr,224,0,134*temp,
							layer3_start_addr,224,0,134*temp,
							layer2_start_addr,LCD_XSIZE_TFT,480,50,0X0C,223,134);
			
			LT768_BTE_Memory_Copy(layer3_start_addr,224,0,134*temp,
							layer3_start_addr,224,0,134*temp,
							layer2_start_addr,LCD_XSIZE_TFT,480,300,0X0C,223,134);
				
			if (Screen_delay_Count(100) == 1)	return 1;
		}
	}
}

#include "stdio.h"

s8 PwmControl = 100;

u8 Backlight_Control(void)
{
	u8 i = 0;
	u8 key = 0;
	u8 flag = 0;
	u8 colse = 0;
	char temp[4] = {0};
	unsigned char state = 0,state_1 = 0;
	
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标
	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 1;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);	     //设置工作窗口大小
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Blue2);
	
	LT768_DrawSquare_Width(120, 70, 305, 120, Green, Grey_2, 3);   //2023_11_20 Draw a rectangle to form a simple button
	LT768_DrawSquare_Width(120, 270, 305, 320, Green, Grey_2, 3);  //2023_11_20 Draw a rectangle to form a simple button

	LT768_Select_Outside_Font_Init(1,0,FLASH_ADDR_32,MEMORY_ADDR_32,SIZE_32_NUM,32,1,1,0,0);
	LT768_Print_Outside_Font_String(150,80,Red,Grey_2,(unsigned char*)"Brighten");
	LT768_Print_Outside_Font_String(150,280,Red,Grey_2,(unsigned char*)"Dimming");
	LT768_Print_Outside_Font_String(125,180,Red,Blue2,(unsigned char*)"Brightness：");
	
	Font_Width_X2();
	Font_Height_X2();
	
	LT768_DrawSquare_Fill(320,160,350,220,Blue2);
	sprintf(temp,"%03d",PwmControl);
	LT768_Print_Internal_Font_String(320,165,Red,Blue2,temp);
	
	while(1)
	{
		delay_ms(50);
		//key = Scan_FunctionKey();
		gt911_Scan();
		if(gTpInfo.sta == 1 && state == 0)
		{
			state = 1;
			
			if ((gTpInfo.x > 120) && (gTpInfo.x < 305) && (gTpInfo.y > 60) && (gTpInfo.y < 130))
			{
				PwmControl += 5;   //增加背光
				flag = 1;
			}
			else if ((gTpInfo.x > 120) && (gTpInfo.x < 305) && (gTpInfo.y > 260) && (gTpInfo.y < 330))
			{
				PwmControl -= 5;   //減少背光
				flag = 1;
			}
			else 
			{
				state_1 = 1;
			}
		}
		
		if(flag == 1)
		{
			flag = 0;
			if(PwmControl < 0)		PwmControl = 0 , colse = 1;
			if(PwmControl > 100)	PwmControl = 100;
			
			if(colse == 1)
			{
				colse = 0;
				LT768_PWM1_Init(0,0,200,100,PwmControl);
			}
			else
			{
				LT768_PWM1_Init(1,0,200,100,PwmControl);
				for(i = 0 ; i < 4 ; i++)	temp[i] = 0;
				LT768_DrawSquare_Fill(320,160,350,220,Blue2);
				sprintf(temp,"%03d",PwmControl);
				LT768_Print_Internal_Font_String(320,165,Red,Blue2,temp);
			}
		}
		
		if(gTpInfo.sta == 0 && state == 1)
		{
			state = 0;
		}
		if(gTpInfo.sta == 0 && state_1 == 1)
		{
			return 1;
		}		
		
	}
}

//--------------------------------------------------------------------仪表盘--------------------------------------------------------------------


typedef struct
{
	u16 x;
	u16 y;
	u32 starAddr;
	u32 len;
}PICTURE_Info;

#define	LAY_DISPLAY	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*2)
#define	LAY_DISPLAY1	(LCD_XSIZE_TFT*LCD_YSIZE_TFT*5)
#define BasicsAddr 0x00ACEF30 //0x00B08140//0x00D3A940
#define SIZE 17

PICTURE_Info PictureInfo[SIZE] = 
{
//	{68, 60, 0x00000000+BasicsAddr, 0x00001FE0},		//10a.png
//	{68, 76, 0x00001FE0+BasicsAddr, 0x00002860},		//11a.png
//	{75, 65, 0x00004840+BasicsAddr, 0x00002616},		//12a.png
//	{68, 66, 0x00006E56+BasicsAddr, 0x00002310},		//13a.png
//	{68, 84, 0x00009166+BasicsAddr, 0x00002CA0},		//14a.png
//	{85, 52, 0x0000BE06+BasicsAddr, 0x00002288},		//15.png
//	{85, 47, 0x0000E08E + BasicsAddr, 0x00001F36},		//16.png
//	{24, 24, 0x0000FFC4+BasicsAddr, 0x00000480},		//17.png
//	{68, 57, 0x00010444+BasicsAddr, 0x00001E48},		//1a.png
//	{75, 63, 0x0001228C+BasicsAddr, 0x000024EA},		//2a.png
//	{75, 63, 0x00014776+BasicsAddr, 0x000024EA},		//3a.png
//	{68, 60, 0x00016C60+BasicsAddr, 0x00001FE0},		//4a.png
//	{68, 60, 0x00018C40+BasicsAddr, 0x00001FE0},		//5a.png
//	{62, 66, 0x0001AC20+BasicsAddr, 0x00001FF8},		//6a.png
//	{85, 49, 0x0001CC18+BasicsAddr, 0x0000208A},		//7a.png
//	{80, 69, 0x0001ECA2+BasicsAddr, 0x00002B20},		//8a.png
//	{75, 65, 0x000217C2+BasicsAddr, 0x00002616},		//9a.png
	
	{54, 48, 0x00000000+BasicsAddr, 0x00001440},		//10a.png
	{54, 61, 0x00001440+BasicsAddr, 0x000019BC},		//11a.png
	{60, 52, 0x00002DFC+BasicsAddr, 0x00001860},		//12a.png
	{54, 53, 0x0000465C+BasicsAddr, 0x0000165C},		//13a.png
	{54, 67, 0x00005CB8+BasicsAddr, 0x00001C44},		//14a.png
	{68, 42, 0x000078FC+BasicsAddr, 0x00001650},		//15.png
	{68, 38, 0x00008F4C + BasicsAddr, 0x00001430},		//16.png
	{20, 20, 0x0000A37C+BasicsAddr, 0x00000320},		//17.png
	{54, 46, 0x0000A69C+BasicsAddr, 0x00001368},		//1a.png
	{60, 50, 0x0000BA04+BasicsAddr, 0x00001770},		//2a.png
	{60, 50, 0x0000D174+BasicsAddr, 0x00001770},		//3a.png
	{54, 48, 0x0000E8E4+BasicsAddr, 0x00001440},		//4a.png
	{54, 48, 0x0000FD24+BasicsAddr, 0x00001440},		//5a.png
	{50, 53, 0x00011164+BasicsAddr, 0x000014B4},		//6a.png
	{68, 39, 0x00012618+BasicsAddr, 0x000014B8},		//7a.png
	{64, 55, 0x00013AD0+BasicsAddr, 0x00001B80},		//8a.png
	{60, 52, 0x00015650+BasicsAddr, 0x00001860},		//9a.png
};

#define POINTER_LAY_1	(LAY_DISPLAY+LCD_XSIZE_TFT*LCD_YSIZE_TFT*2)
#define POINTER_LAY_2	(POINTER_LAY_1+340*340*2)
#define POINTER_LAY_3	(POINTER_LAY_2+160*160*2)
#define POINTER_LAY_4	(POINTER_LAY_3+100*100*2)
#define POINTER_LAY_5	(POINTER_LAY_4+100*100*2)
#define POINTER_LAY_6	(POINTER_LAY_5+125*125*2)

s16 a1 = 315;
s16 a2 = 270;
s16 a3 = 0;
s16 a4= 180;
	
u8 state1 = 0;
u8 state2 = 0;
	
u8 flag1 = 0;
u8 flag2 = 0;
u8 flag3 = 0;
u8 flag4 = 1;


void Flash_To_Sdram(void)
{
	u8 i = 0;
	for(i = 0 ; i < SIZE ; i++)
	{
		Canvas_Image_Start_address(PictureInfo[i].starAddr);
		Canvas_image_width(PictureInfo[i].x);
		LT768_DMA_24bit_Block(1,0,0,0,PictureInfo[i].x,PictureInfo[i].y,PictureInfo[i].x,PictureInfo[i].starAddr);
	}
}

void Copy_Picture_To_Display(u8 picture,u16 x,u16 y)
{
	if(picture < SIZE)
	{
		LT768_BTE_Memory_Copy(PictureInfo[picture].starAddr,PictureInfo[picture].x,0,0,
													PictureInfo[picture].starAddr,PictureInfo[picture].x,0,0,
													LAY_DISPLAY,LCD_XSIZE_TFT,x,y,
													0x0c,PictureInfo[picture].x,PictureInfo[picture].y
												 );
	}
	else
	{
		printf("no picture\r\n");
	}
}

void Copy_AllPicture_To_Display(void)
{
	Copy_Picture_To_Display(5,5,5);
	Copy_Picture_To_Display(6,92,5);
	Copy_Picture_To_Display(1,180,5);
	Copy_Picture_To_Display(4,554,5);
	
	Copy_Picture_To_Display(11,5,420);
	Copy_Picture_To_Display(12,75,420);
	Copy_Picture_To_Display(0,145,420);
	Copy_Picture_To_Display(2,220,415);
	
	Copy_Picture_To_Display(9,295,417);
	Copy_Picture_To_Display(16,370,415);
	Copy_Picture_To_Display(10,445,417);
	
	Copy_Picture_To_Display(14,579,431);
	Copy_Picture_To_Display(3,664,414);
	Copy_Picture_To_Display(8,732,423);
	
	Copy_Picture_To_Display(13,674,126);
	Copy_Picture_To_Display(15,665,310);
}

char num_sleep[5] = {0};
float sleep = 2;


void Pointer1_Turn(u16 a)
{
	u8 x = 0;

	Canvas_Image_Start_address(POINTER_LAY_1);
	Canvas_image_width(340);
	
	LT768_BTE_Memory_Copy(LAY_DISPLAY1,LCD_XSIZE_TFT,228,49,
												LAY_DISPLAY1,LCD_XSIZE_TFT,228,49,
												POINTER_LAY_1,340,0,0,
												0x0c,340,340
											 );
	
	if( state1 == 0 )	sleep += 1.3;
	else						sleep -= 1.3;
	//sprintf(num_sleep,"%d",(u16)sleep);

	if(sleep < 10)					x = 165;
	else if(sleep < 100)		x = 140;
	else if(sleep < 1000)		x = 115;
	LT768_Print_Internal_Font_String(x,225,Red,Black,num_sleep);
	
	TEST_DoubleTriangle(170,170,170,20,15,a,Blue,Blue2);
	
	LT768_BTE_Memory_Copy(POINTER_LAY_1,340,0,0,
												POINTER_LAY_1,340,0,0,
												LAY_DISPLAY,LCD_XSIZE_TFT,228,49,
												0x0c,340,340
											 );
}

void Pointer2_Turn(u16 a)
{
	Canvas_Image_Start_address(POINTER_LAY_3);
	Canvas_image_width(160);
	
	LT768_BTE_Memory_Copy(LAY_DISPLAY1,LCD_XSIZE_TFT,76,127,
												LAY_DISPLAY1,LCD_XSIZE_TFT,76,127,
												POINTER_LAY_3,160,0,0,
												0x0c,160,160
											 );
	
	TEST_DoubleTriangle(80,80,80,15,10,a,Blue,Blue2);
	
	LT768_BTE_Memory_Copy(POINTER_LAY_3,160,0,0,
												POINTER_LAY_3,160,0,0,
												LAY_DISPLAY,LCD_XSIZE_TFT,76,127,
												0x0c,160,160
											 );
}

void Pointer3_Turn(u16 a)
{
	Canvas_Image_Start_address(POINTER_LAY_3);
	Canvas_image_width(100);
	
	LT768_BTE_Memory_Copy(LAY_DISPLAY1,LCD_XSIZE_TFT,652,75,
												LAY_DISPLAY1,LCD_XSIZE_TFT,652,75,
												POINTER_LAY_3,100,0,0,
												0x0c,100,65
											 );
	
	TEST_DoubleTriangle(50,50,50,8,5,a,Blue,Blue2);
	
	LT768_BTE_Memory_Copy(POINTER_LAY_3,100,0,0,
												POINTER_LAY_3,100,0,0,
												LAY_DISPLAY,LCD_XSIZE_TFT,652,75,
												0x0c,100,65
											 );
}

void Pointer4_Turn(u16 a)
{
	Canvas_Image_Start_address(POINTER_LAY_4);
	Canvas_image_width(100);
	
	LT768_BTE_Memory_Copy(LAY_DISPLAY1,LCD_XSIZE_TFT,652,244,
												LAY_DISPLAY1,LCD_XSIZE_TFT,652,244,
												POINTER_LAY_4,100,0,0,
												0x0c,100,65
											 );
	
	TEST_DoubleTriangle(50,50,50,8,5,a,Blue,Blue2);
	
	LT768_BTE_Memory_Copy(POINTER_LAY_4,100,0,0,
												POINTER_LAY_4,100,0,0,
												LAY_DISPLAY,LCD_XSIZE_TFT,652,244,
												0x0c,100,65
											 );
}

void Show_Gears(u8 gears)
{
	u16 x,y;
	if(gears == 0)			x = 17,	y = 360;
	else if(gears == 1)	x = 43,	y = 360;
	else if(gears == 2)	x = 69,	y = 360;
	else if(gears == 3)	x = 95,	y = 360;
	else if(gears == 4)	x = 121,	y = 360;
	
	Canvas_Image_Start_address(LAY_DISPLAY);
	Canvas_image_width(LCD_XSIZE_TFT);
	LT768_DrawSquare_Fill(10,360,170,385,Black);
	
	LT768_BTE_Memory_Copy(PictureInfo[7].starAddr,PictureInfo[7].x,0,0,
												PictureInfo[7].starAddr,PictureInfo[7].x,0,0,
												LAY_DISPLAY,LCD_XSIZE_TFT,x,y,
												0x0c,20,20
											 );
}

char num_total[6] = {0};

void Show_Total(u32 total)
{
	u8 x = 0;
	
	if(total >= 100000)	total = 0;
	
	if(total < 10)					x = 100;
	else if(total < 100)		x = 75;
	else if(total < 1000)		x = 51;
	else if(total < 10000) 	x = 27;
	else if(total < 100000) x = 3;
	
//	sprintf(num_total,"%d",total);
	Canvas_Image_Start_address(POINTER_LAY_5);
	Canvas_image_width(125);
	LT768_DrawSquare_Fill(0,0,125,48,Black);
	LT768_Print_Internal_Font_String(x,0,Red,Black,num_total);
	
	LT768_BTE_Memory_Copy(POINTER_LAY_5,125,0,0,
												POINTER_LAY_5,125,0,0,
												LAY_DISPLAY,LCD_XSIZE_TFT,309,365,
												0x0c,125,48
											 );
}

char num_temperature[5] = {0};
u16  temperature = 2;

void Show_temperature(u16 temperature)
{
	u16 x = 0;
	
	if(temperature >= 100)	temperature = 0;
	
	if(temperature < 10)				x = 27;
	else if(temperature < 100)	x = 2;
	
//	sprintf(num_temperature,"%d",temperature);
	Canvas_Image_Start_address(POINTER_LAY_6);
	Canvas_image_width(55);
	LT768_DrawSquare_Fill(0,0,55,48,Black);
	LT768_Print_Internal_Font_String(x,0,Red,Black,num_temperature);
	
	LT768_BTE_Memory_Copy(POINTER_LAY_6,55,0,0,
												POINTER_LAY_6,55,0,0,
												LAY_DISPLAY,LCD_XSIZE_TFT,551,362,
												0x0c,55,48
											 );
}

void Show_Pointer1_Turn(void)
{
	Pointer1_Turn(a1);
	
	if(state1 == 0)
	{
		if(flag1 == 0)
		{
			a1 += 2;
			if(a1 >= 358)
			{
				a1 = 0;
				flag1 = 1;
			}
		}
		else
		{
			a1 += 2;
			if(a1 >= 225)
			{
				a1 = 225;
				flag1 = 0;
				state1 = 1;
			}
		}
	}
	else
	{
		if(flag1 == 0)
		{
			a1 -= 2;
			if(a1 <= 0)
			{
				a1 = 359;
				flag1 = 1;
			}
		}
		else
		{
			a1 -= 2;
			if(a1 <= 315)
			{
				a1 = 315;
				flag1 = 0;
				state1 = 0;
			}
		}	
	}
}

void Show_Pointer2_Turn(void)
{
	Pointer2_Turn(a2);
	if(state2 == 0)
	{
		if(flag2 == 0)
		{
			a2 += 2;
			if(a2 >= 360)	a2 = 0,	flag2 = 1;	
		}
		else
		{
			a2 += 2;
			if(a2 >= 90)	a2 = 90,	flag2 = 0,	state2 = 1;	
		}
	}
	else
	{
		if(flag2 == 0)
		{
			a2 -= 2;
			if(a2 <= 0)	a2 = 359,	flag2 = 1;	
		}
		else
		{
			a2 -= 2;
			if(a2 <= 270)	a2 = 270,	flag2 = 0,	state2 = 0;	
		}
	}
}


void Show_Pointer3_Turn(void)
{
	Pointer3_Turn(a3);
	if(flag3 == 0)
	{
		a3 += 2;
		if(a3 >= 180)	a3 = 180,	flag3 = 1;
	}
	else
	{
		a3 -= 2;
		if(a3 <= 2)	a3 = 0,	flag3 = 0;
	}
}


void Show_Pointer4_Turn(void)
{
	Pointer4_Turn(a4);
	if(flag4 == 0)
	{
		a4 += 2;
		if(a4 >= 180)	a4 = 180,	flag4 = 1;
	}
	else
	{
		a4 -= 2;
		if(a4 <= 2)	a4 = 0,	flag4 = 0;
	}
}

void Clear_Icon(u8 icon)
{
	u8 flag = 0;
	u16 x,y;
	
	Canvas_Image_Start_address(LAY_DISPLAY);
	Canvas_image_width(LCD_XSIZE_TFT);
	
	switch(icon)
	{
		case 0:		x = 145;	y = 420;	break;
		case 1:		x = 180;	y = 2;		break;
		case 2:		x = 220;	y = 415;	break;
		case 3:		x = 664;	y = 414;	break;
		case 4:		x = 554;	y = 5;		break;
		case 5:		x = 5;		y = 5;		break;
		case 6:		x = 92;		y = 5;		break;
		case 8:		x = 732;	y = 423;	break;
		case 9:		x = 295;	y = 417;	break;
		case 10:	x = 445;	y = 417;	break;
		case 11:	x = 5;		y = 420;	break;
		case 12:	x = 75;		y = 420;	break;
		case 13:	x = 674;	y = 126;	break;
		case 14:	x = 579;	y = 431;	break;
		case 15:	x = 665;	y = 310;	break;
		case 16:	x = 370;	y = 415;	break;
		default:	flag = 1;						break;
	}
	
	if(flag != 1)
	{
		LT768_DrawSquare_Fill(x,y,x+PictureInfo[icon].x,y+PictureInfo[icon].y,Black);
	}
}


void Show_Icon(u8 icon)
{
	switch(icon)
	{
		case 0:		Copy_Picture_To_Display(0,145,420);		break;
		case 1:		Copy_Picture_To_Display(1,180,2);			break;
		case 2:		Copy_Picture_To_Display(2,220,415);		break;
		case 3:		Copy_Picture_To_Display(3,664,414);		break;
		case 4:		Copy_Picture_To_Display(4,554,5);			break;
		case 5:		Copy_Picture_To_Display(5,5,5);			break;
		case 6:		Copy_Picture_To_Display(6,92,5);			break;
		case 8:		Copy_Picture_To_Display(8,732,423);		break;
		case 9:		Copy_Picture_To_Display(9,295,417);		break;
		case 10:	Copy_Picture_To_Display(10,445,417);	break;
		case 11:	Copy_Picture_To_Display(11,5,420);		break;
		case 12:	Copy_Picture_To_Display(12,75,420);		break;
		case 13:	Copy_Picture_To_Display(13,674,126);	break;
		case 14:	Copy_Picture_To_Display(14,579,431);	break;
		case 15:	Copy_Picture_To_Display(15,665,310);	break;
		case 16:	Copy_Picture_To_Display(16,370,415);	break;
		default:break;
	}
}

u8 Show_Panel(void)
{
	s8 icon = 0;
	u8 flag = 0;
	u8 count = 0;
	
	u8 count_Total = 0;
	u32 Total = 0;
	
	u8 count_temperature = 0;
	u8 temperature = 0;
	
	u8 count_gears = 0;
	u8 gears = 0;
	
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(LAY_DISPLAY);			   
	Main_Image_Width(LCD_XSIZE_TFT);
	Main_Window_Start_XY(0,0);				                   
	Canvas_Image_Start_address(LAY_DISPLAY);	          
	Canvas_image_width(LCD_XSIZE_TFT);				          
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);	    
	
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_3_Addr);
	
	Canvas_Image_Start_address(LAY_DISPLAY1);
	Canvas_image_width(LCD_XSIZE_TFT);	
	
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,Picture_3_Addr);// 在显存预存一张底图，便于不BTE的使用
	
	LT768_Select_Internal_Font_Init(24,2,2,0,0);
	
	Flash_To_Sdram();
	Copy_AllPicture_To_Display();
	

	Show_Gears(2);
	Show_Total(12345);
	Show_temperature(55);
	
	while(1)
	{
		Show_Pointer1_Turn();
		Show_Pointer2_Turn();
		Show_Pointer3_Turn();
		Show_Pointer4_Turn();
		
		count_Total++;
		if(count_Total > 100)	
		{
			count_Total = 0 ;
			Total++;
			if(Total > 99999)	Total = 0;
			Show_Total(Total);
		}
		
		count_temperature++;
		if(count_temperature > 120)
		{	
			count_temperature = 0;
			temperature++;
			if(temperature > 99)	temperature = 0;
			Show_temperature(temperature);
		}
		
		count_gears++;
		if(count_gears > 150)
		{
			count_gears = 0;
			gears++;
			if(gears > 4)	gears = 0;
			Show_Gears(gears);
		}
		
		count++;
		if(count >= 30)
		{
			count = 0;
			if(flag == 0)
			{
				Clear_Icon(icon);
				icon++;
				if(icon == 7)		icon = 8;
				if(icon >= 17)	icon = 16,	flag = 1;
			}
			else
			{
				Show_Icon(icon);
				icon--;
				if(icon == 7)	icon = 6;
				if(icon < 0)	icon = 0,	flag = 0;
			}
		}
		if (Screen_delay_Count(1) == 1)	return 1;
	}
}

void LT768_DrawLine1
(
 unsigned short X1        // X1坐标
,unsigned short Y1        // Y1坐标
,unsigned short X2        // X2坐标
,unsigned short Y2        // Y2坐标
)
{
	Line_Start_XY(X1,Y1);
	Line_End_XY(X2,Y2);
	Start_Line();
	Check_2D_Busy();
}

#include <math.h>

#define  BACKGROUND_H	760  // 背景的宽度
#define  BACKGROUND_W	260  // 背景的高度
#define  GRIDS_SIZE   60   // 网格大小
#define  Dot_Num      3    // 波形中点与点之间的点数

#define	 X1	((LCD_XSIZE_TFT-BACKGROUND_H)/2)
#define	 X2	(LCD_XSIZE_TFT-(LCD_XSIZE_TFT-BACKGROUND_H)/2)
#define  Y1 ((LCD_YSIZE_TFT-180-BACKGROUND_W)/2)
#define  Y2 (LCD_YSIZE_TFT-180-(LCD_YSIZE_TFT-180-BACKGROUND_W)/2)


#define TRIANGLE_BUFF_LEN 560
unsigned int gY_TriangleBuff[TRIANGLE_BUFF_LEN] = {0};
unsigned int gY_TriangleTemp[10] = {0};

#define SIN_BUFF_LEN 586  // 610
unsigned int gY_SinBuff_Sin[SIN_BUFF_LEN] = {0};
unsigned int gY_SinTemp[10] = {0};

signed char gOffset = 1;    // 移动的点数


void Load_TriangleWaveDate(void)
{
	unsigned char flag = 0;
  signed int i = 0, count = 0;
	for(i = 0 ; i < TRIANGLE_BUFF_LEN-1 ; i++)
	{
		if(flag == 0)
		{
			count+=4;
			if(count >= 80)	count = 80,	flag = 1;
		}
		else
		{
			count-=4;
			if(count <= 0)	count = 0,	flag = 0;
		}
		gY_TriangleBuff[i] =  count + 30;
	}
}


void Load_SineWaveDate(void)
{
	signed int i = 0;
	unsigned char A = 60 , flag = 0;;

	for(i = 0 ; i < SIN_BUFF_LEN-1 ; i++)
	{
		if(flag == 0)
		{
			if(i%9==0)	A = A - 15;
			if(A <= 15)	flag = 1;
		}
		else
		{
			if(i%9==0)	A = A + 15;
			if(A >= 60)	flag = 0;
		}
		gY_SinBuff_Sin[i]=A*sin(((double)i*3.14159/180)*40)+200;
	}
}


void Move_WaveDate(void)
{
	unsigned int i = 0;
	
	// 三角波形数据移动
	for(i = 0 ; i < gOffset ; i++)										gY_TriangleTemp[i] = gY_TriangleBuff[i];
	for(i = 0 ; i < TRIANGLE_BUFF_LEN-gOffset ; i++)	gY_TriangleBuff[i] = gY_TriangleBuff[i+gOffset];
	for(i = 0 ; i < gOffset ; i++)										gY_TriangleBuff[TRIANGLE_BUFF_LEN-gOffset+i-1] = gY_TriangleTemp[i];
	// 正弦波形数据移动
	for(i = 0 ; i < gOffset ; i++)							gY_SinTemp[i] = gY_SinBuff_Sin[i];
	for(i = 0 ; i < SIN_BUFF_LEN-gOffset ; i++)	gY_SinBuff_Sin[i] = gY_SinBuff_Sin[i+gOffset];
	for(i = 0 ; i < gOffset ; i++)							gY_SinBuff_Sin[SIN_BUFF_LEN-gOffset+i-1] = gY_SinTemp[i];
}

void Drawing_TriangleWave(unsigned short color)
{
	unsigned short i = 0;
	
	Foreground_color_65k(color);
	for(i = 0 ; i < BACKGROUND_H/Dot_Num ; i++)
	{
		LT768_DrawLine1(X1+Dot_Num*i,gY_TriangleBuff[i],X1+Dot_Num*(i+1),gY_TriangleBuff[i+1]);
	}
}

void Drawing_SineWaveDate(unsigned short color)
{
	unsigned short i = 0;
	
	Foreground_color_65k(color);
	for(i = 0 ; i < BACKGROUND_H/Dot_Num ; i++)
	{
		LT768_DrawLine1(X1+Dot_Num*i,gY_SinBuff_Sin[i],X1+Dot_Num*(i+1),gY_SinBuff_Sin[i+1]);
	}
}

unsigned char Waveform_Demo(void)
{
	char buf[3] = {0};
	unsigned char flag = 0;
	unsigned char state = 0, state_1 = 0;
	u8 key1 = 0, key2 = 0;
	signed int i = 0;
	
	Load_TriangleWaveDate();	// 装载三角波形数据
	Load_SineWaveDate();			// 装载正弦波形数据

	
	sprintf(buf,"%2d",gOffset);
	LT768_Select_Outside_Font_Init(1,0,FLASH_ADDR_32,MEMORY_ADDR_32,SIZE_32_NUM,32,1,1,0,0);

	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer2_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度

	Canvas_Image_Start_address(layer2_start_addr);	     //Layer 2;画布图像起始地址
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Blue2);
	LT768_DrawSquare_Width(X1,Y1,X2,Y2,Green,Black,5);
	Foreground_color_65k(color65k_grayscale5);
	LT768_DrawSquare_Fill(300,430,550,472,Black);
	LT768_Print_Outside_Font_String(320,435,Red,Black,"SPEED：");
	LT768_Print_Internal_Font_String(470,435,Red,Black,buf);
	LT768_Print_Outside_Font_String(100,435,Red,Black,"KEY1：+1");
	LT768_Print_Outside_Font_String(600,435,Red,Black,"KEY2：-1");

	
	Canvas_Image_Start_address(layer3_start_addr);	     //Layer 3;画布图像起始地址
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Blue2);
	LT768_DrawSquare_Width(X1,Y1,X2,Y2,Green,Black,5);	
	LT768_DrawSquare_Fill(300,430,550,472,Black);
	LT768_Print_Outside_Font_String(320,435,Red,Black,"SPEED：");
	LT768_Print_Internal_Font_String(470,435,Red,Black,buf);
	LT768_Print_Outside_Font_String(100,435,Red,Black,"KEY1：+1");
	LT768_Print_Outside_Font_String(600,435,Red,Black,"KEY2：-1");

	Enable_Vsync_Interrupt();
	
	while(1)
	{
		Move_WaveDate();
		if(flag == 0)
		{
			Clear_Vsync_Interrupt_Flag();
			while((Read_Interrupt_status()&0x10)==0){};	
			Canvas_Image_Start_address(layer2_start_addr);	
			// 清数据
			LT768_DrawSquare_Width(X1,Y1,X2,Y2,Green,Black,5);
			// 画网格
			Foreground_color_65k(color65k_grayscale5);
			for(i = 0 ; i < BACKGROUND_W/GRIDS_SIZE ; i++)	LT768_DrawLine1(X1,Y1+GRIDS_SIZE*(i+1),X2,Y1+GRIDS_SIZE*(i+1));
			for(i = 0 ; i < BACKGROUND_H/GRIDS_SIZE ; i++)	LT768_DrawLine1(X1+GRIDS_SIZE*(i+1),Y1,X1+GRIDS_SIZE*(i+1),Y2);
			// 画波形
			Drawing_TriangleWave(Magenta);
			Drawing_SineWaveDate(Red);
			
			Main_Image_Start_Address(layer2_start_addr);
				
			flag = 1;
		}

		else
		{
			Clear_Vsync_Interrupt_Flag();
			while((Read_Interrupt_status()&0x10)==0){};	
			Canvas_Image_Start_address(layer3_start_addr);	 	
			// 清数据
			LT768_DrawSquare_Width(X1,Y1,X2,Y2,Green,Black,5);
			// 画网格
			Foreground_color_65k(color65k_grayscale5);
			for(i = 0 ; i < BACKGROUND_W/GRIDS_SIZE ; i++)	LT768_DrawLine1(X1,Y1+GRIDS_SIZE*(i+1),X2,Y1+GRIDS_SIZE*(i+1));
			for(i = 0 ; i < BACKGROUND_H/GRIDS_SIZE ; i++)	LT768_DrawLine1(X1+GRIDS_SIZE*(i+1),Y1,X1+GRIDS_SIZE*(i+1),Y2);
			// 画波形
			Drawing_TriangleWave(Magenta);
			Drawing_SineWaveDate(Red);
			
			Main_Image_Start_Address(layer3_start_addr);

			flag = 0;
		}
			
		gt911_Scan();
		if(gTpInfo.sta == 1 && state == 0)
		{
			state = 1;
			
			if ((gTpInfo.x > 100) && (gTpInfo.x < 300) && (gTpInfo.y > 400) && (gTpInfo.y < 480))
			{
				// 增加移動速度
				gOffset++;
				if(gOffset>=10)	gOffset = 10;
				for(i = 0 ; i < 3 ; i++)	buf[i] = 0;
				sprintf(buf,"%2d",gOffset);
				Canvas_Image_Start_address(layer2_start_addr);	
				LT768_Print_Internal_Font_String(470,435,Red,Black,buf);
				Canvas_Image_Start_address(layer3_start_addr);	
				LT768_Print_Internal_Font_String(470,435,Red,Black,buf);
			}
			else if ((gTpInfo.x > 600) && (gTpInfo.x < 740) && (gTpInfo.y > 400) && (gTpInfo.y < 480))
			{
				// 減少移動速度
				gOffset--;
				if(gOffset<=0)	gOffset = 0;
				for(i = 0 ; i < 3 ; i++)	buf[i] = 0;
				sprintf(buf,"%2d",gOffset);
				Canvas_Image_Start_address(layer2_start_addr);	
				LT768_Print_Internal_Font_String(470,435,Red,Black,buf);
				Canvas_Image_Start_address(layer3_start_addr);	
				LT768_Print_Internal_Font_String(470,435,Red,Black,buf);
			}
			else 
			{
				state_1 = 1;
			}
		}
		
		if(gTpInfo.sta == 0 && state == 1)
		{
			state = 0;
		}
		if(gTpInfo.sta == 0 && state_1 == 1)
		{
			return 1;
		}		
	}
}


#define Main_UI_Lay (10*LCD_XSIZE_TFT*LCD_YSIZE_TFT*2)



u8 Point = 1;

#define LIST_NUM 16

#define FirstRow_X1		20//40
#define FirstRow_Y1		62//75
#define FirstRow_X2		370//460
#define FirstRow_Y2		102//125

#define SecondRow_X1	430//560
#define SecondRow_Y1	62//75
#define SecondRow_X2	780
#define SecondRow_Y2	102//125

#define Offset        2//3
void Main_GUI(void)
{
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer1_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标
	Canvas_Image_Start_address(Main_UI_Lay);	           //Layer 1;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);	     //设置工作窗口大小
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,Blue2);
	
	LT768_Select_Outside_Font_Init(1,0,FLASH_ADDR_24,MEMORY_ADDR_24,SIZE_24_NUM,24/*32*/,2,2,0,0);

	LT768_Print_Outside_Font_String(170/*180*/,0,Red,Blue2,(unsigned char*)"LT768 Function Demo");
	LT768_DrawSquare_Fill(140/*180*/,50/*60*/,660/*875*/,53/*63*/,Red);

	Font_Width_X1();
	Font_Height_X1();

	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1    ,FirstRow_X2,FirstRow_Y2    ,Black,Blue2,3);     // 1
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+40 ,FirstRow_X2,FirstRow_Y2+40 ,Black,Blue2,3);     // 2
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+80 ,FirstRow_X2,FirstRow_Y2+80 ,Black,Blue2,3);     // 3
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+120,FirstRow_X2,FirstRow_Y2+120,Black,Blue2,3);     // 4
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+160,FirstRow_X2,FirstRow_Y2+160,Black,Blue2,3);     // 5
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+200,FirstRow_X2,FirstRow_Y2+200,Black,Blue2,3);     // 6
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+240,FirstRow_X2,FirstRow_Y2+240,Black,Blue2,3);     // 7
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+280,FirstRow_X2,FirstRow_Y2+280,Black,Blue2,3);     // 8
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+320,FirstRow_X2,FirstRow_Y2+320,Black,Blue2,3);     // 9
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+360,FirstRow_X2,FirstRow_Y2+360,Black,Blue2,3);     // 10

	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1    ,SecondRow_X2,SecondRow_Y2    ,Black,Blue2,3); // 11
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+40 ,SecondRow_X2,SecondRow_Y2+40 ,Black,Blue2,3); // 12
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+80 ,SecondRow_X2,SecondRow_Y2+80 ,Black,Blue2,3); // 13
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+120,SecondRow_X2,SecondRow_Y2+120,Black,Blue2,3); // 14
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+160,SecondRow_X2,SecondRow_Y2+160,Black,Blue2,3); // 15
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+200,SecondRow_X2,SecondRow_Y2+200,Black,Blue2,3); // 16
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+240,SecondRow_X2,SecondRow_Y2+240,Black,Blue2,3); // 17
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+280,SecondRow_X2,SecondRow_Y2+280,Black,Blue2,3); // 18
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+320,SecondRow_X2,SecondRow_Y2+320,Black,Blue2,3); // 19
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+360,SecondRow_X2,SecondRow_Y2+360,Black,Blue2,3); // 20

	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+5 ,White,Blue2,(u8*)"1、LT768 Basic Information");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+45 ,White,Blue2,(u8*)"2、Draw ellipses and circles");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+85,White,Blue2,(u8*)"3、Draw lines and curves");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+125,White,Blue2,(u8*)"4、Draw rectangles");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+165,White,Blue2,(u8*)"5、Draw polygons");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+205,White,Blue2,(u8*)"6、Draw tables");   
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+245,White,Blue2,(u8*)"7、Draw cylinders");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+285,White,Blue2,(u8*)"8、DMA for SPI Flash");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+325,White,Blue2,(u8*)"9、Picture slide");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+365,White,Blue2,(u8*)"10、Built-in English font");
	
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+5,White,Blue2,(u8*)"11、Customized fonts");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+45,White,Blue2,(u8*)"12、Picture-in-Picture(PIP)");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+85,White,Blue2,(u8*)"13、Memory copy(BTE)");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+125,White,Blue2,(u8*)"14、Memory copy/opacity(BTE)");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+165,White,Blue2,(u8*)"15、Needle demo(BTE)");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+205,White,Blue2,(u8*)"16、Animation(BTE)");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+245,White,Blue2,(u8*)"17、Brightness adjustment");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+285,White,Blue2,(u8*)"18、Meter display");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+325,White,Blue2,(u8*)"19、Waveform display");
	
	
	LT768_BTE_Memory_Copy(Main_UI_Lay,LCD_XSIZE_TFT,0,0,
	                      Main_UI_Lay,LCD_XSIZE_TFT,0,0,
											  layer1_start_addr,LCD_XSIZE_TFT,0,0,
												0x0c,LCD_XSIZE_TFT,LCD_YSIZE_TFT
	                     );
						 
	Canvas_Image_Start_address(layer1_start_addr);	           //Layer 1;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
}



void GUI_Init(void)
{
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1    ,FirstRow_X2,FirstRow_Y2    ,Black,Blue2,3);     // 1
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+40 ,FirstRow_X2,FirstRow_Y2+40 ,Black,Blue2,3);     // 2
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+80 ,FirstRow_X2,FirstRow_Y2+80 ,Black,Blue2,3);     // 3
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+120,FirstRow_X2,FirstRow_Y2+120,Black,Blue2,3);     // 4
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+160,FirstRow_X2,FirstRow_Y2+160,Black,Blue2,3);     // 5
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+200,FirstRow_X2,FirstRow_Y2+200,Black,Blue2,3);     // 6
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+240,FirstRow_X2,FirstRow_Y2+240,Black,Blue2,3);     // 7
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+280,FirstRow_X2,FirstRow_Y2+280,Black,Blue2,3);     // 8
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+320,FirstRow_X2,FirstRow_Y2+320,Black,Blue2,3);     // 9
	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+360,FirstRow_X2,FirstRow_Y2+360,Black,Blue2,3);     // 10

	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1    ,SecondRow_X2,SecondRow_Y2    ,Black,Blue2,3); // 11
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+40 ,SecondRow_X2,SecondRow_Y2+40 ,Black,Blue2,3); // 12
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+80 ,SecondRow_X2,SecondRow_Y2+80 ,Black,Blue2,3); // 13
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+120,SecondRow_X2,SecondRow_Y2+120,Black,Blue2,3); // 14
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+160,SecondRow_X2,SecondRow_Y2+160,Black,Blue2,3); // 15
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+200,SecondRow_X2,SecondRow_Y2+200,Black,Blue2,3); // 16
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+240,SecondRow_X2,SecondRow_Y2+240,Black,Blue2,3); // 17
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+280,SecondRow_X2,SecondRow_Y2+280,Black,Blue2,3); // 18
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+320,SecondRow_X2,SecondRow_Y2+320,Black,Blue2,3); // 19
	LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+360,SecondRow_X2,SecondRow_Y2+360,Black,Blue2,3); // 20

	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+5 ,White,Blue2,(u8*)"1、LT768 Basic Information");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+45 ,White,Blue2,(u8*)"2、Draw ellipses and circles");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+85,White,Blue2,(u8*)"3、Draw lines and curves");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+125,White,Blue2,(u8*)"4、Draw rectangles");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+165,White,Blue2,(u8*)"5、Draw polygons");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+205,White,Blue2,(u8*)"6、Draw tables");   
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+245,White,Blue2,(u8*)"7、Draw cylinders");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+285,White,Blue2,(u8*)"8、DMA for SPI Flash");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+325,White,Blue2,(u8*)"9、Picture slide");
	LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+365,White,Blue2,(u8*)"10、Built-in English font");
	
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+5,White,Blue2,(u8*)"11、Customized fonts");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+45,White,Blue2,(u8*)"12、Picture-in-Picture(PIP)");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+85,White,Blue2,(u8*)"13、Memory copy(BTE)");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+125,White,Blue2,(u8*)"14、Memory copy/opacity(BTE)");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+165,White,Blue2,(u8*)"15、Needle demo(BTE)");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+205,White,Blue2,(u8*)"16、Animation(BTE)");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+245,White,Blue2,(u8*)"17、Brightness adjustment");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+285,White,Blue2,(u8*)"18、Meter display");
	LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+325,White,Blue2,(u8*)"19、Waveform display");
}

u8 Judge_Pos(void)
{
	if ((gTpInfo.x > FirstRow_X1) && (gTpInfo.x < FirstRow_X2) && (gTpInfo.y > FirstRow_Y1) && (gTpInfo.y < FirstRow_Y2))
	{
		Point = 1;
		return 1;
	}
	else if ((gTpInfo.x > FirstRow_X1) && (gTpInfo.x < FirstRow_X2) && (gTpInfo.y > FirstRow_Y1 + 42) && (gTpInfo.y < FirstRow_Y2 + 42))
	{
		Point = 2;
		return 1;
	}
	else if ((gTpInfo.x > FirstRow_X1) && (gTpInfo.x < FirstRow_X2) && (gTpInfo.y > FirstRow_Y1 + 84) && (gTpInfo.y < FirstRow_Y2 + 84))
	{
		Point = 3;
		return 1;
	}
	else if ((gTpInfo.x > FirstRow_X1) && (gTpInfo.x < FirstRow_X2) && (gTpInfo.y > FirstRow_Y1 + 126) && (gTpInfo.y < FirstRow_Y2 + 126))
	{
		Point = 4;
		return 1;
	}
	else if ((gTpInfo.x > FirstRow_X1) && (gTpInfo.x < FirstRow_X2) && (gTpInfo.y > FirstRow_Y1 + 168) && (gTpInfo.y < FirstRow_Y2 + 168))
	{
		Point = 5;
		return 1;
	}
	else if ((gTpInfo.x > FirstRow_X1) && (gTpInfo.x < FirstRow_X2) && (gTpInfo.y > FirstRow_Y1 + 210) && (gTpInfo.y < FirstRow_Y2 + 210))
	{
		Point = 6;
		return 1;
	}
	else if ((gTpInfo.x > FirstRow_X1) && (gTpInfo.x < FirstRow_X2) && (gTpInfo.y > FirstRow_Y1 + 252) && (gTpInfo.y < FirstRow_Y2 + 252))
	{
		Point = 7;
		return 1;
	}
	else if ((gTpInfo.x > FirstRow_X1) && (gTpInfo.x < FirstRow_X2) && (gTpInfo.y > FirstRow_Y1 + 294) && (gTpInfo.y < FirstRow_Y2 + 294))
	{
		Point = 8;
		return 1;
	}
	else if ((gTpInfo.x > FirstRow_X1) && (gTpInfo.x < FirstRow_X2) && (gTpInfo.y > FirstRow_Y1 + 336) && (gTpInfo.y < FirstRow_Y2 + 336))
	{
		Point = 9;
		return 1;
	}
	else if ((gTpInfo.x > FirstRow_X1) && (gTpInfo.x < FirstRow_X2) && (gTpInfo.y > FirstRow_Y1 + 380) && (gTpInfo.y < FirstRow_Y2 + 380))
	{
		Point = 10;
		return 1;
	}
	else if ((gTpInfo.x > SecondRow_X1) && (gTpInfo.x < SecondRow_X2) && (gTpInfo.y > FirstRow_Y1) && (gTpInfo.y < FirstRow_Y2))
	{
		Point = 11;
		return 1;
	}
	else if ((gTpInfo.x > SecondRow_X1) && (gTpInfo.x < SecondRow_X2) && (gTpInfo.y > FirstRow_Y1 + 42) && (gTpInfo.y < FirstRow_Y2 + 42))
	{
		Point = 12;
		return 1;
	}
	else if ((gTpInfo.x > SecondRow_X1) && (gTpInfo.x < SecondRow_X2) && (gTpInfo.y > FirstRow_Y1 + 84) && (gTpInfo.y < FirstRow_Y2 + 84))
	{
		Point = 13;
		return 1;
	}
	else if ((gTpInfo.x > SecondRow_X1) && (gTpInfo.x < SecondRow_X2) && (gTpInfo.y > FirstRow_Y1 + 126) && (gTpInfo.y < FirstRow_Y2 + 126))
	{
		Point = 14;
		return 1;
	}
	else if ((gTpInfo.x > SecondRow_X1) && (gTpInfo.x < SecondRow_X2) && (gTpInfo.y > FirstRow_Y1 + 168) && (gTpInfo.y < FirstRow_Y2 + 168))
	{
		Point = 15;
		return 1;
	}
	else if ((gTpInfo.x > SecondRow_X1) && (gTpInfo.x < SecondRow_X2) && (gTpInfo.y > FirstRow_Y1 + 210) && (gTpInfo.y < FirstRow_Y2 + 210))
	{
		Point = 16;
		return 1;
	}
	else if ((gTpInfo.x > SecondRow_X1) && (gTpInfo.x < SecondRow_X2) && (gTpInfo.y > FirstRow_Y1 + 252) && (gTpInfo.y < FirstRow_Y2 + 252))
	{
		Point = 17;
		return 1;
	}
	else if ((gTpInfo.x > SecondRow_X1) && (gTpInfo.x < SecondRow_X2) && (gTpInfo.y > FirstRow_Y1 + 294) && (gTpInfo.y < FirstRow_Y2 + 294))
	{
		Point = 18;
		return 1;
	}
	else if ((gTpInfo.x > SecondRow_X1) && (gTpInfo.x < SecondRow_X2) && (gTpInfo.y > FirstRow_Y1 + 336) && (gTpInfo.y < FirstRow_Y2 + 336))
	{
		Point = 19;
		return 1;
	}
	else
		return 0;
}

#define basicaddr1 0x004D9C40
unsigned char Select_Function(void)
{
	unsigned char main_state = 0;
	unsigned char flag = 0;
	unsigned char function = 0;
	u16 pressed_sampling = 0, release_sampling = 0;
	
	Select_Main_Window_16bpp();
	Main_Image_Start_Address(layer1_start_addr);			   //设置主图像起始地址
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(layer1_start_addr);	     //Layer 1;画布图像起始地址
	Canvas_image_width(LCD_XSIZE_TFT);				           //画布图像宽度
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);       //设置工作窗口大小
	Main_Window_Start_XY(0,0);				                   //设置主窗口坐标
	
	LT768_Select_Outside_Font_Init(1,0,FLASH_ADDR_24,MEMORY_ADDR_24,SIZE_24_NUM,24,1,1,0,0);
	
	while(1)
	{		
		gt911_Scan();
		if (gTpInfo.sta == 1 && Judge_Pos() == 1)       // Pressed
		{
			main_state = 1;
			flag = 1;
		}
		else if(gTpInfo.sta == 0 && Judge_Pos() == 1 && main_state == 1)  // Released
		{
			flag = 1;
			function = 1;
		}

		if (flag == 1)
		{
			flag = 0;
			Canvas_Image_Start_address(Main_UI_Lay);
			GUI_Init();
			switch(Point)
			{
				case 1:	LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1,FirstRow_X2,FirstRow_Y2,Black,Blue,3);   // 1
								LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+5,Green,Blue,(u8*)"1、LT768 Basic Information");
								if(function == 1)
								{
									Display_Levetop();
									main_state = 0;
									return 1;
								}
								break;

				case 2: LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+40,FirstRow_X2,FirstRow_Y2+40,Black,Blue,3);   // 2
								LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+45,Green,Blue,(u8*)"2、Draw ellipses and circles");
								if(function == 1)
								{
									Draw_Circle_Ellipse();
									main_state = 0;
									return 1;
								}
								break;

				case 3: LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+80,FirstRow_X2,FirstRow_Y2+80,Black,Blue,3);   // 3
								LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+85,Green,Blue,(u8*)"3、Draw lines and curves");
								if(function == 1)
								{
									Draw_Line_Curve(); 
									main_state = 0;
									return 1;
								}
						break;

				case 4: LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+120,FirstRow_X2,FirstRow_Y2+120,Black,Blue,3);   // 4
								LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+125,Green,Blue,(u8*)"4、Draw rectangels");
								if(function == 1)
								{
									Draw_Rectangle();
									main_state = 0;
									return 1;
								}
								break;

				case 5: LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+160,FirstRow_X2,FirstRow_Y2+160,Black,Blue,3);   // 5
								LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+165,Green,Blue,(u8*)"5、Draw polygons");
								if(function == 1)
								{
									Draw_Polygon();
									main_state = 0;
									return 1;
								}
								break;

				case 6: LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+200,FirstRow_X2,FirstRow_Y2+200,Black,Blue,3);   // 6
								LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+205,Green,Blue,(u8*)"6、Draw tables");
								if(function == 1)
								{
									Draw_Table();
									main_state = 0;
									return 1;
								}
								break;

				case 7: LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+240,FirstRow_X2,FirstRow_Y2+240,Black,Blue,3);   // 7
								LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+245,Green,Blue,(u8*)"7、Draw cylinders");
								if(function == 1)
								{
									Draw_Pillar_Demo();
									main_state = 0;
									return 1;
								}
								break;

				case 8: LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+280,FirstRow_X2,FirstRow_Y2+280,Black,Blue,3);   // 8
								LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+285,Green,Blue,(u8*)"8、DMA for SPI Flash");
								if(function == 1)
								{
									DMA_Demo();
									main_state = 0;
									return 1;
								}
								break;
								
				case 9: LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+320,FirstRow_X2,FirstRow_Y2+320,Black,Blue,3);   // 8
								LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+325,Green,Blue,(u8*)"9、Picture Slide");
								if(function == 1)
								{
									App_Demo_slide_frame_buffer();
									main_state = 0;
									return 1;
								}
								break;
								
				case 10: LT768_DrawSquare_Width(FirstRow_X1,FirstRow_Y1+360,FirstRow_X2,FirstRow_Y2+360,Black,Blue,3);   // 8
								LT768_Print_Outside_Font_String(FirstRow_X1+Offset,FirstRow_Y1+365,Green,Blue,(u8*)"10、Built-in English font");
								if(function == 1)
								{
									Text_Demo();
									LT768_Disable_Text_Cursor();	
									LT768_Disable_Graphic_Cursor();
									main_state = 0;
									return 1;
								}
								break;
																														
				case 11: LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1,SecondRow_X2,SecondRow_Y2,Black,Blue,3); // 9
								LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+5,Green,Blue,(u8*)"11、Customized fonts");
								if(function == 1)
								{
									Outside_Font();
									VSCAN_T_to_B();
									Font_0_degree();
									main_state = 0;
									return 1;
								}
								break;

				case 12: LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+40,SecondRow_X2,SecondRow_Y2+40,Black,Blue,3); // 10
								 LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+45,Green,Blue,(u8*)"12、Picture-In-Picture(PIP)");
								if(function == 1)
								 {
									 PIP_Demo();
									 Disable_PIP1();	
									 Disable_PIP2();
									 main_state = 0;
									 return 1;
								 }
								 break;

				case 13: LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+80,SecondRow_X2,SecondRow_Y2+80,Black,Blue,3); // 11
								 LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+85,Green,Blue,(u8*)"13、Memory copy(BTE)");
								 if(function == 1)
								 {
									 App_Demo_BTE();
									 main_state = 0;
									 return 1;
								 }
								 break;

				case 14: LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+120,SecondRow_X2,SecondRow_Y2+120,Black,Blue,3); // 12
								 LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+125,Green,Blue,(u8*)"14、Memory copy/opacity(BTE)");
								 if(function == 1)
								 {
									 App_Demo_Alpha_Blending();
									 main_state = 0;
									 return 1;
								 }
								 break;

				case 15: LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+160,SecondRow_X2,SecondRow_Y2+160,Black,Blue,3); // 13
								 LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+165,Green,Blue,(u8*)"15、Needle Demo(BTE)");
								 if(function == 1)
								 {
									 Controller_Demo();
									 main_state = 0;
									 return 1;
								 }
								 break;

				case 16: LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+200,SecondRow_X2,SecondRow_Y2+200,Black,Blue,3); // 14
								 LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+205,Green,Blue,(u8*)"16、Animation(BTE)");
								 if(function == 1)
								 {
									 Cartoon_Show();	
									 main_state = 0;
									 return 1;
								 }
								 break;

				case 17: LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+240,SecondRow_X2,SecondRow_Y2+240,Black,Blue,3); // 15
								 LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+245,Green,Blue,(u8*)"17、Brightness adjustment");
								 if(function == 1)
								 {
									 Backlight_Control();
									 main_state = 0;
									 return 1;
								 }
								 break;
				
				case 18: LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+280,SecondRow_X2,SecondRow_Y2+280,Black,Blue,3); // 15
								 LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+285,Green,Blue,(u8*)"18、Meter display");
								 if(function == 1)
								 {
									 Show_Panel();	
									 main_state = 0;
									 return 1;
								 }
								 break;

				case 19: LT768_DrawSquare_Width(SecondRow_X1,SecondRow_Y1+320,SecondRow_X2,SecondRow_Y2+320,Black,Blue,3); // 15
								 LT768_Print_Outside_Font_String(SecondRow_X1+Offset,SecondRow_Y1+325,Green,Blue,(u8*)"19、Waveform display");
								 if(function == 1)
								 {
									 Waveform_Demo();
									 main_state = 0;
									 return 1;
								 }
								 break;
								 
				default:
								break;
			}
			
			LT768_BTE_Memory_Copy(Main_UI_Lay,LCD_XSIZE_TFT,0,0,
	                          Main_UI_Lay,LCD_XSIZE_TFT,0,0,
											      layer1_start_addr,LCD_XSIZE_TFT,0,0,
												    0x0c,LCD_XSIZE_TFT,LCD_YSIZE_TFT
	                         );
		}
	}
}
#endif
