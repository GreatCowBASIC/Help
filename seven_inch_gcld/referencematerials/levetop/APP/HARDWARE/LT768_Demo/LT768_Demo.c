/******************************************************************************
  * Copyright(c) 2023 Levetop Semiconductor Co., Ltd. All rights reserved
  * @file      LT768_Demo.c
  * @author    Levetop TFT Controller Application Team
  * @version   V1.0.0
  * @date      2023-02-24
  * @brief     LT768x demo program
*******************************************************************************/

#include "LT768_Demo.h"
#include "math.h"

/*---------------------------------------------------------------------------------------*/
/* Function:    Display_RGB_Gray_RGB565                                                  */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Display RGB grayshade image (R5G6B5)                                     */
/*---------------------------------------------------------------------------------------*/
void Display_RGB_Gray_RGB565()
{
	  int i,w,h;
      u32 c;
	
	  w = LCD_XSIZE_TFT/3;
      
	
      h = LCD_YSIZE_TFT/32;     // Red color        
      for(i=0;i<31;i++) 
      {
            c = 31 - i;
            LT768_DrawSquare_Fill(0,h*i,w-1,h*(i+1),(c<<11)&0xF800);
      }
      c = 0;
      LT768_DrawSquare_Fill(0,h*31,w-1,LCD_YSIZE_TFT-1,c);
      
      
      h = LCD_YSIZE_TFT/64;     // Green color          
      for(i=0;i<63;i++) 
      {
            c = 63 - i;
            LT768_DrawSquare_Fill(w,h*i,w*2-1,h*(i+1),(c<<5)&0x7E0);
      }
      c = 0;
      LT768_DrawSquare_Fill(w,h*63,w*2-1,LCD_YSIZE_TFT-1,c);
         
      
      h = LCD_YSIZE_TFT/32;     // Blue color
      for(i=0;i<31;i++) 
      {
            c = 31 - i;
            LT768_DrawSquare_Fill(w*2,h*i,LCD_XSIZE_TFT-1,h*(i+1),c&0x1F);
      }
      c = 0;
      LT768_DrawSquare_Fill(w*2,h*31,LCD_XSIZE_TFT-1,LCD_YSIZE_TFT-1,c);
}

/*---------------------------------------------------------------------------------------*/
/* Function:    Display_RGB_Gray_RGB888                                                  */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Display RGB grayshade image (R8G8B8)                                     */
/*---------------------------------------------------------------------------------------*/
void Display_RGB_Gray_RGB888(void) 
{
      int i;
      int w0;
      int h0,h1;
      
      u32 c,r,g,b;
      
      
      w0 = LCD_XSIZE_TFT/4;
      
      if(LCD_YSIZE_TFT<256) 
      {
            h0 = 1;
            h1 = 0;
            
            for(i=0;i<LCD_YSIZE_TFT;i++) 
            {
                  c = 255 - i;
                  LT768_DrawSquare_Fill(0,i,w0-1,i+1,(c<<16)&0xFF0000);
            }
            
            for(i=0;i<LCD_YSIZE_TFT;i++) 
            {
                  c = 255 - i;
                  LT768_DrawSquare_Fill(w0,i,w0*2-1,i+1,(c<<8)&0xFF00);
            }
            
            for(i=0;i<LCD_YSIZE_TFT;i++) 
            {
                  c = 255 - i;
                  LT768_DrawSquare_Fill(w0*2,i,w0*3-1,i+1,c);
            }
            
            for(i=0;i<LCD_YSIZE_TFT;i++) 
            {
                  r = 255 - i;
                  g = 255 - i;
                  b = 255 - i;
                  
                  c = ((r<<16)&0xFF0000) | ((g<<8)&0xFF00) | (b&0xFF);
                  
                  LT768_DrawSquare_Fill(w0*3,i,LCD_XSIZE_TFT-1,i+1,c);
            }            
      }
      else
      {
            h0 = LCD_YSIZE_TFT/256;
            h1 = LCD_YSIZE_TFT - h0*255;
            
            for(i=0;i<255;i++) 
            {
                  c = 255 - i;
                  LT768_DrawSquare_Fill(0,h0*i,w0-1,h0*(i+1),(c<<16)&0xFF0000);
            }
            c = 0;
            LT768_DrawSquare_Fill(0,h0*255,w0-1,LCD_YSIZE_TFT-1,c);
            
            
            for(i=0;i<255;i++) 
            {
                  c = 255 - i;
                  LT768_DrawSquare_Fill(w0,h0*i,w0*2-1,h0*(i+1),(c<<8)&0xFF00);
            }
            c = 0;
            LT768_DrawSquare_Fill(w0,h0*255,w0*2-1,LCD_YSIZE_TFT-1,c);
            
            
            for(i=0;i<255;i++) 
            {
                  c = 255 - i;
                  LT768_DrawSquare_Fill(w0*2,h0*i,w0*3-1,h0*(i+1),c);
            }
            c = 0;
            LT768_DrawSquare_Fill(w0*2,h0*255,w0*3-1,LCD_YSIZE_TFT-1,c);
            
            
            for(i=0;i<255;i++) 
            {
                  r = 255 - i;
                  g = 255 - i;
                  b = 255 - i;
                  c = ((r<<16)&0xFF0000) | ((g<<8)&0xFF00) | (b&0xFF);
                  
                  LT768_DrawSquare_Fill(w0*3,h0*i,LCD_XSIZE_TFT-1,h0*(i+1),c);
            }
            
            c = 0;
            LT768_DrawSquare_Fill(w0*3,h0*255,LCD_XSIZE_TFT-1,LCD_YSIZE_TFT-1,c);
      }     
}


/*---------------------------------------------------------------------------------------*/
/* Function:    Show                                                                     */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Demo show                                                                */
/*              (1) Display full screen of red / green / blue                            */
/*              (2) Display RGB grayshade image                                          */
/*              (3) Retrieve a full screen data from SPI Flash and display it            */
/*---------------------------------------------------------------------------------------*/
void Show(void)
{	
	for(;;)
	{
		if(LCD_16bit)
		{
			// (1) Display full screen of red / green / blue
			LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT-1,LCD_YSIZE_TFT-1,Red);
			delay_ms(1000);
			LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT-1,LCD_YSIZE_TFT-1,Green);
			delay_ms(1000);
			LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT-1,LCD_YSIZE_TFT-1,Blue);
			delay_ms(1000);
			
			// (2) Display RGB grayshade image
			Display_RGB_Gray_RGB565();
			delay_ms(1000);
			
			// (3) Retrieve a full screen data from SPI Flash and display it
			LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,0);
			delay_ms(1000);	   			
		}
		else
		{
			// (1) Display full screen of red / green / blue
			LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT-1,LCD_YSIZE_TFT-1,color16M_red);
			delay_ms(1000);
			LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT-1,LCD_YSIZE_TFT-1,color16M_green);
			delay_ms(1000);
			LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT-1,LCD_YSIZE_TFT-1,color16M_blue);
			delay_ms(1000);
			
			// (2) Display RGB grayshade image
			Display_RGB_Gray_RGB888();
			delay_ms(1000);
			
			// (3) Retrieve a full screen data from SPI Flash and display it
			//LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,0);
			//delay_ms(1000);
		}
	}
}

/*---------------------------------------------------------------------------------------*/
/* Function:    Draw_Demo_1                                                              */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Demonstrate geometric drawing functions                                  */
/*---------------------------------------------------------------------------------------*/
void Draw_Demo_1(void)
{
	unsigned long i,j,h,z,w;
	unsigned long resx1,resy1,resx2,resy2;

	Select_Main_Window_16bpp();
	Main_Image_Start_Address(LAYER_0);           			   // Set main window starting address
	Main_Image_Width(LCD_XSIZE_TFT);
	Canvas_Image_Start_address(LAYER_0);	                   // Set canvas window starting address
	Canvas_image_width(LCD_XSIZE_TFT);				           // Set canvas width
	Active_Window_XY(0,0);
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);             // Set the active window area
	
	Main_Window_Start_XY(0,0);				                   // Set the starting coordinate of the main window

	//--------------------------- Line ------------------------------
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
	h=0;
	do
	{
		resx1=rand()%LCD_XSIZE_TFT;       // Starting x coordinate
		resy1=rand()%(LCD_YSIZE_TFT);     // Starting y coordinate
		resx2=rand()%LCD_XSIZE_TFT;       // Ending x coordinate
		resy2=rand()%(LCD_YSIZE_TFT);     // Ending y coordinate
		i=rand()%65536;                   // Line color
		w=rand()%20;

		LT768_DrawLine_Width(resx1,resy1+w,resx2,resy2+w,i,w);

		h++;
		delay_ms(10);
	}
	while(h<15);

	h=0;
	do
	{
		resx1=rand()%LCD_XSIZE_TFT;       // Starting x coordinate
		resy1=rand()%(LCD_YSIZE_TFT);     // Starting y coordinate
		resx2=rand()%LCD_XSIZE_TFT;       // Ending x coordinate
		resy2=rand()%(LCD_YSIZE_TFT);     // Ending y coordinate
		i=rand()%65536;                   // Line color
		w=rand()%20;

		LT768_DrawLine_Width(resx1,resy1+w,resx2,resy2+w,i,w);

		h++;
		delay_ms(10);
	}
	while(h<500);
	
	//------------------------ Circle ------------------------------
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
	h=0;
	do
	{
		
		resx1=rand()%LCD_XSIZE_TFT;      // x coordinate of the circle center
		resy1=rand()%(LCD_YSIZE_TFT-24); // y coordinate of the circle center
		z=rand()%200;                    // radius
		i=rand()%65536;                  // Color
		
		j=rand()%3;
		if(j)	LT768_DrawCircle(resx1,resy1,z,i);        // Draw hollow circle
		else	LT768_DrawCircle_Fill(resx1,resy1,z,i);   // Draw solid circle
		h++;		
		delay_ms(10);
	}
	while(h<15);

	h=0;
	do
	{
		resx1=rand()%LCD_XSIZE_TFT;      // x coordinate of the circle center
		resy1=rand()%(LCD_YSIZE_TFT-24); // y coordinate of the circle center
		z=rand()%200;                    // radius
		i=rand()%65536;                  // Color

		j=rand()%3;
		if(j)	LT768_DrawCircle(resx1,resy1,z,i);        // Draw hollow circle
		else	LT768_DrawCircle_Fill(resx1,resy1,z,i);   // Draw solid circle
		h++;
		delay_ms(10);
	}
	while(h<500);
	
	//------------------------- Rectangle ----------------------------
	LT768_DrawSquare_Fill(0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,White);
	h=0;
	do
	{
		resx1=rand()%LCD_XSIZE_TFT;       // x coordinate of the starting point
		resy1=rand()%(LCD_YSIZE_TFT);     // y coordinate of the starting point
		resx2=rand()%LCD_XSIZE_TFT;       // x coordinate of the ending point
		resy2=rand()%(LCD_YSIZE_TFT);     // y coordinate of the ending point
		i=rand()%65536;                   // Color
		j=rand()%3;
		if(j)	LT768_DrawSquare(resx1,resy1,resx2,resy2,i);        // Draw hollow rectangle
		else	LT768_DrawSquare_Fill(resx1,resy1,resx2,resy2,i);   // Draw solid rectangle
		h++;
		delay_ms(10);
	}
	while(h<15);

	h=0;
	do
	{
		resx1=rand()%LCD_XSIZE_TFT;       // x coordinate of the starting point
		resy1=rand()%(LCD_YSIZE_TFT);     // y coordinate of the starting point
		resx2=rand()%LCD_XSIZE_TFT;       // x coordinate of the ending point
		resy2=rand()%(LCD_YSIZE_TFT);     // y coordinate of the ending point
		i=rand()%65536;                   // Color
		j=rand()%3;
		if(j)	LT768_DrawSquare(resx1,resy1,resx2,resy2,i);        // Draw hollow rectangle
		else	LT768_DrawSquare_Fill(resx1,resy1,resx2,resy2,i);   // Draw solid rectangle
		h++;
		delay_ms(10);
	}
	while(h<500);
}

/*---------------------------------------------------------------------------------------*/
/* Function:    BTE_Demo_Alpha_Blending_0                                                */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Demonstrate BTE function - Show picture in various opacity level         */
/*---------------------------------------------------------------------------------------*/
void BTE_Demo_Alpha_Blending_0(void)
{
	int i = 0;   // counter
	int	j = 0;   // counter 
	
	Select_Main_Window_16bpp();                           // Set main window color depth
	Main_Image_Start_Address(LAYER_0);				      // Set main window starting address - Display layer
	Main_Image_Width(LCD_XSIZE_TFT);                      // Set main window width
	Main_Window_Start_XY(0,0);                            // Set main window starting coordinate
	Canvas_Image_Start_address(LAYER_0);                  // Set canvas starting address
	Canvas_image_width(LCD_XSIZE_TFT);                    // Set canvas width
	Active_Window_XY(0,0);                                // Set active window strarting coordinate
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);        // Set active window width and height
	
	LT768_DrawSquare_Fill(0, 0, LCD_XSIZE_TFT, LCD_YSIZE_TFT, Black);  // Clear the display layer SDRAM
	
	// (1) Set canvas starting address 
	// (2) Use DMA command to retrieve picture data from Flash (starting from address 0), and then
    //     transmit those data to LT768x SDRAM from canvas starting address	
	Canvas_Image_Start_address(LAYER_1);                         
	LT768_DMA_24bit_Block(1, 0, 0, 0, LCD_XSIZE_TFT, LCD_YSIZE_TFT, LCD_XSIZE_TFT, 0x00000000);
		
	// (1) Set canvas starting address 
	// (2) Write a full black frame to LT768x SDRAM from canvas starting address
	Canvas_Image_Start_address(LAYER_2);
	LT768_DrawSquare_Fill(0, 0, LCD_XSIZE_TFT, LCD_YSIZE_TFT, Black);	
	
	while(1) 
	{
		// Utilize BTE_Alpha_Blending command to demonstrate opacity effect in 
		// various level settings
		for(i = 0; i < 32; i++)
		{
			BTE_Alpha_Blending(LAYER_1, LCD_XSIZE_TFT, 0, 0,      // S0
							   LAYER_2, LCD_XSIZE_TFT, 0, 0,      // S1
							   LAYER_0, LCD_XSIZE_TFT, 0, 0,      // DT
							   LCD_XSIZE_TFT, LCD_YSIZE_TFT,i);	
			delay_ms(30);
		}
		
		// Utilize BTE_Alpha_Blending command to emphasize partial image
		for(i = 0; i < 3; i++)	
			for(j = 0; j < 4; j++) 
			{
				// Redraw the background picture with dimming effects
				BTE_Alpha_Blending(LAYER_1, LCD_XSIZE_TFT, 0, 0,      // S0
								   LAYER_2, LCD_XSIZE_TFT, 0, 0,      // S1
								   LAYER_0, LCD_XSIZE_TFT, 0, 0,      // DT
								   LCD_XSIZE_TFT, LCD_YSIZE_TFT,20);	
				
				// Draw partial image in higest contrast (0 alpha blending)
				BTE_Alpha_Blending(LAYER_1, LCD_XSIZE_TFT, j * 256, i * 200,      // S0
								   LAYER_2, LCD_XSIZE_TFT, j * 256, i * 200,      // S1
								   LAYER_0, LCD_XSIZE_TFT, j * 256, i * 200,      // DT
								   256, 200,0);
				
				delay_ms(200);
			}
	}
}


/*---------------------------------------------------------------------------------------*/
/* Function:    BTE_Demo_Alpha_Blending_1                                                */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Demonstrate BTE functions - Pop up window with dimming background        */
/*---------------------------------------------------------------------------------------*/
void BTE_Demo_Alpha_Blending_1(void)
{
	Select_Main_Window_16bpp();                           // Set main window color depth
	Main_Image_Start_Address(LAYER_0);				      // Set main window starting address - Display layer
	Main_Image_Width(LCD_XSIZE_TFT);                      // Set main window width
	Main_Window_Start_XY(0,0);                            // Set main window starting coordinate
	Canvas_Image_Start_address(LAYER_0);                  // Set canvas starting address
	Canvas_image_width(LCD_XSIZE_TFT);                    // Set canvas width
	Active_Window_XY(0,0);                                // Set active window starting coordinate
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);        // Set active window width and height
	
	// Clear display layer (SDRAM)
	LT768_DrawSquare_Fill(0, 0, LCD_XSIZE_TFT, LCD_YSIZE_TFT, Black);  
	
	// Retrieve the background picture from flash and display it to the TFT panel
	Canvas_Image_Start_address(LAYER_3);
	LT768_DMA_24bit_Block(1, 0, 0, 0, LCD_XSIZE_TFT, LCD_YSIZE_TFT, LCD_XSIZE_TFT, 0x00000000);
	LT768_BTE_Memory_Copy(
	                      LAYER_3, LCD_XSIZE_TFT, 0, 0,    // S0 
	                      LAYER_3, LCD_XSIZE_TFT, 0, 0,    // S1
	                      LAYER_0, LCD_XSIZE_TFT, 0, 0,    // DT
	                      0x0c,                            // ROP code, 0x0c -> DT = S0
	                      LCD_XSIZE_TFT, LCD_YSIZE_TFT     // Data area (width * height)
						 );
	delay_ms(5000);
	
	// Write "black" data to LAYER_4 -> These data will be used for BTE_Alpha_Blending function
	Canvas_Image_Start_address(LAYER_4);
	LT768_DrawSquare_Fill(0, 0, LCD_XSIZE_TFT, LCD_YSIZE_TFT, Black);  
	
	// Background dimming effect by BTE_Alpha_Blending command
	BTE_Alpha_Blending(
	                   LAYER_3, LCD_XSIZE_TFT, 0, 0,       // S0
					   LAYER_4, LCD_XSIZE_TFT, 0, 0,       // S1
					   LAYER_0, LCD_XSIZE_TFT, 0, 0,       // DT
					   LCD_XSIZE_TFT, LCD_YSIZE_TFT,       // Data area (width * height)
					   20                                  // Alpha value (0~31)
					  );                                      	
					   
	// (1) Set canvas starting address 
	// (2) Use DMA command to retrieve picture data (pop-up window) from Flash, and
    //     then transmit those data to LT768x SDRAM from canvas starting address	
	Canvas_Image_Start_address(LAYER_0);                         
	LT768_DMA_24bit_Block(1, 0, 291, 134, 442, 332, 442, 0x0012c000);  // Display the pop-up window	
}


//----------------------------------------------------------- DashBoard -------------------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    TEST_DoubleTriangle                                                      */
/*                                                                                       */
/* Parameters:                                                                           */
/*                   x: Center X of the triangle                                         */
/*                   y: Center Y of the triangle                                         */
/*                  L1: Length of the longer side of the pointer                         */
/*                  L2: Length of the shorter side of the pointer                        */
/*                   H: Height of the triangle                                           */
/*                   A: Angle                                                            */
/*              color1: Filled color for 1st triangle                                    */
/*              color2: Filled color for 2nd triangle                                    */
/* Returns:     None                                                                     */
/* Description: Draw two solid triangles to act as a pointer of a meter                  */
/*---------------------------------------------------------------------------------------*/
void TEST_DoubleTriangle
(
 u16 x
,u16 y
,u16 L1
,u16 L2
,u16 H
,u16 a
,u16 color1
,u16 color2
)
{	
	float cos_x = 0;
	float sin_y = 0;
	
	u16 x1,y1,x2,y2,x3,y3,x4,y4;
	
	if(a<=90)     
	{
		cos_x = cos(a*(3.1415926/180));
		sin_y = sin(a*(3.1415926/180));
		x1 = x - L1*cos_x;
		y1 = y - L1*sin_y;
		
		x2 = x - H*sin_y;
		y2 = y + H*cos_x;
		
		x3 = x + H*sin_y;
		y3 = y - H*cos_x;
		
		x4 = x + L2*cos_x;
		y4 = y + L2*sin_y;
	}
	
	else if((a>90)&&(a<180))  
	{
		a = 180 - a;
		cos_x = cos(a*(3.1415926/180));
		sin_y = sin(a*(3.1415926/180));
		
		x1 = x + L1*cos_x;
		y1 = y - L1*sin_y;

		x2 = x - H*sin_y;
		y2 = y - H*cos_x;
		
		x3 = x + H*sin_y;
		y3 = y + H*cos_x;
		
		x4 = x - L2*cos_x;
		y4 = y + L2*sin_y;
	}
	 
	else if((a>=180)&&(a<270))  
	{
		a = a - 180;
		cos_x = cos(a*(3.1415926/180));
		sin_y = sin(a*(3.1415926/180));
		
		x1 = x + L1*cos_x;
		y1 = y + L1*sin_y;

		x2 = x + H*sin_y;
		y2 = y - H*cos_x;
		
		x3 = x - H*sin_y;
		y3 = y + H*cos_x;
		
		x4 = x - L2*cos_x;
		y4 = y - L2*sin_y;
	}
	
	else if((a>=270)&&(a<360))  
	{
		a = 360 - a;
		cos_x = cos(a*(3.1415926/180));
		sin_y = sin(a*(3.1415926/180));
		
		x1 = x - L1*cos_x;
		y1 = y + L1*sin_y;

		x2 = x + H*sin_y;
		y2 = y + H*cos_x;
		
		x3 = x - H*sin_y;
		y3 = y - H*cos_x;
		
		x4 = x + L2*cos_x;
		y4 = y - L2*sin_y;
	}
	
	LT768_DrawTriangle_Fill(x1,y1,x2,y2,x4,y4,color1);
	LT768_DrawTriangle_Fill(x1,y1,x3,y3,x4,y4,color2);
	
	LT768_DrawCircle_Fill(x,y,3,Red);
}

/*---------------------------------------------------------------------------------------*/
/* Function:    Meter_Pointer                                                            */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Demonstrate a meter pointer                                              */
/*---------------------------------------------------------------------------------------*/
void Meter_Pointer(void)
{
	// LAYER_0: Display layer
	// LAYER_1: Buffer layer for the background picture of a meter
    // LAYER_5: Buffer layer for the drawn pointer and the background picture 	
	
	int state1 = 0,     // Flag, 0: rotate clockwisely    1: rotate counterclockwisely
		flag1  = 0,     // Flag status changes when reach rotating boundry ( <=0, >=358, <=315, >=225 degree)  
        a1     = 315;   // Starting angle
	
	Select_Main_Window_16bpp();                           // Set main window color depth
	Main_Image_Start_Address(LAYER_0);				      // Set main window starting address - Display layer
	Main_Image_Width(LCD_XSIZE_TFT);                      // Set main window width
	Main_Window_Start_XY(0,0);                            // Set main window starting coordinate
	Canvas_Image_Start_address(LAYER_0);                  // Set canvas starting address
	Canvas_image_width(LCD_XSIZE_TFT);                    // Set canvas width
	Active_Window_XY(0,0);                                // Set active window starting coordinate
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);        // Set active window width and height
	
	// Retrieve the background picture from flash and display it to the TFT panel
	// Picture address in the SPI Flash: 0x00000000
	// Canvas start address: LAYER_0 (display layer)
	LT768_DMA_24bit_Block(1, 0, 0, 0, LCD_XSIZE_TFT, LCD_YSIZE_TFT, LCD_XSIZE_TFT, 0x00000000);
	
	// Copy the background picture from LAYER_0 to LAYER_1 which is the buffer layer of the background picture
	LT768_BTE_Memory_Copy(
	                      LAYER_0, LCD_XSIZE_TFT, 0, 0,    // S0 
	                      LAYER_1, LCD_XSIZE_TFT, 0, 0,    // S1
	                      LAYER_1, LCD_XSIZE_TFT, 0, 0,    // DT
	                      0x0c,                            // ROP code, 0x0c -> DT = S0
	                      LCD_XSIZE_TFT, LCD_YSIZE_TFT     // Data area (width * height)
						 );
	
	// Copy the pointer area from LAYER_1 to LAYER_5 which is the buffer layer of the pointer 
	// Pointer area -> left-top coordinate: (340, 105),  width * height: 340 * 340 
	LT768_BTE_Memory_Copy(
	                      LAYER_1, LCD_XSIZE_TFT, 340, 105,    // S0 
	                      LAYER_1, LCD_XSIZE_TFT, 340, 105,    // S1
	                      LAYER_5, LCD_XSIZE_TFT, 340, 105,    // DT
	                      0x0c,                                // ROP code, 0x0c -> DT = S0
	                      340, 340                             // Data area (width * height)
						 );
						 
	Canvas_Image_Start_address(LAYER_5);  // Set the canvas start address to LAYER_5 
	while(1)
	{
		//Draw a pointer to LAYER_5
		TEST_DoubleTriangle(510,280,170,20,15,a1,Blue,Blue2);  
		
		// Move the pointer data (LAYER_5) to display layer (LAYER_0)
		LT768_BTE_Memory_Copy(
	                          LAYER_5, LCD_XSIZE_TFT, 340, 105,    // S0 
	                          LAYER_1, LCD_XSIZE_TFT, 340, 105,    // S1
	                          LAYER_0, LCD_XSIZE_TFT, 340, 105,    // DT
	                          0x0c,                                // ROP code, 0x0c -> DT = S0
	                          340, 340                             // Data area (width * height)
						     );
		
		// Following condition loop allows the pointer to be drawn between 315 and 225 degrees 
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
		
		// Refresh the background picture (only the area overlapped with the pointer) 
		// before drawing the next pointer  
		LT768_BTE_Memory_Copy(
							  LAYER_1, LCD_XSIZE_TFT, 340, 105,    // S0, left-top address (340, 105) 
	                          LAYER_1, LCD_XSIZE_TFT, 340, 105,    // S1, left-top address (340, 105)
	                          LAYER_5, LCD_XSIZE_TFT, 340, 105,    // DT, left-top address (340, 105)
	                          0x0c,                                // ROP code, 0x0c -> DT = S0
	                          340, 340                             // Area overlapped with the pointer  
						     );
	}		
}
//-----------------------------------------------------------------------------------------------------------------------


//----------------------------------------------- Gif Animation ---------------------------------------------------------

/*---------------------------------------------------------------------------------------*/
/* Function:    Gif_Demo                                                                 */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Display gif animation                                                    */
/*---------------------------------------------------------------------------------------*/
void Gif_Demo(void)
{
	int i;                       // counter for loop operation
	unsigned short gif_W = 512;  // Gif width
	unsigned short gif_H = 300;  // Gif height
	
	Select_Main_Window_16bpp();                           // Set main window color depth
	Main_Image_Start_Address(LAYER_0);				      // Set main window starting address - Display layer
	Main_Image_Width(LCD_XSIZE_TFT);                      // Set main window width
	Main_Window_Start_XY(0,0);                            // Set main window starting coordinate
	Canvas_Image_Start_address(LAYER_0);                  // Set canvas starting address
	Canvas_image_width(LCD_XSIZE_TFT);                    // Set canvas width
	Active_Window_XY(0,0);                                // Set active window starting coordinate
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);        // Set active window width and height
	
	// Clear display layer (SDRAM)
	LT768_DrawSquare_Fill(0, 0, LCD_XSIZE_TFT, LCD_YSIZE_TFT, Black); 
	
	while(1)
	{
		// The example gif is broken down into 44 frames, each of them is 512*300*2 bytes
		for(i = 0; i < 44; i++)
		{
			// Retrieve each of the picture data from Flash, and store the picture data to display layer 
			LT768_DMA_24bit_Block(1, 0, 256, 150, gif_W, gif_H, gif_W, gif_W*gif_H*2*i); 
	    }
    }
}


//------------------------------------------------ Circular Progress Bar ------------------------------------------------
// This example utilizes pictures with 800*480 resolution.

/*---------------------------------------------------------------------------------------*/
/* Function:    Fill_Black_Color                                                         */
/*                                                                                       */
/* Parameters:                                                                           */
/*                  X: X center of the circular progress bar                             */
/*                  Y: Y center of the circular progress bar                             */
/*                  R: Radius of the circular progress bar                               */
/*              angle: rotation angle (progress)                                         */
/* Returns:     None                                                                     */
/* Description: Fill black color to designated area, based on the rotation angle         */
/*---------------------------------------------------------------------------------------*/
void Fill_Black_Color(unsigned short X,unsigned short Y,unsigned short R,unsigned short angle)
{
	float a = 0;
	float tan_x = 0;
	float tan_y = 0;
	int x,y;
	
	a = angle;
	if(a<=180)
	{
		LT768_DrawSquare_Fill(X,Y-R,X+R,Y+R,Black); // Fill black color to the area of 180~360 degree
		
		if(a<=45)
		{
			tan_x = tan(a*(3.1415926/180));
			x = X - (R)*tan_x;
			LT768_DrawPentagon_Fill(X-R,Y-R, X,Y-R,  X,Y,  x,Y+R,  X-R,Y+R ,Black);
		}
		else if((a>45)&&(a<=90))
		{
			tan_y = R*tan((90-a)*(3.1415926/180));
			y = Y + tan_y;
			LT768_DrawQuadrilateral_Fill(X-R,Y-R, X,Y-R, X,Y, X-R,y,Black);
			
		}
		else if((a>90)&&(a<=135))
		{
			tan_y = R*tan((a-90)*(3.1415926/180));
			y = Y - tan_y;
			LT768_DrawQuadrilateral_Fill(X-R,Y-R, X,Y-R, X,Y, X-R,y,Black);
		}
		else if((a>135)&&(a<=180))
		{
			tan_x = R*tan((180-a)*(3.1415926/180));
			x = X - tan_x;
		
			LT768_DrawTriangle_Fill(x,Y-R,  X,Y-R,  X,Y,  Black);
		}
	}
	else
	{
		if((a>180)&&(a<=225))
		{
			tan_x = R*tan((a-180)*(3.1415926/180));
			x = X + tan_x;
			LT768_DrawPentagon_Fill(X,Y,  x,Y-R,  X+R,Y-R,  X+R,Y+R,  X,Y+R ,Black);	

		}
		else if((a>225)&&(a<=270))
		{
			tan_y = R*tan((270-a)*(3.1415926/180));
			y = Y - tan_y;
			LT768_DrawQuadrilateral_Fill(X,Y, X+R,y, X+R,Y+R, X,Y+R,Black);

		}
		else if((a>270)&&(a<=315))
		{
			tan_y = R*tan((a-270)*(3.1415926/180));
			y = Y + tan_y;
			LT768_DrawQuadrilateral_Fill(X,Y, X+R,y, X+R,Y+R, X,Y+R,Black);		
		}
		else if((a>315)&&(a<=360))
		{
			tan_x = R*tan((360-a)*(3.1415926/180));
			x = X + tan_x;
			LT768_DrawTriangle_Fill(X,Y,  x,Y+R,  X,Y+R,  Black);

		}
	}	
}


/*---------------------------------------------------------------------------------------*/
/* Function:    Show_DoubleCircular                                                      */
/*                                                                                       */
/* Parameters:  None                                                                     */
/* Returns:     None                                                                     */
/* Description: Display two circular progress bars                                       */
/*---------------------------------------------------------------------------------------*/
/*
{800, 480, 0x00000000, 0x000BB800},//Base.bmp
{800, 480, 0x000BB800, 0x000BB800},//Inside.bmp
{800, 480, 0x00177000, 0x000BB800},//Outside.bmp
*/
// LAYER_3: (1) Store the processed data of internal progress bar; (2) Remove background, then copy to LAYER_2
// LAYER_4: (1) Store the processed data of external progress bar; (2) Remove background, then copy to LAYER_2
// LAYER_2: Finally copy the data of LAYER2 to display layer (LAYER_1)
// Circle center: The two circular progress bars shares the same center, (266, 266) 
void Show_DoubleCircular(unsigned short in_angle,unsigned short out_angle)  
{
	LT768_BTE_Memory_Copy(LAYER_5,LCD_XSIZE_TFT,23,23, LAYER_5,LCD_XSIZE_TFT,23,23, LAYER_2,LCD_XSIZE_TFT,23,23, 0x0c,486,457);
	
	Canvas_Image_Start_address(LAYER_3);
	LT768_BTE_Memory_Copy(LAYER_6,LCD_XSIZE_TFT,104,104, LAYER_6,LCD_XSIZE_TFT,104,104, LAYER_3,LCD_XSIZE_TFT,104,104, 0x0c,324,324);
	Fill_Black_Color(266,266,162,in_angle);
	LT768_BTE_Memory_Copy_Chroma_key(
									 LAYER_3,LCD_XSIZE_TFT,104,104,  // Copy non-black data in the designated area of LAYER_3
								     LAYER_2,LCD_XSIZE_TFT,104,104,  // to LAYER_2
									 Black,324,324
	                                );
	
	Canvas_Image_Start_address(LAYER_4);
	LT768_BTE_Memory_Copy(LAYER_7,LCD_XSIZE_TFT,23,23, LAYER_7,LCD_XSIZE_TFT,23,23, LAYER_4,LCD_XSIZE_TFT,23,23, 0x0c,486,457);
	LT768_DrawCircle_Fill(266,266,162,Black);                        // Fill black color to the internal progress bar area
	Fill_Black_Color(266,266,243,out_angle);
	LT768_BTE_Memory_Copy_Chroma_key(
	                                 LAYER_4,LCD_XSIZE_TFT,23,23,    // Copy non-black data in the designated area of LAYER_4
								     LAYER_2,LCD_XSIZE_TFT,23,23,    // to LAYER_2
									 Black,486,457
	                                );
									
	// Renew the display layer by updated data in LAYER_2
	LT768_BTE_Memory_Copy(LAYER_2,LCD_XSIZE_TFT,23,23, LAYER_2,LCD_XSIZE_TFT,23,23, LAYER_1,LCD_XSIZE_TFT,23,23,  0x0c,486,457);
}


/*----------------------------------------------------------------------------------------*/
/* Function:    CircularProgressBar                                                       */
/*                                                                                        */
/* Parameters:  None                                                                      */
/* Returns:     None                                                                      */
/* Description:                                                                           */ 
/*             (1) Load background & progress bar pictures to SDRAM layers                */
/*             (2) Process these data and update the display by designated angles in loop */
/*----------------------------------------------------------------------------------------*/
void CircularProgressBar(void)
{
	// LAYER_1: Display layer - Load background picture (800*480)
	// LAYER_2: Load the background picture, only for 510*480 
	// LAYER_3: Load the internal progress bar picture, only for 510*480
	// LAYER_4: Load the external progress bar picture only for 510*480
    // LAYER_5: Buffer for LAYER_2
    // LAYER_6: Buffer for LAYER_3
    // LAYER_7: Buffer for LAYER_4
	
	int i = 36 ;      // Start angle of the internal progress bar
	int	j = 257;      // Start angle of the external progress bar
	
	Select_Main_Window_16bpp();                             // Set main window color depth
	Main_Image_Start_Address(LAYER_1);	                    // Set main window start address - Display layer			
	Main_Image_Width(LCD_XSIZE_TFT);                        // Set main window width
	Main_Window_Start_XY(0,0);                              // Set main window start coordinate 
	Canvas_Image_Start_address(LAYER_1);                    // Set canvas start address
	Canvas_image_width(LCD_XSIZE_TFT);                      // Set canvas width
    Active_Window_XY(0,0);                                  // Set active window start coordinate
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);          // Set active window area
	LT768_DMA_24bit_Block(1,0,0,0,800,480,800,0);           // Load the background piccture from the flash
	
	Canvas_Image_Start_address(LAYER_2);                    
	Canvas_image_width(LCD_XSIZE_TFT);                       
	LT768_DMA_24bit_Block(1,0,0,0,510,480,800,0);           // Load the dynamic area of background picture to  
	Canvas_Image_Start_address(LAYER_5);                    // LAYER_2 & LAYER_5
	Canvas_image_width(LCD_XSIZE_TFT);
	LT768_DMA_24bit_Block(1,0,0,0,510,480,800,0); 
	
	Canvas_Image_Start_address(LAYER_3);    
	Canvas_image_width(LCD_XSIZE_TFT);
	LT768_DMA_24bit_Block(1,0,0,0,510,480,800,800*480*2);   // Load the dynamic area of internal progress bar picture to
	Canvas_Image_Start_address(LAYER_6);                    // LAYER_3 & LAYER_6
	Canvas_image_width(LCD_XSIZE_TFT);
	LT768_DMA_24bit_Block(1,0,0,0,510,480,800,800*480*2);   

	Canvas_Image_Start_address(LAYER_4);    
	Canvas_image_width(LCD_XSIZE_TFT);
	LT768_DMA_24bit_Block(1,0,0,0,510,480,800,800*480*2*2); // Load the dynamic area of external progress bar picture to 	
	Canvas_Image_Start_address(LAYER_7);                    // LAYER_4 & LAYER_7
	Canvas_image_width(LCD_XSIZE_TFT);
	LT768_DMA_24bit_Block(1,0,0,0,510,480,800,800*480*2*2); 
	
	while(1)
	{
		Show_DoubleCircular(i,j);// Refresh circular progress bars
		
		i+=10;            		 // Refresh step: 15 degree
		if(i>257) i = 36;  		 // Once reach the maximum angle, reset to the start angle
		j-=10;                   // Refresh step: 15 degree
		if(j<36) j = 257;        // Once reach the minimum angle, reset to the start angle
	}
}
//-----------------------------------------------------------------------------------------------------------------------

//--------------------------------------------------- Picture-in-Picture ------------------------------------------------

/*----------------------------------------------------------------------------------------*/
/* Function:    PIP_Demo                                                                  */
/*                                                                                        */
/* Parameters:  None                                                                      */
/* Returns:     None                                                                      */
/* Description: Display two sub-images(icon) by PIP functions                             */
/*----------------------------------------------------------------------------------------*/
void PIP_Demo(void)
{
	Select_Main_Window_16bpp();                             // Set main window color depth
	Main_Image_Start_Address(LAYER_0);	                    // Set main window start address - Display layer			
	Main_Image_Width(LCD_XSIZE_TFT);                        // Set main window width
	Main_Window_Start_XY(0,0);                              // Set main window start coordinate 
	Canvas_Image_Start_address(LAYER_0);                    // Set canvas start address
	Canvas_image_width(LCD_XSIZE_TFT);                      // Set canvas width
    Active_Window_XY(0,0);                                  // Set active window start coordinate
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);          // Set active window area
	
	// Load the background picture to display layer
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,0);
	
	// Load 1st sub-image
	Canvas_Image_Start_address(LAYER_1); 
	Canvas_image_width(134);
	LT768_DMA_24bit_Block(1,0,0,0,134,134,134,0x000bb800);
	
	// Load 2nd sub-image
	Canvas_Image_Start_address(LAYER_2);
	Canvas_image_width(276);
	LT768_DMA_24bit_Block(1,0,0,0,276,206,276,0x000c4448);
	
	// Initialize PIP
	LT768_PIP_Init(1,1,LAYER_1,0,0,134,0,173,134,134);
	LT768_PIP_Init(1,2,LAYER_2,0,0,276,524,137,276,206);
		
	// Display two PIPs in loop
	while(1)
	{		
		for(int i = 0; i < 524; i += 2)
		{
			LT768_Set_DisWindowPos(1, 1, i, 173);       // Move PIP1 from left to right
			LT768_Set_DisWindowPos(1, 2, 524-i, 137);   // Move PIP2 from right to left
			delay_ms(15);
		}
		
		for(int i = 0; i < 524; i += 2)
		{
			LT768_Set_DisWindowPos(1, 1, 524-i, 173);   // Move PIP1 from right to left
			LT768_Set_DisWindowPos(1, 2, i, 137);       // Move PIP2 from left to right
			delay_ms(15);
		}
	}
}

/*----------------------------------------------------------------------------------------*/
/* Function:    Print_Unicode                                                             */
/*                                                                                        */
/* Parameters:  None                                                                      */
/* Returns:     None                                                                      */
/* Description: Print graphic text coded by unicode                                       */
/*----------------------------------------------------------------------------------------*/
void Print_Unicode(void)
{	
	// 風のリズムで推理が冴える,
	char L1[26] = {0x98,0xA8,0x30,0x6E,0x30,0xEA,0x30,0xBA,0x30,0xE0,0x30,0x67,
				   0x63,0xA8,0x74,0x06,0x30,0x4C,0x51,0xB4,0x30,0x48,0x30,0x8B,
		           0x30,0x01};
	
	// 黒い鏡もほぐれて見える!
	char L2[24] = {0x9E,0xD2,0x30,0x44,0x93,0xE1,0x30,0x82,0x30,0x7B,0x30,0x50,
		           0x30,0x8C,0x30,0x66,0x89,0x8B,0x30,0x48,0x30,0x8B,0x00,0x21};
	
	// たった一つの真実見抜く,
	char L3[38] = {0x30,0x5F,0x30,0x63,0x30,0x5F,0x4E,0x00,0x30,0x64,0x30,0x6E,
		           0x77,0x1F,0x5B,0x9F,0x89,0x8B,0x62,0x9C,0x30,0x4F,0x30,0x01};
	
	// 見た目は子供,ずのうはおとな,
	char L4[40] = {0x89,0x8B,0x30,0x5F,0x76,0xEE,0x30,0x6F,0x5B,0x50,0x4F,0x9B,
		           0x30,0x01,0x30,0x5A,0x30,0x6E,0x30,0x46,0x30,0x6F,0x30,0x4A,
		           0x30,0x68,0x30,0x6A,0x30,0x01};
	
	// その名は,名探偵コナン!
	char L5[24] = {0x30,0x5D,0x30,0x6E,0x54,0x0D,0x30,0x6F,0x30,0x01,0x54,0x0D,
		           0x63,0xA2,0x50,0x75,0x30,0xB3,0x30,0xCA,0x30,0xF3,0x00,0x21};
	
	// しんじつはいつもひとつ
     char c[22] = {0x30,0x57,0x30,0x93,0x30,0x58,0x30,0x64,0x30,0x6F,0x30,0x44,
	               0x30,0x64,0x30,0x82,0x30,0x72,0x30,0x68,0x30,0x64};
			   
	
	Select_Main_Window_16bpp();                             // Set main window color depth
	Main_Image_Start_Address(LAYER_0);	                    // Set main window start address - Display layer			
	Main_Image_Width(LCD_XSIZE_TFT);                        // Set main window width
	Main_Window_Start_XY(0,0);                              // Set main window start coordinate 
	Canvas_Image_Start_address(LAYER_3);                    // Set canvas start address
	Canvas_image_width(LCD_XSIZE_TFT);                      // Set canvas width
    Active_Window_XY(0,0);                                  // Set active window start coordinate
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);          // Set active window area
	
	// Load the background picture to Layer_3 as a backup of the basemap
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,0);
	
	// Copy the basemap to display layer to display it
	LT768_BTE_Memory_Copy(LAYER_3, LCD_XSIZE_TFT, 0, 0,
				          LAYER_3, LCD_XSIZE_TFT, 0, 0,
						  LAYER_0, LCD_XSIZE_TFT, 0, 0,
				          0x0c, LCD_XSIZE_TFT, LCD_YSIZE_TFT);
	
	// Print the font - 0x000BB800 is the starting address (flash) of the 32x32 unicode font
	LT768_Print_Font_Unicode(0x000BB800, 100, 124, 26/2*32, Yellow, Red, 1, 26, L1); delay_ms(500);
    LT768_Print_Font_Unicode(0x000BB800, 260, 180, 24/2*32, Yellow, Red, 1, 24, L2); delay_ms(500);
	LT768_Print_Font_Unicode(0x000BB800, 100, 236, 38/2*32, Yellow, Red, 1, 38, L3); delay_ms(500);
	LT768_Print_Font_Unicode(0x000BB800, 260, 292, 40/2*32, Yellow, Red, 1, 40, L4); delay_ms(500);
	LT768_Print_Font_Unicode(0x000BB800, 220, 360, 24/2*32, White,  Red, 1, 24, L5); 	
}

/*----------------------------------------------------------------------------------------*/
/* Function:    Scrolling_Picture                                                         */
/*                                                                                        */
/* Parameters:  None                                                                      */
/* Returns:     None                                                                      */
/* Description: Scroll image from bottom to top                                           */
/*----------------------------------------------------------------------------------------*/
void Scrolling_Picture(void)
{
	Select_Main_Window_16bpp();                             // Set main window color depth
	Main_Image_Start_Address(LAYER_0);	                    // Set main window start address - Display layer			
	Main_Image_Width(LCD_XSIZE_TFT);                        // Set main window width
	Main_Window_Start_XY(0,0);                              // Set main window start coordinate 
	Canvas_Image_Start_address(LAYER_0);                    // Set canvas start address
	Canvas_image_width(LCD_XSIZE_TFT);                      // Set canvas width
    Active_Window_XY(0,0);                                  // Set active window start coordinate
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);          // Set active window area
	
	// Load the 800x480 picture to display layer to show as the background
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT,LCD_YSIZE_TFT,LCD_XSIZE_TFT,0);
	
	// Load the 420x322 picture to LAYER_3
	Canvas_Image_Start_address(LAYER_3);
	Canvas_image_width(420);
	LT768_DMA_24bit_Block(1,0,0,0,420,322,420,0x000bb800);  // 0x000bb800 is the start address of the picture in Flash.
	
	while(1)
	{
		// Use LAYER_2 as the buffer layer of LAYER_3, and move the data location every 3 rows at a time
		// 
		// 1. Copy the top 3 rows data of the scrolling picture on LAYER_3 to the bottom of the picture in LAYER_2
		LT768_BTE_Memory_Copy(LAYER_3, 420, 0, 0,
							  LAYER_3, 420, 0, 0,
						      LAYER_2, 420, 0, 322-3,
				              0x0c, 420, 3);
		
		// 2. Copy the rest of the picture data on LAYER_3 to the top of LAYER_2
		LT768_BTE_Memory_Copy(LAYER_3, 420, 0, 3,
							  LAYER_3, 420, 0, 3,
						      LAYER_2, 420, 0, 0,
				              0x0c, 420, 322-3);
		
		// 3. Copy the processed data back to LAYER_3, for next loop processing
		LT768_BTE_Memory_Copy(LAYER_2, 420, 0, 0,
							  LAYER_2, 420, 0, 0,
						      LAYER_3, 420, 0, 0,
				              0x0c, 420, 322);
		
		// 4. Copy the processed data to LAYER_0 for displaying
		LT768_BTE_Memory_Copy(LAYER_2, 420, 0, 0,
							  LAYER_2, 420, 0, 0,
						      LAYER_0, 800, 190, 90,
				              0x0c, 420, 322);
	}
}

/*----------------------------------------------------------------------------------------*/
/* Function:    MCU_Write_Flash                                                           */
/*                                                                                        */
/* Parameters:  None                                                                      */
/* Returns:     None                                                                      */
/* Description: MCU write data to flash through LT768x                                    */
/*----------------------------------------------------------------------------------------*/
void MCU_Write_Flash(void)
{
	//Test Data: Yellow color -> 0xFFE0
	u8 pBuf[256] = {
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF
	};	
	
	Select_Main_Window_16bpp();                             // Set main window color depth
	Main_Image_Start_Address(LAYER_0);	                    // Set main window start address - Display layer			
	Main_Image_Width(LCD_XSIZE_TFT);                        // Set main window width
	Main_Window_Start_XY(0,0);                              // Set main window start coordinate 
	Canvas_Image_Start_address(LAYER_0);                    // Set canvas start address
	Canvas_image_width(LCD_XSIZE_TFT);                      // Set canvas width
    Active_Window_XY(0,0);                                  // Set active window start coordinate
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);          // Set active window area
	
	// Display a full black screen
	LT768_DrawSquare_Fill(0, 0, LCD_XSIZE_TFT, LCD_YSIZE_TFT, Black);
						  
	// Initialize SPI interface - the one connected to the flash chip
	LT768_SPI_Init(1,1);                                   
	
	// Erase SPI Flash chip - This may take some time
	W25QXX_Erase_Chip();
	
	// Write pBuf to SPI Flash - Following example is for 800x480 display, the full data bytes = 800x480x2 = 768000
	// Write a full screen of yellow color (0xFFE0)
	for(int i = 0; i <768000; i += 256)
	{	
		W25QXX_Write_Page(pBuf, i, 256);  //Write 256bytes at a time		
	}

	// Use DMA function to retrieve the flash data and display it onto the panel 
	LT768_DMA_24bit_Block(1,0,0,0,LCD_XSIZE_TFT, LCD_YSIZE_TFT, LCD_XSIZE_TFT,0);
}

/*----------------------------------------------------------------------------------------*/
/* Function:    MCU_Write_Memory                                                          */
/*                                                                                        */
/* Parameters:  None                                                                      */
/* Returns:     None                                                                      */
/* Description: MCU write data to LT768x SDRAM memory                                     */
/*----------------------------------------------------------------------------------------*/
void MCU_Write_Memory(void)
{
	int i, j;
	//Test Data: Yellow color -> 0xFFE0, total 128*2 bytes
	u8 pBuf[256] = {
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,
		0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF,0xE0,0xFF
	};	
	
	Select_Main_Window_16bpp();                             // Set main window color depth
	Main_Image_Start_Address(LAYER_0);	                    // Set main window start address - Display layer			
	Main_Image_Width(LCD_XSIZE_TFT);                        // Set main window width
	Main_Window_Start_XY(0,0);                              // Set main window start coordinate 
	Canvas_Image_Start_address(LAYER_0);                    // Set canvas start address
	Canvas_image_width(LCD_XSIZE_TFT);                      // Set canvas width
    Active_Window_XY(0,0);                                  // Set active window start coordinate
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);          // Set active window area
	
	// Display a full black screen
	LT768_DrawSquare_Fill(0, 0, LCD_XSIZE_TFT, LCD_YSIZE_TFT, Black);
	
	// Demo - Write one byte at a time 
	// pBuf has 128*2 bytes -> write 16bpp data for 16*8 times, data width = 16; data height = 8 
	for(i = 0; i < (LCD_YSIZE_TFT/8); i++)
	   for(j = 0; j < (LCD_XSIZE_TFT/16); j++)
			MPU8_16bpp_Memory_Write(j*16, i*8, 16, 8, pBuf);    
	
	// Clear the screen by displaying a full black screen
	Active_Window_XY(0,0);                                  // Reset active window start coordinate
	Active_Window_WH(LCD_XSIZE_TFT,LCD_YSIZE_TFT);          // Reset active window area
	LT768_DrawSquare_Fill(0, 0, LCD_XSIZE_TFT, LCD_YSIZE_TFT, Black);
	delay_ms(1000);

	// Demo - Continuous data write
	for(i = 0; i < (LCD_YSIZE_TFT/8); i++)
	   for(j = 0; j < (LCD_XSIZE_TFT/16); j++)
			MPU8_16bpp_Memory_Write_Continuous(j*16, i*8, 16, 8, pBuf);
}
