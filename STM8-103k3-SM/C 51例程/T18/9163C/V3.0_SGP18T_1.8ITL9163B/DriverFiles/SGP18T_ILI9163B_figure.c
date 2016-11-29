#include<reg51.h>
#include "MyType.h"
#include "SGP18T_ILI9163B_base.h"
#include "SGP18T_ILI9163B_figure.h"








/**********************************************************
函数名称：ILI9163B_display_full()
入口参数：color为常用的需要显示的颜色(已经提前定义)，color为
		  NULL时，则可将不常用颜色放入dat中加以显示
出口参数：无
时间：2011/8/8
功能说明：全屏显示单色画面
其他说明：无
**********************************************************/
void ILI9163B_display_full(uint16 color)
{
  	unsigned int i,j;
	
	ILI9163B_address_rst();

 	for(i=0;i<160;i++)
	{
     	for(j=0;j<128;j++)
        {
			ILI9163B_write_para16(color);
        }
	}
}



/**********************************************************
函数名称：ILI9163B_draw_part()
入口参数：起始、终止横坐标(0-127)，纵坐标(0-159),显示颜色uint16
出口参数：无
时间：2011/8/8
功能说明：填充矩形区域
其他说明：0<=xs<xe<=127
		  0<=ys<ye<=159
**********************************************************/
void ILI9163B_draw_part(uint8 xs,uint8 ys,uint8 xe,uint8 ye,uint16 color_dat)
{
	uint8 i,j;

	ILI9163B_SetPos(xs,ys,xe,ye);	
	for(j=0;j<(ye-ys+1);j++)
    {
    	for(i=0;i<(xe-xs+1);i++)
		{
			ILI9163B_write_para16(color_dat);
		}
	}   
}

/**********************************************************
函数名称：ILI9163B_draw_rectangle()
入口参数：起始、终止横坐标(0-127)，纵坐标(0-159),显示颜色uint16
出口参数：无
时间：2011/8/8
功能说明：画矩形边框
其他说明：0<=xs<xe<=127
		  0<=ys<ye<=159
**********************************************************/
void ILI9163B_draw_rectangle(uint8 xs,uint8 ys,uint8 xe,uint8 ye,uint16 color_dat)
{
	ILI9163B_draw_line(xs,ys,xs,ye,color_dat);	  //画矩形左边
	ILI9163B_draw_line(xe,ys,xe,ye,color_dat);	  //画矩形右边
	ILI9163B_draw_line(xs,ys,xe,ys,color_dat);	  //画矩形上边
	ILI9163B_draw_line(xs,ye,xe,ye,color_dat);	  //画矩形下边
}


/**********************************************************
函数名称：ILI9163B_draw_circle()
入口参数：圆心横坐标(0-127)，纵坐标(0-159),半径(0-128),显示颜色uint16
出口参数：无
时间：2011/8/8
功能说明：画圆形边框(仅支持屏幕内画圆)
其他说明：0<=x<=127
		  0<=y<=159
**********************************************************/
void ILI9163B_draw_circle(uint8 x,uint8 y,uint8 r,uint16 color_dat)
{
	unsigned char dx, dy = r; 

	if((x>=r) &&((128-x)>=r) && (y>=r) && ((160-y)>=r))		//确定所画圆在屏幕范围内，没有超出最外边，(暂不支持与屏幕边相交)
	{
		for(dx = 0; dx <= r; dx++)
		{
			while((r * r + 1 - dx * dx) < (dy * dy)) dy--;
			ILI9163B_draw_dot(x + dx, y - dy, color_dat);
			ILI9163B_draw_dot(x - dx, y - dy, color_dat);
			ILI9163B_draw_dot(x - dx, y + dy, color_dat);
			ILI9163B_draw_dot(x + dx, y + dy, color_dat);

			ILI9163B_draw_dot(x + dy, y - dx, color_dat);
			ILI9163B_draw_dot(x - dy, y - dx, color_dat);
			ILI9163B_draw_dot(x - dy, y + dx, color_dat);
			ILI9163B_draw_dot(x + dy, y + dx, color_dat);
	}
	}



}


/**********************************************************
函数名称：ILI9163B_draw_line()
入口参数：起始、终止横坐标(0-127)，纵坐标(0-159),显示颜色uint16
出口参数：无
时间：2011/8/8
功能说明：画直线
其他说明：0<=xs<xe<=127
		  0<=ys<ye<=159
**********************************************************/
void ILI9163B_draw_line(uint8 xs,uint8 ys,uint8 xe,uint8 ye,uint16 color_dat)
{
	uint8 i,ds;
	int dx,dy,inc_x, inc_y;
	int xerr = 0, yerr = 0;				//初始化变量

	if(xs==xe)	  						//如果是画垂直线则只需对竖直坐标计数
	{
    	ILI9163B_SetPos(xs,ys,xe,ye);
		for(i=0;i<(ye-ys+1);i++)
		{
			ILI9163B_write_para16(color_dat);
		}
	}
	else if(ys==ye)						//如果是水平线则只需要对水平坐标计数
    {
 		ILI9163B_SetPos(xs,ys,xe,ye);
 	  	for(i=0;i<(xe-xs+1);i++)
		{
			ILI9163B_write_para16(color_dat);
		}
	} 
	else											//如果是斜线，则重新计算，使用画点函数画出直线
	{
    	dx = xe - xs;								//计算坐标增量
    	dy = ye - ys;

		if(dx > 0) inc_x = 1;						//设置单步方向
		else 
		{
			inc_x = -1; dx = -dx;
		}
		if(dy > 0) inc_y = 1;						//设置单步方向
		else
	    {
			inc_y = -1; dy = -dy;
		}

		if(dx > dy) ds = dx;						//选取基本增量坐标轴
		else		ds = dy;

		for(i = 0; i <= ds+1; i++)					//画线输出
		{
			ILI9163B_draw_dot(xs, ys,color_dat);	//画点
			xerr += dx;
			yerr += dy;
			if(xerr > ds)
			{
				xerr -= ds;
				xs   += inc_x;
			}
			if(yerr > ds)
			{
				yerr -= ds;
				ys   += inc_y;
			}
		}
	}  
}

/**********************************************************
函数名称：ILI9163B_draw_dot()
入口参数：起始横坐标(0-127)，纵坐标(0-159),显示颜色uint16
出口参数：无
时间：2011/8/8
功能说明：画点
其他说明：0<=x<=127
		  0<=y<=159
**********************************************************/
void ILI9163B_draw_dot(uint8 x,uint8 y,uint16 color_dat)
{
	ILI9163B_SetPos(x,y,x,y);
	ILI9163B_write_para16(color_dat);
}
