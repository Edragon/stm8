/**
  ******************************************************************************
  * @file    main.h
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#ifndef _DATAPROCESS_H_
#define _DATAPROCESS_H_

#include "main.h"

#define pressUp	!( GPIOC->IDR & 1<<0 ) 
#define pressDown	!( GPIOC->IDR & 1<<1 ) 



u8 packProcess(void);
void tempKeyProc(void );
void powerOn(void);
void displayOn(u8 t);
void displayOff(void);


#endif //_DATAPROCESS_H_


/*********************************  END OF FILE  ********************************/
