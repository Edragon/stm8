/** Electrodragon **/
					
#include <iostm8s003f3.h>

#define LED 4 //the LED on the PD3
#define LED_ON() PD_ODR |= (1<<(LED))
#define LED_OFF() PD_ODR &= ~ (1<<(LED))

void GPIO_Init()
{
  
  PD_DDR = (1<LED);
  PD_CR1 = (1<<LED);
  PD_CR2 = 0x0;
  PD_ODR = 0xFF;
}


void Delay_Ms(unsigned int j)
{
  for(int i =0;i<j;j++ )
  {
    ;
  }

}




int main( void )
{
 // asm("sim");  // ½ûÖ¹ÖÐ¶Ï
    
  // GPIO_Init();
  
   
  PD_DDR = 0xFF;
  PD_CR1 = 0xFF;
  PD_CR2 = 0x0;
 // PD_ODR = 0xFF;
   
  while(1)
  {
    
      LED_ON();
      Delay_Ms(2000);
      LED_OFF();
      Delay_Ms(2000);
    
    
      
  
  }

}
