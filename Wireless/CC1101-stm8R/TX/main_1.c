/**
  ******************************************************************************
  * @file    main.c
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#include "dataProcess.h"
#include "spi.h"
#include "tim.h"
#include "exti.h"
#include "CC1101.h"

struct pack_pcb	cc_pcb;

volatile u8 readDataSuccessFlag;
u8 heaterTemp, faultFlag;
u32 test;


/*==============================================================================
Function 		: main body
================================================================================
*/
main()  
{
	SPIInit();
	TIMInit();
    EXTIInit();
	CC1101Init();

    enableInterrupts();
	ReadData_enable();	 
	while( 1 )
	{
      
      
    }
}



/*********************************  END OF FILE  ********************************/
