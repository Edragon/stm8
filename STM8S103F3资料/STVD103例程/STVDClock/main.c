/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */


#include "STM8S103f3p.h"
#define LED_PORT PB_ODR
void Init_GPIO(void)
{
       PB_DDR = 0x20;
       PB_CR1 = 0x20; 
       PB_CR2 = 0x00;
}
void delay_ms(unsigned int ms)
{
       unsigned char i;
       while(ms!=0)
       {
              for(i=0;i<250;i++)
              {}
              for(i=0;i<75;i++)
              {}
              ms--;
       }
}

main()
{
		unsigned char i;
		Init_GPIO();   //初始化I/O
		//启用内部高速晶振且无分频16MHz
		CLK_ICKR|=0x01;      //开启内部HSI
		while(!(CLK_ICKR&0x02));//HSI准备就绪
		CLK_SWR=0xe1;        //HSI为主时钟源
		CLK_CKDIVR=0x00;     //HSI不分频
		for(i=0;i<10;i++)    //闪烁LED
		{
				LED_PORT^=0x20;
				delay_ms(500);
		}
		//启用内部高速晶振且8分频(内部始终分频)2MHz
		CLK_CKDIVR=0x18;   //HSI8分频，2M，复位后的默认值
		for(i=0;i<10;i++)   //闪烁LED
		{
				LED_PORT^=0x20;
				delay_ms(500);
		}
		
		while (1)
		{
        //启用内部高速晶振且无分频16MHz
				
        CLK_SWCR|=0x02; //开启切换
        CLK_ICKR|=0x01;      //开启内部HSI
				while(!(CLK_ICKR&0x02));//HSI准备就绪
				CLK_SWR=0xe1;        //HSI为主时钟源
        while((CLK_SWCR & 0x01)==0x01);//等待切换完成
        CLK_CKDIVR=0x00;     //HSI不分频
        CLK_SWCR&=(~0x02); //关闭切换
        for(i=0;i<20;i++)
        {
						LED_PORT^=0x20;
						delay_ms(500);
				}
				LED_PORT|=0x20;//熄灭LED以区别
				delay_ms(500);
				delay_ms(500);
				delay_ms(500);
				delay_ms(500);
       //启用内部高速晶振且8分频(内部始终分频)2MHz
        CLK_CKDIVR=0x18;
        for(i=0;i<20;i++)
        {
						LED_PORT^=0x20;
						delay_ms(500);
				}
				LED_PORT|=0x20;//熄灭LED以区别
				delay_ms(500);
				delay_ms(500);
			//启用内部低速晶振且无分频
			  
        CLK_SWCR|=0x02; //开启切换
        CLK_ICKR|=0x08; //开启LSI
				while(!(CLK_ICKR&0x10));//HSI准备就绪
				CLK_SWR=0xd2;   //LSR为主时钟源
        while((CLK_SWCR & 0x01)==0x01);//等待切换完成
        CLK_CKDIVR=0x00;   //LSI不分频
        CLK_SWCR&=(~0x02); //关闭切换
        for(i=0;i<20;i++)
        {
						LED_PORT^=0x20;
						delay_ms(500);
        }
			  LED_PORT|=0x20;//熄灭LED以区别
				delay_ms(500);
				delay_ms(500);
				delay_ms(500);
				delay_ms(500);
				/*
       //启用外部高速晶振且16分频500KHz
        CLK_SWCR|=0x02; //开启切换
        CLK_SWR=0xb4;
        while((CLK_SWCR & 0x01)==0x01);
        CLK_CKDIVR=0x04;
        CLK_SWCR&=(~0x02); //关闭切换
        for(i=0;i<10;i++)
        {
						LED_PORT=0xff;
						delay_ms(500);
						LED_PORT=(~0xff);
						delay_ms(500);
        }
				*/
		}
}