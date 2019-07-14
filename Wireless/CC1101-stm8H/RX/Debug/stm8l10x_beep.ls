   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 92 void BEEP_DeInit(void)
  43                     ; 93 {
  45                     	switch	.text
  46  0000               _BEEP_DeInit:
  50                     ; 94   BEEP->CSR = BEEP_CSR_RESET_VALUE;
  52  0000 351f50f3      	mov	20723,#31
  53                     ; 95 }
  56  0004 81            	ret
 121                     ; 104 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 121                     ; 105 {
 122                     	switch	.text
 123  0005               _BEEP_Init:
 125  0005 88            	push	a
 126       00000000      OFST:	set	0
 129                     ; 108   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 131                     ; 111   if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 133  0006 c650f3        	ld	a,20723
 134  0009 a41f          	and	a,#31
 135  000b a11f          	cp	a,#31
 136  000d 260c          	jrne	L15
 137                     ; 113     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 139  000f c650f3        	ld	a,20723
 140  0012 a4e0          	and	a,#224
 141  0014 c750f3        	ld	20723,a
 142                     ; 114     BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 144  0017 721050f3      	bset	20723,#0
 145  001b               L15:
 146                     ; 118   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 148  001b c650f3        	ld	a,20723
 149  001e a43f          	and	a,#63
 150  0020 c750f3        	ld	20723,a
 151                     ; 119   BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 153  0023 c650f3        	ld	a,20723
 154  0026 1a01          	or	a,(OFST+1,sp)
 155  0028 c750f3        	ld	20723,a
 156                     ; 121 }
 159  002b 84            	pop	a
 160  002c 81            	ret
 215                     ; 129 void BEEP_Cmd(FunctionalState NewState)
 215                     ; 130 {
 216                     	switch	.text
 217  002d               _BEEP_Cmd:
 221                     ; 132   assert_param(IS_FUNCTIONAL_STATE(NewState));
 223                     ; 134   if (NewState != DISABLE)
 225  002d 4d            	tnz	a
 226  002e 2706          	jreq	L101
 227                     ; 137     BEEP->CSR |= BEEP_CSR_BEEPEN;
 229  0030 721a50f3      	bset	20723,#5
 231  0034 2004          	jra	L301
 232  0036               L101:
 233                     ; 142     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 235  0036 721b50f3      	bres	20723,#5
 236  003a               L301:
 237                     ; 144 }
 240  003a 81            	ret
 293                     .const:	section	.text
 294  0000               L41:
 295  0000 000003e8      	dc.l	1000
 296                     ; 185 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 296                     ; 186 {
 297                     	switch	.text
 298  003b               _BEEP_LSICalibrationConfig:
 300  003b 5206          	subw	sp,#6
 301       00000006      OFST:	set	6
 304                     ; 192   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 306                     ; 194   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 308  003d 96            	ldw	x,sp
 309  003e 1c0009        	addw	x,#OFST+3
 310  0041 cd0000        	call	c_ltor
 312  0044 ae0000        	ldw	x,#L41
 313  0047 cd0000        	call	c_ludv
 315  004a be02          	ldw	x,c_lreg+2
 316  004c 1f03          	ldw	(OFST-3,sp),x
 317                     ; 198   BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 319  004e c650f3        	ld	a,20723
 320  0051 a4e0          	and	a,#224
 321  0053 c750f3        	ld	20723,a
 322                     ; 200   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 324  0056 1e03          	ldw	x,(OFST-3,sp)
 325  0058 54            	srlw	x
 326  0059 54            	srlw	x
 327  005a 54            	srlw	x
 328  005b 1f05          	ldw	(OFST-1,sp),x
 329                     ; 202   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 331  005d 1e05          	ldw	x,(OFST-1,sp)
 332  005f 58            	sllw	x
 333  0060 58            	sllw	x
 334  0061 58            	sllw	x
 335  0062 1f01          	ldw	(OFST-5,sp),x
 336  0064 1e03          	ldw	x,(OFST-3,sp)
 337  0066 72f001        	subw	x,(OFST-5,sp)
 338  0069 1605          	ldw	y,(OFST-1,sp)
 339  006b 9058          	sllw	y
 340  006d 905c          	incw	y
 341  006f cd0000        	call	c_imul
 343  0072 1605          	ldw	y,(OFST-1,sp)
 344  0074 9058          	sllw	y
 345  0076 9058          	sllw	y
 346  0078 9058          	sllw	y
 347  007a bf00          	ldw	c_x,x
 348  007c 90b300        	cpw	y,c_x
 349  007f 250c          	jrult	L331
 350                     ; 204     BEEP->CSR |= (uint8_t)(A - 2U);
 352  0081 7b06          	ld	a,(OFST+0,sp)
 353  0083 a002          	sub	a,#2
 354  0085 ca50f3        	or	a,20723
 355  0088 c750f3        	ld	20723,a
 357  008b 2009          	jra	L531
 358  008d               L331:
 359                     ; 208     BEEP->CSR |= (uint8_t)(A - 1U);
 361  008d 7b06          	ld	a,(OFST+0,sp)
 362  008f 4a            	dec	a
 363  0090 ca50f3        	or	a,20723
 364  0093 c750f3        	ld	20723,a
 365  0096               L531:
 366                     ; 211 }
 369  0096 5b06          	addw	sp,#6
 370  0098 81            	ret
 383                     	xdef	_BEEP_LSICalibrationConfig
 384                     	xdef	_BEEP_Cmd
 385                     	xdef	_BEEP_Init
 386                     	xdef	_BEEP_DeInit
 387                     	xref.b	c_lreg
 388                     	xref.b	c_x
 407                     	xref	c_imul
 408                     	xref	c_ludv
 409                     	xref	c_ltor
 410                     	end
