   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  33                     ; 47 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  33                     ; 48 {
  34                     	switch	.text
  35  0000               f_NonHandledInterrupt:
  40                     ; 52 }
  43  0000 80            	iret
  65                     ; 60 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  65                     ; 61 {
  66                     	switch	.text
  67  0001               f_TRAP_IRQHandler:
  72                     ; 65 }
  75  0001 80            	iret
  97                     ; 72 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  97                     ; 73 
  97                     ; 74 {
  98                     	switch	.text
  99  0002               f_TLI_IRQHandler:
 104                     ; 78 }
 107  0002 80            	iret
 129                     ; 85 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 129                     ; 86 {
 130                     	switch	.text
 131  0003               f_AWU_IRQHandler:
 136                     ; 90 }
 139  0003 80            	iret
 161                     ; 97 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 161                     ; 98 {
 162                     	switch	.text
 163  0004               f_CLK_IRQHandler:
 168                     ; 102 }
 171  0004 80            	iret
 194                     ; 109 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 194                     ; 110 {
 195                     	switch	.text
 196  0005               f_EXTI_PORTA_IRQHandler:
 201                     ; 114 }
 204  0005 80            	iret
 227                     ; 121 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 227                     ; 122 {
 228                     	switch	.text
 229  0006               f_EXTI_PORTB_IRQHandler:
 234                     ; 126 }
 237  0006 80            	iret
 260                     ; 133 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 260                     ; 134 {
 261                     	switch	.text
 262  0007               f_EXTI_PORTC_IRQHandler:
 267                     ; 138 }
 270  0007 80            	iret
 293                     ; 145 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 293                     ; 146 {
 294                     	switch	.text
 295  0008               f_EXTI_PORTD_IRQHandler:
 300                     ; 150 }
 303  0008 80            	iret
 326                     ; 157 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 326                     ; 158 {
 327                     	switch	.text
 328  0009               f_EXTI_PORTE_IRQHandler:
 333                     ; 162 }
 336  0009 80            	iret
 358                     ; 209 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 358                     ; 210 {
 359                     	switch	.text
 360  000a               f_SPI_IRQHandler:
 365                     ; 214 }
 368  000a 80            	iret
 391                     ; 221 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 391                     ; 222 {
 392                     	switch	.text
 393  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 398                     ; 226 }
 401  000b 80            	iret
 424                     ; 233 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 424                     ; 234 {
 425                     	switch	.text
 426  000c               f_TIM1_CAP_COM_IRQHandler:
 431                     ; 238 }
 434  000c 80            	iret
 457                     ; 271  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 457                     ; 272  {
 458                     	switch	.text
 459  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 464                     ; 276  }
 467  000d 80            	iret
 490                     ; 283  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 490                     ; 284  {
 491                     	switch	.text
 492  000e               f_TIM2_CAP_COM_IRQHandler:
 497                     ; 288  }
 500  000e 80            	iret
 523                     ; 325  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 523                     ; 326  {
 524                     	switch	.text
 525  000f               f_UART1_TX_IRQHandler:
 530                     ; 330  }
 533  000f 80            	iret
 559                     ; 337  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 559                     ; 338  {
 560                     	switch	.text
 561  0010               f_UART1_RX_IRQHandler:
 564  0010 3b0002        	push	c_x+2
 565  0013 be00          	ldw	x,c_x
 566  0015 89            	pushw	x
 567  0016 3b0002        	push	c_y+2
 568  0019 be00          	ldw	x,c_y
 569  001b 89            	pushw	x
 572                     ; 342 		UART1_ClearITPendingBit(UART1_IT_RXNE);
 574  001c ae0255        	ldw	x,#597
 575  001f cd0000        	call	_UART1_ClearITPendingBit
 577                     ; 343 		UART1_SendData8(UART1_ReceiveData8());
 579  0022 cd0000        	call	_UART1_ReceiveData8
 581  0025 cd0000        	call	_UART1_SendData8
 583                     ; 344  }
 586  0028 85            	popw	x
 587  0029 bf00          	ldw	c_y,x
 588  002b 320002        	pop	c_y+2
 589  002e 85            	popw	x
 590  002f bf00          	ldw	c_x,x
 591  0031 320002        	pop	c_x+2
 592  0034 80            	iret
 614                     ; 352 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 614                     ; 353 {
 615                     	switch	.text
 616  0035               f_I2C_IRQHandler:
 621                     ; 357 }
 624  0035 80            	iret
 646                     ; 431  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 646                     ; 432  {
 647                     	switch	.text
 648  0036               f_ADC1_IRQHandler:
 653                     ; 436  }
 656  0036 80            	iret
 679                     ; 457  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 679                     ; 458  {
 680                     	switch	.text
 681  0037               f_TIM4_UPD_OVF_IRQHandler:
 686                     ; 462  }
 689  0037 80            	iret
 712                     ; 470 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 712                     ; 471 {
 713                     	switch	.text
 714  0038               f_EEPROM_EEC_IRQHandler:
 719                     ; 475 }
 722  0038 80            	iret
 734                     	xdef	f_EEPROM_EEC_IRQHandler
 735                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 736                     	xdef	f_ADC1_IRQHandler
 737                     	xdef	f_I2C_IRQHandler
 738                     	xdef	f_UART1_RX_IRQHandler
 739                     	xdef	f_UART1_TX_IRQHandler
 740                     	xdef	f_TIM2_CAP_COM_IRQHandler
 741                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 742                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 743                     	xdef	f_TIM1_CAP_COM_IRQHandler
 744                     	xdef	f_SPI_IRQHandler
 745                     	xdef	f_EXTI_PORTE_IRQHandler
 746                     	xdef	f_EXTI_PORTD_IRQHandler
 747                     	xdef	f_EXTI_PORTC_IRQHandler
 748                     	xdef	f_EXTI_PORTB_IRQHandler
 749                     	xdef	f_EXTI_PORTA_IRQHandler
 750                     	xdef	f_CLK_IRQHandler
 751                     	xdef	f_AWU_IRQHandler
 752                     	xdef	f_TLI_IRQHandler
 753                     	xdef	f_TRAP_IRQHandler
 754                     	xdef	f_NonHandledInterrupt
 755                     	xref	_UART1_ClearITPendingBit
 756                     	xref	_UART1_SendData8
 757                     	xref	_UART1_ReceiveData8
 758                     	xref.b	c_x
 759                     	xref.b	c_y
 778                     	end
