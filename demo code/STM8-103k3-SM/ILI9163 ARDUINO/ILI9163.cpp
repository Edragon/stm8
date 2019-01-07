/* ILI9163 control */

#include <avr/io.h> 
#define F_CPU 16000000L
#include <util/delay.h>
#include "ILI9163.h"
#include "lcd_hw.h"
 

static uint16_t _color;
static uint8_t _orientation;


void ILI9163::lcd_hw_init()
{
	  // LCD_RST = 0;
  DDRB |= (1<<SPI_CS)|(1<<LCD_RS)|(1<<SPI_MOSI)|(1<<SPI_SCK)|(1<<SPI_SS);
  DDRD |= (1<<LCD_BL)|(1<<LCD_RST);
  
  PORTD &= ~(1<<LCD_RST);
  	
  _delay_ms(50);

  PORTD |= (1<<LCD_RST);  
  _delay_ms(100);

 
   SPCR = 0x50;   // enable SPI master, fosc/2 = 8mhz
   SPSR = 0x1;
   
   PORTD |= (1<<LCD_BL);  // turn on backlight


}
 

void ILI9163::ILI9163_write_command(uint8_t cmd)
{
	RS_L();		// command
	LCD_CS_L();
	
	SPDR = cmd;	
	while((SPSR&0x80)==0);
	LCD_CS_H();
}


void ILI9163::ILI9163_write_para8(uint8_t dat)
{  
	RS_H();		// data
	LCD_CS_L();
	SPDR = dat;	
	while((SPSR&0x80)==0);
	LCD_CS_H();
}
 
/****************DRIVE IC GDRAM 16BITS SPI*****************************/
void ILI9163::ILI9163_write_para16(uint16_t dat)
{  		 
	uint8_t buf;
	
	RS_H();
	LCD_CS_L();
	buf = (uint8_t)(0xFF&(dat>>8));
	SPDR = buf;	
	while((SPSR&0x80)==0);
	LCD_CS_H();
	
	buf = (uint8_t)(0xFF&dat);
	LCD_CS_L();
	SPDR = buf;	
	while((SPSR&0x80)==0);
	LCD_CS_H();
}



/************************************************************
 * @brief  Setups the LCD.
 * @param  None
 * @retval None
**********************************************************/
void ILI9163::Init(uint8_t orient)
{   
	
	_orientation = orient;
	lcd_hw_init();
    ILI9163_write_command(0x11);       		  	//Sleep out
    _delay_ms(100);
    
    ILI9163_write_command(0x3a);       		  	//interface pixel format, 16bpp
    ILI9163_write_para8(0x55);						
   
    ILI9163_write_command(0x26);       		  	//Gamma Set
    ILI9163_write_para8(0x04);
	
    ILI9163_write_command(0xf2);              		//Driver Output Control(1)
    ILI9163_write_para8(0x01);
    
    ILI9163_write_command(0xe0);              		//Driver Output Control(1)
    ILI9163_write_para8(0x3f);
    ILI9163_write_para8(0x25);
    ILI9163_write_para8(0x1c);
   	ILI9163_write_para8(0x1e);
    ILI9163_write_para8(0x20);
    ILI9163_write_para8(0x12);
    ILI9163_write_para8(0x2a);
    ILI9163_write_para8(0x90);
    ILI9163_write_para8(0x24);
    ILI9163_write_para8(0x11);
    ILI9163_write_para8(0x00);
    ILI9163_write_para8(0x00);
    ILI9163_write_para8(0x00);
    ILI9163_write_para8(0x00);
    ILI9163_write_para8(0x00);
     
    ILI9163_write_command(0xe1);              //Driver Output Control(1)
    ILI9163_write_para8(0x20);
    ILI9163_write_para8(0x20);
    ILI9163_write_para8(0x20);
    ILI9163_write_para8(0x20);
    ILI9163_write_para8(0x05);
    ILI9163_write_para8(0x00);
    ILI9163_write_para8(0x15);
    ILI9163_write_para8(0xa7);
    ILI9163_write_para8(0x3d);
    ILI9163_write_para8(0x18);
    ILI9163_write_para8(0x25);
    ILI9163_write_para8(0x2a);
    ILI9163_write_para8(0x2b);
    ILI9163_write_para8(0x2b);  
    ILI9163_write_para8(0x3a);  
    
    ILI9163_write_command(0xb1);              	//Frame rate control
    ILI9163_write_para8(0x08);				   	//DIVA=8
    ILI9163_write_para8(0x08);				   	//VPA =8£¬~90Hz
    				   
    ILI9163_write_command(0xb4);              	//Display Inversion control
    ILI9163_write_para8(0x07);				  	//NLA=1,NLB=1,NLC=1
   
   
    ILI9163_write_command(0xc0);              //LCD Power control1
    ILI9163_write_para8(0x0a);
    ILI9163_write_para8(0x02);
      
    ILI9163_write_command(0xc1);              //LCD Power control2
    ILI9163_write_para8(0x02);

    ILI9163_write_command(0xc5);              //LCD VCOM_Control1
    ILI9163_write_para8(0x4f);
   	ILI9163_write_para8(0x5a);

    ILI9163_write_command(0xc7);              //LCD VCOM_Control2
    ILI9163_write_para8(0x40);
    
    ILI9163_write_command(0x2a);              	//Colum Address set
    ILI9163_write_para8(0x00);				   	//Starting address
    ILI9163_write_para8(0x00);					
    ILI9163_write_para8(0x00);				   	//Finish address
    ILI9163_write_para8(0x7f);
   
    ILI9163_write_command(0x2b);              	//page address set
    ILI9163_write_para8(0x00);				   	//starting address 0x0000
    ILI9163_write_para8(0x00);
    ILI9163_write_para8(0x00);				  	//Finish address(159)
    ILI9163_write_para8(0x9f);

    ILI9163_write_command(0x36);              	//Memory access control
	
	if(_orientation == LCD_HORIZONTAL)
		ILI9163_write_para8(0x88);					//MX=1,MY=1
	else
		ILI9163_write_para8(0xc8);	

    ILI9163_write_command(0xb7);              	//LCD Driveing control
    ILI9163_write_para8(0x00);				   	//CRL=0
	   
    ILI9163_write_command(0x29);   		  	//Display on
    ILI9163_write_command(0x2c);   			//switch to memory write mode
  
}


uint16_t ILI9163::GetWidth(){
	if (_orientation == LCD_HORIZONTAL)
		return LCD_WIDTH;
	else
		return LCD_HEIGHT;
}

uint16_t ILI9163::GetHeight(){
	if (_orientation == LCD_HORIZONTAL)
		return LCD_HEIGHT;
	else
		return LCD_WIDTH;
}

void ILI9163::SetOrientation(uint8_t orient)
{
	_orientation=orient;
	 ILI9163_write_command(0x36);  
	if(_orientation == LCD_HORIZONTAL)
		ILI9163_write_para8(0x28);					//MX=1,MY=1
	else
		ILI9163_write_para8(0xc8);
}


// test - set orientation, top 3 bits
void ILI9163::SetOrient(uint8_t orientation)
{
	uint8_t temp;
	
	temp = (orientation << 5) | 0x8;
	
	if(temp & 0x20)
		_orientation = LCD_HORIZONTAL;
	else
		_orientation = LCD_VERTICAL;
		
	 ILI9163_write_command(0x36);  
	 
		ILI9163_write_para8(temp);					//MX=1,MY=1
	 
	
}

    
uint16_t ILI9163::GetColor(void){
	return _color;
}


uint8_t ILI9163::GetOrientation(){
	return _orientation;
}
    
void ILI9163::SetColor(uint16_t color){
	_color = color;
}
   
void ILI9163::setArea(uint8_t xs, uint8_t ys, uint8_t xe, uint8_t ye) 
{
	ILI9163_write_command(0x2A);  //Colulm Address Set
	ILI9163_write_para8(0x00);			
	ILI9163_write_para8(xs);			
	ILI9163_write_para8(0x00);		
	ILI9163_write_para8(xe);			

	ILI9163_write_command(0x2B);  //Page Address Set
	ILI9163_write_para8(0x00);		
	ILI9163_write_para8(ys);			
	ILI9163_write_para8(0x00);		
	ILI9163_write_para8(ye);			

	ILI9163_write_command(0x2C);  
}


void ILI9163::resetArea(void)
{
		setArea(0,0,GetWidth()-1, GetHeight()-1);
	    	
}

void ILI9163::gotoXY(uint8_t x, uint8_t y)
{
	setArea(x,y,x,y);

}

void ILI9163::putPixel(uint8_t x, uint8_t y, uint16_t color)
{
	setArea(x,y,x,y);
	ILI9163_write_para16(color);
}



void ILI9163::fill(uint8_t x_count, uint8_t y_count, uint16_t color)
{
	uint16_t i,j;
 

 	for(i=0;i<x_count;i++)
	{
     	for(j=0;j<y_count;j++)
      {
				ILI9163_write_para16(color);
      }
	}
}






/**
 * @}
 */

/**
 * @}
 */
 
