
#ifndef __SGP18T_ILI9163B_FIGURE_H__
#define __SGP18T_ILI9163B_FIGURE_H__

#include<reg51.h>
#include "MyType.h"



#define		RED			0xf800
#define		GREEN		0x07e0
#define		BLUE		0x001f
#define		PURPLE		0xf81f
#define		YELLOW		0xffe0
#define		CYAN		0x07ff 		//蓝绿色
#define		ORANGE		0xfc08
#define		BLACK		0x0000
#define		WHITE		0xffff




void ILI9163B_display_full(uint16 color);					//全屏显示某种颜色


void ILI9163B_draw_part(uint8 xs,uint8 ys,uint8 xe,uint8 ye,uint16 color_dat);
															//填充矩形区域，行起始、终止坐标，列起始、终止坐标，颜色

void ILI9163B_draw_line(uint8 xs,uint8 ys,uint8 xe,uint8 ye,uint16 color_dat);
															//画线，行起始、终止坐标，列起始、终止坐标，颜色

void ILI9163B_draw_rectangle(uint8 xs,uint8 ys,uint8 xe,uint8 ye,uint16 color_dat);
															//画矩形边框，行起始、终止坐标，列起始、终止坐标，颜色

void ILI9163B_draw_circle(uint8 x,uint8 y,uint8 r,uint16 color_dat);
															//画圆形边框，圆心横坐标、纵坐标，半径，颜色

void ILI9163B_draw_dot(uint8 x,uint8 y,uint16 color_dat);	//画点，横坐标，纵坐标，颜色




#endif /*SGP18T_ILI9163B_figure.h*/