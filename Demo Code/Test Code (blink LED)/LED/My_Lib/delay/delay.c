

#include"delay.h"

/***********************
函数功能：us延时
输入参数：无
输出参数：无
备    注：粗略延时
***********************/
void delay_us(void)
{ 
    asm("nop"); //一个asm("nop")函数经过示波器测试代表100ns
    asm("nop");
    asm("nop");
    asm("nop"); 
}

/***********************
函数功能：ms延时
输入参数：无
输出参数：无
备    注：粗略延时
***********************/
void delay_ms(unsigned int time)
{
    unsigned int i;
    while(time--)  
    for(i=900;i>0;i--)
    delay_us(); 
}
