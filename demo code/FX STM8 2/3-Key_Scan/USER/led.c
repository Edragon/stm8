/******************** (C) COPYRIGHT  风驰iCreate嵌入式开发工作室 ***************************
 * 文件名  ：led.c
 * 描述    ：IO口配置函数库   
 * 实验平台：iCreate STM8开发板
 * 库版本  ：V2.0.0
 * 作者    ：ling_guansheng  QQ：779814207
 * 博客    ：
 *修改时间 ：2011-12-20

  iCreate STM8开发板硬件连接
    |--------------------|
    |  LED1-PD0          |
    |  LED2-PD1          |
    |  LED3-PD2          |
    |  LED4-PD3          |
    |--------------------|

****************************************************************************************/

#include "led.h"

void LED_Init(void)
{
   GPIO_Init(GPIOD,(led1|led2|led3|led4),\
             GPIO_MODE_OUT_PP_HIGH_FAST);//定义LED的管脚的模式
}

void SetLedOFF(void)
{
    GPIO_Write(GPIOD, 0xff);
}


void Led_Reverse(GPIO_Pin_TypeDef LedPins)
{
   GPIO_WriteReverse(GPIOD, LedPins);
}



/******************* (C) COPYRIGHT 风驰iCreate嵌入式开发工作室 *****END OF FILE****/