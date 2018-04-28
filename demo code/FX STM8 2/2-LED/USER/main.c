
/******************** (C) COPYRIGHT  ���iCreateǶ��ʽ���������� ********************
 * �ļ���  ��main.c
 * ����    ����ˮ��    
 * ʵ��ƽ̨��iCreate STM8������
 * ��汾  ��V2.0.0
 * ����    ��ling_guansheng  QQ��779814207
 * ����    ��
 *�޸�ʱ�� ��2011-12-20
**********************************************************************************/

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "stm8s_clk.h"
#include "led.h"

//#define Bit_or_Port  1  



/* Private defines -----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

int main(void)
{
  /* Infinite loop */

  /*�����ڲ�����ʱ��16MΪ��ʱ��*/ 
   CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
   
  /*!<Set High speed internal clock */
   LED_Init();
   SetLedOFF(); /* �����е��� */
  while (1)
  {
    /*  �����Ĵ���  */
    #ifdef Bit_or_Port
    LED_ShowOneToOne();
    /*   ���ϲ���������򵥵ĵ���LED�ĵ��� ���ú궨��ʵ�ֵ�  */
    #else
    LED_Display();
    /*   ʵ��λ�Ʋ���   */
    #endif
   
  
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
