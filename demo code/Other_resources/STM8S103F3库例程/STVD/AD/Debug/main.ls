   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	bsct
   5  0000               _HexTable:
   6  0000 30            	dc.b	48
   7  0001 31            	dc.b	49
   8  0002 32            	dc.b	50
   9  0003 33            	dc.b	51
  10  0004 34            	dc.b	52
  11  0005 35            	dc.b	53
  12  0006 36            	dc.b	54
  13  0007 37            	dc.b	55
  14  0008 38            	dc.b	56
  15  0009 39            	dc.b	57
  16  000a 41            	dc.b	65
  17  000b 42            	dc.b	66
  18  000c 43            	dc.b	67
  19  000d 44            	dc.b	68
  20  000e 45            	dc.b	69
  21  000f 46            	dc.b	70
  52                     ; 7 void Init_UART1(void)
  52                     ; 8 {
  54                     	switch	.text
  55  0000               _Init_UART1:
  59                     ; 9 	UART1_DeInit();
  61  0000 cd0000        	call	_UART1_DeInit
  63                     ; 10 	UART1_Init((u32)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TX_ENABLE);
  65  0003 4b04          	push	#4
  66  0005 4b80          	push	#128
  67  0007 4b00          	push	#0
  68  0009 4b00          	push	#0
  69  000b 4b00          	push	#0
  70  000d ae2580        	ldw	x,#9600
  71  0010 89            	pushw	x
  72  0011 ae0000        	ldw	x,#0
  73  0014 89            	pushw	x
  74  0015 cd0000        	call	_UART1_Init
  76  0018 5b09          	addw	sp,#9
  77                     ; 12 }
  80  001a 81            	ret
 116                     ; 13 void Send(uint8_t dat)
 116                     ; 14 {
 117                     	switch	.text
 118  001b               _Send:
 120  001b 88            	push	a
 121       00000000      OFST:	set	0
 124  001c               L14:
 125                     ; 15   while(( UART1_GetFlagStatus(UART1_FLAG_TXE)==RESET));
 127  001c ae0080        	ldw	x,#128
 128  001f cd0000        	call	_UART1_GetFlagStatus
 130  0022 4d            	tnz	a
 131  0023 27f7          	jreq	L14
 132                     ; 17 		UART1_SendData8(dat);
 134  0025 7b01          	ld	a,(OFST+1,sp)
 135  0027 cd0000        	call	_UART1_SendData8
 137                     ; 19 }
 140  002a 84            	pop	a
 141  002b 81            	ret
 168                     ; 20 void Init_ADC(void)
 168                     ; 21 {
 169                     	switch	.text
 170  002c               _Init_ADC:
 174                     ; 22 	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);
 176  002c 4b00          	push	#0
 177  002e 4b04          	push	#4
 178  0030 ae500f        	ldw	x,#20495
 179  0033 cd0000        	call	_GPIO_Init
 181  0036 85            	popw	x
 182                     ; 23 	ADC1_DeInit();
 184  0037 cd0000        	call	_ADC1_DeInit
 186                     ; 24 ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM, DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, ENABLE);
 188  003a 4b01          	push	#1
 189  003c 4b03          	push	#3
 190  003e 4b08          	push	#8
 191  0040 4b00          	push	#0
 192  0042 4b00          	push	#0
 193  0044 4b00          	push	#0
 194  0046 ae0003        	ldw	x,#3
 195  0049 4f            	clr	a
 196  004a 95            	ld	xh,a
 197  004b cd0000        	call	_ADC1_Init
 199  004e 5b06          	addw	sp,#6
 200                     ; 25 ADC1_Cmd(ENABLE);
 202  0050 a601          	ld	a,#1
 203  0052 cd0000        	call	_ADC1_Cmd
 205                     ; 29 }
 208  0055 81            	ret
 244                     ; 30 void UART1_sendhex(unsigned char dat)
 244                     ; 31 {
 245                     	switch	.text
 246  0056               _UART1_sendhex:
 248  0056 88            	push	a
 249       00000000      OFST:	set	0
 252                     ; 32 		Send('0');
 254  0057 a630          	ld	a,#48
 255  0059 adc0          	call	_Send
 257                     ; 33 		Send('x');
 259  005b a678          	ld	a,#120
 260  005d adbc          	call	_Send
 262                     ; 34 		Send(HexTable[dat>>4]);
 264  005f 7b01          	ld	a,(OFST+1,sp)
 265  0061 4e            	swap	a
 266  0062 a40f          	and	a,#15
 267  0064 5f            	clrw	x
 268  0065 97            	ld	xl,a
 269  0066 e600          	ld	a,(_HexTable,x)
 270  0068 adb1          	call	_Send
 272                     ; 35 		Send(HexTable[dat&0x0f]);
 274  006a 7b01          	ld	a,(OFST+1,sp)
 275  006c a40f          	and	a,#15
 276  006e 5f            	clrw	x
 277  006f 97            	ld	xl,a
 278  0070 e600          	ld	a,(_HexTable,x)
 279  0072 ada7          	call	_Send
 281                     ; 36 		Send(' ');
 283  0074 a620          	ld	a,#32
 284  0076 ada3          	call	_Send
 286                     ; 37 }
 289  0078 84            	pop	a
 290  0079 81            	ret
 326                     ; 38 void UART1_sendstr(unsigned char *dat)
 326                     ; 39 {
 327                     	switch	.text
 328  007a               _UART1_sendstr:
 330  007a 89            	pushw	x
 331       00000000      OFST:	set	0
 334  007b 200c          	jra	L311
 335  007d               L111:
 336                     ; 42 				Send(*dat);
 338  007d 1e01          	ldw	x,(OFST+1,sp)
 339  007f f6            	ld	a,(x)
 340  0080 ad99          	call	_Send
 342                     ; 43 				dat++;
 344  0082 1e01          	ldw	x,(OFST+1,sp)
 345  0084 1c0001        	addw	x,#1
 346  0087 1f01          	ldw	(OFST+1,sp),x
 347  0089               L311:
 348                     ; 40 		while(*dat!='\0')
 350  0089 1e01          	ldw	x,(OFST+1,sp)
 351  008b 7d            	tnz	(x)
 352  008c 26ef          	jrne	L111
 353                     ; 46 }
 356  008e 85            	popw	x
 357  008f 81            	ret
 428                     ; 47 void main(void)
 428                     ; 48 {
 429                     	switch	.text
 430  0090               _main:
 432  0090 5203          	subw	sp,#3
 433       00000003      OFST:	set	3
 436                     ; 51 		Init_UART1();
 438  0092 cd0000        	call	_Init_UART1
 440                     ; 52 		Init_ADC();
 442  0095 ad95          	call	_Init_ADC
 444  0097               L151:
 445                     ; 57 		ADC1_StartConversion();
 447  0097 cd0000        	call	_ADC1_StartConversion
 449                     ; 58     flag_status = ADC1_GetFlagStatus(ADC1_FLAG_EOC);
 451  009a a680          	ld	a,#128
 452  009c cd0000        	call	_ADC1_GetFlagStatus
 454  009f 6b01          	ld	(OFST-2,sp),a
 456  00a1               L161:
 457                     ; 59     while(flag_status == RESET); // SET or RESET
 459  00a1 0d01          	tnz	(OFST-2,sp)
 460  00a3 27fc          	jreq	L161
 461                     ; 60     		u16_adc1_value = ADC1_GetConversionValue();
 463  00a5 cd0000        	call	_ADC1_GetConversionValue
 465  00a8 1f02          	ldw	(OFST-1,sp),x
 466                     ; 61 				UART1_sendhex((u16_adc1_value>>8));
 468  00aa 7b02          	ld	a,(OFST-1,sp)
 469  00ac ada8          	call	_UART1_sendhex
 471                     ; 62 		    UART1_sendhex((u16_adc1_value&0xff));
 473  00ae 7b03          	ld	a,(OFST+0,sp)
 474  00b0 a4ff          	and	a,#255
 475  00b2 ada2          	call	_UART1_sendhex
 477                     ; 63 		    UART1_sendstr("\r\n");
 479  00b4 ae0000        	ldw	x,#L561
 480  00b7 adc1          	call	_UART1_sendstr
 483  00b9 20dc          	jra	L151
 518                     ; 77 void assert_failed(u8* file, u32 line)
 518                     ; 78 { 
 519                     	switch	.text
 520  00bb               _assert_failed:
 524  00bb               L502:
 525  00bb 20fe          	jra	L502
 550                     	xdef	_main
 551                     	xdef	_UART1_sendstr
 552                     	xdef	_UART1_sendhex
 553                     	xdef	_Init_ADC
 554                     	xdef	_Send
 555                     	xdef	_Init_UART1
 556                     	xdef	_HexTable
 557                     	xdef	_assert_failed
 558                     	xref	_UART1_GetFlagStatus
 559                     	xref	_UART1_SendData8
 560                     	xref	_UART1_Init
 561                     	xref	_UART1_DeInit
 562                     	xref	_GPIO_Init
 563                     	xref	_ADC1_GetFlagStatus
 564                     	xref	_ADC1_GetConversionValue
 565                     	xref	_ADC1_StartConversion
 566                     	xref	_ADC1_Cmd
 567                     	xref	_ADC1_Init
 568                     	xref	_ADC1_DeInit
 569                     .const:	section	.text
 570  0000               L561:
 571  0000 0d0a00        	dc.b	13,10,0
 591                     	end
