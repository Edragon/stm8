   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  34                     ; 47 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  34                     ; 48 {
  35                     .text:	section	.text,new
  36  0000               f_NonHandledInterrupt:
  41                     ; 52 }
  44  0000 80            	iret	
  66                     ; 60 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  66                     ; 61 {
  67                     .text:	section	.text,new
  68  0000               f_TRAP_IRQHandler:
  73                     ; 65 }
  76  0000 80            	iret	
  98                     ; 72 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  98                     ; 73 
  98                     ; 74 {
  99                     .text:	section	.text,new
 100  0000               f_TLI_IRQHandler:
 105                     ; 78 }
 108  0000 80            	iret	
 130                     ; 85 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 130                     ; 86 {
 131                     .text:	section	.text,new
 132  0000               f_AWU_IRQHandler:
 137                     ; 90 }
 140  0000 80            	iret	
 162                     ; 97 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 162                     ; 98 {
 163                     .text:	section	.text,new
 164  0000               f_CLK_IRQHandler:
 169                     ; 102 }
 172  0000 80            	iret	
 195                     ; 109 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 195                     ; 110 {
 196                     .text:	section	.text,new
 197  0000               f_EXTI_PORTA_IRQHandler:
 202                     ; 114 }
 205  0000 80            	iret	
 228                     ; 121 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 228                     ; 122 {
 229                     .text:	section	.text,new
 230  0000               f_EXTI_PORTB_IRQHandler:
 235                     ; 126 }
 238  0000 80            	iret	
 261                     ; 133 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 261                     ; 134 {
 262                     .text:	section	.text,new
 263  0000               f_EXTI_PORTC_IRQHandler:
 268                     ; 138 }
 271  0000 80            	iret	
 294                     ; 145 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 294                     ; 146 {
 295                     .text:	section	.text,new
 296  0000               f_EXTI_PORTD_IRQHandler:
 301                     ; 150 }
 304  0000 80            	iret	
 327                     ; 157 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 327                     ; 158 {
 328                     .text:	section	.text,new
 329  0000               f_EXTI_PORTE_IRQHandler:
 334                     ; 162 }
 337  0000 80            	iret	
 359                     ; 209 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 359                     ; 210 {
 360                     .text:	section	.text,new
 361  0000               f_SPI_IRQHandler:
 366                     ; 214 }
 369  0000 80            	iret	
 392                     ; 221 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 392                     ; 222 {
 393                     .text:	section	.text,new
 394  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 399                     ; 226 }
 402  0000 80            	iret	
 425                     ; 233 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 425                     ; 234 {
 426                     .text:	section	.text,new
 427  0000               f_TIM1_CAP_COM_IRQHandler:
 432                     ; 238 }
 435  0000 80            	iret	
 458                     ; 271  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 458                     ; 272  {
 459                     .text:	section	.text,new
 460  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 465                     ; 276  }
 468  0000 80            	iret	
 491                     ; 283  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 491                     ; 284  {
 492                     .text:	section	.text,new
 493  0000               f_TIM2_CAP_COM_IRQHandler:
 498                     ; 288  }
 501  0000 80            	iret	
 524                     ; 298  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 524                     ; 299  {
 525                     .text:	section	.text,new
 526  0000               f_TIM3_UPD_OVF_BRK_IRQHandler:
 531                     ; 303  }
 534  0000 80            	iret	
 557                     ; 310  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 557                     ; 311  {
 558                     .text:	section	.text,new
 559  0000               f_TIM3_CAP_COM_IRQHandler:
 564                     ; 315  }
 567  0000 80            	iret	
 589                     ; 350 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 589                     ; 351 {
 590                     .text:	section	.text,new
 591  0000               f_I2C_IRQHandler:
 596                     ; 355 }
 599  0000 80            	iret	
 622                     ; 363  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 622                     ; 364  {
 623                     .text:	section	.text,new
 624  0000               f_UART2_TX_IRQHandler:
 629                     ; 368  }
 632  0000 80            	iret	
 655                     ; 375  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 655                     ; 376  {
 656                     .text:	section	.text,new
 657  0000               f_UART2_RX_IRQHandler:
 662                     ; 380  }
 665  0000 80            	iret	
 687                     ; 429  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 687                     ; 430  {
 688                     .text:	section	.text,new
 689  0000               f_ADC1_IRQHandler:
 694                     ; 434  }
 697  0000 80            	iret	
 720                     ; 455  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 720                     ; 456  {
 721                     .text:	section	.text,new
 722  0000               f_TIM4_UPD_OVF_IRQHandler:
 727                     ; 460  }
 730  0000 80            	iret	
 753                     ; 468 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 753                     ; 469 {
 754                     .text:	section	.text,new
 755  0000               f_EEPROM_EEC_IRQHandler:
 760                     ; 473 }
 763  0000 80            	iret	
 775                     	xdef	f_EEPROM_EEC_IRQHandler
 776                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 777                     	xdef	f_ADC1_IRQHandler
 778                     	xdef	f_UART2_TX_IRQHandler
 779                     	xdef	f_UART2_RX_IRQHandler
 780                     	xdef	f_I2C_IRQHandler
 781                     	xdef	f_TIM3_CAP_COM_IRQHandler
 782                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 783                     	xdef	f_TIM2_CAP_COM_IRQHandler
 784                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 785                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 786                     	xdef	f_TIM1_CAP_COM_IRQHandler
 787                     	xdef	f_SPI_IRQHandler
 788                     	xdef	f_EXTI_PORTE_IRQHandler
 789                     	xdef	f_EXTI_PORTD_IRQHandler
 790                     	xdef	f_EXTI_PORTC_IRQHandler
 791                     	xdef	f_EXTI_PORTB_IRQHandler
 792                     	xdef	f_EXTI_PORTA_IRQHandler
 793                     	xdef	f_CLK_IRQHandler
 794                     	xdef	f_AWU_IRQHandler
 795                     	xdef	f_TLI_IRQHandler
 796                     	xdef	f_TRAP_IRQHandler
 797                     	xdef	f_NonHandledInterrupt
 816                     	end
