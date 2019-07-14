/**
  ******************************************************************************
  * @file    spi.c
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

 

/*
================================================================================
Function 		: SPIInit()
Description	:	Initinal SPI interface
================================================================================
*/
void SPIInit( void )
{
	
	//SPI interface
	SPI->CR1 |= 1<<6|1<<2;
	SPI->CR2 |= 1<<1|1<<0;

	/* SPI CLK-PB5, MOSI-PB6, MISO-PB7 */
	GPIOB->DDR |= 1<<6|1<<5;			//	PB5/6 Output
	GPIOB->CR2 |= 1<<6|1<<5;			//	PB5/6 10MHz
	
	
	//(GDO0)->PB4  (CSn)->PB3
	GPIOB->DDR |= 1<<3;				//	PB3	Output
	GPIOB->CR1 |= 1<<4|1<<3;	//	PB3 Pull_up,PC3 PP mode
	GPIOB->CR2 |= 1<<3;				//	PB3	10MHz
	GPIOB->ODR |= 1<<3;				//	PB3	to high
		

}



/*********************************  END OF FILE  ********************************/
