   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  33                     ; 43 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  33                     ; 44 {
  34                     	switch	.text
  35  0000               f_NonHandledInterrupt:
  40                     ; 48 }
  43  0000 80            	iret
  65                     ; 56 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  65                     ; 57 {
  66                     	switch	.text
  67  0001               f_TRAP_IRQHandler:
  72                     ; 61 }
  75  0001 80            	iret
  97                     ; 67 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  97                     ; 68 {
  98                     	switch	.text
  99  0002               f_TLI_IRQHandler:
 104                     ; 72 }
 107  0002 80            	iret
 129                     ; 79 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 129                     ; 80 {
 130                     	switch	.text
 131  0003               f_AWU_IRQHandler:
 136                     ; 84 }
 139  0003 80            	iret
 161                     ; 91 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 161                     ; 92 {
 162                     	switch	.text
 163  0004               f_CLK_IRQHandler:
 168                     ; 96 }
 171  0004 80            	iret
 194                     ; 103 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 194                     ; 104 {
 195                     	switch	.text
 196  0005               f_EXTI_PORTA_IRQHandler:
 201                     ; 108 }
 204  0005 80            	iret
 227                     ; 115 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 227                     ; 116 {
 228                     	switch	.text
 229  0006               f_EXTI_PORTB_IRQHandler:
 234                     ; 120 }
 237  0006 80            	iret
 260                     ; 127 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 260                     ; 128 {
 261                     	switch	.text
 262  0007               f_EXTI_PORTC_IRQHandler:
 267                     ; 132 }
 270  0007 80            	iret
 293                     ; 139 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 293                     ; 140 {
 294                     	switch	.text
 295  0008               f_EXTI_PORTD_IRQHandler:
 300                     ; 144 }
 303  0008 80            	iret
 326                     ; 151 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 326                     ; 152 {
 327                     	switch	.text
 328  0009               f_EXTI_PORTE_IRQHandler:
 333                     ; 156 }
 336  0009 80            	iret
 358                     ; 202 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 358                     ; 203 {
 359                     	switch	.text
 360  000a               f_SPI_IRQHandler:
 365                     ; 207 }
 368  000a 80            	iret
 391                     ; 214 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 391                     ; 215 {
 392                     	switch	.text
 393  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 398                     ; 219 }
 401  000b 80            	iret
 424                     ; 226 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 424                     ; 227 {
 425                     	switch	.text
 426  000c               f_TIM1_CAP_COM_IRQHandler:
 431                     ; 231 }
 434  000c 80            	iret
 457                     ; 263  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 457                     ; 264 {
 458                     	switch	.text
 459  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 464                     ; 268 }
 467  000d 80            	iret
 490                     ; 275  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 490                     ; 276 {
 491                     	switch	.text
 492  000e               f_TIM2_CAP_COM_IRQHandler:
 497                     ; 280 }
 500  000e 80            	iret
 523                     ; 317  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 523                     ; 318 {
 524                     	switch	.text
 525  000f               f_UART1_TX_IRQHandler:
 530                     ; 322 }
 533  000f 80            	iret
 556                     ; 329  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 556                     ; 330 {
 557                     	switch	.text
 558  0010               f_UART1_RX_IRQHandler:
 563                     ; 334 }
 566  0010 80            	iret
 588                     ; 342 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 588                     ; 343 {
 589                     	switch	.text
 590  0011               f_I2C_IRQHandler:
 595                     ; 347 }
 598  0011 80            	iret
 620                     ; 422  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 620                     ; 423 {
 621                     	switch	.text
 622  0012               f_ADC1_IRQHandler:
 627                     ; 428     return;
 630  0012 80            	iret
 653                     ; 451  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 653                     ; 452 {
 654                     	switch	.text
 655  0013               f_TIM4_UPD_OVF_IRQHandler:
 660                     ; 456 }
 663  0013 80            	iret
 686                     ; 464 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 686                     ; 465 {
 687                     	switch	.text
 688  0014               f_EEPROM_EEC_IRQHandler:
 693                     ; 469 }
 696  0014 80            	iret
 708                     	xdef	f_EEPROM_EEC_IRQHandler
 709                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 710                     	xdef	f_ADC1_IRQHandler
 711                     	xdef	f_I2C_IRQHandler
 712                     	xdef	f_UART1_RX_IRQHandler
 713                     	xdef	f_UART1_TX_IRQHandler
 714                     	xdef	f_TIM2_CAP_COM_IRQHandler
 715                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 716                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 717                     	xdef	f_TIM1_CAP_COM_IRQHandler
 718                     	xdef	f_SPI_IRQHandler
 719                     	xdef	f_EXTI_PORTE_IRQHandler
 720                     	xdef	f_EXTI_PORTD_IRQHandler
 721                     	xdef	f_EXTI_PORTC_IRQHandler
 722                     	xdef	f_EXTI_PORTB_IRQHandler
 723                     	xdef	f_EXTI_PORTA_IRQHandler
 724                     	xdef	f_CLK_IRQHandler
 725                     	xdef	f_AWU_IRQHandler
 726                     	xdef	f_TLI_IRQHandler
 727                     	xdef	f_TRAP_IRQHandler
 728                     	xdef	f_NonHandledInterrupt
 747                     	end
