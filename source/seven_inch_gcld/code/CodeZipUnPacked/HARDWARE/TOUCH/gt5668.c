#include "gt5668.h"
#include "touch.h"
#include "ctiic.h"
#include "usart.h"
#include "delay.h" 
#include "string.h" 

//GT5668配置数组表

#if 1

//x坐标输出最大值0x0140=320
//y坐标输出最大值0x01E0=480
//0x48=72
//0x8050~0x813B  239个寄存器
//0x813C 0x813D校验和
//0x813E 配置更新标记
const u8 GT5668_CFG_TBL[]=
{ 
	0x48,0x40,0x01,0xE0,0x01,0x05,0x75,0x14,0x00,0x40,
	0x00,0x0A,0x55,0x3C,0x53,0x11,0x01,0x01,0x00,0x00,
	0x14,0x18,0x1A,0x1E,0x0F,0x04,0x00,0x00,0x10,0x10,
	0x00,0x20,0x00,0x00,0x28,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x64,0x1E,0x28,0x88,0x27,0x0A,0x27,
	0x25,0x12,0x0C,0x60,0x12,0x60,0x11,0x03,0x27,0x00,
	0x00,0x1E,0x50,0x80,0x02,0x03,0x00,0x00,0x53,0xD6,
	0x26,0xAF,0x2E,0x94,0x37,0x80,0x3F,0x72,0x47,0x67,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x32,0x20,0x32,0x32,0x64,0x00,0x00,0x00,0x00,0x00,
	0x02,0x09,0x03,0x0A,0x04,0x0B,0x05,0x0C,0x06,0x0D,
	0xFF,0xFF,0xFF,0xFF,0x00,0x01,0x02,0x03,0x04,0x05,
	0x06,0x0E,0x0D,0x0C,0x0B,0x0A,0x09,0x08,0x07,0xFF,
	0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,
	0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x30,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0xFF,0x04,
	0x33,0x02,0xF4,0x0A,0xBA,0x00,0x19,0x7F,0x44,0x28,
	0x46,0x32,0x50,0x00,0x00,0x12,0x50,0x23,0x01
};  
#endif



u16 CRC16(u8 *srcdata,u16 length)
{
	u16 crc=0xffff;
	u16 i,j;
	u8 value;
	for(i=0;i<length;i++)
	{
		for(j=0;j<8;j++)
		{
			value=((srcdata[i]<<j)&0x80)^((crc&0x8000)>>8);	
			crc<<=1;
			if(value!=0)
			{
				crc^=0x8005;
			}
		}
	}
	return crc;
}
//发送GT5668配置参数
//mode:0,参数不保存到flash
//     1,参数保存到flash
u8 GT5668_Send_Cfg(u8 mode)
{

	u16 checksum=0;
	u8 buf[3];
	u8 i=0;	
	for(i=0;i<(sizeof(GT5668_CFG_TBL)-3);i+=2)
		checksum +=((GT5668_CFG_TBL[i]<<8)|GT5668_CFG_TBL[i+1]);//计算校验和  0xafdd
		//checksum +=(GT5668_CFG_TBL[i]<<8)+GT5668_CFG_TBL[i+1];
	//checksum =0-checksum;
	 checksum =(~checksum)+1;
	//printf("Bytesum:%d,\r\n",sizeof(GT5668_CFG_TBL));
	printf("chksum:0x%x,\r\n",checksum);
	buf[0]= checksum>>8;
	buf[1]= checksum;
	buf[2]= mode;	//是否写入到GT5668 FLASH?  即是否掉电保存
	//printf("chksum_H:0x%x,\r\n",buf[0]);
	//printf("chksum_L:0x%x,\r\n",buf[1]);
	//printf("\r\ncrc=%x",CRC16((u8*)GT5668_CFG_TBL,sizeof(GT5668_CFG_TBL)));
	//GT5668_WR_Reg(GT_CFGS_REG,(u8*)GT5668_CFG_TBL,sizeof(GT5668_CFG_TBL));//发送寄存器配置
	//GT5668_WR_Reg(GT_CHECK_REG,buf,3);//写入校验和,和配置更新标记
	return 0;

} 

//发送GT5668配置参数
//mode:0,参数不保存到flash
//     1,参数保存到flash
u8 GT5668_Send_Cfg1(u8 mode)
{

	u16 checksum=0;
	u8 buf[3];
	u8 i=0;	
	for(i=0;i<(sizeof(GT5668_CFG_TBL)-3);i+=2)
		checksum +=(GT5668_CFG_TBL[i]<<8)+GT5668_CFG_TBL[i+1];//计算校验和
	checksum =0-checksum;
	//printf("Bytesum:%d,\r\n",sizeof(GT5668_CFG_TBL));
	printf("chksum:0x%x,\r\n",checksum);
	buf[0]= checksum>>8;
	buf[1]= checksum;
	buf[2]= mode;	//是否写入到GT5668 FLASH?  即是否掉电保存
	//printf("chksum_H:0x%x,\r\n",buf[0]);
	//printf("chksum_L:0x%x,\r\n",buf[1]);
	//printf("\r\ncrc=%x",CRC16((u8*)GT5668_CFG_TBL,sizeof(GT5668_CFG_TBL)));
	//GT5668_WR_Reg(GT_CFGS_REG,(u8*)GT5668_CFG_TBL,sizeof(GT5668_CFG_TBL));//发送寄存器配置
	//GT5668_WR_Reg(GT_CHECK_REG,buf,3);//写入校验和,和配置更新标记
	return 0;

} 


//向GT5668写入一次数据
//reg:起始寄存器地址
//buf:数据缓缓存区
//len:写数据长度
//返回值:0,成功;1,失败.
u8 GT5668_WR_Reg(u16 reg,u8 *buf,u8 len)
{
	u8 i;
	u8 ret=0;
	CT_IIC_Start();	
 	CT_IIC_Send_Byte(GT_CMD_WR);   	//发送写命令 	  0x28
	CT_IIC_Wait_Ack();
	CT_IIC_Send_Byte(reg>>8);   	//发送高8位地址
	CT_IIC_Wait_Ack(); 	 										  		   
	CT_IIC_Send_Byte(reg&0XFF);   	//发送低8位地址
	CT_IIC_Wait_Ack();  
	for(i=0;i<len;i++)
	{	   
    	CT_IIC_Send_Byte(buf[i]);  	//发数据
		ret=CT_IIC_Wait_Ack();
		if(ret)break;  
	}
    CT_IIC_Stop();					//产生一个停止条件	    
	return ret; 
}
//从GT5668读出一次数据
//reg:起始寄存器地址
//buf:数据缓缓存区
//len:读数据长度			  
void GT5668_RD_Reg(u16 reg,u8 *buf,u8 len)
{
	u8 i; 
 	CT_IIC_Start();	
 	CT_IIC_Send_Byte(GT_CMD_WR);   //发送写命令 	0x28 
	CT_IIC_Wait_Ack();
 	CT_IIC_Send_Byte(reg>>8);   	  //发送高8位地址
	CT_IIC_Wait_Ack(); 	 										  		   
 	CT_IIC_Send_Byte(reg&0XFF);   	//发送低8位地址
	CT_IIC_Wait_Ack();  
 	CT_IIC_Start();  	 	   
	CT_IIC_Send_Byte(GT_CMD_RD);   //发送读命令	0x29
	CT_IIC_Wait_Ack();	   
	for(i=0;i<len;i++)
	{	   
    	buf[i]=CT_IIC_Read_Byte(i==(len-1)?0:1); //发数据	  
	} 
    CT_IIC_Stop();//产生一个停止条件    
} 
//初始化GT5668触摸屏
//返回值:0,初始化成功;1,初始化失败 
u8 GT5668_Init(void)
{
	u8 temp[5]; 
	u8 i=0;
	u8 Cfg_Info[239] = {0};
	GPIO_InitTypeDef  GPIO_InitStructure;	
	
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB|RCC_AHB1Periph_GPIOC, ENABLE);//使能GPIOB,C时钟

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1 ;//PB1设置为上拉输入
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;//输入模式
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;//推挽输出
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;//100MHz
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;//上拉
	GPIO_Init(GPIOB, &GPIO_InitStructure);//初始化
		
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13;//PC13设置为推挽输出
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;//输出模式
	GPIO_Init(GPIOC, &GPIO_InitStructure);//初始化	
	
	CT_IIC_Init();      	//初始化电容屏的I2C总线  
	GT_RST=0;				//复位
	delay_ms(10);
 	GT_RST=1;				//释放复位		    
	delay_ms(10); 
	
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1;//PB1设置为浮空输入
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;//输出模式
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOB, &GPIO_InitStructure);//初始化	
	
	delay_ms(100);  
	GT5668_RD_Reg(GT_PID_REG,temp,4);//读取产品ID
	temp[4]=0;
	printf("CTP ID:%s\r\n",temp);	//打印ID
	
	//GT5668_RD_Reg(GT_GSTID_REG,temp1,1);	//读取触摸点的状态
	//printf("0X814E:0x%x,\r\n",temp1[0]);
	
	//GT5668_RD_Reg(0x81A8,temp2,1);
	//printf("0X81A8:0x%x,\r\n",temp2[0]);
	
	if(strcmp((char*)temp,"5668")==0)//ID==9147
	{
		temp[0]=0X02;			
		//GT5668_WR_Reg(GT_CTRL_REG,temp,1);//软复位GT5668
		GT5668_RD_Reg(GT_CFGS_REG,temp,1);//读取GT_CFGS_REG寄存器
//		if(temp[0]<0X60)//默认版本比较低,需要更新flash配置
		{
			//printf("Default Ver:%d\r\n",temp[0]);
			printf("Default Ver:0x%x\r\n",temp[0]);
			//GT5668_Send_Cfg(1);//更新并保存配置
			
			//GT5668_RD_Reg(0x813C,temp,1);
			//printf("0x813C:0x%x\r\n",temp[0]);
			//GT5668_RD_Reg(0x813D,temp,1);
			//printf("0x813D:0x%x\r\n",temp[0]);
		}
		
		#if 1
		GT5668_RD_Reg(0x8050,Cfg_Info,239);	
		printf("Config Info:\r\n");
		for( i = 0; i < 239; i++ )
		{
		printf("0x%02X,",Cfg_Info[i]);
		if((i+1)%10==0)
		printf("\r\n");
		}
		printf("\r\n");
		#endif	
		
		
		//delay_ms(10);
		//temp[0]=0X00;	 
		//GT5668_WR_Reg(GT_CTRL_REG,temp,1);//结束复位 

		//GT5668_RD_Reg(GT_GSTID_REG,temp1,1);	//读取触摸点的状态
		//printf("0X814E:0x%x,\r\n",temp1[0]);
		return 0;
	} 
	return 1;
}
const u16 GT5668_TPX_TBL[5]={GT_TP1_REG,GT_TP2_REG,GT_TP3_REG,GT_TP4_REG,GT_TP5_REG};
//扫描触摸屏(采用查询方式)
//mode:0,正常扫描.
//返回值:当前触屏状态.
//0,触屏无触摸;1,触屏有触摸
u8 GT5668_Scan(u8 mode)
{
	
	u8 buf[4];
	//u8 temp2[1];
	u8 i=0;
	u8 res=0;
	u8 temp;
	u8 tempsta;
 	static u8 t=0;//控制查询间隔,从而降低CPU占用率   
	t++;
	if((t%10)==0||t<10)//空闲时,每进入10次CTP_Scan函数才检测1次,从而节省CPU使用率
	{
		GT5668_RD_Reg(GT_GSTID_REG,&mode,1);	//读取触摸点的状态
		//printf("0X814E:0x%x,\r\n",mode);
		//GT5668_RD_Reg(GT_GSTID_REG,temp2,1);
		//printf("0X814E:0x%x,\r\n",temp2[0]);
		//delay_ms(100);
 		if(mode&0X80&&((mode&0XF)<6))
		{
			temp=0;
			GT5668_WR_Reg(GT_GSTID_REG,&temp,1);//清标志 		
		}		
		if((mode&0XF)&&((mode&0XF)<6))
		{
			temp=0XFF<<(mode&0XF);		//将点的个数转换为1的位数,匹配tp_dev.sta定义 
			tempsta=tp_dev.sta;			//保存当前的tp_dev.sta值
			tp_dev.sta=(~temp)|TP_PRES_DOWN|TP_CATH_PRES; 
			tp_dev.x[4]=tp_dev.x[0];	//保存触点0的数据
			tp_dev.y[4]=tp_dev.y[0];
			for(i=0;i<5;i++)
			{
				if(tp_dev.sta&(1<<i))	//触摸有效?
				{
					GT5668_RD_Reg(GT5668_TPX_TBL[i],buf,4);	//读取XY坐标值
					if(tp_dev.touchtype&0X01)//横屏
					{
						tp_dev.y[i]=((u16)buf[1]<<8)+buf[0];
						tp_dev.x[i]=800-(((u16)buf[3]<<8)+buf[2]);
					}else
					{
						tp_dev.x[i]=((u16)buf[1]<<8)+buf[0];
						tp_dev.y[i]=((u16)buf[3]<<8)+buf[2];
					}  
					printf("x[%d]:%d,y[%d]:%d\r\n",i,tp_dev.x[i],i,tp_dev.y[i]);
				}			
			} 
			res=1;
			if(tp_dev.x[0]>320||tp_dev.y[0]>240)//非法数据(坐标超出了)
			{ 
				if((mode&0XF)>1)		//有其他点有数据,则复第二个触点的数据到第一个触点.
				{
					tp_dev.x[0]=tp_dev.x[1];
					tp_dev.y[0]=tp_dev.y[1];
					t=0;				//触发一次,则会最少连续监测10次,从而提高命中率
				}else					//非法数据,则忽略此次数据(还原原来的)  
				{
					tp_dev.x[0]=tp_dev.x[4];
					tp_dev.y[0]=tp_dev.y[4];
					mode=0X80;		
					tp_dev.sta=tempsta;	//恢复tp_dev.sta
				}
			}else t=0;					//触发一次,则会最少连续监测10次,从而提高命中率
		}
	}
	if((mode&0X8F)==0X80)//无触摸点按下
	{ 
		if(tp_dev.sta&TP_PRES_DOWN)	//之前是被按下的
		{
			tp_dev.sta&=~(1<<7);	//标记按键松开
		}else						//之前就没有被按下
		{ 
			tp_dev.x[0]=0xffff;
			tp_dev.y[0]=0xffff;
			tp_dev.sta&=0XE0;	//清除点有效标记	
		}	 
	} 	
	if(t>240)t=10;//重新从10开始计数
	return res;
	
}
 



























