/**
  ******************************************************************************
  * @file    exti.c
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#include "exti.h"
 
/*
================================================================================
Function 		: EXTIInit()
Description	:	Initinal SPI interface
================================================================================
*/
void EXTIInit( void )
{
	//PD3-EXTI
	GPIOD->CR1 = 1<<3|1<<2;			//	pull up
	EXTI->CR1 |= 1<<6 ;				//	rising edge
	
	//PD2-Data: default status input
    
}



/*********************************  END OF FILE  ********************************/
