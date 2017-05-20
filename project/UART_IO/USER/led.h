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

#ifndef __LED_H
#define __LED_H
#include "stm8s_gpio.h"

#define ON  0
#define OFF 1
#define LED1(ON_OFF)  if(ON_OFF==ON)GPIO_WriteLow(GPIOB, GPIO_PIN_5);\
                      else GPIO_WriteHigh(GPIOB, GPIO_PIN_5)
void LED_Init(void);


void SetLedOFF(void);


#endif


/******************* (C) COPYRIGHT ���iCreateǶ��ʽ���������� *****END OF FILE****/