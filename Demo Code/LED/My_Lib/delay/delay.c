

#include"delay.h"

/***********************
�������ܣ�us��ʱ
�����������
�����������
��    ע��������ʱ
***********************/
void delay_us(void)
{ 
    asm("nop"); //һ��asm("nop")��������ʾ�������Դ���100ns
    asm("nop");
    asm("nop");
    asm("nop"); 
}

/***********************
�������ܣ�ms��ʱ
�����������
�����������
��    ע��������ʱ
***********************/
void delay_ms(unsigned int time)
{
    unsigned int i;
    while(time--)  
    for(i=900;i>0;i--)
    delay_us(); 
}
