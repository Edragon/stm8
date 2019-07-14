/**
  ******************************************************************************
  * @file stm8l10x_it.h
  * @brief This file contains the external declarations of the interrupt routines.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.1.0
  * @date    09/14/2009
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __STM8L10x_IT_H
#define __STM8L10x_IT_H

/* Includes ------------------------------------------------------------------*/
#include "stm8l10x.h"

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
/* Exported functions ------------------------------------------------------- */
#ifdef _COSMIC_
void _stext(void); /* RESET startup routine */
@far @interrupt void NonHandledInterrupt(void);
@far @interrupt void TRAP_IRQHandler(void); /* TRAP */
@far @interrupt void FLASH_IRQHandler(void); /* FLASH EOP/PG_DIS */
@far @interrupt void AWU_IRQHandler(void); /* AWU */
@far @interrupt void EXTIB_IRQHandler(void); /* EXTI PORTB */
@far @interrupt void EXTID_IRQHandler(void); /* EXTI PORTD */
@far @interrupt void EXTI0_IRQHandler(void); /* EXTI PIN0 */
@far @interrupt void EXTI1_IRQHandler(void); /* EXTI PIN1 */
@far @interrupt void EXTI2_IRQHandler(void); /* EXTI PIN2 */
@far @interrupt void EXTI3_IRQHandler(void); /* EXTI PIN3 */
@far @interrupt void EXTI4_IRQHandler(void); /* EXTI PIN4 */
@far @interrupt void EXTI5_IRQHandler(void); /* EXTI PIN5 */
@far @interrupt void EXTI6_IRQHandler(void); /* EXTI PIN6 */
@far @interrupt void EXTI7_IRQHandler(void); /* EXTI PIN7 */
@far @interrupt void COMP_IRQHandler(void); /* COMP */
@far @interrupt void TIM2_UPD_OVF_TRG_BRK_IRQHandler(void); /* TIM2 UPD/OVF/TRG/BRK */
@far @interrupt void TIM2_CAP_IRQHandler(void); /* TIM2 CAP*/
@far @interrupt void TIM3_UPD_OVF_TRG_BRK_IRQHandler(void); /* TIM3 UPD/OVF/TRG/BRK */
@far @interrupt void TIM3_CAP_IRQHandler(void); /* TIM3 CAP*/
@far @interrupt void TIM4_UPD_OVF_IRQHandler(void); /* TIM4 UPD/OVF */
@far @interrupt void SPI_IRQHandler(void); /* SPI */
@far @interrupt void USART_TX_IRQHandler(void); /* USART TX */
@far @interrupt void USART_RX_IRQHandler(void); /* USART RX */
@far @interrupt void I2C_IRQHandler(void); /* I2C */
#endif /* _COSMIC_ */

#endif /* __STM8L10x_IT_H */

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/

