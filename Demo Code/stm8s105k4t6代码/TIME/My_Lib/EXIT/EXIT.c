#include "EXIT.h"
#include "ALL_Includes.h"



#pragma vector = TIM4_Updata_vector
__interrupt void TIM4_Updata_IRQHandler(void)
{
    sim();//�����ж�

    
    TIM4->SR1 &=~BIT(0);//���־λ
    rim();//�����ж�
}


