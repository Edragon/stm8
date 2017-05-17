#include <iostm8s003f3.h>
 
int main( void )
{ 
  PD_ODR = 0; //Turn off all pins on PortD
  
  //Set PD3 as output (for LED)
  PD_DDR_DDR3 = 1; //PortD, Bit 3 is output (PD3 - Data Direction Register)
  PD_CR1_C13 = 1; //PortD, Control Register 1, Bit 3 (PD3) set to Push-Pull
  PD_CR2_C23 = 1; //PortD, Control Register 2, Bit 3 (PD3) set to Push-Pull
  
  //Set PD6 as inout (for BUTTON)
  PD_DDR_DDR6 = 0; //set PD6 as input
  PD_CR1_C16 = 1; //set PD6 as Input with pull-up
  PD_CR2_C26 = 0; //disable interrup for PD6
  
  //
  // Main loop
  //
  while (1)
  {     
    //Read the PD6 and put the value in PD3. If button is pressed,
    //this will read a logic 0 but we need to negate it so that it sets the
    //PD3 to high!
    PD_ODR_bit.ODR3 = !PD_IDR_bit.IDR6;    
  }
}