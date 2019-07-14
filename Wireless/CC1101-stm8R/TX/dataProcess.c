/**
  ******************************************************************************
  * @file    dataProcess.c
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#include "dataProcess.h"
#include "peripheral.h"
#include "disp.h"


/*==============================================================================
Function 		: packet data process
output			: 0-correct, 1-error
===============================================================================*/
u8 packProcess(void)
{
	if( cc_pcb.buff[0] != 0x55 || cc_pcb.buff[1] != 0xff )
		return(1);
	
	if( cc_pcb.buff[2]!=0x0f && cc_pcb.buff[2]!=0xf0 )
		return(2);
	
	if( cc_pcb.buff[2]!=cc_pcb.buff[4] || cc_pcb.buff[3]!=cc_pcb.buff[5] )
		return(3); 
	
	cc_pcb.time1 = 0;
	cc_pcb.time2 = 0;
	
	if( cc_pcb.buff[2] == 0x0f )
		cc_pcb.use = 0;
	else
		cc_pcb.use = 1;

	if( cc_pcb.buff[3] == key.temp )
		cc_pcb.err = 0;
	else if(( cc_pcb.buff[3] & 0xf0 ) == 0xe0 )
		cc_pcb.err = 1;
	else
		cc_pcb.err = 2;

	return(0);
}
		
/*==============================================================================
Function 		: process the temp key
output			: None
===============================================================================*/
void tempKeyProc(void)
{
	
	if( key.count>10 )
	{
		if( pressUp && key.temp < 55 )	key.temp++;
		else if( pressDown && key.temp > 35 )	 key.temp--;
		
		key.count = 0;
		key.time = localTime;
		key.state |= WAIT;
	}
	else if( localTime - key.time > 40 )
	{
		if( key.state & WAIT )
			key.state |= TX;
		
		key.state &= ~( WAIT | KEY );
	}		
}

		
/*==============================================================================
Function 		: recover the MCU
output			: None
===============================================================================*/
void powerOn(void)
{
			GPIOA->CR1 = 0xff;
			GPIOC->CR1 = 0xff;
			
			AWUInit();

			key.power = 0xf0;
			displayOn(key.temp);
}

		
/*==============================================================================
Function 		: display on
output			: None
===============================================================================*/
void displayOn(u8 t)
{
	static u8 phase;
	u8 a, b;
	
	if(t<100)
	{
		a = t % 10;
		b = t / 10;
	}
	else
	{
		a = t & 0xf;
		if( a > 9 )	a = 10;
		b = 10;
	}
	
	switch( phase )
	{
		case 0:
			GPIOA->DDR = 0;
			GPIOC->DDR = 1<<3;
			
			GPIOA->ODR = 0;							
			GPIOC->ODR = 0;							
			
			GPIOD->ODR = d[b][0]>>1;							
			GPIOB->ODR &= 0xf8;
			GPIOB->ODR |= (d[b][0]&1)<<2 | d[a][0];
		
			break;
		
		case 1:
			GPIOA->DDR = 0;
			GPIOC->DDR = 1<<4;
			
			GPIOD->ODR = d[b][1]>>1;							
			GPIOB->ODR &= 0xf8;
			GPIOB->ODR |= (d[b][1]&1)<<2 | d[a][1];
		
		
			break;
		
		case 2:
			GPIOA->DDR = 1<<2;
			GPIOC->DDR = 0;
			
			GPIOD->ODR = d[b][2]>>1;							
			GPIOB->ODR &= 0xf8;
			GPIOB->ODR |= (d[b][2]&1)<<2 | d[a][2];
			
			break;
		
		case 3:
			GPIOA->DDR = 1<<3;
			GPIOC->DDR = 0;
			
			GPIOD->ODR = d[b][3]>>1;							
			GPIOB->ODR &= 0xf8;
			if( cc_pcb.use )
				GPIOB->ODR |= (d[b][3]&1)<<2 | d[a][3] | 1;
			else
				GPIOB->ODR |= (d[b][3]&1)<<2 | d[a][3];
			
			break;
		
		case 4:
			GPIOA->DDR = 0;
			GPIOC->DDR = 1<<3;
			
			GPIOA->ODR = 0x0c;							
			GPIOC->ODR = 0x18;							
			
			GPIOD->ODR = ~(d[b][0]>>1);							
			GPIOB->ODR &= 0xf8;
			GPIOB->ODR |= ~((d[b][0]|0xfe)<<2 | d[a][0]);
		
			break;
		
		case 5:
			GPIOA->DDR = 0;
			GPIOC->DDR = 1<<4;
			
			GPIOD->ODR = ~(d[b][1]>>1);							
			GPIOB->ODR &= 0xf8;
			GPIOB->ODR |= ~((d[b][1]|0xfe)<<2 | d[a][1]);
		
		
			break;
		
		case 6:
			GPIOA->DDR = 1<<2;
			GPIOC->DDR = 0;
			
			GPIOD->ODR = ~(d[b][2]>>1);							
			GPIOB->ODR &= 0xf8;
			GPIOB->ODR |= ~((d[b][2]|0xfe)<<2 | d[a][2]);
			
			break;
		
		case 7:
			GPIOA->DDR = 1<<3;
			GPIOC->DDR = 0;
			
			GPIOD->ODR = ~(d[b][3]>>1);							
			GPIOB->ODR &= 0xf8;
			if( cc_pcb.use )
				GPIOB->ODR |= ~((d[b][3]|0xfe)<<2 | d[a][3] | 1 );
			else
				GPIOB->ODR |= ~((d[b][3]|0xfe)<<2 | d[a][3]);
			
			break;
	}
	
	phase = (phase<7)? phase+1 : 0;
}


/*==============================================================================
Function 		: display off
output			: None
===============================================================================*/
void displayOff(void)
{
			GPIOA->DDR = 0;
			GPIOC->DDR = 0;
			
			GPIOA->CR1 = 0x03;
			GPIOC->CR1 = 0x07;
			
			GPIOD->ODR = 0;							
			GPIOB->ODR &= 0xf8;
			
			AWU->CSR = 0;
			AWU->APR = 0x3f;
			AWU->TBR = 0;

}


		
/*********************************  END OF FILE  ********************************/
