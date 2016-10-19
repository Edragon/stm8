/**
  ******************************************************************************
  * @file    Project/main.c 
  * @author  MCD Application Team
  * @version V2.1.0
  * @date    18-November-2011
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */ 


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

/* Private defines -----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
uint8_t HexTable[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};

void Init_UART2(void)
{
	UART2_DeInit();
	UART2_Init((u32)9600, UART2_WORDLENGTH_8D, UART2_STOPBITS_1, UART2_PARITY_NO, UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TX_ENABLE);
//	UART1_Cmd(ENABLE);
}
void Send(uint8_t dat)
{
  while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
	
		UART2_SendData8(dat);
	
}
void Init_ADC(void)
{
	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);
	ADC1_DeInit();
ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, ENABLE);
ADC1_Cmd(ENABLE);



}
void UART2_sendhex(unsigned char dat)
{
		Send('0');
		Send('x');
		Send(HexTable[dat>>4]);
		Send(HexTable[dat&0x0f]);
		Send(' ');
}
void UART2_sendstr(unsigned char *dat)
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
		Init_UART2();
		Init_ADC();
 /* Infinite loop */
  while (1)
  {
		//Send(0xf0);
		ADC1_StartConversion();
    flag_status = ADC1_GetFlagStatus(ADC1_FLAG_EOC);
    while(flag_status == RESET); // SET or RESET
    		u16_adc1_value = ADC1_GetConversionValue();
				UART2_sendhex((u16_adc1_value>>8));
		    UART2_sendhex((u16_adc1_value&0xff));
		    UART2_sendstr("\r\n");
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
