   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     .const:	section	.text
   6  0000               _APR_Array:
   7  0000 00            	dc.b	0
   8  0001 1e            	dc.b	30
   9  0002 1e            	dc.b	30
  10  0003 1e            	dc.b	30
  11  0004 1e            	dc.b	30
  12  0005 1e            	dc.b	30
  13  0006 1e            	dc.b	30
  14  0007 1e            	dc.b	30
  15  0008 1e            	dc.b	30
  16  0009 1e            	dc.b	30
  17  000a 1e            	dc.b	30
  18  000b 1e            	dc.b	30
  19  000c 1e            	dc.b	30
  20  000d 3d            	dc.b	61
  21  000e 17            	dc.b	23
  22  000f 17            	dc.b	23
  23  0010 3e            	dc.b	62
  24  0011               _TBR_Array:
  25  0011 00            	dc.b	0
  26  0012 01            	dc.b	1
  27  0013 02            	dc.b	2
  28  0014 03            	dc.b	3
  29  0015 04            	dc.b	4
  30  0016 05            	dc.b	5
  31  0017 06            	dc.b	6
  32  0018 07            	dc.b	7
  33  0019 08            	dc.b	8
  34  001a 09            	dc.b	9
  35  001b 0a            	dc.b	10
  36  001c 0b            	dc.b	11
  37  001d 0c            	dc.b	12
  38  001e 0c            	dc.b	12
  39  001f 0e            	dc.b	14
  40  0020 0f            	dc.b	15
  41  0021 0f            	dc.b	15
  70                     ; 67 void AWU_DeInit(void)
  70                     ; 68 {
  72                     .text:	section	.text,new
  73  0000               _AWU_DeInit:
  77                     ; 69     AWU->CSR = AWU_CSR_RESET_VALUE;
  79  0000 725f50f0      	clr	20720
  80                     ; 70     AWU->APR = AWU_APR_RESET_VALUE;
  82  0004 353f50f1      	mov	20721,#63
  83                     ; 71     AWU->TBR = AWU_TBR_RESET_VALUE;
  85  0008 725f50f2      	clr	20722
  86                     ; 72 }
  89  000c 81            	ret	
 252                     ; 82 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 252                     ; 83 {
 253                     .text:	section	.text,new
 254  0000               _AWU_Init:
 256  0000 88            	push	a
 257       00000000      OFST:	set	0
 260                     ; 86     assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 262  0001 4d            	tnz	a
 263  0002 274e          	jreq	L41
 264  0004 a101          	cp	a,#1
 265  0006 274a          	jreq	L41
 266  0008 a102          	cp	a,#2
 267  000a 2746          	jreq	L41
 268  000c a103          	cp	a,#3
 269  000e 2742          	jreq	L41
 270  0010 a104          	cp	a,#4
 271  0012 273e          	jreq	L41
 272  0014 a105          	cp	a,#5
 273  0016 273a          	jreq	L41
 274  0018 a106          	cp	a,#6
 275  001a 2736          	jreq	L41
 276  001c a107          	cp	a,#7
 277  001e 2732          	jreq	L41
 278  0020 a108          	cp	a,#8
 279  0022 272e          	jreq	L41
 280  0024 a109          	cp	a,#9
 281  0026 272a          	jreq	L41
 282  0028 a10a          	cp	a,#10
 283  002a 2726          	jreq	L41
 284  002c a10b          	cp	a,#11
 285  002e 2722          	jreq	L41
 286  0030 a10c          	cp	a,#12
 287  0032 271e          	jreq	L41
 288  0034 a10d          	cp	a,#13
 289  0036 271a          	jreq	L41
 290  0038 a10e          	cp	a,#14
 291  003a 2716          	jreq	L41
 292  003c a10f          	cp	a,#15
 293  003e 2712          	jreq	L41
 294  0040 a110          	cp	a,#16
 295  0042 270e          	jreq	L41
 296  0044 ae0056        	ldw	x,#86
 297  0047 89            	pushw	x
 298  0048 5f            	clrw	x
 299  0049 89            	pushw	x
 300  004a ae002e        	ldw	x,#L501
 301  004d cd0000        	call	_assert_failed
 303  0050 5b04          	addw	sp,#4
 304  0052               L41:
 305                     ; 89     AWU->CSR |= AWU_CSR_AWUEN;
 307  0052 721850f0      	bset	20720,#4
 308                     ; 92     AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 310  0056 c650f2        	ld	a,20722
 311  0059 a4f0          	and	a,#240
 312  005b c750f2        	ld	20722,a
 313                     ; 93     AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 315  005e 7b01          	ld	a,(OFST+1,sp)
 316  0060 5f            	clrw	x
 317  0061 97            	ld	xl,a
 318  0062 c650f2        	ld	a,20722
 319  0065 da0011        	or	a,(_TBR_Array,x)
 320  0068 c750f2        	ld	20722,a
 321                     ; 96     AWU->APR &= (uint8_t)(~AWU_APR_APR);
 323  006b c650f1        	ld	a,20721
 324  006e a4c0          	and	a,#192
 325  0070 c750f1        	ld	20721,a
 326                     ; 97     AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 328  0073 7b01          	ld	a,(OFST+1,sp)
 329  0075 5f            	clrw	x
 330  0076 97            	ld	xl,a
 331  0077 c650f1        	ld	a,20721
 332  007a da0000        	or	a,(_APR_Array,x)
 333  007d c750f1        	ld	20721,a
 334                     ; 99 }
 337  0080 84            	pop	a
 338  0081 81            	ret	
 393                     ; 108 void AWU_Cmd(FunctionalState NewState)
 393                     ; 109 {
 394                     .text:	section	.text,new
 395  0000               _AWU_Cmd:
 399                     ; 110     if (NewState != DISABLE)
 401  0000 4d            	tnz	a
 402  0001 2705          	jreq	L531
 403                     ; 113         AWU->CSR |= AWU_CSR_AWUEN;
 405  0003 721850f0      	bset	20720,#4
 408  0007 81            	ret	
 409  0008               L531:
 410                     ; 118         AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 412  0008 721950f0      	bres	20720,#4
 413                     ; 120 }
 416  000c 81            	ret	
 464                     	switch	.const
 465  0022               L62:
 466  0022 0001adb0      	dc.l	110000
 467  0026               L03:
 468  0026 000249f1      	dc.l	150001
 469  002a               L63:
 470  002a 000003e8      	dc.l	1000
 471                     ; 135 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 471                     ; 136 {
 472                     .text:	section	.text,new
 473  0000               _AWU_LSICalibrationConfig:
 475  0000 5206          	subw	sp,#6
 476       00000006      OFST:	set	6
 479                     ; 138     uint16_t lsifreqkhz = 0x0;
 481                     ; 139     uint16_t A = 0x0;
 483                     ; 142     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 485  0002 96            	ldw	x,sp
 486  0003 1c0009        	addw	x,#OFST+3
 487  0006 cd0000        	call	c_ltor
 489  0009 ae0022        	ldw	x,#L62
 490  000c cd0000        	call	c_lcmp
 492  000f 250f          	jrult	L42
 493  0011 96            	ldw	x,sp
 494  0012 1c0009        	addw	x,#OFST+3
 495  0015 cd0000        	call	c_ltor
 497  0018 ae0026        	ldw	x,#L03
 498  001b cd0000        	call	c_lcmp
 500  001e 250e          	jrult	L23
 501  0020               L42:
 502  0020 ae008e        	ldw	x,#142
 503  0023 89            	pushw	x
 504  0024 5f            	clrw	x
 505  0025 89            	pushw	x
 506  0026 ae002e        	ldw	x,#L501
 507  0029 cd0000        	call	_assert_failed
 509  002c 5b04          	addw	sp,#4
 510  002e               L23:
 511                     ; 144     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 513  002e 96            	ldw	x,sp
 514  002f 1c0009        	addw	x,#OFST+3
 515  0032 cd0000        	call	c_ltor
 517  0035 ae002a        	ldw	x,#L63
 518  0038 cd0000        	call	c_ludv
 520  003b be02          	ldw	x,c_lreg+2
 521  003d 1f03          	ldw	(OFST-3,sp),x
 522                     ; 148     A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 524  003f 54            	srlw	x
 525  0040 54            	srlw	x
 526  0041 1f05          	ldw	(OFST-1,sp),x
 527                     ; 150     if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 529  0043 58            	sllw	x
 530  0044 58            	sllw	x
 531  0045 1f01          	ldw	(OFST-5,sp),x
 532  0047 1e03          	ldw	x,(OFST-3,sp)
 533  0049 72f001        	subw	x,(OFST-5,sp)
 534  004c 1605          	ldw	y,(OFST-1,sp)
 535  004e 9058          	sllw	y
 536  0050 905c          	incw	y
 537  0052 cd0000        	call	c_imul
 539  0055 1605          	ldw	y,(OFST-1,sp)
 540  0057 9058          	sllw	y
 541  0059 9058          	sllw	y
 542  005b bf01          	ldw	c_x+1,x
 543  005d 90b301        	cpw	y,c_x+1
 544  0060 7b06          	ld	a,(OFST+0,sp)
 545  0062 2504          	jrult	L161
 546                     ; 152         AWU->APR = (uint8_t)(A - 2U);
 548  0064 a002          	sub	a,#2
 550  0066 2001          	jra	L361
 551  0068               L161:
 552                     ; 156         AWU->APR = (uint8_t)(A - 1U);
 554  0068 4a            	dec	a
 555  0069               L361:
 556  0069 c750f1        	ld	20721,a
 557                     ; 158 }
 560  006c 5b06          	addw	sp,#6
 561  006e 81            	ret	
 584                     ; 165 void AWU_IdleModeEnable(void)
 584                     ; 166 {
 585                     .text:	section	.text,new
 586  0000               _AWU_IdleModeEnable:
 590                     ; 168     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 592  0000 721950f0      	bres	20720,#4
 593                     ; 171     AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 595  0004 35f050f2      	mov	20722,#240
 596                     ; 172 }
 599  0008 81            	ret	
 643                     ; 180 FlagStatus AWU_GetFlagStatus(void)
 643                     ; 181 {
 644                     .text:	section	.text,new
 645  0000               _AWU_GetFlagStatus:
 649                     ; 182     return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 651  0000 720a50f002    	btjt	20720,#5,L44
 652  0005 4f            	clr	a
 654  0006 81            	ret	
 655  0007               L44:
 656  0007 a601          	ld	a,#1
 659  0009 81            	ret	
 694                     	xdef	_TBR_Array
 695                     	xdef	_APR_Array
 696                     	xdef	_AWU_GetFlagStatus
 697                     	xdef	_AWU_IdleModeEnable
 698                     	xdef	_AWU_LSICalibrationConfig
 699                     	xdef	_AWU_Cmd
 700                     	xdef	_AWU_Init
 701                     	xdef	_AWU_DeInit
 702                     	xref	_assert_failed
 703                     	switch	.const
 704  002e               L501:
 705  002e 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 706  0040 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 707  0052 685f64726976  	dc.b	"h_driver\src\stm8s"
 708  0064 5f6177752e63  	dc.b	"_awu.c",0
 709                     	xref.b	c_lreg
 710                     	xref.b	c_x
 730                     	xref	c_imul
 731                     	xref	c_ludv
 732                     	xref	c_lcmp
 733                     	xref	c_ltor
 734                     	end
