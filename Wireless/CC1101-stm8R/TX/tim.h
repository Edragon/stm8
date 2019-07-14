/**
  ******************************************************************************
  * @file    tim.h
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#ifndef _TIM_H_
#define _TIM_H_


#include "stm8l10x.h"

#define SYSK 1	//modify basetime for sysclock/2MHz-1/4MHz-2/8MHz-4/16MHz-8

void TIMInit( void );
void delay(u16 nTime);
void LedFlash(u16 nTime);

#endif


/*********************************  END OF FILE  ********************************/
