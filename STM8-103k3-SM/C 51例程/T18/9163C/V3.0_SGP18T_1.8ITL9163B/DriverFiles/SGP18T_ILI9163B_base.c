#include<reg51.h>
#include "MyType.h"
#include "SGP18T_ILI9163B_base.h"




/**********************************************************
函数名称：ILI9163B_init()
入口参数：无
出口参数：无
时间：2011/8/8
功能说明：器件初始化
其他说明：无
**********************************************************/
void ILI9163B_init(void)
{   
	
    ILI9163B_write_command(0x11);       		  	//关闭睡眠，振荡器工作
    delay(100);
    
    ILI9163B_write_command(0x3a);       		  	//每次传送16位数据(VIPF3-0=0101)，每个像素16位(IFPF2-0=101)
    ILI9163B_write_para8(0x55);						
   
    ILI9163B_write_command(0x26);       		  	
    ILI9163B_write_para8(0x04);
	
    ILI9163B_write_command(0xf2);              		//Driver Output Control(1)
    ILI9163B_write_para8(0x01);
    
    ILI9163B_write_command(0xe0);              		//Driver Output Control(1)
    ILI9163B_write_para8(0x3f);
    ILI9163B_write_para8(0x25);
    ILI9163B_write_para8(0x1c);
   	ILI9163B_write_para8(0x1e);
    ILI9163B_write_para8(0x20);
    ILI9163B_write_para8(0x12);
    ILI9163B_write_para8(0x2a);
    ILI9163B_write_para8(0x90);
    ILI9163B_write_para8(0x24);
    ILI9163B_write_para8(0x11);
    ILI9163B_write_para8(0x00);
    ILI9163B_write_para8(0x00);
    ILI9163B_write_para8(0x00);
    ILI9163B_write_para8(0x00);
    ILI9163B_write_para8(0x00);
     
    ILI9163B_write_command(0xe1);              //Driver Output Control(1)
    ILI9163B_write_para8(0x20);
    ILI9163B_write_para8(0x20);
    ILI9163B_write_para8(0x20);
    ILI9163B_write_para8(0x20);
    ILI9163B_write_para8(0x05);
    ILI9163B_write_para8(0x00);
    ILI9163B_write_para8(0x15);
    ILI9163B_write_para8(0xa7);
    ILI9163B_write_para8(0x3d);
    ILI9163B_write_para8(0x18);
    ILI9163B_write_para8(0x25);
    ILI9163B_write_para8(0x2a);
    ILI9163B_write_para8(0x2b);
    ILI9163B_write_para8(0x2b);  
    ILI9163B_write_para8(0x3a);  
    
    ILI9163B_write_command(0xb1);              	//设置屏幕刷新频率
    ILI9163B_write_para8(0x08);				   	//DIVA=8
    ILI9163B_write_para8(0x08);				   	//VPA =8，约90Hz
    				   
    ILI9163B_write_command(0xb4);              	//LCD Driveing control
    ILI9163B_write_para8(0x07);				  	//NLA=1,NLB=1,NLC=1
   
   
    ILI9163B_write_command(0xc0);              //LCD Driveing control
    ILI9163B_write_para8(0x0a);
    ILI9163B_write_para8(0x02);
      
    ILI9163B_write_command(0xc1);              //LCD Driveing control
    ILI9163B_write_para8(0x02);

    ILI9163B_write_command(0xc5);              //LCD Driveing control
    ILI9163B_write_para8(0x4f);
   	ILI9163B_write_para8(0x5a);

    ILI9163B_write_command(0xc7);              //LCD Driveing control
    ILI9163B_write_para8(0x40);
    
    ILI9163B_write_command(0x2a);              	//配置MCU可操作的LCD内部RAM横坐标起始、结束参数
    ILI9163B_write_para8(0x00);				   	//横坐标起始地址0x0000
    ILI9163B_write_para8(0x00);					
    ILI9163B_write_para8(0x00);				   	//横坐标结束地址0x007f(127)
    ILI9163B_write_para8(0x7f);
   
    ILI9163B_write_command(0x2b);              	//配置MCU可操作的LCD内部RAM纵坐标起始结束参数
    ILI9163B_write_para8(0x00);				   	//纵坐标起始地址0x0000
    ILI9163B_write_para8(0x00);
    ILI9163B_write_para8(0x00);				  	//纵坐标结束地址0x009f(159)
    ILI9163B_write_para8(0x9f);
		

    ILI9163B_write_command(0x36);              	//配置MPU和DDRAM对应关系
    ILI9163B_write_para8(0xc0);					//MX=1,MY=1

    ILI9163B_write_command(0xb7);              	//LCD Driveing control
    ILI9163B_write_para8(0x00);				   	//CRL=0
	   
    ILI9163B_write_command(0x29);   		  	//开启屏幕显示
    ILI9163B_write_command(0x2c);   			//设置为LCD接收数据/命令模式
  
}


/******************DRIVE IC寄存器寻址 8080 SERIES*******************************/
void ILI9163B_write_command(uint8 cmd)
{
	uint8 i;

	ILI9163_A0=0;	 						//A0=0发送命令
	ILI9163_CS=0;
	for(i=0;i<8;i++)
	{
		ILI9163_SCK=0;
		ILI9163_SDA = (bit)(0x80&cmd);
		ILI9163_SCK = 1;
		cmd = (cmd<<1);

	}
    ILI9163_CS=1;
}

/*****************DRIVE IC寄存器写数据 8080 SERIES******************************/
void ILI9163B_write_para8(uint8 dat)
{  
	uint8 i;

	ILI9163_A0=1;			   				//A0=1发送数据
	ILI9163_CS=0;				
	for(i=0;i<8;i++)
	{
		ILI9163_SCK=0;
		ILI9163_SDA = (bit)(0x80&dat);
		ILI9163_SCK = 1;
		dat = (dat<<1);

	}
	ILI9163_CS=1;
}
 
/****************DRIVE IC GDRAM 写数据 16BITS 8080 SERIES*****************************/
void ILI9163B_write_para16(uint16 dat)
{  		 
	uint8 i,buf;
	ILI9163_A0=1;
	ILI9163_CS=0;				

	buf = (uint8)(0xFF&(dat>>8));
	for(i=0;i<8;i++)
	{
		ILI9163_SCK=0;
		ILI9163_SDA = (bit)(0x80&buf);
		ILI9163_SCK=1;
		buf=(buf<<1);

	}
	ILI9163_CS=1;

	buf = (uint8)(0xFF&dat);
	ILI9163_CS=0;
	for(i=0;i<8;i++)
	{
		ILI9163_SCK=0;
		ILI9163_SDA = (bit)(0x80&buf);
		ILI9163_SCK =1;
		buf=(buf<<1);
	}
	ILI9163_CS=1; 
}


/**********************************************************
函数名称：ILI9163B_SetPos()
入口参数：起始终止坐标
出口参数：无
时间：2011/8/8
功能说明：重新定位输入信息位置
其他说明：无
**********************************************************/
void ILI9163B_SetPos(uint8 xs,uint8 ys,uint8 xe,uint8 ye)
{
	ILI9163B_write_command(0x2A);      	//Colulm addRSTs set
	ILI9163B_write_para8(0x00);			//行起始坐标高8位，始终为零
	ILI9163B_write_para8(xs);			//行起始坐标低8位
	ILI9163B_write_para8(0x00);			//行终止坐标高8位，始终为零
	ILI9163B_write_para8(xe);			//行终止坐标低8位

	ILI9163B_write_command(0x2B);      	//Colulm addRSTs set
	ILI9163B_write_para8(0x00);			//列起始坐标高8位，始终为零
	ILI9163B_write_para8(ys);			//列起始坐标低8位
	ILI9163B_write_para8(0x00);			//列终止坐标高8位，始终为零
	ILI9163B_write_para8(ye);			//列终止坐标低8位

	ILI9163B_write_command(0x2C);      	//GRAM接收MCU数据或命令
}


/**********************************************************
函数名称：ILI9163B_address_rst()
入口参数：无
出口参数：无
时间：2011/8/8
功能说明：重置地址
其他说明：无
**********************************************************/
void ILI9163B_address_rst(void)
{
    ILI9163B_write_command(0x2a);              	//配置MCU可操作的LCD内部RAM横坐标起始、结束参数
    ILI9163B_write_para8(0x00);				   	//横坐标起始地址0x0000
    ILI9163B_write_para8(0x00);					
    ILI9163B_write_para8(0x00);				   	//横坐标结束地址0x007f(127)
    ILI9163B_write_para8(0x7f);
   
    ILI9163B_write_command(0x2b);              	//配置MCU可操作的LCD内部RAM纵坐标起始结束参数
    ILI9163B_write_para8(0x00);				   	//纵坐标起始地址0x0000
    ILI9163B_write_para8(0x00);
    ILI9163B_write_para8(0x00);				  	//纵坐标结束地址0x009f(159)
    ILI9163B_write_para8(0x9f);

	ILI9163B_write_command(0x2C);      	//GRAM接收MCU数据或命令
}



/*********************************************************/
//延时函数
void delay(uint16 t)
{
	uint16 i,j;

	for(j=0;j<t;j++)
		for(i=0;i<250;i++);
}

                 