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
 523                     ; 298  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 523                     ; 299  {
 524                     	switch	.text
 525  000f               f_TIM3_UPD_OVF_BRK_IRQHandler:
 530                     ; 303  }
 533  000f 80            	iret
 556                     ; 310  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 556                     ; 311  {
 557                     	switch	.text
 558  0010               f_TIM3_CAP_COM_IRQHandler:
 563                     ; 315  }
 566  0010 80            	iret
 588                     ; 351 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 588                     ; 352 {
 589                     	switch	.text
 590  0011               f_I2C_IRQHandler:
 595                     ; 356 }
 598  0011 80            	iret
 621                     ; 364  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 621                     ; 365  {
 622                     	switch	.text
 623  0012               f_UART2_TX_IRQHandler:
 628                     ; 369  }
 631  0012 80            	iret
 657                     ; 376  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 657                     ; 377  {
 658                     	switch	.text
 659  0013               f_UART2_RX_IRQHandler:
 662  0013 3b0002        	push	c_x+2
 663  0016 be00          	ldw	x,c_x
 664  0018 89            	pushw	x
 665  0019 3b0002        	push	c_y+2
 666  001c be00          	ldw	x,c_y
 667  001e 89            	pushw	x
 670                     ; 381 		UART2_ClearITPendingBit(UART2_IT_RXNE);
 672  001f ae0255        	ldw	x,#597
 673  0022 cd0000        	call	_UART2_ClearITPendingBit
 675                     ; 382 		UART2_SendData8(UART2_ReceiveData8());
 677  0025 cd0000        	call	_UART2_ReceiveData8
 679  0028 cd0000        	call	_UART2_SendData8
 681                     ; 383  }
 684  002b 85            	popw	x
 685  002c bf00          	ldw	c_y,x
 686  002e 320002        	pop	c_y+2
 687  0031 85            	popw	x
 688  0032 bf00          	ldw	c_x,x
 689  0034 320002        	pop	c_x+2
 690  0037 80            	iret
 712                     ; 432  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 712                     ; 433  {
 713                     	switch	.text
 714  0038               f_ADC1_IRQHandler:
 719                     ; 437  }
 722  0038 80            	iret
 745                     ; 458  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 745                     ; 459  {
 746                     	switch	.text
 747  0039               f_TIM4_UPD_OVF_IRQHandler:
 752                     ; 463  }
 755  0039 80            	iret
 778                     ; 471 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 778                     ; 472 {
 779                     	switch	.text
 780  003a               f_EEPROM_EEC_IRQHandler:
 785                     ; 476 }
 788  003a 80            	iret
 800                     	xdef	f_EEPROM_EEC_IRQHandler
 801                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 802                     	xdef	f_ADC1_IRQHandler
 803                     	xdef	f_UART2_TX_IRQHandler
 804                     	xdef	f_UART2_RX_IRQHandler
 805                     	xdef	f_I2C_IRQHandler
 806                     	xdef	f_TIM3_CAP_COM_IRQHandler
 807                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 808                     	xdef	f_TIM2_CAP_COM_IRQHandler
 809                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 810                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 811                     	xdef	f_TIM1_CAP_COM_IRQHandler
 812                     	xdef	f_SPI_IRQHandler
 813                     	xdef	f_EXTI_PORTE_IRQHandler
 814                     	xdef	f_EXTI_PORTD_IRQHandler
 815                     	xdef	f_EXTI_PORTC_IRQHandler
 816                     	xdef	f_EXTI_PORTB_IRQHandler
 817                     	xdef	f_EXTI_PORTA_IRQHandler
 818                     	xdef	f_CLK_IRQHandler
 819                     	xdef	f_AWU_IRQHandler
 820                     	xdef	f_TLI_IRQHandler
 821                     	xdef	f_TRAP_IRQHandler
 822                     	xdef	f_NonHandledInterrupt
 823                     	xref	_UART2_ClearITPendingBit
 824                     	xref	_UART2_SendData8
 825                     	xref	_UART2_ReceiveData8
 826                     	xref.b	c_x
 827                     	xref.b	c_y
 846                     	end
