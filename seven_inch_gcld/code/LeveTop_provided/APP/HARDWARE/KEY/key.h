/******************************************************************************
  * Copyright(c) 2023 Levetop Semiconductor Co., Ltd. All rights reserved
  * @file      key.h
  * @author    Levetop TFT Controller Application Team
  * @version   V1.0.0
  * @date      2023-02-24
  * @brief     Define related functions for external keys (KEY0 & KEY1)
*******************************************************************************/
#ifndef __KEY_H
#define __KEY_H	 
#include "sys.h"
#include "delay.h"


#define KEY1  PBin(10)
#define KEY2  PBin(11)

#define KEY1_PRES 1
#define KEY2_PRES 2

void KEY_Init(void);
void Waiting_Key(void);
unsigned char Scan_Key(void);
unsigned char Scan_Key_delay(unsigned int t);

unsigned char Scan_FunctionKey(void);

#endif
