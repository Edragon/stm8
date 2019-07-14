/**
  ******************************************************************************
  * @file    main.h
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#ifndef _MAIN_H_
#define _MAIN_H_

#include "stm8l10x.h"

#define pushKey						(( GPIOC->IDR & 0x07 ) != 0x07 )
#define EXTIdisable() 		GPIOC->CR2 = 0  
#define EXTIenable() 			GPIOC->CR2 = 0x07		//	PC0-2
#define powerEXTIenable()	GPIOC->CR2 = 1<<2		//	PC2

#define POWER		0x80
#define RESERVE 0x70
#define WAIT		0x08
#define TX			0x04
#define KEY			0x03
#define STANDBY 0

struct pack_pcb
{
	u8 buff[8];
	u8 use;
	u8 err;
	__IO u8 time1;	//Auto poweroff if not use
	__IO u16 time2;	//Auto poweroff in abnormal
};

struct keystruct
{
	__IO u8 count;
	__IO u8 state;
	u8 power;
	u8 temp;
	u16 time;
};

extern volatile u16 localTime;
extern struct pack_pcb cc_pcb;
extern struct keystruct key;


#endif //_MAIN_H_


/*********************************  END OF FILE  ********************************/
