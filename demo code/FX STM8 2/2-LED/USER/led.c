

/******************** (C) COPYRIGHT  ���iCreateǶ��ʽ���������� ***************************
 * �ļ���  ��led.c
 * ����    ��IO�����ú�����   
 * ʵ��ƽ̨��iCreate STM8������
 * ��汾  ��V2.0.0
 * ����    ��ling_guansheng  QQ��779814207
 * ����    ��
 *�޸�ʱ�� ��2011-12-20

  iCreate STM8������Ӳ������
    |--------------------|
    |  LED1-PD0          |
    |  LED2-PD1          |
    |  LED3-PD2          |
    |  LED4-PD3          |
    |--------------------|

****************************************************************************************/

#include "led.h"

void LED_Init(void)
{
   GPIO_Init(GPIOD,(GPIO_PIN_4|GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3),\
             GPIO_MODE_OUT_PP_HIGH_FAST );//����LED�Ĺܽŵ�ģʽ
   GPIO_Init(GPIOB,GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST );//����LED�Ĺܽŵ�ģʽ
}

void SetLedOFF(void)
{
    GPIO_Write(GPIOD, 0xff);
    GPIO_Write(GPIOB, 0xff);
}
void LED_Display(void)
{
  u8 PortVal;
  for(PortVal=0;PortVal<4;PortVal++)
  {

      GPIOD->ODR =(u8)(~(1<<PortVal));
      
      Delay(0x1ffff);
  }
}

void LED_ShowOneToOne(void)
{
    LED1(ON);
    LED2(OFF);
    LED3(OFF);
    LED4(OFF);
    Delay(0x1ffff);
    LED1(OFF);
    LED2(ON);
    LED3(OFF);
    LED4(OFF);
    Delay(0x1ffff);
    LED1(OFF);
    LED2(OFF);
    LED3(ON);
    LED4(OFF);
    Delay(0x1ffff);
    LED1(OFF);
    LED2(OFF);
    LED3(OFF);
    LED4(ON);
    Delay(0x1ffff);
}

void Delay(u32 nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
  }
}


/******************* (C) COPYRIGHT ���iCreateǶ��ʽ���������� *****END OF FILE****/