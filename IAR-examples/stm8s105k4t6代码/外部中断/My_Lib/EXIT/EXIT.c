/*************************************
              ��������
���ڱ��깺����30Ԫ���´ι��򼴿ɷ���5�ǣ�
      ��50Ԫ���´ι��򼴿ɷ���1Ԫ��
     ��100Ԫ���´ι��򼴿ɷ���2Ԫ��
     ��150Ԫ���´ι��򼴿ɷ���4Ԫ��
      ��200Ԫ���´ι��򼴿�����
http://shop106001793.taobao.com/search.htm?spm=a1z10.5.w5002-3375901029.1.l1TXSl&search=y
              stm8s105
               V1.1
             2013.9.8
**************************************/

#include "EXIT.h"
#include "ALL_Includes.h"



/***********************
�������ܣ��ⲿ�жϳ�ʼ��
�����������
�����������
��    ע��PA2
***********************/
void EXTI_Init(void)
{
    EXIT_GPIO->DDR &=~EXIT_PIN;//����ģʽ
    EXIT_GPIO->CR1 |= EXIT_PIN;//��������
    EXIT_GPIO->CR2 |= EXIT_PIN;//ʹ���ⲿ�ж�
     
    EXTI->CR1  |= BIT(1);//PA�½��ش���  
    
    asm("rim");    //�����ж�
}


#pragma   vector = EXTI0_PA_vector
__interrupt  void  EXTI0_PA_IRQHandler(void)
{
    asm("sim");    //�����ж�
      //PA2�ж�
    if(!(GPIOA->IDR&0X04))
    {    
          LED_ON();
    }
    
    asm("rim");    //�����ж�
}


#pragma vector = TIM4_Updata_vector
__interrupt void TIM4_Updata_IRQHandler(void)
{
    sim();//�����ж�

    
    TIM4->SR1 &=~BIT(0);//���־λ
    rim();//�����ж�
}

