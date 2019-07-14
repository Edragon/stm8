   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     .const:	section	.text
  16  0000               _HSIDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  49                     ; 68 void CLK_DeInit(void)
  49                     ; 69 {
  51                     	switch	.text
  52  0000               _CLK_DeInit:
  56                     ; 70   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  58  0000 350350c0      	mov	20672,#3
  59                     ; 71   CLK->PCKENR = CLK_PCKENR_RESET_VALUE;
  61  0004 725f50c3      	clr	20675
  62                     ; 72   CLK->CCOR  = CLK_CCOR_RESET_VALUE;
  64  0008 725f50c5      	clr	20677
  65                     ; 73 }
  68  000c 81            	ret
 123                     ; 80 void CLK_CCOCmd(FunctionalState NewState)
 123                     ; 81 {
 124                     	switch	.text
 125  000d               _CLK_CCOCmd:
 129                     ; 83   assert_param(IS_FUNCTIONAL_STATE(NewState));
 131                     ; 85   if (NewState != DISABLE)
 133  000d 4d            	tnz	a
 134  000e 2706          	jreq	L74
 135                     ; 88     CLK->CCOR |= CLK_CCOR_CCOEN;
 137  0010 721050c5      	bset	20677,#0
 139  0014 2004          	jra	L15
 140  0016               L74:
 141                     ; 93     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 143  0016 721150c5      	bres	20677,#0
 144  001a               L15:
 145                     ; 96 }
 148  001a 81            	ret
 253                     ; 113 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 253                     ; 114 {
 254                     	switch	.text
 255  001b               _CLK_PeripheralClockConfig:
 257  001b 89            	pushw	x
 258       00000000      OFST:	set	0
 261                     ; 116     assert_param(IS_FUNCTIONAL_STATE(NewState));
 263                     ; 117     assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
 265                     ; 119     if (NewState != DISABLE)
 267  001c 9f            	ld	a,xl
 268  001d 4d            	tnz	a
 269  001e 2709          	jreq	L711
 270                     ; 122       CLK->PCKENR |= ((uint8_t)CLK_Peripheral);
 272  0020 9e            	ld	a,xh
 273  0021 ca50c3        	or	a,20675
 274  0024 c750c3        	ld	20675,a
 276  0027 2009          	jra	L121
 277  0029               L711:
 278                     ; 127       CLK->PCKENR &= (uint8_t)(~(uint8_t)CLK_Peripheral);
 280  0029 7b01          	ld	a,(OFST+1,sp)
 281  002b 43            	cpl	a
 282  002c c450c3        	and	a,20675
 283  002f c750c3        	ld	20675,a
 284  0032               L121:
 285                     ; 129 }
 288  0032 85            	popw	x
 289  0033 81            	ret
 364                     ; 141 void CLK_MasterPrescalerConfig(CLK_MasterPrescaler_TypeDef CLK_MasterPrescaler)
 364                     ; 142 {
 365                     	switch	.text
 366  0034               _CLK_MasterPrescalerConfig:
 368  0034 88            	push	a
 369       00000000      OFST:	set	0
 372                     ; 144   assert_param(IS_CLK_MASTER_PRESCALER(CLK_MasterPrescaler));
 374                     ; 146   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
 376  0035 c650c0        	ld	a,20672
 377  0038 a4fc          	and	a,#252
 378  003a c750c0        	ld	20672,a
 379                     ; 147   CLK->CKDIVR = (uint8_t)CLK_MasterPrescaler;
 381  003d 7b01          	ld	a,(OFST+1,sp)
 382  003f c750c0        	ld	20672,a
 383                     ; 148 }
 386  0042 84            	pop	a
 387  0043 81            	ret
 460                     ; 161 void CLK_CCOConfig(CLK_Output_TypeDef CLK_Output)
 460                     ; 162 {
 461                     	switch	.text
 462  0044               _CLK_CCOConfig:
 464  0044 88            	push	a
 465       00000000      OFST:	set	0
 468                     ; 164   assert_param(IS_CLK_OUTPUT(CLK_Output));
 470                     ; 167   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
 472  0045 c650c5        	ld	a,20677
 473  0048 a4f9          	and	a,#249
 474  004a c750c5        	ld	20677,a
 475                     ; 170   CLK->CCOR |= ((uint8_t)CLK_Output);
 477  004d c650c5        	ld	a,20677
 478  0050 1a01          	or	a,(OFST+1,sp)
 479  0052 c750c5        	ld	20677,a
 480                     ; 173   CLK->CCOR |= CLK_CCOR_CCOEN;
 482  0055 721050c5      	bset	20677,#0
 483                     ; 174 }
 486  0059 84            	pop	a
 487  005a 81            	ret
 540                     ; 181 uint32_t CLK_GetClockFreq(void)
 540                     ; 182 {
 541                     	switch	.text
 542  005b               _CLK_GetClockFreq:
 544  005b 5209          	subw	sp,#9
 545       00000009      OFST:	set	9
 548                     ; 183   uint32_t clockfrequency = 0;
 550                     ; 184   uint8_t tmp = 0, presc = 0;
 554                     ; 186   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
 556  005d c650c0        	ld	a,20672
 557  0060 a403          	and	a,#3
 558  0062 6b09          	ld	(OFST+0,sp),a
 559                     ; 187   presc = HSIDivFactor[tmp];
 561  0064 7b09          	ld	a,(OFST+0,sp)
 562  0066 5f            	clrw	x
 563  0067 97            	ld	xl,a
 564  0068 d60000        	ld	a,(_HSIDivFactor,x)
 565  006b 6b09          	ld	(OFST+0,sp),a
 566                     ; 188   clockfrequency = HSI_VALUE / presc;
 568  006d 7b09          	ld	a,(OFST+0,sp)
 569  006f b703          	ld	c_lreg+3,a
 570  0071 3f02          	clr	c_lreg+2
 571  0073 3f01          	clr	c_lreg+1
 572  0075 3f00          	clr	c_lreg
 573  0077 96            	ldw	x,sp
 574  0078 1c0001        	addw	x,#OFST-8
 575  007b cd0000        	call	c_rtol
 577  007e ae2400        	ldw	x,#9216
 578  0081 bf02          	ldw	c_lreg+2,x
 579  0083 ae00f4        	ldw	x,#244
 580  0086 bf00          	ldw	c_lreg,x
 581  0088 96            	ldw	x,sp
 582  0089 1c0001        	addw	x,#OFST-8
 583  008c cd0000        	call	c_ludv
 585  008f 96            	ldw	x,sp
 586  0090 1c0005        	addw	x,#OFST-4
 587  0093 cd0000        	call	c_rtol
 589                     ; 190   return((uint32_t)clockfrequency);
 591  0096 96            	ldw	x,sp
 592  0097 1c0005        	addw	x,#OFST-4
 593  009a cd0000        	call	c_ltor
 597  009d 5b09          	addw	sp,#9
 598  009f 81            	ret
 623                     	xdef	_HSIDivFactor
 624                     	xdef	_CLK_GetClockFreq
 625                     	xdef	_CLK_CCOConfig
 626                     	xdef	_CLK_MasterPrescalerConfig
 627                     	xdef	_CLK_PeripheralClockConfig
 628                     	xdef	_CLK_CCOCmd
 629                     	xdef	_CLK_DeInit
 630                     	xref.b	c_lreg
 631                     	xref.b	c_x
 650                     	xref	c_ltor
 651                     	xref	c_ludv
 652                     	xref	c_rtol
 653                     	end
