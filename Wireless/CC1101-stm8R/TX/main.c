/**
  ******************************************************************************
  * @file    main.c
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#include "dataProcess.h"
#include "peripheral.h"
#include "CC1101.h"

volatile u16 localTime;
struct pack_pcb	cc_pcb;
struct keystruct key;



static void ParaInit(void)
{
	key.power = 0xf0;
	key.temp = 42;	
	key.state = POWER;
}

/*==============================================================================
Function 		: main body
================================================================================
*/
main()  
{
	PeriphConfig();
	CC1101Init();
	
	ParaInit();

	while( 1 )
	{
	
		/*------------ presskey	-----------*/
		switch( key.state & ( POWER | KEY ))
		{
			case 0x01:
					delay(30);
					if( key.count>25 )
					{
						key.power = 0xf0;
						key.state = POWER | TX;
						powerOn();
					}
					else
						key.state = STANDBY;
					
					break;
					
			case 0x81:
					if( key.count>20 )
					{
						key.time = localTime;
						key.power = 0x0f;
						key.state = TX;
					}
					else if( localTime - key.time > 30 )
						key.state &= ~KEY;
					
					break;
					
			case 0x82:
					tempKeyProc();
					break;
					
			default:
					key.state &= ~(KEY|RESERVE);
					key.count = 0;
					break;
		}
		
		/*------------ auto power off	-----------*/
		if( key.state & KEY )
		{
			cc_pcb.err = 0;
			cc_pcb.time1 = 0;
			cc_pcb.time2 = 0;
		}
		else if( cc_pcb.time1 > 120 || cc_pcb.time2 > 1000 )	//about 5min/40min
		{
			cc_pcb.time1 = 0;
			cc_pcb.time2 = 0;
			key.power = 0xaa;		//
			key.state = TX;
		}
		
		//------------ received data	-----------//
		if( CC1101RecPacket(cc_pcb.buff,6) == 0 )
		{
			packProcess();
			CC1101SWOR();
		}
		
		//------------ send data	-----------//
		if( key.state & TX )
		{
				cc_pcb.buff[0] = 0x55;
				cc_pcb.buff[1] = 0xff;
				cc_pcb.buff[2] = cc_pcb.buff[4] = key.power;
				cc_pcb.buff[3] = cc_pcb.buff[5] = key.temp;

				disableInterrupts();
				CC1101SendPacket( cc_pcb.buff, 6 );
				CC1101SWOR();
				enableInterrupts();
				key.state &= ~TX;			
		}
		
		/*------------ display	-----------*/
		if( key.state & POWER )
		{
			if( cc_pcb.err == 0 )
				displayOn(key.temp);				
			else if( cc_pcb.err == 1 )
				displayOn(cc_pcb.buff[3]);
			else
				displayOn(0xee);
		}		
		else
			displayOff();
		
		/*------------ sleep	-----------*/
		if(( key.state | POWER ) == POWER )
		{
			if( key.state == POWER )
			{
				EXTIenable();
			}
			else
			{
				cc_pcb.use = 0;
				disableInterrupts();
				CC1101SPWD();
				powerEXTIenable();
			}
			
			halt();
		}	
	}
}



/*********************************  END OF FILE  ********************************/
