
/******************** (C) COPYRIGHT  ���iCreateǶ��ʽ���������� ********************
 * �ļ���  ��main.c
 * ����    ������ͨ��     
 * ʵ��ƽ̨��iCreate STM8������
 * ��汾  ��V2.0.0
 * ����    ��ling_guansheng  QQ��779814207
 * ����    ��
 *�޸�ʱ�� ��2011-12-20
**********************************************************************************/

/* Includes ------------------------------------------------------------------*/
/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "stm8s_clk.h"
#include "intrinsics.h"
#include "stm8s_uart1.h"
#include "uart.h"
#include "led.h"
#include "string.h"

void Delay(u32 nCount);
extern u8 RxBuffer[RxBufferSize];
extern u8 UART_RX_NUM;
extern u8 N1[RxBufferSize];
extern u8 F1[RxBufferSize];

/* Private defines -----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

int main(void)
{
   u8 len ;
  /* Infinite loop */
  
  /*�����ڲ�ʱ��16MΪ��ʱ��*/ 
 
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  /*!<Set High speed internal clock  */

   Uart_Init();
   LED_Init();
   SetLedOFF();
   __enable_interrupt(); 
   printf("\r\nӲ��ƽ̨Ϊ:%s\r\n","iCreate STM8 ������");
   UART1_SendString("Serial Communication ---STM8 Development Board of FengChi Electron ",\
             sizeof("Serial Communication ---STM8 Development Board of FengChi Electron"));
   
   Delay(0xffff);
   UART1_SendByte('\n');
   Delay(0xffff);

   while (1)
   {
     
  
      if(UART_RX_NUM&0x80)
      {
        //data = RxBuffer;
        
        len=UART_RX_NUM&0x3f;/*�õ��˴ν��յ������ݳ���*/
        
        UART1_SendString("You sent the messages is:",sizeof("You sent the messages is"));
        UART1_SendString(RxBuffer,len);   
        UART1_SendByte('\n');

        if(RxBuffer[0] == N1[0])
        {
          if (RxBuffer[1] == N1[1])
        {
          LED1(ON);
        }
        }
        if(RxBuffer[0] == F1[0])
        {
          if (RxBuffer[1] == F1[1])
        {
          LED1(OFF);
        }
        }
        
        UART_RX_NUM = 0;
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

/******************* (C) COPYRIGHT ���iCreateǶ��ʽ���������� *****END OF FILE****/
