#include "IOSTM8S103F3.h"
unsigned char i=0;

void Init_Timer4(void)
{
    TIM4_CR1=0x01;//使能计数器
  //TIM4_IER=0x00;
    TIM4_IER=0x01;//更新中断使能
    TIM4_EGR=0x01;
    TIM4_CNTR=255;//计数器值
    TIM4_ARR=255;//自动重装的值
    TIM4_PSCR=0x07;//分频值

}
void Init_GPIO(void)
{
    PB_DDR|=0x20;
    PB_CR1|=0x20;
    PB_CR2|=0x00;
}

/*
中断
声明一个中断向量，说明如下：

#pragma vector=0x02
__interrupt void interrupt_handler(void)
{

}
说明:
#pragma vector：
是IAR中断向量指令
=0x02 :
其数字代表中断向量编号。STM8的地址是从0x00800开始，IAR的中断编号从0开始。中断向量号依次按照中断地址递增。如：
复位向量是0x008000，中断向量号是0x00
TRAP的中断地址是0x008004中断向量号是0x01
SPI中断号是0x0C;详细见下表
__interrupt void interrupt_handler
(void):
是声明一个中断函数，注意interrupt是两个下划线，interrupt_handler是中断函数名字，可自己定义

*/
#pragma vector=TIM4_OVR_UIF_vector//0x19
__interrupt void TIM4_OVR_UIF_IRQHandler(void)//对应IAP的中断地址：0x8060
{
  //asm("JP 0x9060\n");
      i++;
      TIM4_SR=0x00;
      if(i==61)
      {
	  PB_ODR^=0x20;
	  i=0;
      }
      //return;
}

int main( void )
{
    Init_GPIO();
    Init_Timer4();
    asm("rim");//开全局中断
    while(1);
    //return 0;
}
