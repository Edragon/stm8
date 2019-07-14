/**
  ******************************************************************************
  * @file    exti.h
  * @author  xu
  * @version V1.0.0
  * @date    18-February-2014
  ******************************************************************************/

#ifndef _EXTI_H_
#define _EXTI_H_


#include "stm8l10x.h"

/*
================================================================================
Function 		: EXTIInit()
Description	:	Initinal SPI interface
================================================================================
*/
static void EXTIInit( void )
{
	//Pin0-2 falling edge
	EXTI->CR1 |= 2<<4|2<<2 ;
	//Pin4-rising edge
	EXTI->CR2 |= 1<<0 ;
	
	//(GDO0)-PB4,key1/3-PB0/2
	GPIOB->CR1 |= ~(1<<4);		//	PB4 floating mode
	
}


#endif


/*********************************  END OF FILE  ********************************/
