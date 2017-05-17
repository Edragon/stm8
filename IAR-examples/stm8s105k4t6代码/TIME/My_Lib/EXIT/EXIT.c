#include "EXIT.h"
#include "ALL_Includes.h"



#pragma vector = TIM4_Updata_vector
__interrupt void TIM4_Updata_IRQHandler(void)
{
    sim();//关总中断

    
    TIM4->SR1 &=~BIT(0);//清标志位
    rim();//开总中断
}


