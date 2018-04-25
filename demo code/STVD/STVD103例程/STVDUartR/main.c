/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "STM8S103f3p.h"
void Init_UART1(void)
{
      UART1_CR1=0x00;
      UART1_CR2=0x00;
      UART1_CR3=0x00;
      // 设置波特率，必须注意以下几点：
      // (1) 必须先写BRR2
      // (2) BRR1存放的是分频系数的第11位到第4位，
      // (3) BRR2存放的是分频系数的第15位到第12位，和第3位
      // 到第0位
      // 例如对于波特率位9600时，分频系数=2000000/9600=208
      // 对应的十六进制数为00D0，BBR1=0D,BBR2=00

      UART1_BRR2=0x00;
      UART1_BRR1=0x0d;

      UART1_CR2=0x2c;//允许接收，发送，开接收中断
}
void UART1_sendchar(unsigned char c)
{
      while((UART1_SR & 0x80)==0x00);
      UART1_DR=c;
}
main()
{
	unsigned char i=0;
	Init_UART1();
	_asm("rim");//开中断，sim为关中断
	while (1);
}
//将收到的数据再发送出去
@far @interrupt void UART1_Recv_IRQHandler (void)
{
      unsigned char ch;
      ch=UART1_DR;
			UART1_sendchar(ch);
      return;
}