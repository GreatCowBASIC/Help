#include "Download.h"
#include "sys.h"
#include "ff.h"
#include "LT768_Lib.h"
#include "string.h"




extern uint8_t  Flash_type;
#define run_time  5

extern unsigned int GetCrc32(unsigned char *InStr,unsigned int len, unsigned int value);

void num_to_char(char *buf,u8 num)
{
	if(num >= 100)
	{
		buf[0] = '1';
		buf[1] = '0';
		buf[2] = '0';
	}
	else if(num >=10)
	{
		buf[0] = ' ';
		buf[1] = (num / 10) + '0';
		buf[2] = (num % 10) + '0';
	}
	else
	{
		buf[0] = ' ';
		buf[1] = ' ';
		buf[2] = num + '0';
	}
	buf[3] = '%';
	buf[4] = '\0';
}
u8 buff[4*1024];

signed char Flash_Updata(const char *buf,char type)  //OK 0; NG crc -1, BBM -2;None 回对应的标号。
{
	
	uint64_t addr = 0;
	uint8_t num = 0;
	uint16_t block_num = 0;
	uint32_t blockremain = 0;
	uint32_t file_size = 0;
	uint32_t BIN_CRC = 0;
	uint32_t Check_BIN_CRC = 0;
	uint32_t Check_num = 0;
	
	char run_flag = 0;
	
	
	char showbuff[10];
	
	FATFS fs;
	FIL fsrc;
	FRESULT res;
	UINT br;


	f_mount(&fs,"0:",1);

	res = f_open(&fsrc, buf, FA_READ);

	if(res == FR_OK)
	{
		file_size = f_size(&fsrc);
//		printf("size=%d\r\n",file_size);
		
	//读取文件获取文件总体CRC==============================================
		for(;;)
		{
		//闪动=====================================================================
			{
				if(run_flag == run_time)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White,"* ");
				}
				else if(run_flag == run_time*2)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White," *");
					run_flag = 0;
				}
				run_flag++;
			}
		//========================================================================	
			res=f_read(&fsrc,buff,4*1024,&br);
			if(res||(br == 0))
			{
				f_lseek(&fsrc,0);   //不关闭文件，将文件读取指针指向文件开头
				break;
			}
			BIN_CRC = GetCrc32(buff,br,BIN_CRC);
		}
//		printf("CRC:%x\r\n",BIN_CRC);
		
	//=====================================================================
	
	//循环向Flash写数据==============================================
		for(;;)
		{
		//闪动=====================================================================
			{
				if(run_flag == run_time)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White,"* ");
				}
				else if(run_flag == run_time*2)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White," *");
					run_flag = 0;
				}
				run_flag++;
			}
		//========================================================================	
		
		//进度=====================================================================
			num = addr * 100.0 / file_size;
			if(num == 100) num = 99;
			num_to_char(showbuff,num);
			
			if(type == 1)   			//UartTFT_Flash.bin
			{
				LT768_Print_Internal_Font_String(275,50,Progress_color,White,showbuff);
			}
		//========================================================================
			
			//读文件烧录
			uint8_t time = 0;
			
			uint32_t File_CRC = 0;
			uint32_t Flash_CRC = 0;
			char BBM_flag = 0;
			
			res=f_read(&fsrc,buff,2*1024,&br);
			if(res||(br == 0))
			{
				f_close(&fsrc);
				break;
			}
			File_CRC = GetCrc32(buff,br,0);
			
			for(;;)
			{
				if(Flash_type == 0 )//NorFlash 
				{
					block_num = addr/(64*1024);
					blockremain = addr% (64*1024);
					
					if(blockremain == 0)				//新BLOCK执行擦除
						W25QXX_BlockErase64KB(block_num);
					
					W25QXX_Write_NoCheck(buff,addr,br);//写入数据
					W25QXX_Read(&buff[2*1024],addr,br);//立刻拿回数据
				}
				else				//NandFlash
				{
					block_num = addr/(128*1024);
					blockremain = addr% (128*1024);
					
					if(blockremain == 0)				//新BLOCK执行擦除
						W25N01GV_Erase_Block(block_num);
					
					W25N01GV_Write_NoCheck(buff,addr,br);//写入数据
					W25N01GV_Read_NoCheck(&buff[2*1024],addr,br);//立刻拿回数据
				}
				Flash_CRC = GetCrc32(&buff[2*1024],br,0);
				
				if(File_CRC != Flash_CRC)//对比数据是否正确
				{
					time++;
				}
				else
				{
					break;
				}
				if(time == 3) //三次了，退出报错,NG CRC
				{
					if(Flash_type == 0 )//NorFlash
					{
						return -1;
					}
					else			   //NandFlash
					{
						if(W25N01GV_BBM(block_num)  == 0) //BBM OK
						{
							BBM_flag = 1;
							break;
						}
						else							 //BBM Fail
						{
							return -2;
						}
					}
				}
			}
			addr += br;  //Flash地址增加
			
			if(BBM_flag)
			{
				f_lseek(&fsrc,block_num*128*1024);
				addr = block_num*128*1024;
			}
			//========================================================================
		}
		
	//校验整体CRC========================================================================
		for(;;)
		{
		//闪动=====================================================================
			{
				if(run_flag == run_time)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White,"* ");
				}
				else if(run_flag == run_time*2)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White," *");
					run_flag = 0;
				}
				run_flag++;
			}
		//========================================================================	
				
			unsigned short Read_size;
			if(file_size - Check_num>= 2048)
				Read_size = 2048;
			else
				Read_size = file_size - Check_num;
			
			if(Flash_type == 0 )//NorFlash 
			{
				W25QXX_Read(buff,Check_num,Read_size);
			}
			else			   //NandFlash
			{
				W25N01GV_Read_NoCheck(buff,Check_num,Read_size);
			}
			
			Check_BIN_CRC = GetCrc32(buff,Read_size,Check_BIN_CRC);
			
			Check_num += Read_size;

			if(Check_num == file_size)
			{
				Check_num = 0;
				break;
			}				
		}
		if(Check_BIN_CRC != BIN_CRC)  //NG CRC
		{
//			printf("2");
//			while(1);
			return -1;
		}
		//========================================================================
		
		return 0;   //能跑到这里的，只能是好的
	}
	else    //打开文件失败，返回文件系统结果代号
	{	
		return res;
	}
}
//判断块是不是坏块，参数为块编号;  好块返回0，坏块返回1；
uint8_t  Check_BadBlock(uint16_t block_num) 
{
	
	uint16_t i= 0 ,j= 0;
	uint32_t addr = block_num*128*1024;

	W25N01GV_Erase_Block(block_num);
	
	addr = block_num*128*1024;
	for(i=0;i<64;i++)
	{
		memset(buff,i,sizeof(buff));
		W25N01GV_Write_NoCheck(buff,addr,2048);
		addr+=2048;
	}
	
	addr = block_num*128*1024;
	for(i=0;i<64;i++)
	{
		W25N01GV_Read_NoCheck(buff,addr,2048);
		
		for(j=0;j<2048;j++)
		{
			if(buff[j] != i)
				return 1;
		}
		addr+=2048;
	}



	W25N01GV_Erase_Block(block_num);
	
	addr = block_num*128*1024;
	for(i=0;i<64;i++)
	{
		memset(buff,0xA5,sizeof(buff));
		W25N01GV_Write_NoCheck(buff,addr,2048);
		addr+=2048;
	}
	
	addr = block_num*128*1024;
	for(i=0;i<64;i++)
	{
		W25N01GV_Read_NoCheck(buff,addr,2048);
		
		for(j=0;j<2048;j++)
		{
			if(buff[j] != 0xA5)
				return 1;
		}
		addr+=2048;
	}
	
	W25N01GV_Erase_Block(block_num);
	
	addr = block_num*128*1024;
	for(i=0;i<64;i++)
	{
		memset(buff,0xFF,sizeof(buff));
		W25N01GV_Write_NoCheck(buff,addr,2048);
		addr+=2048;
	}
	
	addr = block_num*128*1024;
	for(i=0;i<64;i++)
	{
		W25N01GV_Read_NoCheck(buff,addr,2048);
		
		for(j=0;j<2048;j++)
		{
			if(buff[j] != 0xFF)
				return 1;
		}
		addr+=2048;
	}

	
	
	return 0;
}

signed char W25N01GV_BBM(unsigned short Block_num) //OK 0,Fail 1
{
	BBM LUT[20];
	
	if(Check_BadBlock(Block_num) == 0)		//检查是否真的是坏块
		return 1;
	
	if((W25N01GV_ReadSR(0xC0) & 0x40) == 0x40)  // 替换列表已经满了
	{
		return 1;
	}
		
	W25N01GV_Read_BBM_LUT(LUT);				//读回Flash里的坏块管理表数据

	for(int i=0;i<20;i++)
	printf("LBA[%d]:%x   PBA[%d]:%x \r\n",i,LUT[i].LBA,i,LUT[i].PBA);
	printf("\r\n");
//	while(1);
	unsigned short Block_replace_num = 1023;
	unsigned char  Find_good_block_result = 0;
	
	char run_flag = 0;
	char time = 0;
	for(;;)
	{
		Find_good_block_result = 0;
		//闪动=====================================================================
			{
				if(run_flag == run_time)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White,"* ");
				}
				else if(run_flag == run_time*2)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White," *");
					run_flag = 0;
				}
				run_flag++;
			}
		//========================================================================	
		
		for(int i=0;i<20;i++)
		{
			if(LUT[i].PBA == Block_replace_num)   //替换列表里有该替换地址
			{
				if((LUT[i].LBA & 0xC000) == 0x8000) //该替换序列使能并有效
				{
					Find_good_block_result = 0;
					break;
				}
				else
				{
					Find_good_block_result = 1;
					break;
				}
			}
			else  //没有该替换地址
			{
				Find_good_block_result = 1;
			}
		}
		if(Find_good_block_result == 1) //该Block没有在替换类表里，再判断该Block是否为好的块
		{
			if(Check_BadBlock(Block_replace_num) == 0) //好块
			{
				break;
			}
			else										//坏块
			{
				time++;
				Block_replace_num--;
				Find_good_block_result = 0;
			}
		}
		else
		{
			time++;
			if(time == 21)
			{
				Find_good_block_result = 0;
				break;
			}
			Block_replace_num--;
		}
	}
	
	if(Find_good_block_result == 0)  //无法找到好块
	{
		return 1;
	}
	else							//找到好块
	{
		char Replace_flag = 1;
		printf("Block_replace_num:%x\r\n",Block_replace_num);
//		while(1);
		if(Block_num>=Block_replace_num) return 1;
		W25N01GV_Bad_Block_Replace(Block_num,Block_replace_num);
		W25N01GV_Read_BBM_LUT(LUT);
		for(int i=0;i<20;i++)
		{
			printf("LBA[%d]:%x   PBA[%d]:%x \r\n",i,LUT[i].LBA,i,LUT[i].PBA);
			if(((LUT[i].LBA & 0x3FFF) == Block_num) && (LUT[i].PBA == Block_replace_num))
			{
				if((LUT[i].LBA & 0xC000) == 0x8000)  //Enable link
				{
					Replace_flag = 0;
				}
				else
				{
					Replace_flag = 1;
				}
			}
		}
		if(Replace_flag)
			return 1;
		else if(Replace_flag == 0)
			return 0;
	}
}

#include "stmflash.h"
signed char APP_Updata(const char *buf)  //OK 0; NG crc -1, BBM -2;None 回对应的标号。
{
	u8 num = 0;
	u32 addr = 0;
	u32 file_size = 0;
	char showbuff[10];
	u32 BIN_CRC = 0;
	u32 Check_BIN_CRC = 0;
	char run_flag = 0;
	u32 Check_num = 0;
	
	FATFS fs;
	FIL fsrc;
	FRESULT res;
	UINT br;
		
	f_mount(&fs,"0:",1);
	
	res = f_open(&fsrc, buf, FA_READ);

	if(res == FR_OK)
	{
//	printf("res=%d\r\n",res);
	file_size = f_size(&fsrc);
//	printf("size=%d\r\n",file_size);
		
		//读取文件获取文件总体CRC==============================================
		for(;;)
		{
		//闪动=====================================================================
			{
				if(run_flag == run_time)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White,"* ");
				}
				else if(run_flag == run_time*2)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White," *");
					run_flag = 0;
				}
				run_flag++;
			}
		//========================================================================	
			res = f_read(&fsrc,buff,4*1024,&br);
			if(res||(br == 0))
			{
				f_lseek(&fsrc,0);   //不关闭文件，将文件读取指针指向文件开头
				break;
			}
			BIN_CRC = GetCrc32(buff,br,BIN_CRC);
		}
//		printf("CRC:%x\r\n",BIN_CRC);
		
		//=====================================================================
		
		for(;;)
		{
		//闪动=====================================================================
			{
				if(run_flag == run_time)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White,"* ");
				}
				else if(run_flag == run_time*2)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White," *");
					run_flag = 0;
				}
				run_flag++;
			}
		//========================================================================		

		//进度====================================================================
			num = addr * 100 / file_size;
			if(num == 100) num = 99;
			num_to_char(showbuff,num);
			
			LT768_Print_Internal_Font_String(275,100,Progress_color,White,showbuff);
		//========================================================================

			//读文件烧录
			u8 time = 0;
			
			u32 File_CRC = 0;
			u32 Flash_CRC = 0;
			res=f_read(&fsrc,buff,2*1024,&br);
			if(res||(br == 0))
			{
				f_close(&fsrc);
				break;
			}
			File_CRC = GetCrc32(buff,br,0);
			
			for(;;)
			{
//				EFLASH_Write(APP_ADDR+addr,buff,br);//写入数据
				
				STMFLASH_Write(APP_ADDR+addr,(uint16_t*)buff,br/2);
				for(u16 i = 0;i<br;i++)             //立刻拿回数据
					buff[2*1024 + i] = *(volatile unsigned char*)(APP_ADDR+addr+i);

				Flash_CRC = GetCrc32(&buff[2*1024],br,0);
				
				if(File_CRC != Flash_CRC)//对比数据是否正确
				{
					time++;
				}
				else
				{
					break;
				}
				if(time ==3) //三次了，退出报错,NG CRC
				{
					return -1;
				}
			}
			addr += br;  //增加
			//========================================================================
		}
		//校验整体CRC========================================================================
		for(;;)
		{
		//闪动=====================================================================
			{
				if(run_flag == run_time)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White,"* ");
				}
				else if(run_flag == run_time*2)
				{
					LT768_Print_Internal_Font_String(10,250,Black,White," *");
					run_flag = 0;
				}
				run_flag++;
			}
		//========================================================================	
			
			unsigned short Read_size;
			
			if(file_size - Check_num>= 4000)
				Read_size = 4000;
			else
				Read_size = file_size - Check_num;
			
			for(u16 i = 0;i<Read_size;i++)             //立刻拿回数据
					buff[i] = *(volatile unsigned char*)(APP_ADDR + Check_num + i);
			
			Check_BIN_CRC = GetCrc32(buff,Read_size,Check_BIN_CRC);
			
			Check_num += Read_size;

			if(Check_num == file_size) break;
		}
		if(Check_BIN_CRC != BIN_CRC)  //NG CRC
			return -1;
		//========================================================================
		
		return 0;   //能跑到这里的，只能是好的		
	}
	else    //打开文件失败，返回文件系统结果代号
	{	
		return res;
	}
}