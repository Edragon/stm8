#include "IOSTM8S103F3.h"
int main( void )
{
  int i,j;
	  PB_DDR|=0x20;
	  PB_CR1|=0x20;
	  PB_CR2|=0x00;
	  while (1)
	  {
			  PB_ODR^=0x00;
				for(i=0;i<100;i++)
				    for(j=0;j<200;j++);
				PB_ODR^=0xf0;
				for(i=0;i<100;i++)
				    for(j=0;j<200;j++);
	  }
  return 0;
}
