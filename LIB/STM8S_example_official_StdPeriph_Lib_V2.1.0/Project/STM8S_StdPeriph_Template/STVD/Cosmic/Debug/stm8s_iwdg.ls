   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  69                     ; 42 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  69                     ; 43 {
  71                     .text:	section	.text,new
  72  0000               _IWDG_WriteAccessCmd:
  74  0000 88            	push	a
  75       00000000      OFST:	set	0
  78                     ; 45     assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  80  0001 a155          	cp	a,#85
  81  0003 2711          	jreq	L21
  82  0005 4d            	tnz	a
  83  0006 270e          	jreq	L21
  84  0008 ae002d        	ldw	x,#45
  85  000b 89            	pushw	x
  86  000c 5f            	clrw	x
  87  000d 89            	pushw	x
  88  000e ae0000        	ldw	x,#L73
  89  0011 cd0000        	call	_assert_failed
  91  0014 5b04          	addw	sp,#4
  92  0016               L21:
  93                     ; 47     IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  95  0016 7b01          	ld	a,(OFST+1,sp)
  96  0018 c750e0        	ld	20704,a
  97                     ; 48 }
 100  001b 84            	pop	a
 101  001c 81            	ret	
 192                     ; 57 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 192                     ; 58 {
 193                     .text:	section	.text,new
 194  0000               _IWDG_SetPrescaler:
 196  0000 88            	push	a
 197       00000000      OFST:	set	0
 200                     ; 60     assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 202  0001 4d            	tnz	a
 203  0002 2726          	jreq	L42
 204  0004 a101          	cp	a,#1
 205  0006 2722          	jreq	L42
 206  0008 a102          	cp	a,#2
 207  000a 271e          	jreq	L42
 208  000c a103          	cp	a,#3
 209  000e 271a          	jreq	L42
 210  0010 a104          	cp	a,#4
 211  0012 2716          	jreq	L42
 212  0014 a105          	cp	a,#5
 213  0016 2712          	jreq	L42
 214  0018 a106          	cp	a,#6
 215  001a 270e          	jreq	L42
 216  001c ae003c        	ldw	x,#60
 217  001f 89            	pushw	x
 218  0020 5f            	clrw	x
 219  0021 89            	pushw	x
 220  0022 ae0000        	ldw	x,#L73
 221  0025 cd0000        	call	_assert_failed
 223  0028 5b04          	addw	sp,#4
 224  002a               L42:
 225                     ; 62     IWDG->PR = (uint8_t)IWDG_Prescaler;
 227  002a 7b01          	ld	a,(OFST+1,sp)
 228  002c c750e1        	ld	20705,a
 229                     ; 63 }
 232  002f 84            	pop	a
 233  0030 81            	ret	
 265                     ; 72 void IWDG_SetReload(uint8_t IWDG_Reload)
 265                     ; 73 {
 266                     .text:	section	.text,new
 267  0000               _IWDG_SetReload:
 271                     ; 74     IWDG->RLR = IWDG_Reload;
 273  0000 c750e2        	ld	20706,a
 274                     ; 75 }
 277  0003 81            	ret	
 300                     ; 83 void IWDG_ReloadCounter(void)
 300                     ; 84 {
 301                     .text:	section	.text,new
 302  0000               _IWDG_ReloadCounter:
 306                     ; 85     IWDG->KR = IWDG_KEY_REFRESH;
 308  0000 35aa50e0      	mov	20704,#170
 309                     ; 86 }
 312  0004 81            	ret	
 335                     ; 93 void IWDG_Enable(void)
 335                     ; 94 {
 336                     .text:	section	.text,new
 337  0000               _IWDG_Enable:
 341                     ; 95     IWDG->KR = IWDG_KEY_ENABLE;
 343  0000 35cc50e0      	mov	20704,#204
 344                     ; 96 }
 347  0004 81            	ret	
 360                     	xdef	_IWDG_Enable
 361                     	xdef	_IWDG_ReloadCounter
 362                     	xdef	_IWDG_SetReload
 363                     	xdef	_IWDG_SetPrescaler
 364                     	xdef	_IWDG_WriteAccessCmd
 365                     	xref	_assert_failed
 366                     .const:	section	.text
 367  0000               L73:
 368  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 369  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 370  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
 371  0036 5f697764672e  	dc.b	"_iwdg.c",0
 391                     	end
