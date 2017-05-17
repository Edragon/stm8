/*************************************
              今明电子
凡在本店购买满30元，下次购买即可返还5角；
      满50元，下次购买即可返还1元；
     满100元，下次购买即可返还2元；
     满150元，下次购买即可返还4元；
      满200元，下次购买即可免邮
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
    sim();//关总中断

    
    TIM4->SR1 &=~BIT(0);//清标志位
    rim();//开总中断
}


