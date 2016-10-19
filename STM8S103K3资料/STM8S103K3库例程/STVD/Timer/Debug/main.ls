   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	bsct
   5  0000               _i:
   6  0000 00            	dc.b	0
  36                     ; 29 void Init_GPIO(void)
  36                     ; 30 {
  38                     	switch	.text
  39  0000               _Init_GPIO:
  43                     ; 31 	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
  45  0000 4be0          	push	#224
  46  0002 4b20          	push	#32
  47  0004 ae5005        	ldw	x,#20485
  48  0007 cd0000        	call	_GPIO_Init
  50  000a 85            	popw	x
  51                     ; 33 }
  54  000b 81            	ret
  81                     ; 34 void Init_Timer4(void)
  81                     ; 35 {
  82                     	switch	.text
  83  000c               _Init_Timer4:
  87                     ; 43 	TIM4_TimeBaseInit(TIM4_PRESCALER_128, 0xff);
  89  000c ae00ff        	ldw	x,#255
  90  000f a607          	ld	a,#7
  91  0011 95            	ld	xh,a
  92  0012 cd0000        	call	_TIM4_TimeBaseInit
  94                     ; 45   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
  96  0015 a601          	ld	a,#1
  97  0017 cd0000        	call	_TIM4_ClearFlag
  99                     ; 48 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 101  001a ae0001        	ldw	x,#1
 102  001d a601          	ld	a,#1
 103  001f 95            	ld	xh,a
 104  0020 cd0000        	call	_TIM4_ITConfig
 106                     ; 49 	TIM4_Cmd(ENABLE);
 108  0023 a601          	ld	a,#1
 109  0025 cd0000        	call	_TIM4_Cmd
 111                     ; 50 }
 114  0028 81            	ret
 140                     ; 51 void main(void)
 140                     ; 52 {
 141                     	switch	.text
 142  0029               _main:
 146                     ; 54 	Init_GPIO();
 148  0029 add5          	call	_Init_GPIO
 150                     ; 55 	Init_Timer4();
 152  002b addf          	call	_Init_Timer4
 154                     ; 56 	enableInterrupts();
 157  002d 9a            rim
 159  002e               L14:
 161  002e 20fe          	jra	L14
 196                     ; 74 void assert_failed(u8* file, u32 line)
 196                     ; 75 { 
 197                     	switch	.text
 198  0030               _assert_failed:
 202  0030               L36:
 203  0030 20fe          	jra	L36
 227                     	xdef	_main
 228                     	xdef	_Init_Timer4
 229                     	xdef	_Init_GPIO
 230                     	xdef	_i
 231                     	xdef	_assert_failed
 232                     	xref	_TIM4_ClearFlag
 233                     	xref	_TIM4_ITConfig
 234                     	xref	_TIM4_Cmd
 235                     	xref	_TIM4_TimeBaseInit
 236                     	xref	_GPIO_Init
 255                     	end
