
//�Ա���http://tonvdon.taobao.com/

#include "ALL_Includes.h"

//����CPU�ڲ�ʱ��
#define  SYS_CLOCK    16


void CLOCK_Config(u8 SYS_CLK);
void All_Congfig(void);


int main(void)
{     
      All_Congfig();
               
      while(1)
      {         
          LED_ON();
          delay_ms(500);
          LED_OFF();
          delay_ms(500);
      }
        
}


void All_Congfig(void)
{
    CLOCK_Config(SYS_CLOCK);//ϵͳʱ�ӳ�ʼ��  
    LED_Init();    
}


/*********************************************
�������ܣ�ϵͳ�ڲ�ʱ������
���������SYS_CLK : 2��4��8��16
�����������
��    ע��ϵͳ����Ĭ���ڲ�2�ͣȣ�
*********************************************/
void CLOCK_Config(u8 SYS_CLK)
{
   //ʱ������Ϊ�ڲ�RC��16M
   CLK->CKDIVR &=~(BIT(4)|BIT(3));
  
   switch(SYS_CLK)
   {
      case 2: CLK->CKDIVR |=((1<<4)|(1<<3)); break;
      case 4: CLK->CKDIVR |=(1<<4); break;
      case 8: CLK->CKDIVR |=(1<<3); break;
   }
}



