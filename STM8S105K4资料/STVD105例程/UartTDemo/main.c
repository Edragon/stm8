/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include"stm8s105k4.h"

void Init_UART2(void)
{
      UART2_CR1=0x00;
      UART2_CR2=0x00;
      UART2_CR3=0x00;
      // 设置波特率，必须注意以下几点：
      // (1) 必须先写BRR2
      // (2) BRR1存放的是分频系数的第11位到第4位，
      // (3) BRR2存放的是分频系数的第15位到第12位，和第3位
      // 到第0位
      // 例如对于波特率位9600时，分频系数=2000000/9600=208
      // 对应的十六进制数为00D0，BBR1=0D,BBR2=00

      UART2_BRR2=0x00;
      UART2_BRR1=0x0d;

      UART2_CR2=0x2c;//允许接收，发送，开接收中断
}
void UART2_sendchar(unsigned char c)
{
      while((UART2_SR & 0x80)==0x00);
      UART2_DR=c;
}

main()
{
	unsigned char i=0;
	Init_UART2();
	while (1)
	{
		UART2_sendchar(i);
		i++; 
	}
}