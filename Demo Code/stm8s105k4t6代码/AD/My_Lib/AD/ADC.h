/*************************************
              ��������
���ڱ��깺����30Ԫ���´ι��򼴿ɷ���5�ǣ�
      ��50Ԫ���´ι��򼴿ɷ���1Ԫ��
     ��100Ԫ���´ι��򼴿ɷ���2Ԫ��
     ��150Ԫ���´ι��򼴿ɷ���4Ԫ��
      ��200Ԫ���´ι��򼴿�����
http://shop106001793.taobao.com/search.htm?spm=a1z10.5.w5002-3375901029.1.l1TXSl&search=y
              stm8s105
               V1.1
             2013.9.8
**************************************/

#ifndef _ADC_H
#define _ADC_H

#include "stm8s.h"

#define Channel_0       0x00
#define Channel_1       0x01
#define Channel_2       0x02
#define Channel_3       0x03
#define Channel_4       0x04
#define Channel_5       0x05
#define Channel_6       0x06
#define Channel_7       0x07
#define Channel_8       0x08
#define Channel_9       0x09
#define Channel_10      0x0A
#define Channel_11      0x0B
#define Channel_12      0x0C
#define Channel_13      0x0D
#define Channel_14      0x0E
#define Channel_15      0x0F

/***************************
AD IO�ں궨��
***************************/
#define ADC_GPIO        GPIOF
#define ADC_PIN         (1<<4)


void ADC_Init(u8 Channel);
u16 ADC_Data(void);
void ADC_IOConfig(void);


#endif
