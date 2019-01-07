/* 	ILI9163_Font.h -- High-level graphic routines for TFT panel					*/ 
/* 	Author- xy																	*/
/* 	Web - www.nuelectronics.com													*/
/*	Version - v0.1																*/
/*	Date - 12/04/2010															*/

// Font routinen, can be used as Icons

#ifndef _ILI9163_FONT_H_
#define _ILI9163_FONT_H_

#include <inttypes.h>
#include <avr/pgmspace.h>

#define FONT_HEADER_SIZE 7

class ILI9163_Font{

	public:
		uint8_t *Font_Ptr;
		uint8_t Font_Width;
		uint8_t Font_Height;
		uint8_t Font_BitsPixel; 
    	char Font_FirstChar;
    	char Font_LastChar;
		
		uint8_t FixedFont;
		uint16_t Font_color;
		uint16_t BK_color;
		uint16_t  CursorX;
		uint16_t CursorY;
		uint8_t  Char_space;
		uint8_t	 Transparent;   // Transparent =1 - don't print background color, 0 - print background color

	
	ILI9163_Font();
	void set_Color(uint16_t fColor, uint16_t bColor, uint8_t Transparent);
	void set_Cursor(uint16_t x, uint16_t y);
	void set_Font(uint8_t *p_font);  // select font
	void putChar(char c);      
	uint8_t CharWidth(char c);     // calculate char width
	void putstr_P(char *str); //print ROM string
	uint16_t  str_Width_P(char *str); // calulate ROM string width
	void putstr(char *str);        // Print RAM string
	void putnumber(long n);				 // Print integer value
	uint16_t str_Width(char *str);   // calculate RAM string width
};

#endif	
	