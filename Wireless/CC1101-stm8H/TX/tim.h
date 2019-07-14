/**
  ******************************************************************************
  * @file    tim.h
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#ifndef _TIM_H_
#define _TIM_H_


#include "stm8s.h"



void TIMInit( void );
u16 getLocalTime(void);
void delayMs(u16 nTime);
void delayUs(u8 nTime);
void LedFlash(u16 nTime);

#endif


/*********************************  END OF FILE  ********************************/
