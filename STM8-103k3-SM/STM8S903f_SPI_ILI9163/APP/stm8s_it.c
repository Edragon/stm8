/**
  ******************************************************************************
  * @file stm8s_it.c
  * @brief This file contains all the interrupt routines, for Cosmic compiler.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.1.1
  * @date 05/06/2009
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <stm8s_it.h>
#include <stm8s_type.h>



/** @addtogroup IT_Functions
  * @{
  */
#ifdef _COSMIC_
/**
  * @brief Dummy interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
@far @interrupt void NonHandledInterrupt(void)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief TRAP interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
@far @interrupt void TRAP_IRQHandler(void)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif

#ifdef _RAISONANCE_

/**
  * @brief TRAP interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
void TRAP_IRQHandler(void) trap
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif

#ifdef _IARSYSTEMS_
/**
  * @brief TRAP interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
#pragma vector=1
__interrupt void TRAP_IRQHandler(void)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif

/**
  * @brief Top Level Interrupt Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void TLI_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void TLI_IRQHandler(void) interrupt 0
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=2
__interrupt void TLI_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Auto Wake Up Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void AWU_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void AWU_IRQHandler(void) interrupt 1
#endif	

#ifdef _IAR_SYSTEMS_
#pragma vector=3
__interrupt void AWU_IRQHandler(void)
#endif
{

}

/**
  * @brief Clock Controller Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void CLK_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void CLK_IRQHandler(void) interrupt 2
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=4
__interrupt void CLK_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief External Interrupt PORTA Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void EXTI_PORTA_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void EXTI_PORTA_IRQHandler(void) interrupt 3
#endif
#ifdef _IAR_SYSTEMS_
/**函数(模块)名称:  EXTI_PORTA_IRQHandler()
**功能:           判断是否有建按下，有则让LED翻转
**调用函数清单:    无
**调用本函数清单:  无 
**输入参数:        无                            		
**输出参数:        无       	
**函数返回值说明:  无
**使用的资源       I/O端口模块       	
**其它说明:        无
*************************************************/
#pragma vector=5
__interrupt void EXTI_PORTA_IRQHandler(void)
#endif
    {
      unsigned int i;
      disableInterrupts();
      for(i=0;i<8000;i++);        //延时约20ms去抖
      if((GPIO_ReadInputPin(GPIOA, GPIO_PIN_6))==0)
        GPIO_WriteReverse(GPIOG, GPIO_PIN_0|GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7);
      while((GPIO_ReadInputPin(GPIOA, GPIO_PIN_6))==0);   //等待按键释放
      enableInterrupts();
    }


/**
  * @brief External Interrupt PORTB Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
*/
#ifdef _COSMIC_
@far @interrupt void EXTI_PORTB_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void EXTI_PORTB_IRQHandler(void) interrupt 4
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=6
__interrupt void EXTI_PORTB_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief External Interrupt PORTC Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void EXTI_PORTC_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void EXTI_PORTC_IRQHandler(void) interrupt 5
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=7
__interrupt void EXTI_PORTC_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief External Interrupt PORTD Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void EXTI_PORTD_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void EXTI_PORTD_IRQHandler(void) interrupt 6
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=8
__interrupt void EXTI_PORTD_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief External Interrupt PORTE Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void EXTI_PORTE_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void EXTI_PORTE_IRQHandler(void) interrupt 7
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=9
__interrupt void EXTI_PORTE_IRQHandler(void)
#endif
{

}
#ifdef STM8S903
/**
  * @brief External Interrupt PORTF Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void EXTI_PORTF_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void EXTI_PORTF_IRQHandler(void) interrupt 8
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0xA
__interrupt void EXTI_PORTF_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*STM8S903*/

#ifdef STM8S208
/**
  * @brief CAN RX Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void CAN_RX_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void CAN_RX_IRQHandler(void) interrupt 8
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0xA
__interrupt void CAN_RX_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief CAN TX Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void CAN_TX_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void CAN_TX_IRQHandler(void) interrupt 9
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0xB
__interrupt void CAN_TX_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*STM8S208*/

/**
  * @brief SPI Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void SPI_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void SPI_IRQHandler(void) interrupt 10
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0xC
__interrupt void SPI_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Timer1 Update/Overflow/Trigger/Break Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void) interrupt 11
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0xD
__interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Timer1 Capture/Compare Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void TIM1_CAP_COM_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void TIM1_CAP_COM_IRQHandler(void) interrupt 12
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0xE
__interrupt void TIM1_CAP_COM_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

#ifdef STM8S903
/**
  * @brief Timer5 Update/Overflow/Break/Trigger Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void TIM5_UPD_OVF_BRK_TRG_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void TIM5_UPD_OVF_BRK_TRG_IRQHandler(void) interrupt 13
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0xF
__interrupt void TIM5_UPD_OVF_BRK_TRG_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
/**
  * @brief Timer5 Capture/Compare Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void TIM5_CAP_COM_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void TIM5_CAP_COM_IRQHandler(void) interrupt 14
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x10
__interrupt void TIM5_CAP_COM_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

#else /*STM8S208, STM8S207, STM8S105 or STM8S103*/
/**
  * @brief Timer2 Update/Overflow/Break Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void TIM2_UPD_OVF_BRK_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void TIM2_UPD_OVF_BRK_IRQHandler(void) interrupt 13
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0xF
__interrupt void TIM2_UPD_OVF_BRK_IRQHandler(void)
#endif
{

}

/**
  * @brief Timer2 Capture/Compare Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void TIM2_CAP_COM_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void TIM2_CAP_COM_IRQHandler(void) interrupt 14
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x10
__interrupt void TIM2_CAP_COM_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*STM8S903*/

#if defined (STM8S208) || defined(STM8S207) || defined(STM8S105)
/**
  * @brief Timer3 Update/Overflow/Break Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void TIM3_UPD_OVF_BRK_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void TIM3_UPD_OVF_BRK_IRQHandler(void) interrupt 15
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x11
__interrupt void TIM3_UPD_OVF_BRK_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Timer3 Capture/Compare Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void TIM3_CAP_COM_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void TIM3_CAP_COM_IRQHandler(void) interrupt 16
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x12
__interrupt void TIM3_CAP_COM_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*STM8S208, STM8S207 or STM8S105*/

#ifndef STM8S105
/**
  * @brief UART1 TX Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void UART1_TX_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void UART1_TX_IRQHandler(void) interrupt 17
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x13
__interrupt void UART1_TX_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief UART1 RX Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void UART1_RX_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void UART1_RX_IRQHandler(void) interrupt 18
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x14
__interrupt void UART1_RX_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*STM8S105*/

/**
  * @brief I2C Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void I2C_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void I2C_IRQHandler(void) interrupt 19
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x15
__interrupt void I2C_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

#ifdef STM8S105
/**
  * @brief UART2 TX interrupt routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void UART2_TX_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void UART2_TX_IRQHandler(void) interrupt 20
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x16
__interrupt void UART2_TX_IRQHandler(void)
#endif
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}

/**
  * @brief UART2 RX interrupt routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void UART2_RX_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void UART2_RX_IRQHandler(void) interrupt 21
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x17
__interrupt void UART2_RX_IRQHandler(void)
#endif
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
#endif /* STM8S105*/

#if defined(STM8S207) || defined(STM8S208)
/**
  * @brief UART3 TX interrupt routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void UART3_TX_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void UART3_TX_IRQHandler(void) interrupt 20
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x16
__interrupt void UART3_TX_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief UART3 RX interrupt routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void UART3_RX_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void UART3_RX_IRQHandler(void) interrupt 21
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x17
__interrupt void UART3_RX_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*STM8S208 or STM8S207*/

#if defined(STM8S207) || defined(STM8S208)
/**
  * @brief ADC2 interrupt routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void ADC2_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void ADC2_IRQHandler(void) interrupt 22
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x18
__interrupt void ADC2_IRQHandler(void)
#endif
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
#else /*STM8S105, STM8S103 or STM8S903*/
/**
  * @brief ADC1 interrupt routine.
  * @par Parameters:
  * None
  * @retval 
  * None
  */
#ifdef _COSMIC_
@far @interrupt void ADC1_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void ADC1_IRQHandler(void) interrupt 22
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x18
__interrupt void ADC1_IRQHandler(void)
#endif
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
#endif /*STM8S208 or STM8S207*/

#ifdef STM8S903
/**
  * @brief Timer6 Update/Overflow/Trigger Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void TIM6_UPD_OVF_TRG_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void TIM6_UPD_OVF_TRG_IRQHandler(void) interrupt 23
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x19
__interrupt void TIM6_UPD_OVF_TRG_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#else /*STM8S208, STM8S207, STM8S105 or STM8S103*/
/**
  * @brief Timer4 Update/Overflow Interruption routine.
  * @par Parameters:
  * None
  * @retval
  * None
  */
#ifdef _COSMIC_
@far @interrupt void TIM4_UPD_OVF_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void TIM4_UPD_OVF_IRQHandler(void) interrupt 23
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x19
__interrupt void TIM4_UPD_OVF_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*STM8S903*/

/**
  * @brief Eeprom EEC Interruption routine.
  * @par Parameters:
  * None
  * @retval
	* None
  */
#ifdef _COSMIC_
@far @interrupt void EEPROM_EEC_IRQHandler(void)
#endif

#ifdef _RAISONANCE_
void EEPROM_EEC_IRQHandler(void) interrupt 24
#endif

#ifdef _IAR_SYSTEMS_
#pragma vector=0x1A
__interrupt void EEPROM_EEC_IRQHandler(void)
#endif
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/