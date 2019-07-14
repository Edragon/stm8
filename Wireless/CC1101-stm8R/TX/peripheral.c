/**
  ******************************************************************************
  * @file    gpio.h
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#include "peripheral.h"
 
static void RCCInit(void)
{
	CLK->CKDIVR = 4/SYSK - 1/SYSK;		// sys-clock
	CLK->PCKENR = 1<<6 | 1<<4 | 1<<0;	// AWU/SPI/TIM2
}


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

}


/*
================================================================================
Function 		: GPIOInit()
Description	:	Initinal SPI interface
================================================================================
*/
static void GPIOInit( void )
{
/*-------- all to pullup or pp --------------------*/
	GPIOA->CR1 = 0xff;
	GPIOB->CR1 = 0xff;
	GPIOC->CR1 = 0xff;
	GPIOD->CR1 = 0xff;
	

	
/*-------- Key button --------------------*/
	GPIOC->DDR &= 0xf8;	//GPIOC_0-2--input
	
/*-------- LCD Display --------------------*/
	GPIOA->DDR = 0;			//GPIOA_2/3--COM3/4
	GPIOC->DDR = 0;			//GPIOC_3/4--COM1/2
	GPIOB->DDR |= 0x07;	//GPIOB_0-2--Seg1-3
	GPIOD->DDR = 1;			//GPIOD_0--Seg4
	
	/*------ SPI_GPIO CLK-PB5, MOSI-PB6, MISO-PB7 ---------*/
	GPIOB->DDR |= 1<<6|1<<5;	//	PB5/6 Output
	GPIOB->CR1 &= ~(1<<7);		//	PB7	to floatting
	
	/*----------- (CSn)->PB3 -----------------*/
	GPIOB->DDR |= 1<<3;				//	PB3	Output
	GPIOB->ODR |= 1<<3;				//	PB3	to high
	/*----------- (GDO0)->PB4 -----------------*/
	GPIOB->DDR &= ~(1<<4);		//	PB4 input
	GPIOB->CR1 &= ~(1<<4);		//	PB4	to floatting
	

}

/*
================================================================================
Function 		: EXTIInit()
Description	:	Initinal SPI interface
================================================================================
*/
static void EXTIInit( void )
{
	//Pin0-2 falling edge
	EXTI->CR1 |= 2<<4|2<<2|2<<0 ;
}


/*
================================================================================
Function 		: AWUInit()
Description	:	Initinal SPI interface
================================================================================
*/
void AWUInit( void )
{
	AWU->APR = 18;
	AWU->TBR = 5;
	AWU->CSR = 1<<4;
	
}

/*
================================================================================
Function 		: periph_Config()
Description	:	Initinal SPI interface
================================================================================
*/
void PeriphConfig( void )
{
	RCCInit();
	SPIInit();
	GPIOInit();
	EXTIInit();
	TIMInit();
	AWUInit();
	
}


/*********************************  END OF FILE  ********************************/
