/**
  ******************************************************************************
  * @file    Tim.c
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#include "tim.h"
 
/*
================================================================================
Function 		: TIMInit()
Description	:	Initinal SPI interface
================================================================================
*/
void TIMInit( void )
{
	/*-----------------------*/
	TIM1->PSCRH = (16000-1)>>8;					//	1KHz clock
	TIM1->PSCRL = (u8)(16000-1);				//	1KHz clock
	TIM1->ARRH = 0xff;		//	cycle count
	TIM1->ARRL = 0xff;		//	cycle count
	
	TIM1->CR1 |= 1<<0;		//	TIM enable	
	
	/*-----------------------*/
	TIM4->PSCR = 4;				//	1MHz clock
	TIM4->ARR = 0xff;			//	cycle count
	
	TIM4->CR1 |= 1<<0;		//	enable tim4

}


/*
================================================================================
Function 		: localTime()
Description	:	return the local time
================================================================================
*/
u16 getLocalTime(void)
{	
	u16 t;
	
	t = TIM1->CNTRH<<8;		//must read MSB first
	t |= TIM1->CNTRL;
	
	return( t );
}


/*
================================================================================
Function 		: delayMs()
Description	:	time delay (in ms)
================================================================================
*/
void delayMs(u16 nTime)
{	
	u16 t, dt;
	
	t = getLocalTime();
	do{
		dt =  getLocalTime() - t;
	}while( dt<nTime);
}

/*
================================================================================
Function 		: delayUs()
Description	:	time delay (in us),must less then 255us
================================================================================
*/
void delayUs(u8 nTime)
{	
	u8 t;
	
	t = TIM4->CNTR;
	while( (u8)(TIM4->CNTR-t)<nTime);
}


/*
================================================================================
Function 		: LedFlash()
Description	:	time delay (in ms)
================================================================================
*/
void LedFlash(u16 nTime)
{	
	GPIOA->ODR |= 1<<3;	
	delayMs(nTime);
	GPIOA->ODR &= ~(1<<3);
}

/*********************************  END OF FILE  ********************************/
