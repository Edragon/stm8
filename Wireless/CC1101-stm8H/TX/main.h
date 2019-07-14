/**
  ******************************************************************************
  * @file    main.h
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************
**/

#ifndef _MAIN_H_
#define _MAIN_H_

#include "stm8s.h"

#define ReadDataClock				(GPIOD->IDR & 1<<3)	//	PD3
#define ReadDataValue				(GPIOD->IDR&1<<2)		//	PD2

#define REM	0x10
#define USE	0x08
#define ERR	0x04
#define TX	0x02
#define EXEC	0x01

struct pack_pcb
{
	u8 buf[8];
	u8 state;
	u8 power;			//remote power command
	u8 temp;			//remote temperature
};

struct readData
{
	u8 da[3];
	u8 num;
	u8 temp0;			//local temperature
	u8 temp;			//read temperature
	u16 time;
};


extern struct readData read;


#endif //_MAIN_H_


/*********************************  END OF FILE  ********************************/
