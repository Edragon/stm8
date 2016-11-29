#ifndef __SGP18T_ILI9163B_BASE_H__
#define __SGP18T_ILI9163B_BASE_H__


#include<reg51.h>
#include "MyType.h"



/*******************接口定义******************************/
sbit	ILI9163_RESET	=	P1^2; 
sbit	ILI9163_A0		=	P1^3;
sbit	ILI9163_SDA		=	P1^4;
sbit	ILI9163_SCK		=	P1^5;
sbit	ILI9163_CS		=	P1^6;





/*****************私有函数声名*********************************/

void ILI9163B_init(void);									//LCD初始化

void ILI9163B_write_command(uint8 cmd);						//发送控制字

void ILI9163B_write_para8(uint8 dat);						//发送数据参数

void ILI9163B_write_para16(uint16 dat);						//发送像素显示参数

void ILI9163B_address_rst(void);							//DDRAM地址重置

void ILI9163B_SetPos(uint8 xs,uint8 ys,uint8 xe,uint8 ye);	//定位显示像素位置

void delay(uint16 t);									   	//延时函数

#endif /*SGP18T_ILI9163B.h*/