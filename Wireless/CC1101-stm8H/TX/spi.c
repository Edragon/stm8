/**
  ******************************************************************************
  * @file    spi.c
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#include "spi.h"
 

/*
================================================================================
Function 		: SPIInit()
Description	:	Initinal SPI interface
================================================================================
*/
void SPIInit( void )
{
	//初始化SPI接口
	SPI->CR1 |= 1<<6|1<<2;
	SPI->CR2 |= 1<<1|1<<0;

	/* SPI CLK-PC5, MOSI-PC6, MISO-PC7 */
	GPIOC->DDR |= 1<<6|1<<5;			//	PC5/6 Output
	GPIOC->CR1 |= 1<<7|1<<6|1<<5;	//	PC7 Pull_up, PD5/6 PP mode
	GPIOC->CR2 |= 1<<6|1<<5;			//	PC5/6 10MHz
	
	
	GPIOInit();
}

/*
================================================================================
Function 		: GPIOInit()
Description	:	Initinal GPIO interface
================================================================================
*/
void GPIOInit(void)
{	
	//初始化(GDO0)->PC4  (CSn)->PC3
	GPIOC->DDR |= 1<<3;				//	PC3	Output
	GPIOC->CR1 |= 1<<4|1<<3;	//	PC4 Pull_up,PC3 PP mode
	GPIOC->CR2 |= 1<<3;				//	PC3	10MHz
	GPIOC->ODR |= 1<<3;				//	PC3	to high
		
	//	初始化LED GPIO
	GPIOA->DDR |= 1<<3;			//	PA3	Output
	GPIOA->CR1 |= 1<<3;			//	PA3	PP mode

	//	初始化Control GPIO Power-PD4, tempUp-PB4, tempDown-PB5
	GPIOB->DDR |= 1<<5|1<<4;			//	PB4/5	Output
	GPIOB->CR1 = 0;						//	PB OD mode
	GPIOD->DDR |= 1<<4;	        		//	PD4	Output
	GPIOD->CR1 &= ~(1<<4);				//	PD4 OD mode
    
	GPIOB->ODR |= 1<<5|1<<4;			//	PB4/5 to 1
	GPIOD->ODR |= 1<<4;			        //	PD4	to 1
}


/*********************************  END OF FILE  ********************************/
