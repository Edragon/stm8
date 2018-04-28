

#ifndef  __KEY_SCAN_H
#define  __KEY_SCAN_H
#include "stm8s_gpio.h"

#define Buttom_ON   0
#define Buttom_OFF  1

#define Buttom1 GPIO_PIN_5
#define Buttom2 GPIO_PIN_6
#define Buttom3 GPIO_PIN_7

void Buttom_Init(void);
void Delay(u16 nCount);
BitStatus Key_Scan(GPIO_Pin_TypeDef Buttom);
#endif