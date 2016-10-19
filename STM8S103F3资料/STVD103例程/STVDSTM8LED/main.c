/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "STM8S103f3p.h"

main()
{
	  int i,j;
	  PB_DDR|=0x20;
	  PB_CR1|=0x20;
	  PB_CR2|=0x00;
	  while (1)
	  {
			  //PE_ODR^=0x00;
				//for(i=0;i<200;i++)
				//    for(j=0;j<200;j++);
				PB_ODR^=0xf0;
				for(i=0;i<200;i++)
				    for(j=0;j<200;j++);
	  }
}