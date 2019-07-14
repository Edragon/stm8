/**
  ******************************************************************************
  * @file    gpio.h
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#include "tim.h"
 
static void RCCInit(void)
{
	CLK->CKDIVR = 4/SYSK - 1/SYSK;		// sys-clock
	CLK->PCKENR = 1<<6 | 1<<4 | 1<<0;	// AWU/SPI/TIM2
}

/*
================================================================================
Function 		: GPIOInit()
Description	:	Initinal SPI interface
================================================================================
*/
static void GPIOInit( void )
{
	RCCInit();
	
	GPIOA->DDR = 0;
	GPIOB->DDR |= 0x07;	//PB0-3
	GPIOC->DDR = 0;
	GPIOD->DDR = 1;			//PD0
	
	GPIOA->CR1 = 0xff;
	GPIOB->CR1 = 0xff;
	GPIOC->CR1 = 0xff;
	GPIOD->CR1 = 0xff;
	
	AWU->APR = 17;
	AWU->TBR = 5;
	AWU->CSR = 1<<4;
	
}




/*********************************  END OF FILE  ********************************/
