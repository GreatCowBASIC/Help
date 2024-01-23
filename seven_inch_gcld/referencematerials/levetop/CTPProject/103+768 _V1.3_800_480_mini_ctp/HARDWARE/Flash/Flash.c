#include "Flash.h"
extern uint16_t SPI2_ReadWriteByte(uint16_t TxData);

uint8_t  W25Q256 = 0; 	 //256 NorFlash的标志 ，用于识别到256的时候开启4Byte 地址
uint8_t  Flash_type = 2;  //用于判断 是NorFlash(0) 或者 NandFlash(1)


//------------------------------------------------------- NorFlash -------------------------------------------------------------
//指令表
#define W25X_WriteEnable		0x06       
#define W25X_WriteDisable		0x04 
#define W25X_ReadStatusReg		0x05 
#define W25X_WriteStatusReg		0x01 
#define W25X_ReadData			0x03 
#define W25X_FastReadData		0x0B 
#define W25X_FastReadDual		0x3B 
#define W25X_PageProgram		0x02
#define W25X_BlockErase32KB		0x52
#define W25X_BlockErase64KB		0xD8 
#define W25X_SectorErase		0x20 
#define W25X_ChipErase			0xC7 
#define W25X_PowerDown			0xB9 
#define W25X_ReleasePowerDown	0xAB 
#define W25X_DeviceID			0xAB 
#define W25X_ManufactDeviceID	0x90 
#define W25X_JedecDeviceID		0x9F


//读取W25QXX的状态寄存器
//BIT7  6   5   4   3   2   1   0
//SPR   RV  TB BP2 BP1 BP0 WEL BUSY
//SPR:默认0,状态寄存器保护位,配合WP使用
//TB,BP2,BP1,BP0:FLASH区域写保护设置
//WEL:写使能锁定
//BUSY:忙标记位(1,忙;0,空闲)
//默认:0x00
uint8_t W25QXX_ReadSR(void)   //读取W25QXX的状态寄存器
{  
	uint8_t byte=0;   
	nSS_Active();                            		//使能器件   
	SPI_Master_FIFO_Data_Put(W25X_ReadStatusReg); 	//发送读取状态寄存器命令    
	byte=SPI_Master_FIFO_Data_Put(0xff);          	//读取一个字节  
	nSS_Inactive();                            		//取消片选     
	return byte;   
} 

	
//将WEL置位   
void W25QXX_Write_Enable(void)   //W25QXX写使能
{
	nSS_Active();                          			//使能器件   
    SPI_Master_FIFO_Data_Put(W25X_WriteEnable); 	//发送写使能  
	nSS_Inactive();                           		//取消片选     	      
} 
	
//将WEL清零  
void W25QXX_Write_Disable(void)   //W25QXX写禁止
{  
	nSS_Active();                            		//使能器件   
    SPI_Master_FIFO_Data_Put(W25X_WriteDisable); 	//发送写禁止指令    
	nSS_Inactive();                            		//取消片选     	      
} 		


void W25QXX_Wait_Busy(void)   		//等待空闲
{   
	while((W25QXX_ReadSR()&0x01)==0x01) ;  		// 等待BUSY位清空
}  
  
uint16_t W25QXX_ReadID(void)
{
	uint16_t Temp = 0;	  
	nSS_Active();				    
	SPI_Master_FIFO_Data_Put(0x90);//发送读取ID命令	    
	SPI_Master_FIFO_Data_Put(0x00); 	    
	SPI_Master_FIFO_Data_Put(0x00); 	    
	SPI_Master_FIFO_Data_Put(0x00); 	 			   
	Temp|=SPI_Master_FIFO_Data_Put(0xFF)<<8;  
	Temp|=SPI_Master_FIFO_Data_Put(0xFF);	 
	nSS_Inactive();				    
	return Temp;
}   		

void W25QXX_Read(uint8_t* pBuffer,uint32_t ReadAddr,uint16_t NumByteToRead)   
{ 
 	uint16_t i;   										    
	nSS_Active();                            			//使能器件   
    SPI_Master_FIFO_Data_Put(W25X_ReadData);         	//发送读取命令  

	if (W25Q256)
	SPI_Master_FIFO_Data_Put((uint8_t)((ReadAddr)>>24));  	//256Flash发送32bit地址
	
    SPI_Master_FIFO_Data_Put((uint8_t)((ReadAddr)>>16));  	//发送24bit地址    
    SPI_Master_FIFO_Data_Put((uint8_t)((ReadAddr)>>8));   
    SPI_Master_FIFO_Data_Put((uint8_t)ReadAddr);   
    for(i=0;i<NumByteToRead;i++)
	{ 
        pBuffer[i]=SPI_Master_FIFO_Data_Put(0XFF);   	//循环读数  
    }
	nSS_Inactive();  				    	      
} 

void W25QXX_Write_Page(uint8_t* pBuffer,uint32_t WriteAddr,uint16_t NumByteToWrite)
{
 	uint16_t i;  
    W25QXX_Write_Enable();                  							//SET WEL 
	nSS_Active();                            							//使能器件   
    SPI_Master_FIFO_Data_Put(W25X_PageProgram);      					//发送写页命令 

	if (W25Q256)
	SPI_Master_FIFO_Data_Put((uint8_t)((WriteAddr)>>24));  	//256Flash发送32bit地址
	
    SPI_Master_FIFO_Data_Put((uint8_t)((WriteAddr)>>16)); 					//发送24bit地址    
    SPI_Master_FIFO_Data_Put((uint8_t)((WriteAddr)>>8));   
    SPI_Master_FIFO_Data_Put((uint8_t)WriteAddr);
	
	
	#if STM32_SPI_8
		LCD_CmdWrite(0xB8);
		SS_RESET; 	      
		SPI2_ReadWriteByte(0x80);
	#endif
    for(i=0;i<NumByteToWrite;i++)
	{
			
		#if STM32_SPI_8
			SPI2_ReadWriteByte(pBuffer[i]);
		#else
			LCD_CmdWrite(0xB8);
			LCD_DataWrite(pBuffer[i]);
		#endif		
		
	}
	#if STM32_SPI_8
		SS_SET; 	      
	#endif
	nSS_Inactive();                            							//取消片选 
	W25QXX_Wait_Busy();					   								//等待写入结束
} 

void W25QXX_Write_NoCheck(uint8_t* pBuffer,uint32_t WriteAddr,uint16_t NumByteToWrite)   
{ 			 		 
	uint16_t pageremain;	   
	pageremain=256-WriteAddr%256; //单页剩余的字节数		 	    
	if(NumByteToWrite<=pageremain)pageremain=NumByteToWrite;//不大于256个字节
	while(1)
	{	   
		W25QXX_Write_Page(pBuffer,WriteAddr,pageremain);
		if(NumByteToWrite==pageremain)break;//写入结束了
	 	else //NumByteToWrite>pageremain
		{
			pBuffer+=pageremain;
			WriteAddr+=pageremain;	

			NumByteToWrite-=pageremain;			  //减去已经写入了的字节数
			if(NumByteToWrite>256)pageremain=256; //一次可以写入256个字节
			else pageremain=NumByteToWrite; 	  //不够256个字节了
		}
	}
} 
void W25QXX_BlockErase64KB(uint32_t addr)   
{    
	addr*=(64*1024);
	W25QXX_Write_Enable();                 	 	  //SET WEL 
	W25QXX_Wait_Busy();   
	nSS_Active();                            	  //使能器件   
	SPI_Master_FIFO_Data_Put(W25X_BlockErase64KB);  //发送64KB块擦除命令 

	if (W25Q256)
	SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>24));  	//256Flash发送32bit地址

	SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>16)); 	  //发送24bit地址    
	SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>8));   
	SPI_Master_FIFO_Data_Put((uint8_t)addr);  			  //发送块地址
	nSS_Inactive();                             //取消片选     
	W25QXX_Wait_Busy();   				   	  //等待芯片擦除结束
} 
void W25QXX_SectorErase(uint32_t addr)   
{                 
  addr *=4096;
  W25QXX_Write_Enable();                 	 	  //SET WEL 
  W25QXX_Wait_Busy();   
  nSS_Active();                            	   //使能器件   
  SPI_Master_FIFO_Data_Put(W25X_SectorErase);  //发送64KB块擦除命令 

  if (W25Q256)
  SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>24));  	//256Flash发送32bit地址
		
  SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>16));  //发送24bit地址    
  SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>8));   
  SPI_Master_FIFO_Data_Put((uint8_t)addr);  		   //发送块地址
  nSS_Inactive();                                 //取消片选     
  W25QXX_Wait_Busy();   				   	     //等待芯片擦除结束
} 
void W25QXX_Erase_Chip(void)   
{	
    W25QXX_Write_Enable();                 	 	  //SET WEL 
    W25QXX_Wait_Busy();   
    nSS_Active();                            	  //使能器件   
    SPI_Master_FIFO_Data_Put(W25X_ChipErase);   //发送片擦除命令z  
    nSS_Inactive();                            	//取消片选     
	W25QXX_Wait_Busy();   				   		        //等待芯片擦除结束	
} 

//void W25QXX_BlockErase32KB(uint32_t addr)   
//{                                   
//  W25QXX_Write_Enable();                 	 	  //SET WEL 
//  W25QXX_Wait_Busy();   
//  nSS_Active();                            	      //使能器件   
//  SPI_Master_FIFO_Data_Put(W25X_BlockErase32KB);  //发送64KB块擦除命令 
//	
//  if (W25Q256)
//  SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>24));  	//256Flash发送32bit地址
//	
//  SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>16)); 	  //发送24bit地址    
//  SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>8));   
//  SPI_Master_FIFO_Data_Put((uint8_t)addr);  			  //发送块地址
//  nSS_Inactive();                                 //取消片选     
//  W25QXX_Wait_Busy();   				   	      //等待芯片擦除结束
//} 
void W25QXX_Enter_4Byte_AddressMode(void)
{
	nSS_Active();
	SPI_Master_FIFO_Data_Put(0xB7);
	nSS_Inactive();
}
//------------------------------------------------------- NorFlash -------------------------------------------------------------

//------------------------------------------------------- NandFlash -------------------------------------------------------------

#define W25N01GV_WriteEnable		0x06
#define W25N01GV_WriteDisable		0x04 
#define W25N01GV_ReadStatusReg		0x05 
#define W25N01GV_WriteStatusReg		0x01 
#define W25N01GV_ReadData			0x03 
#define W25N01GV_FastReadData		0x0B 
#define W25N01GV_FastReadDual		0x3B 
#define W25N01GV_PageProgram		0x02 
#define W25N01GV_BlockErase			0xD8 
#define W25N01GV_SectorErase		0x20 
#define W25N01GV_ChipErase			0xC7 
#define W25N01GV_PowerDown			0xB9 
#define W25N01GV_ReleasePowerDown	0xAB 
#define W25N01GV_DeviceID			0xAB 
#define W25N01GV_ManufactDeviceID	0x90 
#define W25N01GV_JedecDeviceID		0x9F

uint8_t W25N01GV_ReadSR(uint8_t reg)   //读取W25N01的状态寄存器
{  
	uint8_t byte = 0;   
	nSS_Active();                                  	//使能器件 
	SPI_Master_FIFO_Data_Put(0x0F);   					//发送读取状态寄存器命令 
	SPI_Master_FIFO_Data_Put(reg);                     //寄存器地址 
	byte = SPI_Master_FIFO_Data_Put(0Xff);             //读取一个字节 
	nSS_Inactive();                                 	//取消片选  	
	
	return byte;  
} 

void W25N01GV_Write_SR(uint8_t reg, uint8_t val)   
{   
	W25N01GV_Write_Enable();	
	nSS_Active(); 							//使能器件
       
	SPI_Master_FIFO_Data_Put(0x1F);          //发送写取状态寄存器命令    
	SPI_Master_FIFO_Data_Put(reg);                      //寄存器地址 
	SPI_Master_FIFO_Data_Put(val);               	      //写入一个字节      	      
	
	nSS_Inactive();                                 //取消片选 
	W25N01GV_Write_Disable();
}

void W25N01GV_Write_Enable(void)   //W25QXX写使能
{
	nSS_Active();                         			//使能器件   
    SPI_Master_FIFO_Data_Put(0x06); 	//发送写使能  
	nSS_Inactive();                          		//取消片选     	      
} 

void W25N01GV_Write_Disable(void)   //W25QXX写禁止
{  
	nSS_Active();                          		//使能器件   
    SPI_Master_FIFO_Data_Put(0x04); 	//发送写禁止指令    
	nSS_Inactive();                            	//取消片选     	      
} 

void W25N01GV_Wait_Busy(void)   		//等待空闲
{   
	while((W25N01GV_ReadSR(0xc0)&0x01)==0x01);  		// 等待BUSY位清空
}

uint32_t W25N01GV_ReadID(void)
{
	uint8_t Mfr_id = 0;
	uint16_t Device_id = 0;
	uint32_t id = 0;
	
	nSS_Active();	
	SPI_Master_FIFO_Data_Put(0x9f);
	SPI_Master_FIFO_Data_Put(0x00);
	Mfr_id = SPI_Master_FIFO_Data_Put(0xff);
	Device_id = SPI_Master_FIFO_Data_Put(0xff);
	Device_id = Device_id<<8 | SPI_Master_FIFO_Data_Put(0xff);
	nSS_Inactive();
	
	id = Mfr_id;
	id = (id<<16)+Device_id;
	return id;
}  

void W25N01GV_Erase_Block(uint16_t block)   
{               
	uint32_t addr = 0;	
	addr = 64 * block;  //输入的是页地址，一个块有64页。

	
	W25N01GV_Write_SR(0xA0, 0x00);          // 关flash保护功能
	
    W25N01GV_Write_Enable();                //SET WEL 
    W25N01GV_Wait_Busy();   
	
    nSS_Active();  						    //使能器件
    SPI_Master_FIFO_Data_Put(0xD8);        	//发送片擦除命令  
	SPI_Master_FIFO_Data_Put((uint8_t)(addr>>16));        	//发送片擦除命令  
	SPI_Master_FIFO_Data_Put((uint8_t)(addr>>8)); 
	SPI_Master_FIFO_Data_Put((uint8_t)(addr));
	nSS_Inactive();                         //取消片选     	
	
	W25N01GV_Wait_Busy();   				        //等待芯片擦除结束
	W25N01GV_Write_SR(0xA0,0x7C);                 // 开flash保护功能
}

void W25N01GV_EraseFlash(void)           //一共有1024个block
{
	uint16_t block = 0;
	for(block = 0 ;block < 1024 ; block++)
	{
		W25N01GV_Erase_Block(block);
	}
}
void W25N01GV_WritePageAddr_Data(uint8_t* pBuffer,uint16_t ColumnAddr,uint32_t PageAddr,uint16_t NumByteToWrite)   //不能写入超过2048 Byte（一页2048个Byte，后面的64 Byte非数据位）
{
 	uint16_t i;
 	
	W25N01GV_Write_SR(0xa0, 0x00);      // 关flash保护功能
	
	//------写BUFF------
    W25N01GV_Write_Enable();                  	//SET WEL 
    nSS_Active();                           //使能器件   
    SPI_Master_FIFO_Data_Put(0x02);      	    //发送写BUFF命令   
    SPI_Master_FIFO_Data_Put(ColumnAddr>>8); 	//BUFF地址   
    SPI_Master_FIFO_Data_Put(ColumnAddr);

#if STM32_SPI_8
	LCD_CmdWrite(0xB8);
	SS_RESET;
	SPI2_ReadWriteByte(0x80);
#endif
	for(i=0;i<NumByteToWrite;i++)
#if STM32_SPI_8
		SPI2_ReadWriteByte(pBuffer[i]);
#else
	{
		LCD_CmdWrite(0xB8);
		LCD_DataWrite(pBuffer[i]);
	}
#endif

#if STM32_SPI_8
	SS_SET;
#endif

	nSS_Inactive();                          //取消片选 
	
	W25N01GV_Wait_Busy();					    	//等待写入结束
	
	//-------BUFF数据写入flash--------
	W25N01GV_Write_Enable();
	nSS_Active();                          	//使能器件   
	SPI_Master_FIFO_Data_Put(0x10);      	    	//发送写页命令   
	SPI_Master_FIFO_Data_Put(PageAddr>>16); 	       	 	//发送16it地址    
	SPI_Master_FIFO_Data_Put(PageAddr>>8); 		//发送16it地址    
	SPI_Master_FIFO_Data_Put(PageAddr);   
	nSS_Inactive();   
	W25N01GV_Wait_Busy();					        //等待写入结束 
	
	W25N01GV_Write_SR(0xa0, 0x7c);                // 开flash保护功能
}

void W25N01GV_Write_NoCheck(uint8_t* pBuffer,uint32_t WriteAddr,uint16_t NumByteToWrite)   //函数内部自动将32位地址转换为对应的页地址和页内地址
{             
	uint16_t WriteNum = 0;         //写入每一页的数据量
	uint16_t ColumnAddr;           //页内地址
	uint32_t PageAddr;             //页地址
	
//判断第一次写入时，对应的页内地址，页地址，写入的数据量。
	ColumnAddr = (WriteAddr%2048);
	PageAddr = WriteAddr/2048;
	
	if(NumByteToWrite<(2048-ColumnAddr)) WriteNum = NumByteToWrite;         
	else WriteNum = 2048-ColumnAddr;
		
	while(1)
	{
//		printf("ColumnAddr:%d\r\n",ColumnAddr);
//		printf("PageAddr:%d\r\n",PageAddr);
		
		W25N01GV_WritePageAddr_Data(pBuffer,ColumnAddr,PageAddr,WriteNum);
		if(NumByteToWrite == WriteNum)break;    //如果已经写入的数据达到要求，则写入完毕，退出。因为NumByteToWrite是不断减少的，当减到最后一次的时候，要写入的数据必定等于剩余的数据。
		
		pBuffer += WriteNum;                    //数组头跟着移动
		ColumnAddr = 0;           				//下一次写入操作必定从页内0地址写起。		
		PageAddr++;								//下一次写入操作必定从新页开始写。
		NumByteToWrite -= WriteNum;				//总写入数据量根据已经写入的量进行减少。
		
		if(NumByteToWrite<2048)                //下一次不需要写满一页
		{
			 WriteNum =NumByteToWrite;
		}
		else WriteNum = 2048;                  //下一次要写满一页
	}
} 

void W25N01GV_ReadPageAddr_Data(uint8_t* pBuffer,uint16_t ColumnAddr,uint32_t PageAddr,uint16_t NumByteToRead)   
{ 
 	uint16_t i; 
	W25N01GV_Write_SR(0xB0,W25N01GV_ReadSR(0xB0)|0x08);
    //------从flash读数据到BUFF-----	
	nSS_Active();                            //使能器件   
	SPI_Master_FIFO_Data_Put(0x13);
	SPI_Master_FIFO_Data_Put(PageAddr>>16);            //空周期
    SPI_Master_FIFO_Data_Put(PageAddr>>8);     //发送16bit页地址，将对应页的数据提取到BUFF中     
    SPI_Master_FIFO_Data_Put(PageAddr);   
	nSS_Inactive(); 	
	W25N01GV_Wait_Busy();
	
	W25N01GV_Write_SR(0xB0,W25N01GV_ReadSR(0xB0)|0x08);

	//------再从BUFF读数据到单片机内-----
	nSS_Active();   	
	SPI_Master_FIFO_Data_Put(0x03); 
	SPI_Master_FIFO_Data_Put(ColumnAddr>>8);  
	SPI_Master_FIFO_Data_Put(ColumnAddr); 	
	SPI_Master_FIFO_Data_Put(0x00);

	for(i=0;i<NumByteToRead;i++)
	{ 
        pBuffer[i]=SPI_Master_FIFO_Data_Put(0XFF);   	//循环读数  
    }

	 nSS_Inactive(); //---------------------	
	 W25N01GV_Wait_Busy();
}
void W25N01GV_Read_NoCheck(uint8_t* pBuffer,uint32_t ReadAddr,uint16_t NumByteToRead)   //函数内部自动将32位地址转换为对应的页地址和页内地址
{             
	uint16_t ReadNum = 0;         //读取每一页的数据量
	uint16_t ColumnAddr;          //业内地址
	uint32_t PageAddr;
	
//判断第一次读取时，对应的页内地址，页地址，写入的数据量。
	ColumnAddr = (ReadAddr%2048);
	PageAddr = ReadAddr/2048;
	
	if(NumByteToRead<(2048-ColumnAddr)) ReadNum = NumByteToRead;         
	else ReadNum = 2048-ColumnAddr;
	
	while(1)
	{
		
		W25N01GV_ReadPageAddr_Data(pBuffer,ColumnAddr,PageAddr,ReadNum);
		if(NumByteToRead == ReadNum)break;    //如果已经写入的数据达到要求，则写入完毕，退出。因为NumByteToWrite是不断减少的，当减到最后一次的时候，要写入的数据必定等于剩余的数据。
		
		pBuffer += ReadNum;                     //数组头跟着移动
		ColumnAddr = 0;           				//下一次读取操作必定从页内0地址写起。		
		PageAddr++;								//下一次读取操作必定从新页开始写。
		NumByteToRead -= ReadNum;				//总读取数据量根据已经读取的量进行减少。
		
		if(NumByteToRead<2048)                //下一次不需要写满一页
		{
			 ReadNum =NumByteToRead;
		}
		else ReadNum = 2048;                  //下一次要写满一页


	}
}

void W25N01GV_Read_BBM_LUT(BBM * L )
{
	uint8_t i;
	
	nSS_Active();  						     
	SPI_Master_FIFO_Data_Put(0xA5);
	SPI_Master_FIFO_Data_Put(0xFF);	
	
	for(i=0;i<20;i++)
	{
		L[i].LBA = ((uint16_t)SPI_Master_FIFO_Data_Put(0xFF)<<8); 
		L[i].LBA |= SPI_Master_FIFO_Data_Put(0xFF);
		L[i].PBA = ((uint16_t)SPI_Master_FIFO_Data_Put(0xFF)<<8); 
		L[i].PBA |= SPI_Master_FIFO_Data_Put(0xFF);
	}
	nSS_Inactive(); 
}
uint8_t W25N01GV_Bad_Block_Replace(uint16_t LBA,uint16_t PBA) //Bad LBA,good PBA
{
	if((W25N01GV_ReadSR(0xC0) &0x40) == 0)  //Look Up Table not full
	{
		W25N01GV_Write_Enable();
		W25N01GV_Wait_Busy();
		
		nSS_Active();  						     
		SPI_Master_FIFO_Data_Put(0xA1);        	 
		SPI_Master_FIFO_Data_Put((uint8_t)(LBA>>8)); 
		SPI_Master_FIFO_Data_Put((uint8_t)(LBA));
		SPI_Master_FIFO_Data_Put((uint8_t)(PBA>>8)); 
		SPI_Master_FIFO_Data_Put((uint8_t)(PBA));
		nSS_Inactive();                           
		
		W25N01GV_Wait_Busy();
		return 0;  //OK
	}
	else
	{
		return 1;  //Failure
	}
}