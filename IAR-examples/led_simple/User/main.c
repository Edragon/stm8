

#include "ALL_Includes.h"

//定义CPU内部时钟
#define  SYS_CLOCK    16


void CLOCK_Config(u8 SYS_CLK);
void All_Congfig(void);


int main(void)
{     
      All_Congfig();
               
      while(1)
      {         
          LED_ON();
          delay_ms(500);
          LED_OFF();
          delay_ms(500);
      }
        
}


void All_Congfig(void)
{
    CLOCK_Config(SYS_CLOCK);//系统时钟初始化  
    LED_Init();    
}


/*********************************************
函数功能：系统内部时钟配置
输入参数：SYS_CLK : 2、4、8、16
输出参数：无
备    注：系统启动默认内部2ＭＨＺ
*********************************************/
void CLOCK_Config(u8 SYS_CLK)
{
   //时钟配置为内部RC，16M
   CLK->CKDIVR &=~(BIT(4)|BIT(3));
  
   switch(SYS_CLK)
   {
      case 2: CLK->CKDIVR |=((1<<4)|(1<<3)); break;
      case 4: CLK->CKDIVR |=(1<<4); break;
      case 8: CLK->CKDIVR |=(1<<3); break;
   }
}



