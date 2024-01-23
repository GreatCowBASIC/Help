#ifndef __KEY_H
#define __KEY_H	 
#include "sys.h"
#include "delay.h"


#define KEY1  PBin(0)
#define KEY2  PBin(1)

#define KEY1_PRES 1
#define KEY2_PRES 2

void KEY_Init(void);
void Waiting_Key(void);
unsigned char Scan_Key(void);
unsigned char Scan_Key_delay(unsigned int t);

unsigned char Scan_FunctionKey(void);

#endif
