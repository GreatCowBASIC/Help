/******************************************************************************
  * Copyright(c) 2023 Levetop Semiconductor Co., Ltd. All rights reserved
  * @file      main.c
  * @author    Levetop TFT Controller Application Team
  * @version   V1.0.0
  * @date      2023-02-24
  * @brief     TP chip related GPIO pins intialization and functions
*******************************************************************************/

#ifndef _rtp_h
#define _rtp_h
#include "rpio.h"
#include "LT768_Lib.h"
#include <math.h>
#include <stdlib.h>
#include "delay.h"

// Initialize TP chip related GPIO pins
u8 LT_TpInit(void);

// Scan the TP - Check if the TP is touched and retrieve the coordinate if so
u8 LT_TpScan(void);

// Read x and y coordinate
u8 TP_Read_XY2(u16 *x,u16 *y) ;

#endif
