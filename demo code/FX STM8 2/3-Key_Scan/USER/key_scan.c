/******************** (C) COPYRIGHT  风驰iCreate嵌入式开发工作室 ***************************
 * 文件名  ：key_scan.c
 * 描述    ：按键配置函数库   
 * 实验平台：iCreate STM8开发板
 * 库版本  ：V2.0.0
 * 作者    ：ling_guansheng  QQ：779814207
 * 博客    ：
 *修改时间 ：2011-12-20

  iCreate STM8开发板硬件连接
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
        Delay(0x3ff);/*  消抖 */
        if(!GPIO_ReadInputPin(GPIOD,Buttom))
        {
          while(!GPIO_ReadInputPin(GPIOD,Buttom));/*松手释放*/
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

/******************* (C) COPYRIGHT 风驰iCreate嵌入式开发工作室 *****END OF FILE****/