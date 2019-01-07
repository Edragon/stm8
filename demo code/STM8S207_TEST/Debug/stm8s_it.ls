   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 66 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  43                     ; 67 {
  44                     	switch	.text
  45  0000               f_TRAP_IRQHandler:
  49                     ; 71 }
  52  0000 80            	iret
  74                     ; 78 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  74                     ; 79 
  74                     ; 80 {
  75                     	switch	.text
  76  0001               f_TLI_IRQHandler:
  80                     ; 84 }
  83  0001 80            	iret
 105                     ; 91 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 105                     ; 92 {
 106                     	switch	.text
 107  0002               f_AWU_IRQHandler:
 111                     ; 96 }
 114  0002 80            	iret
 136                     ; 103 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 136                     ; 104 {
 137                     	switch	.text
 138  0003               f_CLK_IRQHandler:
 142                     ; 108 }
 145  0003 80            	iret
 168                     ; 115 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 168                     ; 116 {
 169                     	switch	.text
 170  0004               f_EXTI_PORTA_IRQHandler:
 174                     ; 120 }
 177  0004 80            	iret
 200                     ; 127 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 200                     ; 128 {
 201                     	switch	.text
 202  0005               f_EXTI_PORTB_IRQHandler:
 206                     ; 132 }
 209  0005 80            	iret
 232                     ; 139 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 232                     ; 140 {
 233                     	switch	.text
 234  0006               f_EXTI_PORTC_IRQHandler:
 238                     ; 144 }
 241  0006 80            	iret
 264                     ; 151 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 264                     ; 152 {
 265                     	switch	.text
 266  0007               f_EXTI_PORTD_IRQHandler:
 270                     ; 156 }
 273  0007 80            	iret
 296                     ; 163 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 296                     ; 164 {
 297                     	switch	.text
 298  0008               f_EXTI_PORTE_IRQHandler:
 302                     ; 168 }
 305  0008 80            	iret
 327                     ; 215 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 327                     ; 216 {
 328                     	switch	.text
 329  0009               f_SPI_IRQHandler:
 333                     ; 220 }
 336  0009 80            	iret
 359                     ; 227 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 359                     ; 228 {
 360                     	switch	.text
 361  000a               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 365                     ; 232 }
 368  000a 80            	iret
 391                     ; 239 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 391                     ; 240 {
 392                     	switch	.text
 393  000b               f_TIM1_CAP_COM_IRQHandler:
 397                     ; 245 }
 400  000b 80            	iret
 423                     ; 278  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 423                     ; 279  {
 424                     	switch	.text
 425  000c               f_TIM2_UPD_OVF_BRK_IRQHandler:
 429                     ; 283  }
 432  000c 80            	iret
 455                     ; 290  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 455                     ; 291  {
 456                     	switch	.text
 457  000d               f_TIM2_CAP_COM_IRQHandler:
 461                     ; 295  }
 464  000d 80            	iret
 487                     ; 305  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 487                     ; 306  {
 488                     	switch	.text
 489  000e               f_TIM3_UPD_OVF_BRK_IRQHandler:
 493                     ; 310  }
 496  000e 80            	iret
 519                     ; 317  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 519                     ; 318  {
 520                     	switch	.text
 521  000f               f_TIM3_CAP_COM_IRQHandler:
 525                     ; 322  }
 528  000f 80            	iret
 551                     ; 332  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 551                     ; 333  {
 552                     	switch	.text
 553  0010               f_UART1_TX_IRQHandler:
 557                     ; 337  }
 560  0010 80            	iret
 583                     ; 344  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 583                     ; 345  {
 584                     	switch	.text
 585  0011               f_UART1_RX_IRQHandler:
 589                     ; 349  }
 592  0011 80            	iret
 614                     ; 383 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 614                     ; 384 {
 615                     	switch	.text
 616  0012               f_I2C_IRQHandler:
 620                     ; 388 }
 623  0012 80            	iret
 646                     ; 422  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 646                     ; 423  {
 647                     	switch	.text
 648  0013               f_UART3_TX_IRQHandler:
 652                     ; 427  }
 655  0013 80            	iret
 678                     ; 434  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 678                     ; 435  {
 679                     	switch	.text
 680  0014               f_UART3_RX_IRQHandler:
 684                     ; 453  }
 687  0014 80            	iret
 709                     ; 462  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
 709                     ; 463  {
 710                     	switch	.text
 711  0015               f_ADC2_IRQHandler:
 715                     ; 465  }
 718  0015 80            	iret
 741                     ; 500  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 741                     ; 501  {
 742                     	switch	.text
 743  0016               f_TIM4_UPD_OVF_IRQHandler:
 747                     ; 505  }
 750  0016 80            	iret
 773                     ; 513 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 773                     ; 514 {
 774                     	switch	.text
 775  0017               f_EEPROM_EEC_IRQHandler:
 779                     ; 518 }
 782  0017 80            	iret
 794                     	xdef	f_EEPROM_EEC_IRQHandler
 795                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 796                     	xdef	f_ADC2_IRQHandler
 797                     	xdef	f_UART3_TX_IRQHandler
 798                     	xdef	f_UART3_RX_IRQHandler
 799                     	xdef	f_I2C_IRQHandler
 800                     	xdef	f_UART1_RX_IRQHandler
 801                     	xdef	f_UART1_TX_IRQHandler
 802                     	xdef	f_TIM3_CAP_COM_IRQHandler
 803                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 804                     	xdef	f_TIM2_CAP_COM_IRQHandler
 805                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 806                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 807                     	xdef	f_TIM1_CAP_COM_IRQHandler
 808                     	xdef	f_SPI_IRQHandler
 809                     	xdef	f_EXTI_PORTE_IRQHandler
 810                     	xdef	f_EXTI_PORTD_IRQHandler
 811                     	xdef	f_EXTI_PORTC_IRQHandler
 812                     	xdef	f_EXTI_PORTB_IRQHandler
 813                     	xdef	f_EXTI_PORTA_IRQHandler
 814                     	xdef	f_CLK_IRQHandler
 815                     	xdef	f_AWU_IRQHandler
 816                     	xdef	f_TLI_IRQHandler
 817                     	xdef	f_TRAP_IRQHandler
 836                     	end
