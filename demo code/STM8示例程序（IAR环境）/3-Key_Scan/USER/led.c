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
   GPIO_Init(GPIOD,(led1|led2|led3|led4),\
             GPIO_MODE_OUT_PP_HIGH_FAST);//����LED�Ĺܽŵ�ģʽ
}

void SetLedOFF(void)
{
    GPIO_Write(GPIOD, 0xff);
}


void Led_Reverse(GPIO_Pin_TypeDef LedPins)
{
   GPIO_WriteReverse(GPIOD, LedPins);
}



/******************* (C) COPYRIGHT ���iCreateǶ��ʽ���������� *****END OF FILE****/