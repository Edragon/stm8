/**
  ******************************************************************************
  * @file    FLASH_WriteWord\main.c
  * @author  MCD Application Team
  * @version  V2.0.1
  * @date     18-November-2011
  * @brief   This file contains the main function for FLASH write word example.
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

/**
  * @addtogroup FLASH_WriteWord
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
typedef enum { FAILED = 0, PASSED = !FAILED} TestStatus;
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
__IO TestStatus OperationStatus = FAILED;
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

/**
  * @brief How to Write a word & Erase Byte on Data EEPROM memory.
  * @par   Examples description
  *        - Program a word at address 0x4100
  *        - Check program using Read byte
  *        - Erase word using erase byte
  *        - Check the 4 bytes (word) value is 0x00.
  * @param  None
  * @retval None
  */
void main(void)
{
    uint32_t start_add = 0x4100;
    uint32_t add = 0x00;
    uint32_t new_val = 0x01234567;
    uint8_t sub_test_count = 0x00, val = 0x00;

    /*Define FLASH programming time*/
    FLASH_SetProgrammingTime(FLASH_PROGRAMTIME_STANDARD);
    /* Unlock Data memory */
    FLASH_Unlock(FLASH_MEMTYPE_DATA);

    /* Program word at address 0x4100*/
    FLASH_ProgramWord(start_add, new_val);

    /* Check program word action */
    val = FLASH_ReadByte(start_add);
    add = start_add;
    if (val != BYTE_3(new_val))
    {
        /* Error */
        OperationStatus = FAILED;
        /* OperationStatus = PASSED, if the data written/read to/from DATA EEPROM memory is correct */
        /* OperationStatus = FAILED, if the data written/read to/from DATA EEPROM memory is corrupted */
        while (1);
    }

    add += 1;
    val = FLASH_ReadByte(add);
    if (val != BYTE_2(new_val))
    {
        /* Error */
        OperationStatus = FAILED;
        /* OperationStatus = PASSED, if the data written/read to/from DATA EEPROM memory is correct */
        /* OperationStatus = FAILED, if the data written/read to/from DATA EEPROM memory is corrupted */
        while (1);
    }

    add += 1;
    val = FLASH_ReadByte(add);
    if (val != BYTE_1(new_val))
    {
        /* Error */
        OperationStatus = FAILED;
        /* OperationStatus = PASSED, if the data written/read to/from DATA EEPROM memory is correct */
        /* OperationStatus = FAILED, if the data written/read to/from DATA EEPROM memory is corrupted */
        while (1);
    }

    add += 1;
    val = FLASH_ReadByte(add);
    if (val != BYTE_0(new_val))
    {
        /* Error */
        OperationStatus = FAILED;
        /* OperationStatus = PASSED, if the data written/read to/from DATA EEPROM memory is correct */
        /* OperationStatus = FAILED, if the data written/read to/from DATA EEPROM memory is corrupted */
        while (1);
    }

    /* Erase word using Erase byte */
    add = start_add;
    for (sub_test_count = 0; sub_test_count < 4; sub_test_count++)
    {
        FLASH_EraseByte(add);
        add += 1;
    }

    /* Verify Erase action */
    add = start_add;
    for (sub_test_count = 0; sub_test_count < 4; sub_test_count++)
    {
        val = FLASH_ReadByte(add);
        if (val != 0x00)
        {
            /* Error */
            OperationStatus = FAILED;
            /* OperationStatus = PASSED, if the data written/read to/from DATA EEPROM memory is correct */
            /* OperationStatus = FAILED, if the data written/read to/from DATA EEPROM memory is corrupted */
            while (1);
        }
        add += 1;
    }

    /* Pass */
    OperationStatus = PASSED;
    /* OperationStatus = PASSED, if the data written/read to/from DATA EEPROM memory is correct */
    /* OperationStatus = FAILED, if the data written/read to/from DATA EEPROM memory is corrupted */
    while (1);

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
