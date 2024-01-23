#ifndef __GT911_H
#define __GT911_H


#include "LT768_Lib.h"
#include "delay.h"

#define     RST_High                    Write_GPIO_A_7_0(0x10)
#define     RST_Low                     Write_GPIO_A_7_0(0x00)

#define     INT_High                    GPIO_SetBits(GPIOB, GPIO_Pin_9)
#define     INT_Low                     GPIO_ResetBits(GPIOB, GPIO_Pin_9)

/************************Error code*****************************/
#define 		CT_COM_OK               (0)
#define 		CT_ACK_FAIL             (1)

#define 		FT6X06_ID               (0x6206)
#define 		CT_IC                   (FT6X06_ID)              //Control IC
#define 		CT_ADDR                 (0x70)                   //device address
#define 		CT_WRITE_MASK           (0x00)
#define 		CT_READ_MASK            (0x01)

#define 		CT_CACK_TIMEOUT         (3000)                   //Time limit when waiting for ACK

// Define TP information
typedef struct
{
	u8 (*scan)(void);	 // 0: TP Scan, 1: Physical coordinate
	u8 sta;				 // Status,   0£ºuntouched    1£ºtouched   2£ºtouched and not released
	u16 x;               // Pannel X coordinate
	u16 y;               // Pannel Y coordinate
	u16 px;				 // Physical X coordinate
	u16 py;				 // Physical Y coordinate
} TP_INFO;



extern u8 ctp_active_index;

u8 TP_Get_INT(void);
void CTP_io_Init(void);
u8 CTI2C_write_byte(const u8 s);
u8 CTI2C_read_byte(u8 ack);
u8 CT_Read_Nbyte(const u8 sla_add,const u8 add,u16 n,u8 *s);
void TP_read_XY(void);
u8  gt911_Scan(void);

#endif
