#include<reg51.h>
#include "MyType.h"
#include "SGP18T_ILI9163B_base.h"
#include "SGP18T_ILI9163B_figure.h"
#include "SGP18T_ILI9163B_ascii.h"


int main(void)
{      
	ILI9163_RESET=0;                                
	delay(50);
	ILI9163_RESET=1;                     
	delay(100); 
	ILI9163B_init();
	delay(20);
	while(1)
	{  
		uint8 i,j;

		ILI9163B_display_full(RED);	
		LCD_prints16(4,9,"DRAW PART",WHITE,RED);
		for(i=5;i>1;i--)
		{
			ILI9163B_draw_part(10*i,10*i,127-10*i,159-10*i,BLACK);
			delay(500); 
		}

		ILI9163B_display_full(GREEN);
		LCD_prints(1,19,"DRAW RECTANGLE",BLACK,GREEN);
		for(i=1;i<7;i++)
		{
			ILI9163B_draw_rectangle(10*i,10*i,127-10*i,159-10*i,BLACK);
			delay(500);
		}

		ILI9163B_display_full(BLUE);
		LCD_prints16(4,9,"DRAW LINE",WHITE,BLUE);
		ILI9163B_draw_line(0,0,127,159,BLACK);
		ILI9163B_draw_line(0,159,127,0,BLACK);
		for(i=1;i<10;i++)
		{
			ILI9163B_draw_line(12*i,0,12*i,159,BLACK);
			ILI9163B_draw_line(0,15*i,127,15*i,BLACK);
			delay(500);
		}

		ILI9163B_display_full(PURPLE);
		LCD_prints16(2,9,"DRAW CIRCLE",WHITE,PURPLE);
		for(i=1;i<7;i++)
		{
			ILI9163B_draw_circle(63,79,10*i,BLACK);
			delay(500);
		}

		ILI9163B_display_full(ORANGE);
		LCD_prints16(3,9,"PRINT CHAR",WHITE,ORANGE);
		for(i=0;i<8;i++)
		{
			for(j=0;j<21;j++)
			{
				LCD_printc6(j,i,(' '+i*8+j),BLACK,ORANGE);
				delay(50);
			}
		}
		for(i=8;i<15;i++)
		{
			for(j=0;j<16;j++)
			{
				LCD_printc(j,i,(' '+i*8+j),BLUE,ORANGE);
				delay(50);
			}
		}
		delay(500); 

	   	ILI9163B_display_full(BLACK);
		LCD_prints16(4,7,"LCTECH",BLUE,BLACK);
		LCD_prints6(2,18,"lctech-inc.taobao",WHITE,BLACK);
		delay(1000); 
		//while(1);
   }
}
