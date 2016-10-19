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
		Init_GPIO();   //��ʼ��I/O
		//�����ڲ����پ������޷�Ƶ16MHz
		CLK_ICKR|=0x01;      //�����ڲ�HSI
		while(!(CLK_ICKR&0x02));//HSI׼������
		CLK_SWR=0xe1;        //HSIΪ��ʱ��Դ
		CLK_CKDIVR=0x00;     //HSI����Ƶ
		for(i=0;i<10;i++)    //��˸LED
		{
				LED_PORT^=0x20;
				delay_ms(500);
		}
		//�����ڲ����پ�����8��Ƶ(�ڲ�ʼ�շ�Ƶ)2MHz
		CLK_CKDIVR=0x18;   //HSI8��Ƶ��2M����λ���Ĭ��ֵ
		for(i=0;i<10;i++)   //��˸LED
		{
				LED_PORT^=0x20;
				delay_ms(500);
		}
		
		while (1)
		{
        //�����ڲ����پ������޷�Ƶ16MHz
				
        CLK_SWCR|=0x02; //�����л�
        CLK_ICKR|=0x01;      //�����ڲ�HSI
				while(!(CLK_ICKR&0x02));//HSI׼������
				CLK_SWR=0xe1;        //HSIΪ��ʱ��Դ
        while((CLK_SWCR & 0x01)==0x01);//�ȴ��л����
        CLK_CKDIVR=0x00;     //HSI����Ƶ
        CLK_SWCR&=(~0x02); //�ر��л�
        for(i=0;i<20;i++)
        {
						LED_PORT^=0x20;
						delay_ms(500);
				}
				LED_PORT|=0x20;//Ϩ��LED������
				delay_ms(500);
				delay_ms(500);
				delay_ms(500);
				delay_ms(500);
       //�����ڲ����پ�����8��Ƶ(�ڲ�ʼ�շ�Ƶ)2MHz
        CLK_CKDIVR=0x18;
        for(i=0;i<20;i++)
        {
						LED_PORT^=0x20;
						delay_ms(500);
				}
				LED_PORT|=0x20;//Ϩ��LED������
				delay_ms(500);
				delay_ms(500);
			//�����ڲ����پ������޷�Ƶ
			  
        CLK_SWCR|=0x02; //�����л�
        CLK_ICKR|=0x08; //����LSI
				while(!(CLK_ICKR&0x10));//HSI׼������
				CLK_SWR=0xd2;   //LSRΪ��ʱ��Դ
        while((CLK_SWCR & 0x01)==0x01);//�ȴ��л����
        CLK_CKDIVR=0x00;   //LSI����Ƶ
        CLK_SWCR&=(~0x02); //�ر��л�
        for(i=0;i<20;i++)
        {
						LED_PORT^=0x20;
						delay_ms(500);
        }
			  LED_PORT|=0x20;//Ϩ��LED������
				delay_ms(500);
				delay_ms(500);
				delay_ms(500);
				delay_ms(500);
				/*
       //�����ⲿ���پ�����16��Ƶ500KHz
        CLK_SWCR|=0x02; //�����л�
        CLK_SWR=0xb4;
        while((CLK_SWCR & 0x01)==0x01);
        CLK_CKDIVR=0x04;
        CLK_SWCR&=(~0x02); //�ر��л�
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