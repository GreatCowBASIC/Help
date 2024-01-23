#include "Flash.h"
extern uint16_t SPI2_ReadWriteByte(uint16_t TxData);

uint8_t  W25Q256 = 0; 	 //256 NorFlash�ı�־ ������ʶ��256��ʱ����4Byte ��ַ
uint8_t  Flash_type = 2;  //�����ж� ��NorFlash(0) ���� NandFlash(1)


//------------------------------------------------------- NorFlash -------------------------------------------------------------
//ָ���
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


//��ȡW25QXX��״̬�Ĵ���
//BIT7  6   5   4   3   2   1   0
//SPR   RV  TB BP2 BP1 BP0 WEL BUSY
//SPR:Ĭ��0,״̬�Ĵ�������λ,���WPʹ��
//TB,BP2,BP1,BP0:FLASH����д��������
//WEL:дʹ������
//BUSY:æ���λ(1,æ;0,����)
//Ĭ��:0x00
uint8_t W25QXX_ReadSR(void)   //��ȡW25QXX��״̬�Ĵ���
{  
	uint8_t byte=0;   
	nSS_Active();                            		//ʹ������   
	SPI_Master_FIFO_Data_Put(W25X_ReadStatusReg); 	//���Ͷ�ȡ״̬�Ĵ�������    
	byte=SPI_Master_FIFO_Data_Put(0xff);          	//��ȡһ���ֽ�  
	nSS_Inactive();                            		//ȡ��Ƭѡ     
	return byte;   
} 

	
//��WEL��λ   
void W25QXX_Write_Enable(void)   //W25QXXдʹ��
{
	nSS_Active();                          			//ʹ������   
    SPI_Master_FIFO_Data_Put(W25X_WriteEnable); 	//����дʹ��  
	nSS_Inactive();                           		//ȡ��Ƭѡ     	      
} 
	
//��WEL����  
void W25QXX_Write_Disable(void)   //W25QXXд��ֹ
{  
	nSS_Active();                            		//ʹ������   
    SPI_Master_FIFO_Data_Put(W25X_WriteDisable); 	//����д��ָֹ��    
	nSS_Inactive();                            		//ȡ��Ƭѡ     	      
} 		


void W25QXX_Wait_Busy(void)   		//�ȴ�����
{   
	while((W25QXX_ReadSR()&0x01)==0x01) ;  		// �ȴ�BUSYλ���
}  
  
uint16_t W25QXX_ReadID(void)
{
	uint16_t Temp = 0;	  
	nSS_Active();				    
	SPI_Master_FIFO_Data_Put(0x90);//���Ͷ�ȡID����	    
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
	nSS_Active();                            			//ʹ������   
    SPI_Master_FIFO_Data_Put(W25X_ReadData);         	//���Ͷ�ȡ����  

	if (W25Q256)
	SPI_Master_FIFO_Data_Put((uint8_t)((ReadAddr)>>24));  	//256Flash����32bit��ַ
	
    SPI_Master_FIFO_Data_Put((uint8_t)((ReadAddr)>>16));  	//����24bit��ַ    
    SPI_Master_FIFO_Data_Put((uint8_t)((ReadAddr)>>8));   
    SPI_Master_FIFO_Data_Put((uint8_t)ReadAddr);   
    for(i=0;i<NumByteToRead;i++)
	{ 
        pBuffer[i]=SPI_Master_FIFO_Data_Put(0XFF);   	//ѭ������  
    }
	nSS_Inactive();  				    	      
} 

void W25QXX_Write_Page(uint8_t* pBuffer,uint32_t WriteAddr,uint16_t NumByteToWrite)
{
 	uint16_t i;  
    W25QXX_Write_Enable();                  							//SET WEL 
	nSS_Active();                            							//ʹ������   
    SPI_Master_FIFO_Data_Put(W25X_PageProgram);      					//����дҳ���� 

	if (W25Q256)
	SPI_Master_FIFO_Data_Put((uint8_t)((WriteAddr)>>24));  	//256Flash����32bit��ַ
	
    SPI_Master_FIFO_Data_Put((uint8_t)((WriteAddr)>>16)); 					//����24bit��ַ    
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
	nSS_Inactive();                            							//ȡ��Ƭѡ 
	W25QXX_Wait_Busy();					   								//�ȴ�д�����
} 

void W25QXX_Write_NoCheck(uint8_t* pBuffer,uint32_t WriteAddr,uint16_t NumByteToWrite)   
{ 			 		 
	uint16_t pageremain;	   
	pageremain=256-WriteAddr%256; //��ҳʣ����ֽ���		 	    
	if(NumByteToWrite<=pageremain)pageremain=NumByteToWrite;//������256���ֽ�
	while(1)
	{	   
		W25QXX_Write_Page(pBuffer,WriteAddr,pageremain);
		if(NumByteToWrite==pageremain)break;//д�������
	 	else //NumByteToWrite>pageremain
		{
			pBuffer+=pageremain;
			WriteAddr+=pageremain;	

			NumByteToWrite-=pageremain;			  //��ȥ�Ѿ�д���˵��ֽ���
			if(NumByteToWrite>256)pageremain=256; //һ�ο���д��256���ֽ�
			else pageremain=NumByteToWrite; 	  //����256���ֽ���
		}
	}
} 
void W25QXX_BlockErase64KB(uint32_t addr)   
{    
	addr*=(64*1024);
	W25QXX_Write_Enable();                 	 	  //SET WEL 
	W25QXX_Wait_Busy();   
	nSS_Active();                            	  //ʹ������   
	SPI_Master_FIFO_Data_Put(W25X_BlockErase64KB);  //����64KB��������� 

	if (W25Q256)
	SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>24));  	//256Flash����32bit��ַ

	SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>16)); 	  //����24bit��ַ    
	SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>8));   
	SPI_Master_FIFO_Data_Put((uint8_t)addr);  			  //���Ϳ��ַ
	nSS_Inactive();                             //ȡ��Ƭѡ     
	W25QXX_Wait_Busy();   				   	  //�ȴ�оƬ��������
} 
void W25QXX_SectorErase(uint32_t addr)   
{                 
  addr *=4096;
  W25QXX_Write_Enable();                 	 	  //SET WEL 
  W25QXX_Wait_Busy();   
  nSS_Active();                            	   //ʹ������   
  SPI_Master_FIFO_Data_Put(W25X_SectorErase);  //����64KB��������� 

  if (W25Q256)
  SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>24));  	//256Flash����32bit��ַ
		
  SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>16));  //����24bit��ַ    
  SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>8));   
  SPI_Master_FIFO_Data_Put((uint8_t)addr);  		   //���Ϳ��ַ
  nSS_Inactive();                                 //ȡ��Ƭѡ     
  W25QXX_Wait_Busy();   				   	     //�ȴ�оƬ��������
} 
void W25QXX_Erase_Chip(void)   
{	
    W25QXX_Write_Enable();                 	 	  //SET WEL 
    W25QXX_Wait_Busy();   
    nSS_Active();                            	  //ʹ������   
    SPI_Master_FIFO_Data_Put(W25X_ChipErase);   //����Ƭ��������z  
    nSS_Inactive();                            	//ȡ��Ƭѡ     
	W25QXX_Wait_Busy();   				   		        //�ȴ�оƬ��������	
} 

//void W25QXX_BlockErase32KB(uint32_t addr)   
//{                                   
//  W25QXX_Write_Enable();                 	 	  //SET WEL 
//  W25QXX_Wait_Busy();   
//  nSS_Active();                            	      //ʹ������   
//  SPI_Master_FIFO_Data_Put(W25X_BlockErase32KB);  //����64KB��������� 
//	
//  if (W25Q256)
//  SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>24));  	//256Flash����32bit��ַ
//	
//  SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>16)); 	  //����24bit��ַ    
//  SPI_Master_FIFO_Data_Put((uint8_t)((addr)>>8));   
//  SPI_Master_FIFO_Data_Put((uint8_t)addr);  			  //���Ϳ��ַ
//  nSS_Inactive();                                 //ȡ��Ƭѡ     
//  W25QXX_Wait_Busy();   				   	      //�ȴ�оƬ��������
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

uint8_t W25N01GV_ReadSR(uint8_t reg)   //��ȡW25N01��״̬�Ĵ���
{  
	uint8_t byte = 0;   
	nSS_Active();                                  	//ʹ������ 
	SPI_Master_FIFO_Data_Put(0x0F);   					//���Ͷ�ȡ״̬�Ĵ������� 
	SPI_Master_FIFO_Data_Put(reg);                     //�Ĵ�����ַ 
	byte = SPI_Master_FIFO_Data_Put(0Xff);             //��ȡһ���ֽ� 
	nSS_Inactive();                                 	//ȡ��Ƭѡ  	
	
	return byte;  
} 

void W25N01GV_Write_SR(uint8_t reg, uint8_t val)   
{   
	W25N01GV_Write_Enable();	
	nSS_Active(); 							//ʹ������
       
	SPI_Master_FIFO_Data_Put(0x1F);          //����дȡ״̬�Ĵ�������    
	SPI_Master_FIFO_Data_Put(reg);                      //�Ĵ�����ַ 
	SPI_Master_FIFO_Data_Put(val);               	      //д��һ���ֽ�      	      
	
	nSS_Inactive();                                 //ȡ��Ƭѡ 
	W25N01GV_Write_Disable();
}

void W25N01GV_Write_Enable(void)   //W25QXXдʹ��
{
	nSS_Active();                         			//ʹ������   
    SPI_Master_FIFO_Data_Put(0x06); 	//����дʹ��  
	nSS_Inactive();                          		//ȡ��Ƭѡ     	      
} 

void W25N01GV_Write_Disable(void)   //W25QXXд��ֹ
{  
	nSS_Active();                          		//ʹ������   
    SPI_Master_FIFO_Data_Put(0x04); 	//����д��ָֹ��    
	nSS_Inactive();                            	//ȡ��Ƭѡ     	      
} 

void W25N01GV_Wait_Busy(void)   		//�ȴ�����
{   
	while((W25N01GV_ReadSR(0xc0)&0x01)==0x01);  		// �ȴ�BUSYλ���
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
	addr = 64 * block;  //�������ҳ��ַ��һ������64ҳ��

	
	W25N01GV_Write_SR(0xA0, 0x00);          // ��flash��������
	
    W25N01GV_Write_Enable();                //SET WEL 
    W25N01GV_Wait_Busy();   
	
    nSS_Active();  						    //ʹ������
    SPI_Master_FIFO_Data_Put(0xD8);        	//����Ƭ��������  
	SPI_Master_FIFO_Data_Put((uint8_t)(addr>>16));        	//����Ƭ��������  
	SPI_Master_FIFO_Data_Put((uint8_t)(addr>>8)); 
	SPI_Master_FIFO_Data_Put((uint8_t)(addr));
	nSS_Inactive();                         //ȡ��Ƭѡ     	
	
	W25N01GV_Wait_Busy();   				        //�ȴ�оƬ��������
	W25N01GV_Write_SR(0xA0,0x7C);                 // ��flash��������
}

void W25N01GV_EraseFlash(void)           //һ����1024��block
{
	uint16_t block = 0;
	for(block = 0 ;block < 1024 ; block++)
	{
		W25N01GV_Erase_Block(block);
	}
}
void W25N01GV_WritePageAddr_Data(uint8_t* pBuffer,uint16_t ColumnAddr,uint32_t PageAddr,uint16_t NumByteToWrite)   //����д�볬��2048 Byte��һҳ2048��Byte�������64 Byte������λ��
{
 	uint16_t i;
 	
	W25N01GV_Write_SR(0xa0, 0x00);      // ��flash��������
	
	//------дBUFF------
    W25N01GV_Write_Enable();                  	//SET WEL 
    nSS_Active();                           //ʹ������   
    SPI_Master_FIFO_Data_Put(0x02);      	    //����дBUFF����   
    SPI_Master_FIFO_Data_Put(ColumnAddr>>8); 	//BUFF��ַ   
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

	nSS_Inactive();                          //ȡ��Ƭѡ 
	
	W25N01GV_Wait_Busy();					    	//�ȴ�д�����
	
	//-------BUFF����д��flash--------
	W25N01GV_Write_Enable();
	nSS_Active();                          	//ʹ������   
	SPI_Master_FIFO_Data_Put(0x10);      	    	//����дҳ����   
	SPI_Master_FIFO_Data_Put(PageAddr>>16); 	       	 	//����16it��ַ    
	SPI_Master_FIFO_Data_Put(PageAddr>>8); 		//����16it��ַ    
	SPI_Master_FIFO_Data_Put(PageAddr);   
	nSS_Inactive();   
	W25N01GV_Wait_Busy();					        //�ȴ�д����� 
	
	W25N01GV_Write_SR(0xa0, 0x7c);                // ��flash��������
}

void W25N01GV_Write_NoCheck(uint8_t* pBuffer,uint32_t WriteAddr,uint16_t NumByteToWrite)   //�����ڲ��Զ���32λ��ַת��Ϊ��Ӧ��ҳ��ַ��ҳ�ڵ�ַ
{             
	uint16_t WriteNum = 0;         //д��ÿһҳ��������
	uint16_t ColumnAddr;           //ҳ�ڵ�ַ
	uint32_t PageAddr;             //ҳ��ַ
	
//�жϵ�һ��д��ʱ����Ӧ��ҳ�ڵ�ַ��ҳ��ַ��д�����������
	ColumnAddr = (WriteAddr%2048);
	PageAddr = WriteAddr/2048;
	
	if(NumByteToWrite<(2048-ColumnAddr)) WriteNum = NumByteToWrite;         
	else WriteNum = 2048-ColumnAddr;
		
	while(1)
	{
//		printf("ColumnAddr:%d\r\n",ColumnAddr);
//		printf("PageAddr:%d\r\n",PageAddr);
		
		W25N01GV_WritePageAddr_Data(pBuffer,ColumnAddr,PageAddr,WriteNum);
		if(NumByteToWrite == WriteNum)break;    //����Ѿ�д������ݴﵽҪ����д����ϣ��˳�����ΪNumByteToWrite�ǲ��ϼ��ٵģ����������һ�ε�ʱ��Ҫд������ݱض�����ʣ������ݡ�
		
		pBuffer += WriteNum;                    //����ͷ�����ƶ�
		ColumnAddr = 0;           				//��һ��д������ض���ҳ��0��ַд��		
		PageAddr++;								//��һ��д������ض�����ҳ��ʼд��
		NumByteToWrite -= WriteNum;				//��д�������������Ѿ�д��������м��١�
		
		if(NumByteToWrite<2048)                //��һ�β���Ҫд��һҳ
		{
			 WriteNum =NumByteToWrite;
		}
		else WriteNum = 2048;                  //��һ��Ҫд��һҳ
	}
} 

void W25N01GV_ReadPageAddr_Data(uint8_t* pBuffer,uint16_t ColumnAddr,uint32_t PageAddr,uint16_t NumByteToRead)   
{ 
 	uint16_t i; 
	W25N01GV_Write_SR(0xB0,W25N01GV_ReadSR(0xB0)|0x08);
    //------��flash�����ݵ�BUFF-----	
	nSS_Active();                            //ʹ������   
	SPI_Master_FIFO_Data_Put(0x13);
	SPI_Master_FIFO_Data_Put(PageAddr>>16);            //������
    SPI_Master_FIFO_Data_Put(PageAddr>>8);     //����16bitҳ��ַ������Ӧҳ��������ȡ��BUFF��     
    SPI_Master_FIFO_Data_Put(PageAddr);   
	nSS_Inactive(); 	
	W25N01GV_Wait_Busy();
	
	W25N01GV_Write_SR(0xB0,W25N01GV_ReadSR(0xB0)|0x08);

	//------�ٴ�BUFF�����ݵ���Ƭ����-----
	nSS_Active();   	
	SPI_Master_FIFO_Data_Put(0x03); 
	SPI_Master_FIFO_Data_Put(ColumnAddr>>8);  
	SPI_Master_FIFO_Data_Put(ColumnAddr); 	
	SPI_Master_FIFO_Data_Put(0x00);

	for(i=0;i<NumByteToRead;i++)
	{ 
        pBuffer[i]=SPI_Master_FIFO_Data_Put(0XFF);   	//ѭ������  
    }

	 nSS_Inactive(); //---------------------	
	 W25N01GV_Wait_Busy();
}
void W25N01GV_Read_NoCheck(uint8_t* pBuffer,uint32_t ReadAddr,uint16_t NumByteToRead)   //�����ڲ��Զ���32λ��ַת��Ϊ��Ӧ��ҳ��ַ��ҳ�ڵ�ַ
{             
	uint16_t ReadNum = 0;         //��ȡÿһҳ��������
	uint16_t ColumnAddr;          //ҵ�ڵ�ַ
	uint32_t PageAddr;
	
//�жϵ�һ�ζ�ȡʱ����Ӧ��ҳ�ڵ�ַ��ҳ��ַ��д�����������
	ColumnAddr = (ReadAddr%2048);
	PageAddr = ReadAddr/2048;
	
	if(NumByteToRead<(2048-ColumnAddr)) ReadNum = NumByteToRead;         
	else ReadNum = 2048-ColumnAddr;
	
	while(1)
	{
		
		W25N01GV_ReadPageAddr_Data(pBuffer,ColumnAddr,PageAddr,ReadNum);
		if(NumByteToRead == ReadNum)break;    //����Ѿ�д������ݴﵽҪ����д����ϣ��˳�����ΪNumByteToWrite�ǲ��ϼ��ٵģ����������һ�ε�ʱ��Ҫд������ݱض�����ʣ������ݡ�
		
		pBuffer += ReadNum;                     //����ͷ�����ƶ�
		ColumnAddr = 0;           				//��һ�ζ�ȡ�����ض���ҳ��0��ַд��		
		PageAddr++;								//��һ�ζ�ȡ�����ض�����ҳ��ʼд��
		NumByteToRead -= ReadNum;				//�ܶ�ȡ�����������Ѿ���ȡ�������м��١�
		
		if(NumByteToRead<2048)                //��һ�β���Ҫд��һҳ
		{
			 ReadNum =NumByteToRead;
		}
		else ReadNum = 2048;                  //��һ��Ҫд��һҳ


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