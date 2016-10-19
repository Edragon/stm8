

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"


void Init_UART1(void)
{
	UART1_DeInit();
	UART1_Init((u32)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TX_ENABLE);
//	UART1_Cmd(ENABLE);
}
void Send(uint8_t dat)
{
  while(( UART1_GetFlagStatus(UART1_FLAG_TXE)==RESET));
	
		UART1_SendData8(dat);
	
}
void main(void)
{
    uint8_t i=0; 
		//CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
		Init_UART1();
 /* Infinite loop */
  while (1)
  {
		Send(i);
    //UART1_SendData8(0x01);
		i++;
  }
  
}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
