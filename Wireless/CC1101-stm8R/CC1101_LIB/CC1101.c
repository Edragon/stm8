/**
  ******************************************************************************
  * @file    CC1101.c
  * @author  xu
  * @version V1.0.0
  * @date    18-December-2014
  ******************************************************************************/

#include "CC1101.H"
#include "tim.h"


#define halRfWriteReg	CC1101WriteReg

#define PA_TABLE { 0x00,0x12,0x0e,0x33,0x68,0x53,0x61,0x60 }

u8 PaTabel[8] = PA_TABLE;
/*==============================================================================
*/
void RfWriteReg(void)
{
		halRfWriteReg(CC1101_IOCFG0,0x01);	//GDO0 Output Pin Configuration
		halRfWriteReg(CC1101_IOCFG2,0x2f);	//GDO2 Output Pin to HW0
		halRfWriteReg(CC1101_FIFOTHR,0x47);	//RX FIFO and TX FIFO Thresholds
		halRfWriteReg(CC1101_CHANNR,0x02);	//Channel Number
		halRfWriteReg(CC1101_FSCTRL1,0x06);	//Frequency Synthesizer Control
		halRfWriteReg(CC1101_FREQ2,0x10);		//Frequency Control Word, High Byte
		halRfWriteReg(CC1101_FREQ1,0xB1);		//Frequency Control Word, Middle Byte
		halRfWriteReg(CC1101_FREQ0,0x3B);		//Frequency Control Word, Low Byte
		halRfWriteReg(CC1101_MDMCFG4,0xF6);	//Modem Configuration
		halRfWriteReg(CC1101_MDMCFG3,0x83);	//Modem Configuration
		halRfWriteReg(CC1101_MDMCFG2,0x1B);	//Modem Configuration
		halRfWriteReg(CC1101_DEVIATN,0x15);	//Modem Deviation Setting
		halRfWriteReg(CC1101_PKTCTRL1,0x24);		//Main Radio Control State Machine Configuration	========
		halRfWriteReg(CC1101_MCSM2,0x18);		//Main Radio Control State Machine Configuration	========
		halRfWriteReg(CC1101_MCSM0,0x18);		//Main Radio Control State Machine Configuration
		halRfWriteReg(CC1101_FOCCFG,0x16);	//Frequency Offset Compensation Configuration
		halRfWriteReg(CC1101_WOREVT1,0x43);	//WOR EVENT0 period	=========
		halRfWriteReg(CC1101_WOREVT0,0xb5);	//WOR EVENT0 period	500ms /every packet is 588ms	=======
		halRfWriteReg(CC1101_WORCTRL,0x78);	//Wake On Radio Control	=======$$$
		halRfWriteReg(CC1101_FREND0,0x17);	//Front End TX Configuration
		halRfWriteReg(CC1101_FSCAL3,0xE9);	//Frequency Synthesizer Calibration
		halRfWriteReg(CC1101_FSCAL2,0x2A);	//Frequency Synthesizer Calibration
		halRfWriteReg(CC1101_FSCAL1,0x00);	//Frequency Synthesizer Calibration
		halRfWriteReg(CC1101_FSCAL0,0x1F);	//Frequency Synthesizer Calibration
		halRfWriteReg(CC1101_TEST2,0x81);		//Various Test Settings
		halRfWriteReg(CC1101_TEST1,0x35);		//Various Test Settings
		halRfWriteReg(CC1101_TEST0,0x09);		//Various Test Settings
}

/*==============================================================================
Function 		: SPI_ExchangeByte()
Description	:	SPI low level communication	fuction
Parameter		:	--input,To send data
Return			:	received data
================================================================================
*/
static u8 SPI_ExchangeByte( u8 input )
{
	while (!( SPI->SR & 1<<1 ));
	SPI->DR = input;
	while (!( SPI->SR & 1<<0 ));
	return 	SPI->DR;
}

/*
================================================================================
Function 		: 	CC1101ReadReg()
Description	: read a byte from the specified register
INPUT    		: 	--addr, The address of the register
OUTPUT   		: 	the byte read from the rigister
================================================================================
*/
u8 CC1101ReadReg( u8 addr )
{
	u8 i;
	
	CC_CSN_LOW();
	SPI_ExchangeByte( addr | READ_SINGLE);
	i = SPI_ExchangeByte( 0xFF );
	CC_CSN_HIGH();
	return i;
}


/*
================================================================================
Function 		:	CC1101ReadMultiReg()
Description	:	Read some bytes from the rigisters continously
INPUT    		: --addr, The address of the register  buff, The buffer stores the data
		   				--size, How many bytes should be read
================================================================================
*/
void CC1101ReadMultiReg( u8 addr, u8 *buff, u8 size )
{
	u8 i, j;
	
	CC_CSN_LOW();
	SPI_ExchangeByte( addr | READ_BURST);
	for( i = 0; i < size; i ++ )
	{
		for( j = 0; j < 5; j ++ );
		*( buff + i ) = SPI_ExchangeByte( 0xFF );
	}
	CC_CSN_HIGH();
}

/*
================================================================================
Function 		: 	CC1101ReadStatus()
Description	: Read a status register
INPUT    		: 	--addr, The address of the register
OUTPUT  		: 	the value read from the status register
================================================================================
*/
u8 CC1101ReadStatus( u8 addr )
{
	u8 i;
	CC_CSN_LOW();
	SPI_ExchangeByte( addr | READ_BURST);
	i = SPI_ExchangeByte( 0xFF );
	CC_CSN_HIGH();
	return i;
}
/*
================================================================================
Function 		: 	CC1101SetTRMode()
Description	: Set the device as TX mode or RX mode
INPUT    		: --mode selection
================================================================================
*/
void CC1101SetTRMode( TRMODE mode )
{
	if( mode == TX_MODE ) 		
	{ 
		CC1101WriteCmd( CC1101_STX ); 
	}
	else if( mode == RX_MODE )	
	{ 
		for( u16 i=0; i<30*SYSK; i++ );
		CC1101WriteCmd( CC1101_SRX ); 
	} 
}

/*
================================================================================
Function 		: 	CC1101WriteReg()
Description	: Write a byte to the specified register
INPUT    		: --addr, The address of the register
		   				--value, the byte you want to write
================================================================================
*/
void CC1101WriteReg( u8 addr, u8 value )
{
	CC_CSN_LOW();
	SPI_ExchangeByte( addr );
	SPI_ExchangeByte( value );
	CC_CSN_HIGH();
}

/*
================================================================================
Function 		: CC1101WriteMultiReg()
Description	: Write some bytes to the specified register
INPUT    		: --addr, The address of the register
		   				--buff, a buffer stores the values
		   				--size, How many byte should be written
================================================================================
*/
void CC1101WriteMultiReg( u8 addr, u8 *buff, u8 size )
{
	u8 i;
	CC_CSN_LOW();
	SPI_ExchangeByte( addr | WRITE_BURST );
	for( i = 0; i < size; i ++ )
	{
		SPI_ExchangeByte( *( buff + i ) );	
	}
	CC_CSN_HIGH();
}


/*
================================================================================
Function 		: 	CC1101WriteCmd()
Description	: Write a command byte to the device
INPUT    		:	command, the byte you want to write
================================================================================
*/
void CC1101WriteCmd( u8 command )
{
	CC_CSN_LOW();
	SPI_ExchangeByte( command );
	CC_CSN_HIGH();
}


/*
================================================================================
Function 		: CC1101Reset()
Description	: Reset the CC1101 device
================================================================================
*/
void CC1101Reset( void )
{
	CC_CSN_HIGH();
	CC_CSN_LOW();
	CC_CSN_HIGH();
	for( u8 i=0; i<30*SYSK; i++ );
	CC1101WriteCmd( CC1101_SRES );	
}


/*
================================================================================
Function 		: CC1101SetIdle()
Description	: Set the CC1101 into IDLE mode
================================================================================
*/
void CC1101SetIdle( void )
{
    CC1101WriteCmd(CC1101_SIDLE);
}

/*
================================================================================
Function 		: CC1101WOR()
Description	: Enter Wake on Radio mode
================================================================================
*/
void CC1101SWOR( void )
{
	
	CC1101SetIdle();
	CC1101WriteReg(CC1101_IOCFG0,0x01); //GDO0
	CC1101WriteReg(CC1101_IOCFG1,0x2e); //GDO1
	CC1101WriteCmd( CC1101_SWOR );

}


/*
================================================================================
Function 		: CC1101ExitSWOR()
Description	: Enter Wake on Radio mode
================================================================================
*/
void CC1101ExitSWOR( void )
{
	
	CC1101SetIdle();
	CC1101WriteReg(CC1101_IOCFG0,0x06); //GDO0
	CC1101WriteReg(CC1101_IOCFG1,0x2e); //GDO1
	CC1101WriteMultiReg(CC1101_PATABLE, PaTabel, 8);

}


/*
================================================================================
Function 		: CC1101SPWD()
Description	: Enter power down mode
================================================================================
*/
void CC1101SPWD( void )
{
	
	CC1101SetIdle();
	CC1101WriteReg(CC1101_IOCFG0,0x6f); //GDO0 Output Pin to HW1
	CC1101WriteReg(CC1101_IOCFG1,0x6f); //GDO1 Output Pin to HW1
	for( u16 i=0; i<200*SYSK; i++ );
	CC1101WriteCmd( CC1101_SPWD );

}


/*==============================================================================
Function 		: CC1101ClrTXBuff()
Description	: Flush the TX buffer of CC1101
================================================================================
*/
void CC1101ClrTXBuff( void )
{
    CC1101SetIdle();
    CC1101WriteCmd( CC1101_SFTX );
}


/*==============================================================================
Function 		: CC1101ClrRXBuff()
Description	: Flush the RX buffer of CC1101
================================================================================
*/
void CC1101ClrRXBuff( void )
{
    CC1101SetIdle();
    CC1101WriteCmd( CC1101_SFRX );
}


/*==============================================================================
Function 		: CC1101SendPacket()
Description	: Send a packet
INPUT    		: txbuffer, The buffer stores data to be sent
           		size, How many bytes should be sent
================================================================================
*/
void CC1101SendPacket( u8 *txbuffer, u8 size )
{
		CC1101ExitSWOR();
		
    CC1101WriteReg( CC1101_TXFIFO, size );
    CC1101WriteMultiReg( CC1101_TXFIFO, txbuffer, size );
    CC1101SetTRMode( TX_MODE );

		while( !GDO0 );
		while( GDO0 );
    CC1101ClrTXBuff();
}


/*==============================================================================
Function 		: CC1101GetRXCnt()
Description	: Get received count of CC1101
OUTPUT   		: How many bytes have been received
================================================================================
*/
u8 CC1101GetRXCnt( void )
{
    return ( CC1101ReadStatus( CC1101_RXBYTES ) & BYTES_IN_RXFIFO );
}


/*==============================================================================
Function 		: CC1101RecPacket()
Description	: Receive a packet
INPUT    		: rxBuffer, A buffer store the received data
              size, How many bytes should be received
OUTPUT   		: 1:received, 0:no data 
================================================================================
*/
u8 CC1101RecPacket( u8 *rxBuffer, u8 length )
{
	
	if( !GDO0 )	return 1;
	
	if ( CC1101GetRXCnt() != 0 )
	{
		if( CC1101ReadReg(CC1101_RXFIFO) == length )
		{   // Pull data, include 2 bytes of status 
			CC1101ReadMultiReg(CC1101_RXFIFO, rxBuffer, length+2);
					
			CC1101ClrRXBuff();
			
			if( rxBuffer[length+1] & CRC_OK ) { return 0; }
			else    return 2;           // CRC error
		}                               
		else
		{
			CC1101ClrRXBuff();          // Flush RXFIFO
			return 3;                   // Error
		}
	}
	else    return 4;               // Error
}

/*
================================================================================
Function 		:	CC1101Init()
Description	:	Config the CC1101 register
================================================================================
*/
void CC1101Init( void )
{
	CC1101Reset();
	
	RfWriteReg();
	
	CC1101WriteReg( CC1101_SYNC0, 0xc6 );
	CC1101WriteReg( CC1101_SYNC1, 0xe7 );
		
	CC1101WriteMultiReg(CC1101_PATABLE, PaTabel, 8);
	
	CC1101SWOR();
	
}


/*
================================================================================
------------------------------------THE END-------------------------------------
================================================================================
*/
