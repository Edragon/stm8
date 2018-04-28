

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
uint8_t HexTable[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};

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
void Init_ADC(void)
{
	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);
	ADC1_DeInit();
ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, ENABLE);
ADC1_Cmd(ENABLE);



}
void UART1_sendhex(unsigned char dat)
{
		Send('0');
		Send('x');
		Send(HexTable[dat>>4]);
		Send(HexTable[dat&0x0f]);
		Send(' ');
}
void UART1_sendstr(unsigned char *dat)
{
		while(*dat!='\0')
		{
				Send(*dat);
				dat++;
				//delay2us();
		}
}
void main(void)
{
    FlagStatus flag_status;
		u16 u16_adc1_value;
		Init_UART1();
		Init_ADC();
 /* Infinite loop */
  while (1)
  {
		//Send(0xf0);
		ADC1_StartConversion();
    flag_status = ADC1_GetFlagStatus(ADC1_FLAG_EOC);
    while(flag_status == RESET); // SET or RESET
    		u16_adc1_value = ADC1_GetConversionValue();
				UART1_sendhex((u16_adc1_value>>8));
		    UART1_sendhex((u16_adc1_value&0xff));
		    UART1_sendstr("\r\n");
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
