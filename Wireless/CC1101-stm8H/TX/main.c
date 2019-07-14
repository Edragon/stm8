/**
  ******************************************************************************
  * @file    main.c
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************
**/

#include "peripheral.h"
#include "dataProcess.h"
#include "CC1101.h"


#define readDataTime 1000		//1000ms

struct pack_pcb	cc_pcb;
struct readData read;

/*==============================================================================
Function 		: main body
================================================================================
*/
main()  
{

	PeriphConfig();
	CC1101Init();
		 
	while( 1 )
	{
		/*------------------- Rx --------------------*/
		if( GDO0 )	// data received
		{
			if( CC1101RecPacket( cc_pcb.buf, 6 ) == 0 )
			{
				LedFlash(10);
				packProcess( &cc_pcb );
			}
			
			CC1101SetTRMode( RX_MODE );
		}
		
		/*------------------ exec -------------------*/
		if( cc_pcb.state & EXEC )
		{
			ecex( &cc_pcb );
			read.time -= ( readDataTime + 1 );    //	read data right away
		}
		
		/*----------------- read data ----------------*/
		if( getLocalTime() - read.time > readDataTime )	
		{
			read.time = getLocalTime();
			
			while( ReadDataClock ){}  //wait a data packet
			delayMs(3);
      /*  read next packet    */
			read.num = 0;
			enableInterrupts();
			delayMs(10);						//wait for reading
			disableInterrupts();
            
			if( read.num == 41 )    //read clock numbers is right
			{           	
				readDataProcess();
				LedFlash(5);
        //------------------	wheather need to tx ----------------//
				if(( cc_pcb.state & ( REM | EXEC )) == REM )
				{
					if(( read.temp & 0xf0 )==0xe0 && ( cc_pcb.state & ERR )==0 )
					{
							cc_pcb.state |= ( ERR | TX );
							cc_pcb.buf[2] = cc_pcb.buf[4] = 0x0f;
					}
					else if( read.da[0]==0 && cc_pcb.state & USE )
					{
							cc_pcb.state |= TX;
							cc_pcb.buf[2] = cc_pcb.buf[4] = 0x0f;
					}
					else if( read.da[0] && (cc_pcb.state & USE)==0 )
					{
							cc_pcb.state |= TX;
							cc_pcb.buf[2] = cc_pcb.buf[4] = 0xf0;
					}
				}
				
				if( read.da[0] )
					cc_pcb.state |= USE;
				else
					cc_pcb.state &= ~USE;

				if( read.temp < 66 )
					cc_pcb.state &= ~ERR;
			}
			else	read.temp = 0xaa;
			
			if(( cc_pcb.state & REM ) == 0 )//save local set before remote
			{		
				if( read.temp<35 || read.temp>65 )  read.temp0 = 40;
				else   read.temp0 = read.temp;
			}
		}
					 
		/*------------------- Tx --------------------*/
		if( cc_pcb.state & TX )
		{	
			cc_pcb.buf[0] = 0x55;
			cc_pcb.buf[1] = 0xff;
			cc_pcb.buf[3] = cc_pcb.buf[5] = read.temp;
			
			CC1101SendPacket( cc_pcb.buf, 6 );
			LedFlash(10);
    	CC1101SetTRMode( RX_MODE );
			
			cc_pcb.state &= ~TX;
		}
		
		IWDGFresh();           //  iwdg fresh
	}
}



/*********************************  END OF FILE  ********************************/
