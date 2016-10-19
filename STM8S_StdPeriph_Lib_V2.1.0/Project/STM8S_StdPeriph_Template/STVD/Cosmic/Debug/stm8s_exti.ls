   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 47 void EXTI_DeInit(void)
  33                     ; 48 {
  35                     .text:	section	.text,new
  36  0000               _EXTI_DeInit:
  40                     ; 49     EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  42  0000 725f50a0      	clr	20640
  43                     ; 50     EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  45  0004 725f50a1      	clr	20641
  46                     ; 51 }
  49  0008 81            	ret	
 175                     ; 64 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 175                     ; 65 {
 176                     .text:	section	.text,new
 177  0000               _EXTI_SetExtIntSensitivity:
 179  0000 89            	pushw	x
 180       00000000      OFST:	set	0
 183                     ; 68     assert_param(IS_EXTI_PORT_OK(Port));
 185  0001 9e            	ld	a,xh
 186  0002 4d            	tnz	a
 187  0003 2718          	jreq	L41
 188  0005 9e            	ld	a,xh
 189  0006 4a            	dec	a
 190  0007 2714          	jreq	L41
 191  0009 9e            	ld	a,xh
 192  000a a102          	cp	a,#2
 193  000c 270f          	jreq	L41
 194  000e 9e            	ld	a,xh
 195  000f a103          	cp	a,#3
 196  0011 270a          	jreq	L41
 197  0013 9e            	ld	a,xh
 198  0014 a104          	cp	a,#4
 199  0016 2705          	jreq	L41
 200  0018 ae0044        	ldw	x,#68
 201  001b ad7c          	call	LC004
 202  001d               L41:
 203                     ; 69     assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 205  001d 7b02          	ld	a,(OFST+2,sp)
 206  001f 2711          	jreq	L42
 207  0021 a101          	cp	a,#1
 208  0023 270d          	jreq	L42
 209  0025 a102          	cp	a,#2
 210  0027 2709          	jreq	L42
 211  0029 a103          	cp	a,#3
 212  002b 2705          	jreq	L42
 213  002d ae0045        	ldw	x,#69
 214  0030 ad67          	call	LC004
 215  0032               L42:
 216                     ; 72     switch (Port)
 218  0032 7b01          	ld	a,(OFST+1,sp)
 220                     ; 94     default:
 220                     ; 95         break;
 221  0034 270e          	jreq	L12
 222  0036 4a            	dec	a
 223  0037 271a          	jreq	L32
 224  0039 4a            	dec	a
 225  003a 2725          	jreq	L52
 226  003c 4a            	dec	a
 227  003d 2731          	jreq	L72
 228  003f 4a            	dec	a
 229  0040 2745          	jreq	L13
 230  0042 2053          	jra	L511
 231  0044               L12:
 232                     ; 74     case EXTI_PORT_GPIOA:
 232                     ; 75         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 234  0044 c650a0        	ld	a,20640
 235  0047 a4fc          	and	a,#252
 236  0049 c750a0        	ld	20640,a
 237                     ; 76         EXTI->CR1 |= (uint8_t)(SensitivityValue);
 239  004c c650a0        	ld	a,20640
 240  004f 1a02          	or	a,(OFST+2,sp)
 241                     ; 77         break;
 243  0051 202f          	jp	LC001
 244  0053               L32:
 245                     ; 78     case EXTI_PORT_GPIOB:
 245                     ; 79         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 247  0053 c650a0        	ld	a,20640
 248  0056 a4f3          	and	a,#243
 249  0058 c750a0        	ld	20640,a
 250                     ; 80         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 252  005b 7b02          	ld	a,(OFST+2,sp)
 253  005d 48            	sll	a
 254  005e 48            	sll	a
 255                     ; 81         break;
 257  005f 201e          	jp	LC002
 258  0061               L52:
 259                     ; 82     case EXTI_PORT_GPIOC:
 259                     ; 83         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 261  0061 c650a0        	ld	a,20640
 262  0064 a4cf          	and	a,#207
 263  0066 c750a0        	ld	20640,a
 264                     ; 84         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 266  0069 7b02          	ld	a,(OFST+2,sp)
 267  006b 97            	ld	xl,a
 268  006c a610          	ld	a,#16
 269                     ; 85         break;
 271  006e 200d          	jp	LC003
 272  0070               L72:
 273                     ; 86     case EXTI_PORT_GPIOD:
 273                     ; 87         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 275  0070 c650a0        	ld	a,20640
 276  0073 a43f          	and	a,#63
 277  0075 c750a0        	ld	20640,a
 278                     ; 88         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 280  0078 7b02          	ld	a,(OFST+2,sp)
 281  007a 97            	ld	xl,a
 282  007b a640          	ld	a,#64
 283  007d               LC003:
 284  007d 42            	mul	x,a
 285  007e 9f            	ld	a,xl
 286  007f               LC002:
 287  007f ca50a0        	or	a,20640
 288  0082               LC001:
 289  0082 c750a0        	ld	20640,a
 290                     ; 89         break;
 292  0085 2010          	jra	L511
 293  0087               L13:
 294                     ; 90     case EXTI_PORT_GPIOE:
 294                     ; 91         EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 296  0087 c650a1        	ld	a,20641
 297  008a a4fc          	and	a,#252
 298  008c c750a1        	ld	20641,a
 299                     ; 92         EXTI->CR2 |= (uint8_t)(SensitivityValue);
 301  008f c650a1        	ld	a,20641
 302  0092 1a02          	or	a,(OFST+2,sp)
 303  0094 c750a1        	ld	20641,a
 304                     ; 93         break;
 306                     ; 94     default:
 306                     ; 95         break;
 308  0097               L511:
 309                     ; 97 }
 312  0097 85            	popw	x
 313  0098 81            	ret	
 315  0099               LC004:
 316  0099 89            	pushw	x
 317  009a 5f            	clrw	x
 318  009b 89            	pushw	x
 319  009c ae0000        	ldw	x,#L111
 320  009f cd0000        	call	_assert_failed
 322  00a2 5b04          	addw	sp,#4
 323  00a4 81            	ret	
 381                     ; 106 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 381                     ; 107 {
 382                     .text:	section	.text,new
 383  0000               _EXTI_SetTLISensitivity:
 385  0000 88            	push	a
 386       00000000      OFST:	set	0
 389                     ; 109     assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 391  0001 4d            	tnz	a
 392  0002 2712          	jreq	L63
 393  0004 a104          	cp	a,#4
 394  0006 270e          	jreq	L63
 395  0008 ae006d        	ldw	x,#109
 396  000b 89            	pushw	x
 397  000c 5f            	clrw	x
 398  000d 89            	pushw	x
 399  000e ae0000        	ldw	x,#L111
 400  0011 cd0000        	call	_assert_failed
 402  0014 5b04          	addw	sp,#4
 403  0016               L63:
 404                     ; 112     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 406  0016 721550a1      	bres	20641,#2
 407                     ; 113     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 409  001a c650a1        	ld	a,20641
 410  001d 1a01          	or	a,(OFST+1,sp)
 411  001f c750a1        	ld	20641,a
 412                     ; 114 }
 415  0022 84            	pop	a
 416  0023 81            	ret	
 461                     ; 121 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 461                     ; 122 {
 462                     .text:	section	.text,new
 463  0000               _EXTI_GetExtIntSensitivity:
 465  0000 88            	push	a
 466  0001 88            	push	a
 467       00000001      OFST:	set	1
 470                     ; 123     uint8_t value = 0;
 472  0002 0f01          	clr	(OFST+0,sp)
 473                     ; 126     assert_param(IS_EXTI_PORT_OK(Port));
 475  0004 4d            	tnz	a
 476  0005 271e          	jreq	L05
 477  0007 a101          	cp	a,#1
 478  0009 271a          	jreq	L05
 479  000b a102          	cp	a,#2
 480  000d 2716          	jreq	L05
 481  000f a103          	cp	a,#3
 482  0011 2712          	jreq	L05
 483  0013 a104          	cp	a,#4
 484  0015 270e          	jreq	L05
 485  0017 ae007e        	ldw	x,#126
 486  001a 89            	pushw	x
 487  001b 5f            	clrw	x
 488  001c 89            	pushw	x
 489  001d ae0000        	ldw	x,#L111
 490  0020 cd0000        	call	_assert_failed
 492  0023 5b04          	addw	sp,#4
 493  0025               L05:
 494                     ; 128     switch (Port)
 496  0025 7b02          	ld	a,(OFST+1,sp)
 498                     ; 145     default:
 498                     ; 146         break;
 499  0027 2710          	jreq	L541
 500  0029 4a            	dec	a
 501  002a 2712          	jreq	L741
 502  002c 4a            	dec	a
 503  002d 2718          	jreq	L151
 504  002f 4a            	dec	a
 505  0030 271b          	jreq	L351
 506  0032 4a            	dec	a
 507  0033 2722          	jreq	L551
 508  0035 7b01          	ld	a,(OFST+0,sp)
 509  0037 2023          	jra	LC005
 510  0039               L541:
 511                     ; 130     case EXTI_PORT_GPIOA:
 511                     ; 131         value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 513  0039 c650a0        	ld	a,20640
 514                     ; 132         break;
 516  003c 201c          	jp	LC006
 517  003e               L741:
 518                     ; 133     case EXTI_PORT_GPIOB:
 518                     ; 134         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 520  003e c650a0        	ld	a,20640
 521  0041 a40c          	and	a,#12
 522  0043 44            	srl	a
 523  0044 44            	srl	a
 524                     ; 135         break;
 526  0045 2015          	jp	LC005
 527  0047               L151:
 528                     ; 136     case EXTI_PORT_GPIOC:
 528                     ; 137         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 530  0047 c650a0        	ld	a,20640
 531  004a 4e            	swap	a
 532                     ; 138         break;
 534  004b 200d          	jp	LC006
 535  004d               L351:
 536                     ; 139     case EXTI_PORT_GPIOD:
 536                     ; 140         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 538  004d c650a0        	ld	a,20640
 539  0050 4e            	swap	a
 540  0051 a40c          	and	a,#12
 541  0053 44            	srl	a
 542  0054 44            	srl	a
 543                     ; 141         break;
 545  0055 2003          	jp	LC006
 546  0057               L551:
 547                     ; 142     case EXTI_PORT_GPIOE:
 547                     ; 143         value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 549  0057 c650a1        	ld	a,20641
 550  005a               LC006:
 551  005a a403          	and	a,#3
 552  005c               LC005:
 553                     ; 144         break;
 555                     ; 145     default:
 555                     ; 146         break;
 557                     ; 149     return((EXTI_Sensitivity_TypeDef)value);
 561  005c 85            	popw	x
 562  005d 81            	ret	
 596                     ; 157 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 596                     ; 158 {
 597                     .text:	section	.text,new
 598  0000               _EXTI_GetTLISensitivity:
 600  0000 88            	push	a
 601       00000001      OFST:	set	1
 604                     ; 160     uint8_t value = 0;
 606  0001 0f01          	clr	(OFST+0,sp)
 607                     ; 163     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 609  0003 c650a1        	ld	a,20641
 610  0006 a404          	and	a,#4
 611                     ; 165     return((EXTI_TLISensitivity_TypeDef)value);
 615  0008 5b01          	addw	sp,#1
 616  000a 81            	ret	
 629                     	xdef	_EXTI_GetTLISensitivity
 630                     	xdef	_EXTI_GetExtIntSensitivity
 631                     	xdef	_EXTI_SetTLISensitivity
 632                     	xdef	_EXTI_SetExtIntSensitivity
 633                     	xdef	_EXTI_DeInit
 634                     	xref	_assert_failed
 635                     .const:	section	.text
 636  0000               L111:
 637  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 638  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 639  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
 640  0036 5f657874692e  	dc.b	"_exti.c",0
 660                     	end
