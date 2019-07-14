/**
  ******************************************************************************
  * @file    dataProcess.c
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#include "dataProcess.h"
#include "tim.h"

#define PulseL 180      /*key control time of low  in ms*/
#define PulseH 130      /*key control time of high in ms*/


static u8 process(u8 data);
static void power(void);
static void tempDown(void);
static void tempUp(void);


/*==============================================================================
Function 		: process data of heater
output			: temperature, 0xff present error
===============================================================================*/
void readDataProcess(void)
{
	u8 t;
	
	t = process( read.da[1] );
	t = ( t > 9 )? t<<4 : t*10;
	t += process( read.da[2] );
    
	if( t==0 || ( t&0xf0 )==0xe0 || t>34 && t<66 )
		read.temp = t;
	else
		read.temp = 0xff;
	
	read.da[0] &= 0x04;     //  fire

}


/*==============================================================================
Function 		: process data
output			: data, 0xff present error
===============================================================================*/
u8 process(u8 data)
{
	switch( data | 0x08 )   //:f-f,e-7,d-b,c-3,a-5,9-9,8-1,6-6,4-2,0-0
	{
		case 0x08:		return(0);  //0x0£¬
		case 0xfd:		return(0);  //0xfb
		case 0x68:		return(1);  //0x61
		case 0xdb:		return(2);  //0xbd
		case 0xfa:		return(3);  //0xf5
		case 0x6e:		return(4);  //0x67
		case 0xbe:		return(5);  //0xd7
		case 0xbf:		return(6);  //0xdf
		case 0xe8:		return(7);  //0x71
		case 0xff:		return(8);  //0xff
		case 0xfe:		return(9);  //0xf7
		case 0x9f:		return(0xe);//0x9f
		default:			return(0xff);
	}	
}


/*==============================================================================
Function 		: packet data process
output			: 0-correct, other-error
===============================================================================*/
u8 packProcess(struct pack_pcb *p_pcb)
{
		if( p_pcb->buf[2]!=p_pcb->buf[4] || p_pcb->buf[3]!=p_pcb->buf[5] )
			return(1); 
		
		if( p_pcb->buf[2]!=0x0f && p_pcb->buf[2]!=0xf0 && p_pcb->buf[2]!=0xaa )
			return(2);
		
		if( p_pcb->buf[3]<35 || p_pcb->buf[3]>55 )
			return(3);
		
		if( p_pcb->buf[0]!=0x55 && p_pcb->buf[1]!=0xff )
			return(4);
			
		p_pcb->state |= EXEC;	// rev data, execute
		
		if( p_pcb->buf[2] == 0x0f )	p_pcb->power = 0;	//manual power off
		else if( p_pcb->buf[2] == 0xaa )	p_pcb->power = 1;	//auto power off
		else	p_pcb->power = 2;	// power on
		
		p_pcb->temp = p_pcb->buf[3];
		
		return(0);
}
		
		
/*==============================================================================
Function 		: exexute control
output			: none
===============================================================================*/
void ecex(struct pack_pcb *p_pcb )
{
	if( read.temp == 0xaa || read.temp == 0xff ) // error
      return;

	if( read.temp == 0 ) // heater status is power off
	{
		if( p_pcb->power == 2 )		power();
		else    p_pcb->state &= ~( EXEC | REM );
		
		return;
	}
    
	if( p_pcb->power < 2 )	// remote command is power off
	{
    // restore previous temperature
		if( read.temp == read.temp0 )
		{
//			if( p_pcb->power==1 )
				p_pcb->state &= ~( EXEC | REM );
//			else
//			power();
		}
		else if( read.temp < read.temp0 )
			tempUp();
		else
			tempDown();
	}
	else
	{
		p_pcb->state |= REM;

		if( read.temp == p_pcb->temp )
			p_pcb->state &= ~EXEC;
		else if( read.temp < p_pcb->temp )
			tempUp();
		else
			tempDown();
	}
}		
		
		
/*==============================================================================
Function 		: power on/off
output			: none
===============================================================================*/
void power(void)
{
    GPIOD->ODR &= ~(1<<4);
    delayMs( 3*PulseL );
    
    GPIOD->ODR |= 1<<4;
    delayMs( PulseH );
}
	

/*==============================================================================
Function 		: increase temperatrue
output			: none
===============================================================================*/
static void tempUp(void)
{
    GPIOB->ODR &= ~(1<<4);
    delayMs( PulseL );

    GPIOB->ODR |= 1<<4;
    delayMs( PulseH );
}
			
		
/*==============================================================================
Function 		: decrease temperatrue
output			: none
===============================================================================*/
static void tempDown(void)
{
    GPIOB->ODR &= ~(1<<5);
    delayMs( PulseL );

    GPIOB->ODR |= 1<<5;
    delayMs( PulseH );
}

		
		
		
/*********************************  END OF FILE  ********************************/
