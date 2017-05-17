#include <iostm8s003f3.h>




void delay(unsigned int n)
{
    while (n-- > 0);
}




//main entry point
int main( void )
{
 
    PD_ODR = 0; //Turn off all pins
    PD_DDR_DDR3 = 1; //PortD, Bit 3 is output (PD3 - Data Direction Register)
    PD_CR1_C13 = 1; //PortD, Control Register 1, Bit 3 (PD3) set to Push-Pull
    PD_CR2_C23 = 1; //PortD, Control Register 2, Bit 3 (PD3) set to Push-Pull
      
    while (1)
    {
        //Turn on and off the output and then delay
        PD_ODR_bit.ODR3 = !PD_ODR_bit.ODR3;
        delay(30000);
    }
}