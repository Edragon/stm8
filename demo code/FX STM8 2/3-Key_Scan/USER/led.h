

#ifndef __LED_H
#define __LED_H
#include "stm8s_gpio.h"

#define ON  0
#define OFF 1
#define bit_set   1
#define bit_reset 0

#define led1 GPIO_PIN_0
#define led2 GPIO_PIN_1
#define led3 GPIO_PIN_2
#define led4 GPIO_PIN_3

#define LED1(ON_OFF)  if(ON_OFF==ON)GPIO_WriteLow(GPIOD,led1);\
                      else GPIO_WriteHigh(GPIOD, led1)

#define LED2(ON_OFF)  if(ON_OFF==ON)GPIO_WriteLow(GPIOD, led2);\
                      else GPIO_WriteHigh(GPIOD, led2)

#define LED3(ON_OFF)  if(ON_OFF==ON)GPIO_WriteLow(GPIOD, led3);\
                      else GPIO_WriteHigh(GPIOD, led3)

#define LED4(ON_OFF)  if(ON_OFF==ON)GPIO_WriteLow(GPIOD, led4);\
                      else GPIO_WriteHigh(GPIOD, led4)
void LED_Init(void);
void SetLedOFF(void);
void Led_Reverse(GPIO_Pin_TypeDef LedPins);




#endif


