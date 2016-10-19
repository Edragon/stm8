/**
  ******************************************************************************
  * @file    CLK_ClockSelection\main.c
  * @brief   This file contains the main function for the CLK Clock Selection example.
  * @author  MCD Application Team
  * @version  V2.0.1
  * @date     18-November-2011
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


#define LED_GPIO_PORT  (GPIOB)
#define LED_GPIO_PINS  (GPIO_PIN_5)

static void CLK_Config(void);
static void GPIO_Config(void);


void Delay(uint16_t nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
  }
}

void main(void)
{

    uint8_t i;
		ErrorStatus clk_return_status;
		/* GPIO Configuration  -----------------------------------------*/
    GPIO_Config();  
 
    CLK_HSICmd(ENABLE);//开始内部高频RC
		CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);//不分频
		//CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
		for(i=0;i<10;i++)
		{
			/* Toggles LEDs */
       GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
       Delay(0xFFFF);
		}
		CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);//8分频
		//CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
		for(i=0;i<10;i++)
		{
			/* Toggles LEDs */
       GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
       Delay(0xFFFF);
		}
		
    while (1)
    {
			
			clk_return_status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
      if (clk_return_status == SUCCESS)  //SUCCESS or ERROR
       {
			    CLK_ClockSwitchCmd(ENABLE);
					CLK_HSICmd(ENABLE);//开始内部高频RC
					CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);//不分频
					CLK_ClockSwitchCmd(DISABLE);
					for(i=0;i<10;i++)
					{
						
						GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
						Delay(0xFFFF);
					}
					
			 };
	
			 
			clk_return_status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_LSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
			if (clk_return_status == SUCCESS)  //SUCCESS or ERROR
			{
					
					CLK_ClockSwitchCmd(ENABLE);
					CLK_LSICmd(ENABLE);
					CLK_ClockSwitchCmd(DISABLE);
					for(i=0;i<2;i++)
					{
						GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
						Delay(0xFFFF);
					}
					
			};
			 
			
    }

}

/**
  * @brief  Configure GPIO for buttons available on the evaluation board
  * @param  None
  * @retval None
  */
static void GPIO_Config(void)
{
  GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
    
}




#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/