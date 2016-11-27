//Ã‘±¶£∫http://tonvdon.taobao.com/

#ifndef  _LED_H
#define  _LED_H

#define  LEDPort  GPIOA
#define  LEDPin   (1 << 3) 



void LED_Init(void);
void LED_ON(void);
void LED_OFF(void);


#endif
