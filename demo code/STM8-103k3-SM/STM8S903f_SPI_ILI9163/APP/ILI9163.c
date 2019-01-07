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
�������ƣ�ILI9163_GPIO_init()
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
�������ƣ�ILI9163B_init()
��ڲ�������
���ڲ�������
ʱ��2015/4/15
����˵����������ʼ��
*******************************************************/
void ILI9163B_init(void)
{
  //void ILI9163_init();
  ILI9163B_write_command(0x11);       		  	//�ر�˯�ߣ���������
  delay(100);
    
  ILI9163B_write_command(0x3a);       		  	//ÿ�δ���16λ���ݣ�VIPF3-0=0101����ÿ������16λ��IFPF2-0=101��
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
    
  ILI9163B_write_command(0xb1);              	//������Ļˢ��Ƶ��
  ILI9163B_write_para8(0x08);				   	//DIVA=8
  ILI9163B_write_para8(0x08);				   	//VPA =8Լ90Hz
    				   
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
    
  ILI9163B_write_command(0x2a);              	//����MCU�ɲ�����LCD�ڲ�RAM��������ʼ����������
  ILI9163B_write_para8(0x00);				   	//��������ʼ��ַ0x0000
  ILI9163B_write_para8(0x00);					
  ILI9163B_write_para8(0x00);				   	//�����������ַ0x007f(127)
  ILI9163B_write_para8(0x7f);
   
  ILI9163B_write_command(0x2b);              	//����MCU�ɲ�����LCD�ڲ�RAM��������ʼ��������
  ILI9163B_write_para8(0x00);				   	//��������ʼ��ַ0x0000
  ILI9163B_write_para8(0x00);
  ILI9163B_write_para8(0x00);				  	//�����������ַ0x009f(159)
  ILI9163B_write_para8(0x9f);

  ILI9163B_write_command(0x36);              	//����MPU��DDRAM��Ӧ��ϵ  ���������޸Ĵ˴��Ĵ���
 // ILI9163B_write_para8(0xc0);					//MX=1,MY=1
   ILI9163B_write_para8(0xA8);	
  
  ILI9163B_write_command(0xb7);              	//LCD Driveing control
  ILI9163B_write_para8(0x00);				   	//CRL=0
	   
  ILI9163B_write_command(0x29);   		  	//������Ļ��ʾ
  ILI9163B_write_command(0x2c);   			//����ΪLCD��������/����ģʽ
  
}

// ILI9163_A0      GPIO_PIN_0   PC3
// ILI9163_RESET   GPIO_PIN_1   PC1
// ILI9163_SDA     GPIO_PIN_2   PC6
// ILI9163_SCK     GPIO_PIN_3   PC5
// ILI9163_CS      GPIO_PIN_4   PE5
/*****************DRIVE IC�Ĵ���Ѱַ 8080 SERIES***********************/
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
/***************DRIVE IC�Ĵ���д����******************************/
void ILI9163B_write_para8(uint8 dat)
{  
	uint8 i;

	//ILI9163_A0=1;			   				//A0=1��������
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
/*******************************DRIVE IC GDRAMд���� 16BITS 8080 SERIES******************/
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
�������ƣ�ILI9163B SetPos����
��ڲ�������ʼ��ֹ����
���ڲ�������
ʱ�䣺2015/4/15
����˵�������¶�λ������Ϣλ��
**********************************************************************************/
void ILI9163B_SetPos(uint8 xs,uint8 ys,uint8 xe,uint8 ye)
{
	ILI9163B_write_command(0x2A);      	//Colulm addRSTs set
	ILI9163B_write_para8(0x00);			//����ʼ�����8λ��ʼ��Ϊ��
	ILI9163B_write_para8(xs);			//����ʼ�����8λ
	ILI9163B_write_para8(0x00);			//����ʼ�����8λ��ʼ��Ϊ��
	ILI9163B_write_para8(xe);			//����ֹ�����8λ

	ILI9163B_write_command(0x2B);      	//Colulm addRSTs set
	ILI9163B_write_para8(0x00);			//����ʼ�����8λ��ʼ��Ϊ��
	ILI9163B_write_para8(ys);			//����ʼ�����8λ
	ILI9163B_write_para8(0x00);			//��������ʼ��8λ��ʼ��Ϊ0
	ILI9163B_write_para8(ye);			//����ֹ�����8λ

	ILI9163B_write_command(0x2C);      	//GRAM����MCU���ݻ�����
}

/**********************************************************
����˵����ILI9163B_address_rst()
��ڲ�������
���ڲ�������
ʱ�䣺2015/4/15
����˵�������õ�ַ
**********************************************************/
void ILI9163B_address_rst(void)
{
    ILI9163B_write_command(0x2a);              	//����MCU�ɲ�����LCD�ڲ�RAM��������ʼ����������
    ILI9163B_write_para8(0x00);				   	//��������ʼ��ַ0x0000
    ILI9163B_write_para8(0x00);					
    ILI9163B_write_para8(0x00);				   	//�����������ַ0x007f(127)
    //ILI9163B_write_para8(0x7f);
    ILI9163B_write_para8(0x9f);                       //�����������ַ0x009f(159)
    
    ILI9163B_write_command(0x2b);              	//����MCU�ɲ�����LCD�ڲ�RAM��������ʼ��������
    ILI9163B_write_para8(0x00);				   	//�����������ַ0x0000
    ILI9163B_write_para8(0x00);
    ILI9163B_write_para8(0x00);				  	//�����������ַ0x009f(159)
    //ILI9163B_write_para8(0x9f);
    ILI9163B_write_para8(0x7f);                   //�����������ַ0x007f(127)
    
    ILI9163B_write_command(0x2C);      	//GRAM����MCU���ݻ�����
}
/*****************��ʱ����***********************/
void delay(uint16 t)
{
	uint16 i,j;

	for(j=0;j<t;j++)
		for(i=0;i<250;i++);
}