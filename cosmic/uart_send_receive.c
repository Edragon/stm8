/*********************************************************************
目标系统: 基于STM8单片机 
应用软件: Cosmic CxSTM8 
*********************************************************************/

/*----------------------------------------------------------------------
实验内容：
USART自发自收，使用PB口的LED指示接收到的数据，观察是否与发送的数据一致。
----------------------------------------------------------------------
硬件连接：  
将MCU.RXD与MCU.TXD使用短路帽短接，将PB口的LED指示灯使能开关切换到"ON"状态。
----------------------------------------------------------------------*/

#include <STM8S207S8.h>

#define LED_DDR  PB_DDR
#define LED_PORT PB_ODR
#define LED_CR1  PB_CR1
#define LED_CR2  PB_CR2

void Init_UART3(void)
{
      UART3_CR1=0x00;
      UART3_CR2=0x00;
      UART3_CR3=0x00;
      // 设置波特率，必须注意以下几点：
      // (1) 必须先写BRR2
      // (2) BRR1存放的是分频系数的第11位到第4位，
      // (3) BRR2存放的是分频系数的第15位到第12位，和第3位
      // 到第0位
      // 例如对于波特率位9600时，分频系数=2000000/9600=208
      // 对应的十六进制数为00D0，BBR1=0D,BBR2=00

      UART3_BRR2=0x00;
      UART3_BRR1=0x0d;

      UART3_CR2=0x2c;//允许接收，发送，开接收中断
}

void UART3_sendchar(unsigned char c)
{
      while((UART3_SR & 0x80)==0x00);
      UART3_DR=c;
}

@far @interrupt void UART3_Recv_IRQHandler (void)
{
      unsigned char ch;
      ch=UART3_DR;
      LED_PORT=ch;
      return;
}

void main(void)
{
      unsigned char i=0;

      LED_DDR=0XFF;
      LED_CR1=0XFF;
      LED_CR2=0X00;
      Init_UART3();
      _asm("rim");

      while(1)
      {
            UART3_sendchar(i);
             i++; 
      };
}