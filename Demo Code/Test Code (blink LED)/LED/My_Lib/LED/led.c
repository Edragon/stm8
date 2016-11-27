

#include "led.h"
#include "ALL_Includes.h"

/***********************
函数功能：初始化LED
输入参数：无
输出参数：无
备    注：无
***********************/
void LED_Init(void)
{
      //设置IO口为输出
    LEDPort->DDR |= LEDPin;//输出模式
    LEDPort->CR1 |= LEDPin;//推挽输出
   
}

/***********************
函数功能：LED开
输入参数：无
输出参数：无
备    注：无
***********************/
void LED_ON(void)
{
    LEDPort->ODR &=~LEDPin;//LED置低
}

/***********************
函数功能：LED开
输入参数：无
输出参数：无
备    注：无
***********************/
void LED_OFF(void)
{
    LEDPort->ODR |= LEDPin;//LED置高
}