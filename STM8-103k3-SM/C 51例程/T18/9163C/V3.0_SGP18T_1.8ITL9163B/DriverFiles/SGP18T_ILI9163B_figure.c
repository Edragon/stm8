#include<reg51.h>
#include "MyType.h"
#include "SGP18T_ILI9163B_base.h"
#include "SGP18T_ILI9163B_figure.h"








/**********************************************************
�������ƣ�ILI9163B_display_full()
��ڲ�����colorΪ���õ���Ҫ��ʾ����ɫ(�Ѿ���ǰ����)��colorΪ
		  NULLʱ����ɽ���������ɫ����dat�м�����ʾ
���ڲ�������
ʱ�䣺2011/8/8
����˵����ȫ����ʾ��ɫ����
����˵������
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
�������ƣ�ILI9163B_draw_part()
��ڲ�������ʼ����ֹ������(0-127)��������(0-159),��ʾ��ɫuint16
���ڲ�������
ʱ�䣺2011/8/8
����˵��������������
����˵����0<=xs<xe<=127
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
�������ƣ�ILI9163B_draw_rectangle()
��ڲ�������ʼ����ֹ������(0-127)��������(0-159),��ʾ��ɫuint16
���ڲ�������
ʱ�䣺2011/8/8
����˵���������α߿�
����˵����0<=xs<xe<=127
		  0<=ys<ye<=159
**********************************************************/
void ILI9163B_draw_rectangle(uint8 xs,uint8 ys,uint8 xe,uint8 ye,uint16 color_dat)
{
	ILI9163B_draw_line(xs,ys,xs,ye,color_dat);	  //���������
	ILI9163B_draw_line(xe,ys,xe,ye,color_dat);	  //�������ұ�
	ILI9163B_draw_line(xs,ys,xe,ys,color_dat);	  //�������ϱ�
	ILI9163B_draw_line(xs,ye,xe,ye,color_dat);	  //�������±�
}


/**********************************************************
�������ƣ�ILI9163B_draw_circle()
��ڲ�����Բ�ĺ�����(0-127)��������(0-159),�뾶(0-128),��ʾ��ɫuint16
���ڲ�������
ʱ�䣺2011/8/8
����˵������Բ�α߿�(��֧����Ļ�ڻ�Բ)
����˵����0<=x<=127
		  0<=y<=159
**********************************************************/
void ILI9163B_draw_circle(uint8 x,uint8 y,uint8 r,uint16 color_dat)
{
	unsigned char dx, dy = r; 

	if((x>=r) &&((128-x)>=r) && (y>=r) && ((160-y)>=r))		//ȷ������Բ����Ļ��Χ�ڣ�û�г�������ߣ�(�ݲ�֧������Ļ���ཻ)
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
�������ƣ�ILI9163B_draw_line()
��ڲ�������ʼ����ֹ������(0-127)��������(0-159),��ʾ��ɫuint16
���ڲ�������
ʱ�䣺2011/8/8
����˵������ֱ��
����˵����0<=xs<xe<=127
		  0<=ys<ye<=159
**********************************************************/
void ILI9163B_draw_line(uint8 xs,uint8 ys,uint8 xe,uint8 ye,uint16 color_dat)
{
	uint8 i,ds;
	int dx,dy,inc_x, inc_y;
	int xerr = 0, yerr = 0;				//��ʼ������

	if(xs==xe)	  						//����ǻ���ֱ����ֻ�����ֱ�������
	{
    	ILI9163B_SetPos(xs,ys,xe,ye);
		for(i=0;i<(ye-ys+1);i++)
		{
			ILI9163B_write_para16(color_dat);
		}
	}
	else if(ys==ye)						//�����ˮƽ����ֻ��Ҫ��ˮƽ�������
    {
 		ILI9163B_SetPos(xs,ys,xe,ye);
 	  	for(i=0;i<(xe-xs+1);i++)
		{
			ILI9163B_write_para16(color_dat);
		}
	} 
	else											//�����б�ߣ������¼��㣬ʹ�û��㺯������ֱ��
	{
    	dx = xe - xs;								//������������
    	dy = ye - ys;

		if(dx > 0) inc_x = 1;						//���õ�������
		else 
		{
			inc_x = -1; dx = -dx;
		}
		if(dy > 0) inc_y = 1;						//���õ�������
		else
	    {
			inc_y = -1; dy = -dy;
		}

		if(dx > dy) ds = dx;						//ѡȡ��������������
		else		ds = dy;

		for(i = 0; i <= ds+1; i++)					//�������
		{
			ILI9163B_draw_dot(xs, ys,color_dat);	//����
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
�������ƣ�ILI9163B_draw_dot()
��ڲ�������ʼ������(0-127)��������(0-159),��ʾ��ɫuint16
���ڲ�������
ʱ�䣺2011/8/8
����˵��������
����˵����0<=x<=127
		  0<=y<=159
**********************************************************/
void ILI9163B_draw_dot(uint8 x,uint8 y,uint16 color_dat)
{
	ILI9163B_SetPos(x,y,x,y);
	ILI9163B_write_para16(color_dat);
}
