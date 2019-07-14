/**
  ******************************************************************************
  * @file    CC1101.h
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************
**/
#ifndef _CC1101_H_
#define _CC1101_H_

#include "main.h"     
#include "CC1101_REG.h"	

#define CC_CSN_LOW()		GPIOC->ODR &= ~(1<<3);	while( GPIOC->IDR & 1<<7 );	
#define CC_CSN_HIGH()		GPIOC->ODR |= 1<<3
#define GDO0						(GPIOC->IDR & 1<<4)
		
/*-----------------------------------macro definitions----------------------------*/

typedef enum { TX_MODE, RX_MODE }	TRMODE;

/*----------------------------------- private fuction  ----------------------------*/

static u8 SPI_ExchangeByte( u8 input );

/*read a byte from the specified register*/
u8 CC1101ReadReg( u8 addr );

/*Read some bytes from the rigisters continously*/
void CC1101ReadMultiReg( u8 addr, u8 *buff, u8 size );

/*Read a status register*/
static u8 CC1101ReadStatus( u8 addr );

/*Write a byte to the specified register*/
static void CC1101WriteReg( u8 addr, u8 value );

/*Write some bytes to the specified register*/
static void CC1101WriteMultiReg( u8 addr, u8 *buff, u8 size );

/*----------------------------------- export fction  ----------------------------*/

/*Write a command byte to the device*/
void CC1101WriteCmd( u8 command );

/*Reset the CC1101 device*/
void CC1101Reset( void );

/*Set the CC1101 into IDLE mode*/
void CC1101SetIdle( void );

/*Set the device as TX mode or RX mode*/
void CC1101SetTRMode( TRMODE mode );

/*Flush the TX buffer of CC1101*/
void CC1101ClrTXBuff( void );

/*Flush the RX buffer of CC1101*/
void CC1101ClrRXBuff( void );

/*Send a packet*/
void CC1101SendPacket( u8 *txbuffer, u8 size );

/*Get received count of CC1101*/
u8 CC1101GetRXCnt( void );

/*Receive a packet*/
u8 CC1101RecPacket( u8 *rxBuffer, u8 length );


void CC1101Init( void );

#endif // _CC1101_H_
/*


------------------------------------THE END-------------------------------------
================================================================================
*/
