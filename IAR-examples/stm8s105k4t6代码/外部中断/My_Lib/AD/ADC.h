/*************************************
              今明电子
凡在本店购买满30元，下次购买即可返还5角；
      满50元，下次购买即可返还1元；
     满100元，下次购买即可返还2元；
     满150元，下次购买即可返还4元；
      满200元，下次购买即可免邮
http://shop106001793.taobao.com/search.htm?spm=a1z10.5.w5002-3375901029.1.l1TXSl&search=y
              stm8s105
               V1.1
             2013.9.8
**************************************/

#ifndef _ADC_H
#define _ADC_H

#include "stm8s.h"

#define Channel_2       0x02
#define Channel_3       0x03
#define Channel_4       0x04
#define Channel_5       0x05
#define Channel_6       0x06


/***************************
AD IO口宏定义
***************************/
#define ADC_GPIO        GPIOC
#define ADC_PIN         (1<<4)


void ADC_Init(u8 Channel);
u16 ADC_Data(void);
void ADC_IOConfig(void);


#endif
