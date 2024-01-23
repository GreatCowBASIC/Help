#ifndef __FLASH_H
#define __FLASH_H
#include "sys.h"
#include "LT768_Lib.h"





uint16_t W25QXX_ReadID(void);
uint8_t W25QXX_ReadSR(void);
void W25QXX_Write_Enable(void);
void W25QXX_Wait_Busy(void); 
void W25QXX_Write_NoCheck(uint8_t* pBuffer,uint32_t WriteAddr,uint16_t NumByteToWrite);
void W25QXX_Read(uint8_t* pBuffer,uint32_t ReadAddr,uint16_t NumByteToRead);
void W25QXX_Erase_Chip(void) ;
void W25QXX_SectorErase(uint32_t addr);
void W25QXX_BlockErase64KB(uint32_t addr);
void W25QXX_Enter_4Byte_AddressMode(void);
uint8_t W25QXX_ReadSR(void);   //¶ÁÈ¡W25QXXµÄ×´Ì¬¼Ä´æÆ÷

uint32_t W25N01GV_ReadID(void);
void W25N01GV_Write_Enable(void);   			
void W25N01GV_Write_Disable(void);
uint8_t W25N01GV_ReadSR(uint8_t reg);
void W25N01GV_Write_SR(uint8_t reg, uint8_t val);
void W25N01GV_EraseFlash(void);
void W25N01GV_Erase_Block(uint16_t block);
void W25N01GV_Write_NoCheck(uint8_t* pBuffer,uint32_t WriteAddr,uint16_t NumByteToWrite);
void W25N01GV_Read_NoCheck(uint8_t* pBuffer,uint32_t ReadAddr,uint16_t NumByteToRead);

typedef struct 
{
	uint16_t  LBA ;       //»µ¿éµØÖ·
	uint16_t  PBA ;		  //Ìæ»»µØÖ·
}BBM;
void W25N01GV_Read_BBM_LUT(BBM * L );
uint8_t W25N01GV_Bad_Block_Replace(uint16_t LBA,uint16_t PBA);


#endif
