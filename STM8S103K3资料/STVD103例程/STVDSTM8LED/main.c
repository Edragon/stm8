/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "STM8S103k3.h"

main()
{
	  int i,j;
	  PE_DDR|=0x20;
	  PE_CR1|=0x20;
	  PE_CR2|=0x00;
	  while (1)
	  {
			  //PE_ODR^=0x00;
				//for(i=0;i<200;i++)
				//    for(j=0;j<200;j++);
				PE_ODR^=0xf0;
				for(i=0;i<200;i++)
				    for(j=0;j<200;j++);
	  }
}