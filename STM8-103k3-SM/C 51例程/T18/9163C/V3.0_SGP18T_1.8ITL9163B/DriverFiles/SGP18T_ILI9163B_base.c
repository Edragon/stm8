#include<reg51.h>
#include "MyType.h"
#include "SGP18T_ILI9163B_base.h"




/**********************************************************
�������ƣ�ILI9163B_init()
��ڲ�������
���ڲ�������
ʱ�䣺2011/8/8
����˵����������ʼ��
����˵������
**********************************************************/
void ILI9163B_init(void)
{   
	
    ILI9163B_write_command(0x11);       		  	//�ر�˯�ߣ���������
    delay(100);
    
    ILI9163B_write_command(0x3a);       		  	//ÿ�δ���16λ����(VIPF3-0=0101)��ÿ������16λ(IFPF2-0=101)
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
    ILI9163B_write_para8(0x08);				   	//VPA =8��Լ90Hz
    				   
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
		

    ILI9163B_write_command(0x36);              	//����MPU��DDRAM��Ӧ��ϵ
    ILI9163B_write_para8(0xc0);					//MX=1,MY=1

    ILI9163B_write_command(0xb7);              	//LCD Driveing control
    ILI9163B_write_para8(0x00);				   	//CRL=0
	   
    ILI9163B_write_command(0x29);   		  	//������Ļ��ʾ
    ILI9163B_write_command(0x2c);   			//����ΪLCD��������/����ģʽ
  
}


/******************DRIVE IC�Ĵ���Ѱַ 8080 SERIES*******************************/
void ILI9163B_write_command(uint8 cmd)
{
	uint8 i;

	ILI9163_A0=0;	 						//A0=0��������
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

/*****************DRIVE IC�Ĵ���д���� 8080 SERIES******************************/
void ILI9163B_write_para8(uint8 dat)
{  
	uint8 i;

	ILI9163_A0=1;			   				//A0=1��������
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
 
/****************DRIVE IC GDRAM д���� 16BITS 8080 SERIES*****************************/
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
�������ƣ�ILI9163B_SetPos()
��ڲ�������ʼ��ֹ����
���ڲ�������
ʱ�䣺2011/8/8
����˵�������¶�λ������Ϣλ��
����˵������
**********************************************************/
void ILI9163B_SetPos(uint8 xs,uint8 ys,uint8 xe,uint8 ye)
{
	ILI9163B_write_command(0x2A);      	//Colulm addRSTs set
	ILI9163B_write_para8(0x00);			//����ʼ�����8λ��ʼ��Ϊ��
	ILI9163B_write_para8(xs);			//����ʼ�����8λ
	ILI9163B_write_para8(0x00);			//����ֹ�����8λ��ʼ��Ϊ��
	ILI9163B_write_para8(xe);			//����ֹ�����8λ

	ILI9163B_write_command(0x2B);      	//Colulm addRSTs set
	ILI9163B_write_para8(0x00);			//����ʼ�����8λ��ʼ��Ϊ��
	ILI9163B_write_para8(ys);			//����ʼ�����8λ
	ILI9163B_write_para8(0x00);			//����ֹ�����8λ��ʼ��Ϊ��
	ILI9163B_write_para8(ye);			//����ֹ�����8λ

	ILI9163B_write_command(0x2C);      	//GRAM����MCU���ݻ�����
}


/**********************************************************
�������ƣ�ILI9163B_address_rst()
��ڲ�������
���ڲ�������
ʱ�䣺2011/8/8
����˵�������õ�ַ
����˵������
**********************************************************/
void ILI9163B_address_rst(void)
{
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

	ILI9163B_write_command(0x2C);      	//GRAM����MCU���ݻ�����
}



/*********************************************************/
//��ʱ����
void delay(uint16 t)
{
	uint16 i,j;

	for(j=0;j<t;j++)
		for(i=0;i<250;i++);
}

                 