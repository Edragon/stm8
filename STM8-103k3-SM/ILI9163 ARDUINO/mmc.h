#ifndef _MMC_H__
#define _MMC_H__

#include "lcd_hw.h"


// Port Controls  (Platform dependent)
#define SELECT()	SD_CS_PORT &= ~(1<<SD_CS_PIN)      /* MMC CS = L */
#define DESELECT()	SD_CS_PORT |=  (1<<SD_CS_PIN)      /* MMC CS = H */ 
#define	MMC_SEL		!(SD_CS_PORT &(1<<SD_CS_PIN))	/* MMC CS status (true:selected) */


/*-----------------------------------------------------------------------*/
/* SPI interace                                                          */
/*-----------------------------------------------------------------------*/
void init_spi (void)
{
	DESELECT();									// set default CS pin	
	SPI_PORT |= (1<<DD_MOSI) | (1<<DD_SCK);
	SPI_DDR   |= (1<<DD_MOSI) | (1<<DD_SCK)|(1<<SPI_SS);	// set spi direction
	SD_CS_PORT |= (1<<SD_CS_PIN);
	SD_CS_DDR |= (1<<SD_CS_PIN);          		// Turns on CS pin as output

	SPCR	   = (1<<SPE)|(1<<MSTR); 			// Initialize SPI port (Mode 0)
    SPSR	   = (1<<SPI2X);					// SPI double speed settings
}


/*

// Alternative macro to receive data fast 
#define rcv_spi()	({SPDR=0xFF; while(!(SPSR& (1<<SPIF)));  SPDR;})

#define xmit_spi(dat) 	SPDR=(dat); while(!(SPSR& (1<<SPIF))); 
*/
#endif
