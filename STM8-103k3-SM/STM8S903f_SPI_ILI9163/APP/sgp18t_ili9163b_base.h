#ifndef __SGP18T_ILI9163B_BASE_H__
#define __SGP18T_ILI9163B_BASE_H__


#include<stm8s_gpio.h>
#include "ILI9163.h"



/*******************接口定义*****************************
#define ILI9163_A0      GPIO_pin_0
#define ILI9163_RESET   GPIO_pin_1
#define ILI9163_SDA     GPIO_pin_2
#define ILI9163_SCK     GPIO_pin_3
#define ILI9163_CS      GPIO_pin_4*/




/*****************私有函数声明*********************************/

void ILI9163B_init(void);									//LCD初始化

void ILI9163B_write_command(uint8 cmd);						//发送控制字

void ILI9163B_write_para8(uint8 dat);						//发送数据参数

void ILI9163B_write_para16(uint16 dat);						//发送像素显示参数

void ILI9163B_address_rst(void);							//DDRAM地址重置

void ILI9163B_SetPos(uint8 xs,uint8 ys,uint8 xe,uint8 ye);	//定位显示像素位置

void delay(uint16 t);	
//void ILI9163_init();

#endif /*SGP18T_ILI9163B.h*/