#ifndef __LCD_HW_H
#define __LCD_HW_H

#ifdef PB1
#define LCD_RST PD1
#define SPI_CS  PB4
#define SPI_MOSI PB2
#define SPI_SCK PB1
#define SPI_SS  PB0
#define LCD_RS  PB6
#define LCD_BL  PD6
#else 
#define LCD_RST PORTD1
#define SPI_CS  PORTB4
#define SPI_SS PORTB0
#define SPI_MOSI PORTB2
#define SPI_SCK PORTB1
#define LCD_RS  PORTB6
#define LCD_BL  PORTD6
#endif

#define LCD_CS_L()  	PORTB &= ~(1<<SPI_CS);
#define LCD_CS_H()	PORTB |= (1<<SPI_CS);

#define RS_L()	PORTB &= ~(1<<LCD_RS);
#define RS_H()	PORTB |= (1<<LCD_RS);

#define SD_CS_DDR		DDRD
#define SD_CS_PORT	PORTD
#define SD_CS_PIN		1


//PORT deifinition for Touchpanel
//SPI configuration (Platform dependent)
#define SPI_DDR		DDRB
#define SPI_PORT 	PORTB
#define DD_MOSI		2
#define DD_MISO		3
#define DD_SCK		1


#endif

