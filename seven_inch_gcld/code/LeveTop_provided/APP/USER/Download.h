#ifndef __DOWNLOAD_H
#define __DOWNLOAD_H

#include "Flash.h"

#define Back_color		  White
#define File_name_color   Black
#define OK_color 		  Blue
#define NG_color     	  Red
#define Fail_color		  Red
#define None_color		  Purple
#define Progress_color	  Black

#define APP_ADDR  0x8008000                           //在（1024×32）32K开始运行

signed char Flash_Updata(const char *buf,char type);
signed char APP_Updata(const char *buf);

signed char W25N01GV_BBM(unsigned short Block_num);
#endif
