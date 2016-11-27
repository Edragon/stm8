/**
  ******************************************************************************
  * @file    EXTI_InterruptPriority\main.c
  * @author  MCD Application Team
  * @version  V2.0.1
  * @date     18-November-2011
  * @brief   This file contains the main function for the EXTI Interrupt Priority example.
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
#include "main.h"

/**
  * @addtogroup EXTI_InterruptPriority
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
static void GPIO_Config(void);
/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{

  /* GPIO Configuration  -----------------------------------------*/
  GPIO_Config();  
  
  /* Initialize the Interrupt sensitivity */
  EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_FALL_ONLY);
  EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
  
  enableInterrupts();

  while (1)
  {
    /* The LED toggles in the interrupt routines */
  }

}

/**
  * @brief  Configure GPIO for buttons and Leds available on the evaluation board
  * @param  None
  * @retval None
  */
static void GPIO_Config(void)
{
  /* Initialize I/Os in Output Mode for LEDs */
  GPIO_Init(LEDS_PORT, (GPIO_Pin_TypeDef)(LED1_PIN | LED2_PIN | LED3_PIN | LED4_PIN),
            GPIO_MODE_OUT_PP_HIGH_FAST);

  /* Initialize I/O in Input Mode with Interrupt for Joystick */
  GPIO_Init(JOYSTICK_PORT, (GPIO_Pin_TypeDef)(JOYSTICK_LEFT_PIN|JOYSTICK_RIGHT_PIN|JOYSTICK_UP_PIN|JOYSTICK_DOWN_PIN),
            GPIO_MODE_IN_FL_IT);
  
  GPIO_Init(JOYSTICK_SEL_PORT, JOYSTICK_SEL_PIN, GPIO_MODE_IN_FL_IT);
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
