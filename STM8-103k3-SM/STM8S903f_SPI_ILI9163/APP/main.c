#include "stm8s.h"
#include "ILI9163.h"
#include "SGP18T_ILI9163B_base.h"
#include "SGP18T_ILI9163B_figure.h"
#include "SGP18T_ILI9163B_ascii.h"
#include "ILI9163CHN.h"

/**********************华丽的分割线*******************************
#define		RED		0x001f
#define		GREEN		0x07e0
#define		BLUE		0xf800
#define		PURPLE		0xf81f        //紫色
#define		YELLOW		0xffe0
#define		CYAN		0x07ff 		//蓝绿色
#define		ORANGE		0xfc08
#define		BLACK		0x0000
#define		WHITE		0xffff
*********************华丽的分割线********************************/

void CLK_Init(void)
{
  CLK_DeInit();
 // CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);   //1分频 16MKZ
 //   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV2);//2分频 8MHZ
 // CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV4);//4分频  4MHZ
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);//8分频  2MHZ
}


void ILI9163_GPIO_init()
{
  GPIO_Init(GPIOC,GPIO_PIN_1,GPIO_MODE_OUT_PP_HIGH_FAST); 
  GPIO_Init(GPIOC,GPIO_PIN_3,GPIO_MODE_OUT_PP_HIGH_FAST); 
  GPIO_Init(GPIOC,GPIO_PIN_5,GPIO_MODE_OUT_PP_HIGH_FAST); 
  GPIO_Init(GPIOC,GPIO_PIN_6,GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(GPIOE,GPIO_PIN_5,GPIO_MODE_OUT_PP_HIGH_FAST);
  GPIO_Init(GPIOC,GPIO_PIN_2,GPIO_MODE_OUT_PP_HIGH_FAST);
}

main()
{
 CLK_Init();
 ILI9163_GPIO_init();
GPIO_WriteLow(GPIOC,GPIO_PIN_1);                                 
 delay(50);
  GPIO_WriteHigh(GPIOC,GPIO_PIN_1);                      
 delay(100); 
   GPIO_WriteHigh(GPIOC,GPIO_PIN_2); 
 ILI9163B_init();
 delay(20);
ILI9163B_display_full(WHITE);
LCD_PutString(5,5,"深圳市艾尔赛科技",0x001f,0x0000);
   LCD_PutString(5,100,"确定",0x001f,0x0000);
    LCD_PutString(120,100,"取消",0x001f,0x0000);
 delay(5000);
 while(1)
 {
    
   
   uint8 i,j;
  
   ILI9163B_display_full(RED);	 
   LCD_prints16(5,7,"DRAW PART",BLACK,RED);
   for(i=5;i>1;i--)
   {
    ILI9163B_draw_part(10*i,10*i,159-10*i,127-10*i,BLACK);
   // delay(500); 
   }
   ILI9163B_display_full(GREEN);
   LCD_prints(4,15,"DRAW RECTANGLE",BLACK,GREEN);
   for(i=1;i<7;i++)
   {
    ILI9163B_draw_rectangle(10*i,10*i,159-10*i,127-10*i,BLACK);
   // delay(500);
   }
   ILI9163B_display_full(BLUE);
   LCD_prints16(5,7,"DRAW LINE",WHITE,BLUE);
   ILI9163B_draw_line(0,0,159,127,BLACK);
   ILI9163B_draw_line(0,127,159,0,BLACK);
   for(i=1;i<10;i++)
   {
    ILI9163B_draw_line(12*i,0,12*i,127,BLACK);
    ILI9163B_draw_line(0,15*i,159,15*i,BLACK);
   // delay(500);
   }
   ILI9163B_display_full(PURPLE);
   LCD_prints16(5,7,"DRAW CIRCLE",WHITE,PURPLE);
   for(i=1;i<7;i++)
   {
    ILI9163B_draw_circle(80,64,10*i,BLACK);
   // delay(500);
   }
   ILI9163B_display_full(ORANGE);
   LCD_prints16(5,200,"PRINT CHAR",WHITE,ORANGE);
   for(i=0;i<8;i++)
   {
    for(j=0;j<21;j++)
    {
     LCD_printc6(j,i,(' '+i*8+j),BLACK,ORANGE);
    // delay(50);
    }
   }
   for(i=8;i<15;i++)
   {
    for(j=0;j<16;j++)
    {
     LCD_printc(j,i,(' '+i*8+j),BLUE,ORANGE);
    // delay(50);
    }
   }
 //  delay(500); 
  ILI9163B_display_full(BLACK);
  LCD_prints6(5,5,"lctech-inc.taobao",WHITE,BLACK);
  delay(1000);
 }
}