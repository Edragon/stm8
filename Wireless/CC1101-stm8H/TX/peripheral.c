/**
  ******************************************************************************
  * @file    spi.c
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#include "peripheral.h"
 
/*
================================================================================
Function 		: RCCInit()
Description	:	Initinal SYSCLK interface
================================================================================
*/
static void RCCInit(void)
{
	CLK->CKDIVR = 0;	// SysClock = 16MHz
}

/*
================================================================================
Function 		: SPIInit()
Description	:	Initinal SPI interface
================================================================================
*/
static void SPIInit( void )
{
	//初始化SPI接口
	SPI->CR1 |= 1<<6|1<<2;
	SPI->CR2 |= 1<<1|1<<0;

}

/*
================================================================================
Function 		: GPIOInit()
Description	:	Initinal GPIO interface
================================================================================
*/
static void GPIOInit(void)
{	
	/*------- SPI CLK-PC5, MOSI-PC6, MISO-PC7 ----------*/
	GPIOC->DDR |= 1<<6|1<<5;			//	PC5/6 Output
	GPIOC->CR1 |= 1<<7|1<<6|1<<5;	//	PC7 Pull_up, PD5/6 PP mode
	GPIOC->CR2 |= 1<<6|1<<5;			//	PC5/6 10MHz
	
	/*------(GDO0)->PC4  (CSn)->PC3 ----------*/
	GPIOC->DDR |= 1<<3;				//	PC3	Output
	GPIOC->CR1 |= 1<<4|1<<3;	//	PC4 Pull_up,PC3 PP mode
	GPIOC->CR2 |= 1<<3;				//	PC3	10MHz
	GPIOC->ODR |= 1<<3;				//	PC3	to high
		
	/*---------- PD2/3 data read GPIO ------------*/
	GPIOD->CR1 = 1<<3|1<<2;		//	pull up ( data-PD2 clock-PD3 )
	GPIOD->CR2 = 1<<3;				//	clock-PD3 enable EXTI )
	
	/*------------- LED->PA3 ------------*/
	GPIOA->DDR |= 1<<3;			//	PA3	Output
	GPIOA->CR1 |= 1<<3;			//	PA3	PP mode

	//	key Control GPIO Power-PD4, tempUp-PB4, tempDown-PB5
	GPIOB->DDR |= 1<<5|1<<4;			//	PB4/5	Output
	GPIOB->CR1 = 0;								//	PB OD mode
	GPIOD->DDR |= 1<<4;	        	//	PD4	Output
	GPIOD->CR1 &= ~(1<<4);				//	PD4 OD mode
    
	GPIOB->ODR |= 1<<5|1<<4;			//	PB4/5 to 1
	GPIOD->ODR |= 1<<4;			      //	PD4	to 1
}

/*
================================================================================
Function 		: EXTIInit()
Description	:	Initinal SPI interface
================================================================================
*/
static void EXTIInit( void )
{
	
	/*---------- PD3 data clock EXTI ------------*/
	EXTI->CR1 |= 1<<6 ;				//	rising edge
    
}


/*
================================================================================
Function 	:   IWDG_Init()
Description	:	IWDG Init
================================================================================
*/ 
static void IWDGInit(void) 
{ 
    IWDG->KR = 0xCC;    //  start IWDG  
    IWDG->KR = 0x55;    //  key word
    IWDG->RLR = 0xff;
    IWDG->PR = 0x06;    //  64 -- 1.02s
    IWDG->KR = 0xAA;    //  refresh
}


/*
================================================================================
Function 	:   IWDG_fresh()
Description	:	IWDG fresh
================================================================================
*/ 
void IWDGFresh(void) 
{ 
    IWDG->KR = 0xAA;    //  refresh
}


/*
================================================================================
Function 		: EXTIInit()
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
	IWDGInit();
}



/*********************************  END OF FILE  ********************************/
