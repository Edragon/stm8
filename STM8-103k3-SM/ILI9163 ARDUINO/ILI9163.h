#ifndef _ILI9163_H_
#define _ILI9163_H_


#define LCD_HEIGHT 128	
#define LCD_WIDTH		160

#include <inttypes.h>

// color definition
#define _RGB565(r, g, b) ((uint16_t)(((r >> 3) << 11)| ((g >> 2) << 5)| (b >> 3)))

#define BLACK                       _RGB565(0x00, 0x00, 0x00)
#define WHITE                       _RGB565(0xFF, 0xFF, 0xFF)
#define RED                         _RGB565(0xFF, 0x00, 0x00)
#define GREEN                       _RGB565(0x00, 0xFF, 0x00)
#define BLUE                        _RGB565(0x00, 0x00, 0xFF)
#define YELLOW                      _RGB565(0xFF, 0xFF, 0x00)
#define MAGENTA                     _RGB565(0xFF, 0x00, 0xFF)
#define CYAN                        _RGB565(0x00, 0xFF, 0xFF)
#define GRAY                        _RGB565(0x80, 0x80, 0x40)
#define SILVER                      _RGB565(0xA0, 0xA0, 0x80)
#define GOLD                        _RGB565(0xA0, 0xA0, 0x40)
 

#define LCD_HORIZONTAL 0x1
#define LCD_VERTICAL 0x2

class ILI9163
{
	
  	
  public:
	static void lcd_hw_init();
	static void ILI9163_write_command(uint8_t cmd);
	static void ILI9163_write_para8(uint8_t dat);
	static void ILI9163_write_para16(uint16_t dat);
	static void Init(uint8_t orient);
	static uint16_t GetWidth();
  	static uint16_t GetHeight();
  	static void SetOrientation(uint8_t orient);	
  	static void SetOrient(uint8_t orientation);
  	static uint8_t GetOrientation(); 
  	static void SetColor(uint16_t color);
  	static uint16_t GetColor(void);
  	static void resetArea();
  	static void setArea(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2);
	static void gotoXY(uint8_t x, uint8_t y);
  	static void putPixel(uint8_t x, uint8_t y, uint16_t color);
  	static void fill(uint8_t x_count, uint8_t y_count, uint16_t color);
	//	static void Scroll(int y);
};
#endif

