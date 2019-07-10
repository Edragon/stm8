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

#ifndef __LED_H
#define __LED_H
#include "stm8s_gpio.h"

#define ON  0
#define OFF 1
#define LED1(ON_OFF)  if(ON_OFF==ON)GPIO_WriteLow(GPIOD, GPIO_PIN_4);\
                      else GPIO_WriteHigh(GPIOD, GPIO_PIN_4)

#define LED2(ON_OFF)  if(ON_OFF==ON)GPIO_WriteLow(GPIOD, GPIO_PIN_1);\
                      else GPIO_WriteHigh(GPIOD, GPIO_PIN_1)

#define LED3(ON_OFF)  if(ON_OFF==ON)GPIO_WriteLow(GPIOD, GPIO_PIN_2);\
                      else GPIO_WriteHigh(GPIOD, GPIO_PIN_2)

#define LED4(ON_OFF)  if(ON_OFF==ON)GPIO_WriteLow(GPIOD, GPIO_PIN_3);\
                      else GPIO_WriteHigh(GPIOD, GPIO_PIN_3)
                        
#define LED5(ON_OFF)  if(ON_OFF==ON)GPIO_WriteLow(GPIOB, GPIO_PIN_5);\
                      else GPIO_WriteHigh(GPIOB, GPIO_PIN_5)                       
void LED_Init(void);
void SetLedOFF(void);
void LED_Display(void);
void Delay(u32 nCount);
void LED_ShowOneToOne(void);

#endif


/******************* (C) COPYRIGHT 风驰iCreate嵌入式开发工作室 *****END OF FILE****/