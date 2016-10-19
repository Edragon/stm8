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
 588                     ; 350 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 588                     ; 351 {
 589                     	switch	.text
 590  0011               f_I2C_IRQHandler:
 595                     ; 355 }
 598  0011 80            	iret
 621                     ; 363  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 621                     ; 364  {
 622                     	switch	.text
 623  0012               f_UART2_TX_IRQHandler:
 628                     ; 368  }
 631  0012 80            	iret
 654                     ; 375  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 654                     ; 376  {
 655                     	switch	.text
 656  0013               f_UART2_RX_IRQHandler:
 661                     ; 380  }
 664  0013 80            	iret
 686                     ; 429  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 686                     ; 430  {
 687                     	switch	.text
 688  0014               f_ADC1_IRQHandler:
 693                     ; 434  }
 696  0014 80            	iret
 722                     ; 455  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 722                     ; 456  {
 723                     	switch	.text
 724  0015               f_TIM4_UPD_OVF_IRQHandler:
 727  0015 3b0002        	push	c_x+2
 728  0018 be00          	ldw	x,c_x
 729  001a 89            	pushw	x
 730  001b 3b0002        	push	c_y+2
 731  001e be00          	ldw	x,c_y
 732  0020 89            	pushw	x
 735                     ; 460 	i++;
 737  0021 3c00          	inc	_i
 738                     ; 461 	if(i==61)
 740  0023 b600          	ld	a,_i
 741  0025 a13d          	cp	a,#61
 742  0027 260b          	jrne	L172
 743                     ; 463 	    GPIO_WriteReverse(GPIOE, GPIO_PIN_5);
 745  0029 4b20          	push	#32
 746  002b ae5014        	ldw	x,#20500
 747  002e cd0000        	call	_GPIO_WriteReverse
 749  0031 84            	pop	a
 750                     ; 464 			i=0;
 752  0032 3f00          	clr	_i
 753  0034               L172:
 754                     ; 466 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 756  0034 a601          	ld	a,#1
 757  0036 cd0000        	call	_TIM4_ClearITPendingBit
 759                     ; 467  }
 762  0039 85            	popw	x
 763  003a bf00          	ldw	c_y,x
 764  003c 320002        	pop	c_y+2
 765  003f 85            	popw	x
 766  0040 bf00          	ldw	c_x,x
 767  0042 320002        	pop	c_x+2
 768  0045 80            	iret
 791                     ; 475 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 791                     ; 476 {
 792                     	switch	.text
 793  0046               f_EEPROM_EEC_IRQHandler:
 798                     ; 480 }
 801  0046 80            	iret
 813                     	xref.b	_i
 814                     	xdef	f_EEPROM_EEC_IRQHandler
 815                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 816                     	xdef	f_ADC1_IRQHandler
 817                     	xdef	f_UART2_TX_IRQHandler
 818                     	xdef	f_UART2_RX_IRQHandler
 819                     	xdef	f_I2C_IRQHandler
 820                     	xdef	f_TIM3_CAP_COM_IRQHandler
 821                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 822                     	xdef	f_TIM2_CAP_COM_IRQHandler
 823                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 824                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 825                     	xdef	f_TIM1_CAP_COM_IRQHandler
 826                     	xdef	f_SPI_IRQHandler
 827                     	xdef	f_EXTI_PORTE_IRQHandler
 828                     	xdef	f_EXTI_PORTD_IRQHandler
 829                     	xdef	f_EXTI_PORTC_IRQHandler
 830                     	xdef	f_EXTI_PORTB_IRQHandler
 831                     	xdef	f_EXTI_PORTA_IRQHandler
 832                     	xdef	f_CLK_IRQHandler
 833                     	xdef	f_AWU_IRQHandler
 834                     	xdef	f_TLI_IRQHandler
 835                     	xdef	f_TRAP_IRQHandler
 836                     	xdef	f_NonHandledInterrupt
 837                     	xref	_TIM4_ClearITPendingBit
 838                     	xref	_GPIO_WriteReverse
 839                     	xref.b	c_x
 840                     	xref.b	c_y
 859                     	end
