   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 48 void BEEP_DeInit(void)
  33                     ; 49 {
  35                     .text:	section	.text,new
  36  0000               _BEEP_DeInit:
  40                     ; 50     BEEP->CSR = BEEP_CSR_RESET_VALUE;
  42  0000 351f50f3      	mov	20723,#31
  43                     ; 51 }
  46  0004 81            	ret	
 112                     ; 61 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 112                     ; 62 {
 113                     .text:	section	.text,new
 114  0000               _BEEP_Init:
 116  0000 88            	push	a
 117       00000000      OFST:	set	0
 120                     ; 65     assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 122  0001 4d            	tnz	a
 123  0002 2716          	jreq	L41
 124  0004 a140          	cp	a,#64
 125  0006 2712          	jreq	L41
 126  0008 a180          	cp	a,#128
 127  000a 270e          	jreq	L41
 128  000c ae0041        	ldw	x,#65
 129  000f 89            	pushw	x
 130  0010 5f            	clrw	x
 131  0011 89            	pushw	x
 132  0012 ae000c        	ldw	x,#L15
 133  0015 cd0000        	call	_assert_failed
 135  0018 5b04          	addw	sp,#4
 136  001a               L41:
 137                     ; 68     if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 139  001a c650f3        	ld	a,20723
 140  001d a41f          	and	a,#31
 141  001f a11f          	cp	a,#31
 142  0021 2610          	jrne	L35
 143                     ; 70         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 145  0023 c650f3        	ld	a,20723
 146  0026 a4e0          	and	a,#224
 147  0028 c750f3        	ld	20723,a
 148                     ; 71         BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 150  002b c650f3        	ld	a,20723
 151  002e aa0b          	or	a,#11
 152  0030 c750f3        	ld	20723,a
 153  0033               L35:
 154                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 156  0033 c650f3        	ld	a,20723
 157  0036 a43f          	and	a,#63
 158  0038 c750f3        	ld	20723,a
 159                     ; 76     BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 161  003b c650f3        	ld	a,20723
 162  003e 1a01          	or	a,(OFST+1,sp)
 163  0040 c750f3        	ld	20723,a
 164                     ; 78 }
 167  0043 84            	pop	a
 168  0044 81            	ret	
 223                     ; 87 void BEEP_Cmd(FunctionalState NewState)
 223                     ; 88 {
 224                     .text:	section	.text,new
 225  0000               _BEEP_Cmd:
 229                     ; 89     if (NewState != DISABLE)
 231  0000 4d            	tnz	a
 232  0001 2705          	jreq	L301
 233                     ; 92         BEEP->CSR |= BEEP_CSR_BEEPEN;
 235  0003 721a50f3      	bset	20723,#5
 238  0007 81            	ret	
 239  0008               L301:
 240                     ; 97         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 242  0008 721b50f3      	bres	20723,#5
 243                     ; 99 }
 246  000c 81            	ret	
 294                     .const:	section	.text
 295  0000               L62:
 296  0000 0001adb0      	dc.l	110000
 297  0004               L03:
 298  0004 000249f1      	dc.l	150001
 299  0008               L63:
 300  0008 000003e8      	dc.l	1000
 301                     ; 114 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 301                     ; 115 {
 302                     .text:	section	.text,new
 303  0000               _BEEP_LSICalibrationConfig:
 305  0000 5206          	subw	sp,#6
 306       00000006      OFST:	set	6
 309                     ; 121     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 311  0002 96            	ldw	x,sp
 312  0003 1c0009        	addw	x,#OFST+3
 313  0006 cd0000        	call	c_ltor
 315  0009 ae0000        	ldw	x,#L62
 316  000c cd0000        	call	c_lcmp
 318  000f 250f          	jrult	L42
 319  0011 96            	ldw	x,sp
 320  0012 1c0009        	addw	x,#OFST+3
 321  0015 cd0000        	call	c_ltor
 323  0018 ae0004        	ldw	x,#L03
 324  001b cd0000        	call	c_lcmp
 326  001e 250e          	jrult	L23
 327  0020               L42:
 328  0020 ae0079        	ldw	x,#121
 329  0023 89            	pushw	x
 330  0024 5f            	clrw	x
 331  0025 89            	pushw	x
 332  0026 ae000c        	ldw	x,#L15
 333  0029 cd0000        	call	_assert_failed
 335  002c 5b04          	addw	sp,#4
 336  002e               L23:
 337                     ; 123     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 339  002e 96            	ldw	x,sp
 340  002f 1c0009        	addw	x,#OFST+3
 341  0032 cd0000        	call	c_ltor
 343  0035 ae0008        	ldw	x,#L63
 344  0038 cd0000        	call	c_ludv
 346  003b be02          	ldw	x,c_lreg+2
 347  003d 1f03          	ldw	(OFST-3,sp),x
 348                     ; 127     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 350  003f c650f3        	ld	a,20723
 351  0042 a4e0          	and	a,#224
 352  0044 c750f3        	ld	20723,a
 353                     ; 129     A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 355  0047 54            	srlw	x
 356  0048 54            	srlw	x
 357  0049 54            	srlw	x
 358  004a 1f05          	ldw	(OFST-1,sp),x
 359                     ; 131     if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 361  004c 58            	sllw	x
 362  004d 58            	sllw	x
 363  004e 58            	sllw	x
 364  004f 1f01          	ldw	(OFST-5,sp),x
 365  0051 1e03          	ldw	x,(OFST-3,sp)
 366  0053 72f001        	subw	x,(OFST-5,sp)
 367  0056 1605          	ldw	y,(OFST-1,sp)
 368  0058 9058          	sllw	y
 369  005a 905c          	incw	y
 370  005c cd0000        	call	c_imul
 372  005f 1605          	ldw	y,(OFST-1,sp)
 373  0061 9058          	sllw	y
 374  0063 9058          	sllw	y
 375  0065 9058          	sllw	y
 376  0067 bf01          	ldw	c_x+1,x
 377  0069 90b301        	cpw	y,c_x+1
 378  006c 7b06          	ld	a,(OFST+0,sp)
 379  006e 2504          	jrult	L721
 380                     ; 133         BEEP->CSR |= (uint8_t)(A - 2U);
 382  0070 a002          	sub	a,#2
 384  0072 2001          	jra	L131
 385  0074               L721:
 386                     ; 137         BEEP->CSR |= (uint8_t)(A - 1U);
 388  0074 4a            	dec	a
 389  0075               L131:
 390  0075 ca50f3        	or	a,20723
 391  0078 c750f3        	ld	20723,a
 392                     ; 139 }
 395  007b 5b06          	addw	sp,#6
 396  007d 81            	ret	
 409                     	xdef	_BEEP_LSICalibrationConfig
 410                     	xdef	_BEEP_Cmd
 411                     	xdef	_BEEP_Init
 412                     	xdef	_BEEP_DeInit
 413                     	xref	_assert_failed
 414                     	switch	.const
 415  000c               L15:
 416  000c 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 417  001e 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 418  0030 685f64726976  	dc.b	"h_driver\src\stm8s"
 419  0042 5f626565702e  	dc.b	"_beep.c",0
 420                     	xref.b	c_lreg
 421                     	xref.b	c_x
 441                     	xref	c_imul
 442                     	xref	c_ludv
 443                     	xref	c_lcmp
 444                     	xref	c_ltor
 445                     	end
