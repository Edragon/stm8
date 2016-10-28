/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "STM8S103f3p.h"
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
main()
{
	Init_GPIO();
	Init_Timer4();
	_asm("rim");

	while (1);
}

@far @interrupt void TIM4_UPD_OVF_IRQHandler (void)
{
      i++;
      TIM4_SR=0x00;
      if(i==61)
      {
					PB_ODR^=0x20;
					i=0;
      }
      return;
}

