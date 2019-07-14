/**
  ******************************************************************************
  * @file    ReadData.c
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#include "main.h"
#include "tim.h"
#include "ReadData.h"
 
/*
================================================================================
Function 		: EXTIInit()
Description	:	Initinal SPI interface
================================================================================
*/
void readData( void )
{
  volatile u8 i, a, b;
  
  for( i = 0; i < 100; i++ ){
    delayUs(1);
    if(( GPIOD->IDR&1<<3 )==0 ){
      delayMs(2);
      break;
    }
  }
/*  
  a = GPIOD->IDR&1<<3;
  for( i = 0; i < 41; ){
    delayUs(1);
    b = GPIOD->IDR&1<<3;
    
    if( !a && b ){
      i++;
      dat.d32 <<= 1;
      if( ReadDataValue ) dat.d32++;
    }
    else    a = b;
  }*/
}



/*********************************  END OF FILE  ********************************/
