/*************************************
              ��������
���ڱ��깺����30Ԫ���´ι��򼴿ɷ���5�ǣ�
      ��50Ԫ���´ι��򼴿ɷ���1Ԫ��
     ��100Ԫ���´ι��򼴿ɷ���2Ԫ��
     ��150Ԫ���´ι��򼴿ɷ���4Ԫ��
      ��200Ԫ���´ι��򼴿�����
http://shop106001793.taobao.com/search.htm?spm=a1z10.5.w5002-3375901029.1.l1TXSl&search=y
              stm8s103
               V1.1
             2013.9.8
**************************************/

#include "EXIT.h"
#include "ALL_Includes.h"



#pragma vector = TIM4_Updata_vector
__interrupt void TIM4_Updata_IRQHandler(void)
{
    sim();//�����ж�

    
    TIM4->SR1 &=~BIT(0);//���־λ
    rim();//�����ж�
}


