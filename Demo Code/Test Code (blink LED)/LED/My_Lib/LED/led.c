

#include "led.h"
#include "ALL_Includes.h"

/***********************
�������ܣ���ʼ��LED
�����������
�����������
��    ע����
***********************/
void LED_Init(void)
{
      //����IO��Ϊ���
    LEDPort->DDR |= LEDPin;//���ģʽ
    LEDPort->CR1 |= LEDPin;//�������
   
}

/***********************
�������ܣ�LED��
�����������
�����������
��    ע����
***********************/
void LED_ON(void)
{
    LEDPort->ODR &=~LEDPin;//LED�õ�
}

/***********************
�������ܣ�LED��
�����������
�����������
��    ע����
***********************/
void LED_OFF(void)
{
    LEDPort->ODR |= LEDPin;//LED�ø�
}