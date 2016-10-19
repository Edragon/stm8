/** @page TIM1_Input_Capture LSI clock source Capture by TIM1 

  @verbatim
  ******************** (C)COPYRIGHT 2011 STMicroelectronics *******************
  * @file    TIM1/TIM1_Input_Capture/readme.txt
  * @author  MCD Application Team
  * @version V2.1.0
  * @date    18-November-2011
  * @brief   Description of the TIM1 Input Capture  Example.
  ******************************************************************************
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  ******************************************************************************
   @endverbatim
   
  @par Example description

  This example shows how to configure the TIM1 peripheral to capture the internal 
  clock source (LSI).
  
  TIM1CLK is fixed to 2 MHz, the TIM1 Prescaler is equal to 0 so the TIM1 counter
  clock used is 2 MHz. (By default, fTIM1= fMaster/8 )
  
  The TIM1 Channel 1 is configured as Input capture.
  The LSI signal is redirected to the CCO output Pin.
  The TIM1 Channel 1 is connected to the CCO Pin. 
  
  The captured value of LSI clock Frequency is stored in the LSIClockFreq variable.


  @par Directory contents

  - TIM1\TIM1_Input_Capture\main.c            Main file containing the "main" function
  - TIM1\TIM1_Input_Capture\stm8s_conf.h      Library Configuration file
  - TIM1\TIM1_Input_Capture\stm8s_it.c        Interrupt routines source
  - TIM1\TIM1_Input_Capture\stm8s_it.h        Interrupt routines declaration
  

 @par Hardware and Software environment

  - This example runs on STM8S and STM8A High density, Medium density and Low 
    density devices.
  
  - This example has been tested with STMicroelectronics STM8/128-EVAL evaluation 
    board and can be easily tailored to any other development board.

  - STM8/128-EVAL Set-up
     - Connect the configurable Clock Output pin CCO (PE.0) to the  TIM1_CC1  pin (PC.1)


  @par How to use it ?

  In order to make the program work, you must do the following :

  - Copy all source files from this example folder to the template folder under
    Project\Template
  - Open your preferred toolchain 
  - Rebuild all files and load your image into target memory
  - Run the example
  - Connect the TIM1_CC1 pin to COO pin
  - Read the value of LSIClockFreq variable

  @note
  - High-Density STM8A devices are the STM8AF52xx STM8AF6269/8x/Ax,
    STM8AF51xx, and STM8AF6169/7x/8x/9x/Ax microcontrollers where the Flash memory
    density ranges between 32 to 128 Kbytes
  - Medium-Density STM8A devices are the STM8AF622x/4x, STM8AF6266/68,
    STM8AF612x/4x, and STM8AF6166/68 microcontrollers where the Flash memory 
    density ranges between 8 to 32 Kbytes
  - High-Density STM8S devices are the STM8S207xx, STM8S007 and STM8S208xx microcontrollers
    where the Flash memory density ranges between 32 to 128 Kbytes.
  - Medium-Density STM8S devices are the STM8S105x and STM8S005 microcontrollers
    where the Flash memory density ranges between 16 to 32-Kbytes.
  - Low-Density STM8S devices are the STM8S103xx, STM8S003 and STM8S903xx microcontrollers
    where the Flash density is 8 Kbytes.
      
 * <h3><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h3>
 */
