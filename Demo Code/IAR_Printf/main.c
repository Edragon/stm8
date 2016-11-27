#include "stm8s.h"
#include "stdio.h"

void Delay(u16 Ms)
{
   for(u16 i=0;i<Ms;i++);
}


//´®¿Úprintf¸ÄÐ´
int fputc(int ch,FILE *f)
{
   UART2_SendData8((u8)ch);
   while(UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET);
   return ch;
}

void USART_CONFIG(void)
{
   UART2_DeInit();
   UART2_Init((u32)9600,
              UART2_WORDLENGTH_8D,
              UART2_STOPBITS_1,
              UART2_PARITY_NO,
              UART2_SYNCMODE_CLOCK_DISABLE,
              UART2_MODE_TXRX_ENABLE);
              //UART2_Cmd(ENABLE);
}

int main( void )
{
  USART_CONFIG();
  GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_OUT_PP_HIGH_FAST );
  while(1)
  {
     GPIO_WriteHigh(GPIOD,GPIO_PIN_3);
     Delay(500);
     GPIO_WriteLow(GPIOD,GPIO_PIN_3);
     Delay(60000);
     Delay(60000);
     printf("Hello World!\n");
  }
  //return 0;
}
