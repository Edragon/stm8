
/******************** (C) COPYRIGHT  风驰iCreate嵌入式开发工作室 ********************
 * 文件名  ：main.c
 * 描述    ：串口通信     
 * 实验平台：iCreate STM8开发板
 * 库版本  ：V2.0.0
 * 作者    ：ling_guansheng  QQ：779814207
 * 博客    ：
 *修改时间 ：2011-12-20
**********************************************************************************/

/* Includes ------------------------------------------------------------------*/
/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "stm8s_clk.h"
#include "intrinsics.h"
#include "stm8s_uart1.h"
#include "uart.h"
void Delay(u32 nCount);
extern u8 RxBuffer[RxBufferSize];
extern u8 UART_RX_NUM;
/* Private defines -----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

int main(void)
{
   u8 len ;
  /* Infinite loop */
  
  /*设置内部时钟16M为主时钟*/ 
 
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  /*!<Set High speed internal clock  */

   Uart_Init();
   __enable_interrupt(); 
   printf("\r\n硬件平台为:%s\r\n","iCreate STM8 开发板");
   UART1_SendString("Serial Communication ---STM8 Development Board of FengChi Electron ",\
             sizeof("Serial Communication ---STM8 Development Board of FengChi Electron"));
   
   Delay(0xffff);
   UART1_SendByte('\n');
   Delay(0xffff);
   while (1)
   {
     
  
      if(UART_RX_NUM&0x80)
      {
        len=UART_RX_NUM&0x3f;/*得到此次接收到的数据长度*/
        UART1_SendString("You sent the messages is:",sizeof("You sent the messages is"));
        UART1_SendString(RxBuffer,len);
        UART1_SendByte('\n');
        UART_RX_NUM=0;
      }
    }

  
  
}

void Delay(u32 nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
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

/******************* (C) COPYRIGHT 风驰iCreate嵌入式开发工作室 *****END OF FILE****/
