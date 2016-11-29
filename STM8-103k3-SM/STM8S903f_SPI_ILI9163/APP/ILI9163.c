#include "ILI9163.h"
#include "stm8s_gpio.h"
#include "SGP18T_ILI9163B_base.h"

// ILI9163_A0      GPIO_PIN_0   PC3
// ILI9163_RESET   GPIO_PIN_1   PC1
// ILI9163_SDA     GPIO_PIN_2   PC6
// ILI9163_SCK     GPIO_PIN_3   PC5
// ILI9163_CS      GPIO_PIN_4   PE5
//uint8 SDA; 


/*********************************************
函数名称：ILI9163_GPIO_init()
*******************************************
void ILI9163_GPIO_init()
{
  GPIO_Init(GPIOB,GPIO_PIN_4,GPIO_MODE_OUT_PP_LOW_SLOW); 
GPIO_Init(GPIOB,GPIO_PIN_3,GPIO_MODE_OUT_PP_LOW_SLOW); 
GPIO_Init(GPIOB,GPIO_PIN_2,GPIO_MODE_OUT_PP_LOW_SLOW); 
GPIO_Init(GPIOB,GPIO_PIN_1,GPIO_MODE_OUT_PP_LOW_SLOW);
GPIO_Init(GPIOB,GPIO_PIN_0,GPIO_MODE_OUT_PP_LOW_SLOW); 
}*/
/************************************************
函数名称：ILI9163B_init()
入口参数：无
出口参数：五
时间2015/4/15
功能说明：器件初始化
*******************************************************/
void ILI9163B_init(void)
{
  //void ILI9163_init();
  ILI9163B_write_command(0x11);       		  	//关闭睡眠，振荡器工作
  delay(100);
    
  ILI9163B_write_command(0x3a);       		  	//每次传送16位数据（VIPF3-0=0101），每个像素16位（IFPF2-0=101）
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
  ILI9163B_write_para8(0x08);				   	//VPA =8约90Hz
    				   
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
    
  ILI9163B_write_command(0x2a);              	//配置MCU可操作的LCD内部RAM横坐标起始，结束参数
  ILI9163B_write_para8(0x00);				   	//横坐标起始地址0x0000
  ILI9163B_write_para8(0x00);					
  ILI9163B_write_para8(0x00);				   	//横坐标结束地址0x007f(127)
  ILI9163B_write_para8(0x7f);
   
  ILI9163B_write_command(0x2b);              	//配置MCU可操作的LCD内部RAM纵坐标起始结束参数
  ILI9163B_write_para8(0x00);				   	//纵坐标起始地址0x0000
  ILI9163B_write_para8(0x00);
  ILI9163B_write_para8(0x00);				  	//纵坐标结束地址0x009f(159)
  ILI9163B_write_para8(0x9f);

  ILI9163B_write_command(0x36);              	//配置MPU和DDRAM对应关系  竖屏横屏修改此处寄存器
 // ILI9163B_write_para8(0xc0);					//MX=1,MY=1
   ILI9163B_write_para8(0xA8);	
  
  ILI9163B_write_command(0xb7);              	//LCD Driveing control
  ILI9163B_write_para8(0x00);				   	//CRL=0
	   
  ILI9163B_write_command(0x29);   		  	//开启屏幕显示
  ILI9163B_write_command(0x2c);   			//设置为LCD接收数据/命令模式
  
}

// ILI9163_A0      GPIO_PIN_0   PC3
// ILI9163_RESET   GPIO_PIN_1   PC1
// ILI9163_SDA     GPIO_PIN_2   PC6
// ILI9163_SCK     GPIO_PIN_3   PC5
// ILI9163_CS      GPIO_PIN_4   PE5
/*****************DRIVE IC寄存器寻址 8080 SERIES***********************/
void ILI9163B_write_command(uint8 cmd)
{
	uint8 i;

	//GPIO_WriteLow(GPIOB,GPIO_PIN_0);
       // GPIO_WriteLow(GPIOB,GPIO_PIN_4);
        GPIO_WriteLow(GPIOC,GPIO_PIN_3);
       GPIO_WriteLow(GPIOE,GPIO_PIN_5);
	for(i=0;i<8;i++)
	{
          // GPIO_WriteLow(GPIOB,GPIO_PIN_3);
          GPIO_WriteLow(GPIOC,GPIO_PIN_5);
           if((0x80&cmd)==0x80)
           {
            //GPIO_WriteHigh(GPIOB,GPIO_PIN_2);
             GPIO_WriteHigh(GPIOC,GPIO_PIN_6);
           }
           else
           {
            //GPIO_Writelow(GPIOB,GPIO_PIN_2);
             GPIO_WriteLow(GPIOC,GPIO_PIN_6);
           }
           //GPIO_WriteHigh(GPIOB,GPIO_PIN_3);
            GPIO_WriteHigh(GPIOC,GPIO_PIN_5);
           cmd = (cmd<<1);
	}
      //GPIO_WriteHigh(GPIOB,GPIO_PIN_4); 
        GPIO_WriteHigh(GPIOE,GPIO_PIN_5);   
}



// ILI9163_A0      GPIO_PIN_0   PC3
// ILI9163_RESET   GPIO_PIN_1   PC1
// ILI9163_SDA     GPIO_PIN_2   PC6
// ILI9163_SCK     GPIO_PIN_3   PC5
// ILI9163_CS      GPIO_PIN_4   PE5
/***************DRIVE IC寄存器写数据******************************/
void ILI9163B_write_para8(uint8 dat)
{  
	uint8 i;

	//ILI9163_A0=1;			   				//A0=1发送数据
	//ILI9163_CS=0;	
        // GPIO_WriteHigh(GPIOB,GPIO_PIN_0);
          //GPIO_WriteLow(GPIOB,GPIO_PIN_4);
           GPIO_WriteHigh(GPIOC,GPIO_PIN_3);
          GPIO_WriteLow(GPIOE,GPIO_PIN_5);
	for(i=0;i<8;i++)
	{
		//ILI9163_SCK=0;
           //GPIO_WriteLow(GPIOB,GPIO_PIN_3);
            GPIO_WriteLow(GPIOC,GPIO_PIN_5);
           // ILI9163_SDA = (bit)(0x80&dat);
             // SDA=0x80&dat;
              if((0x80&dat)==0x80)
              {
                // GPIO_WriteHigh(GPIOB,GPIO_PIN_2);
                  GPIO_WriteHigh(GPIOC,GPIO_PIN_6);
              }
              else
              {
                 //GPIO_WriteLow(GPIOB,GPIO_PIN_2);
                 GPIO_WriteLow(GPIOC,GPIO_PIN_6);
              }
                 //GPIO_WriteHigh(GPIOB,GPIO_PIN_3);
               GPIO_WriteHigh(GPIOC,GPIO_PIN_5);
		dat = (dat<<1);

	}
	//ILI9163_CS=1;
       //  GPIO_WriteHigh(GPIOB,GPIO_PIN_4);
         GPIO_WriteHigh(GPIOE,GPIO_PIN_5);
}

// ILI9163_A0      GPIO_PIN_0   PC3
// ILI9163_RESET   GPIO_PIN_1   PC1
// ILI9163_SDA     GPIO_PIN_2   PC6
// ILI9163_SCK     GPIO_PIN_3   PC5
// ILI9163_CS      GPIO_PIN_4   PE5
/*******************************DRIVE IC GDRAM写数据 16BITS 8080 SERIES******************/
void ILI9163B_write_para16(uint16 dat)
{  		 
	uint8 i,buf;
	//ILI9163_A0=1;
	//ILI9163_CS=0;				
         //GPIO_WriteHigh(GPIOB,GPIO_PIN_0);
        // GPIO_WriteLow(GPIOB,GPIO_PIN_4);
          GPIO_WriteHigh(GPIOC,GPIO_PIN_3);
         GPIO_WriteLow(GPIOE,GPIO_PIN_5);
	buf = (uint8)(0xFF&(dat>>8));
	for(i=0;i<8;i++)
	{
		//ILI9163_SCK=0;
              // GPIO_WriteLow(GPIOB,GPIO_PIN_3);
               GPIO_WriteLow(GPIOC,GPIO_PIN_5);
		//ILI9163_SDA = (bit)(0x80&buf);
		//ILI9163_SCK=1;
              if((0x80&buf)==0x80)
              {
               //  GPIO_WriteHigh(GPIOB,GPIO_PIN_2);
                 GPIO_WriteHigh(GPIOC,GPIO_PIN_6);
              }
              else
              {
                 //GPIO_WriteLow(GPIOB,GPIO_PIN_2);
                 GPIO_WriteLow(GPIOC,GPIO_PIN_6);
              }
                 //GPIO_WriteHigh(GPIOB,GPIO_PIN_3);
              GPIO_WriteHigh(GPIOC,GPIO_PIN_5);
		buf=(buf<<1);

	}
	//ILI9163_CS=1;
        // GPIO_WriteHigh(GPIOB,GPIO_PIN_4);
         GPIO_WriteHigh(GPIOE,GPIO_PIN_5);
	buf = (uint8)(0xFF&dat);
	//ILI9163_CS=0;
        // GPIO_WriteLow(GPIOB,GPIO_PIN_4);
         GPIO_WriteLow(GPIOE,GPIO_PIN_5);
	for(i=0;i<8;i++)
	{
		//ILI9163_SCK=0;
                 //GPIO_WriteLow(GPIOB,GPIO_PIN_3);
		//ILI9163_SDA = (bit)(0x80&buf);
              //ILI9163_SCK =1;
                 GPIO_WriteLow(GPIOC,GPIO_PIN_5);
              if((0x80&buf)==0x80)
              {
                 //GPIO_WriteHigh(GPIOB,GPIO_PIN_2);
                 GPIO_WriteHigh(GPIOC,GPIO_PIN_6);
              }
              else
              {
                // GPIO_WriteLow(GPIOB,GPIO_PIN_2);
                 GPIO_WriteLow(GPIOC,GPIO_PIN_6);
              }
                // GPIO_WriteHigh(GPIOB,GPIO_PIN_3);
              GPIO_WriteHigh(GPIOC,GPIO_PIN_5);
		buf=(buf<<1);
	}
	//ILI9163_CS=1; 
        // GPIO_WriteHigh(GPIOB,GPIO_PIN_4);
        GPIO_WriteHigh(GPIOE,GPIO_PIN_5);
}
/********************************************************************************
函数名称：ILI9163B SetPos（）
入口参数：起始终止坐标
出口参数：无
时间：2015/4/15
功能说明：重新定位输入信息位置
**********************************************************************************/
void ILI9163B_SetPos(uint8 xs,uint8 ys,uint8 xe,uint8 ye)
{
	ILI9163B_write_command(0x2A);      	//Colulm addRSTs set
	ILI9163B_write_para8(0x00);			//行起始坐标高8位，始终为零
	ILI9163B_write_para8(xs);			//行起始坐标低8位
	ILI9163B_write_para8(0x00);			//行起始坐标高8位，始终为零
	ILI9163B_write_para8(xe);			//行终止坐标低8位

	ILI9163B_write_command(0x2B);      	//Colulm addRSTs set
	ILI9163B_write_para8(0x00);			//列起始坐标高8位，始终为零
	ILI9163B_write_para8(ys);			//列起始坐标低8位
	ILI9163B_write_para8(0x00);			//列坐标起始低8位，始终为0
	ILI9163B_write_para8(ye);			//列终止坐标低8位

	ILI9163B_write_command(0x2C);      	//GRAM接收MCU数据或命令
}

/**********************************************************
函数说明：ILI9163B_address_rst()
入口参数：无
出口参数：无
时间：2015/4/15
功能说明：重置地址
**********************************************************/
void ILI9163B_address_rst(void)
{
    ILI9163B_write_command(0x2a);              	//配置MCU可操作的LCD内部RAM横坐标起始，结束参数
    ILI9163B_write_para8(0x00);				   	//横坐标起始地址0x0000
    ILI9163B_write_para8(0x00);					
    ILI9163B_write_para8(0x00);				   	//横坐标结束地址0x007f(127)
    //ILI9163B_write_para8(0x7f);
    ILI9163B_write_para8(0x9f);                       //横坐标结束地址0x009f(159)
    
    ILI9163B_write_command(0x2b);              	//配置MCU可操作的LCD内部RAM纵坐标起始结束参数
    ILI9163B_write_para8(0x00);				   	//纵坐标结束地址0x0000
    ILI9163B_write_para8(0x00);
    ILI9163B_write_para8(0x00);				  	//纵坐标结束地址0x009f(159)
    //ILI9163B_write_para8(0x9f);
    ILI9163B_write_para8(0x7f);                   //纵坐标结束地址0x007f(127)
    
    ILI9163B_write_command(0x2C);      	//GRAM接收MCU数据或命令
}
/*****************延时函数***********************/
void delay(uint16 t)
{
	uint16 i,j;

	for(j=0;j<t;j++)
		for(i=0;i<250;i++);
}