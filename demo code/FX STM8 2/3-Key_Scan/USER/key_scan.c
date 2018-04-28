/******************** (C) COPYRIGHT  ���iCreateǶ��ʽ���������� ***************************
 * �ļ���  ��key_scan.c
 * ����    ���������ú�����   
 * ʵ��ƽ̨��iCreate STM8������
 * ��汾  ��V2.0.0
 * ����    ��ling_guansheng  QQ��779814207
 * ����    ��
 *�޸�ʱ�� ��2011-12-20

  iCreate STM8������Ӳ������
    |--------------------|
    |  Buttom1-PD5       |
    |  Buttom2-PD6       |
    |  Buttom3-PD7       |
    |--------------------|

****************************************************************************************/
#include "key_scan.h"
void Buttom_Init(void)
{
    GPIO_Init(GPIOD,Buttom1|Buttom2|Buttom3,GPIO_MODE_IN_PU_NO_IT);
}

BitStatus Key_Scan(GPIO_Pin_TypeDef Buttom)
{
    BitStatus ButtomStatus;
    ButtomStatus=Buttom_OFF;
    if(!GPIO_ReadInputPin(GPIOD,Buttom))
    {
        Delay(0x3ff);/*  ���� */
        if(!GPIO_ReadInputPin(GPIOD,Buttom))
        {
          while(!GPIO_ReadInputPin(GPIOD,Buttom));/*�����ͷ�*/
          ButtomStatus=Buttom_ON;
        }
    }
    return ButtomStatus;
}

void Delay(u16 nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
  }
}

/******************* (C) COPYRIGHT ���iCreateǶ��ʽ���������� *****END OF FILE****/