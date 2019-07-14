/**
  ******************************************************************************
  * @file    spi.c
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/


#ifndef _SPI_H_
#define _SPI_H_


#include "stm8l10x.h"

/*
================================================================================
Function 		: SPIInit()
Description	:	Initinal SPI interface
================================================================================
*/
static void SPIInit( void )
{
	
	//SPI interface
	SPI->CR2 |= 1<<1|1<<0;
	SPI->CR1 |= 1<<6|1<<2;
//	SPI->CR1 |= (SYSK/2-SYSK/8)<<3|1<<6|1<<2;

	/* SPI_GPIO CLK-PB5, MOSI-PB6, MISO-PB7 */
	GPIOB->DDR |= 1<<6|1<<5;			//	PB5/6 Output
	GPIOB->CR1 |= 1<<7|1<<6|1<<5;	//	PB7 Pull_up,PB6/5 PP mode
	GPIOB->CR2 |= 1<<6|1<<5;			//	PB5/6 10MHz
	
	
	// (CSn)->PB3
	GPIOB->DDR |= 1<<3;				//	PB3	Output
	GPIOB->CR1 |= 1<<3;				//	PB3 PP mode
	GPIOB->CR2 |= 1<<3;				//	PB3	10MHz
	GPIOB->ODR |= 1<<3;				//	PB3	to high
		
}




#endif

/*********************************  END OF FILE  ********************************/
