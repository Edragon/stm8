   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  72                     ; 3 void delay_ms(unsigned int z)//ms延时函数
  72                     ; 4 {
  74                     	switch	.text
  75  0000               _delay_ms:
  77  0000 5204          	subw	sp,#4
  78       00000004      OFST:	set	4
  81                     ; 6 	for(x=z;x>0;x--)
  83  0002 1f01          	ldw	(OFST-3,sp),x
  85  0004 2017          	jra	L34
  86  0006               L73:
  87                     ; 7 		for(y=250;y>0;y--);
  89  0006 ae00fa        	ldw	x,#250
  90  0009 1f03          	ldw	(OFST-1,sp),x
  91  000b               L74:
  95  000b 1e03          	ldw	x,(OFST-1,sp)
  96  000d 1d0001        	subw	x,#1
  97  0010 1f03          	ldw	(OFST-1,sp),x
 100  0012 1e03          	ldw	x,(OFST-1,sp)
 101  0014 26f5          	jrne	L74
 102                     ; 6 	for(x=z;x>0;x--)
 104  0016 1e01          	ldw	x,(OFST-3,sp)
 105  0018 1d0001        	subw	x,#1
 106  001b 1f01          	ldw	(OFST-3,sp),x
 107  001d               L34:
 110  001d 1e01          	ldw	x,(OFST-3,sp)
 111  001f 26e5          	jrne	L73
 112                     ; 8 }
 115  0021 5b04          	addw	sp,#4
 116  0023 81            	ret
 140                     ; 10 void LED_GPIO_Init(void)
 140                     ; 11 {
 141                     	switch	.text
 142  0024               _LED_GPIO_Init:
 146                     ; 12 	GPIO_Init(GPIOC, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST);
 148  0024 4be0          	push	#224
 149  0026 4bff          	push	#255
 150  0028 ae500a        	ldw	x,#20490
 151  002b cd0000        	call	_GPIO_Init
 153  002e 85            	popw	x
 154                     ; 13 }
 157  002f 81            	ret
 194                     ; 15 main()
 194                     ; 16 {
 195                     	switch	.text
 196  0030               _main:
 198  0030 88            	push	a
 199       00000001      OFST:	set	1
 202                     ; 17 	unsigned char temp=0x02;
 204  0031 a602          	ld	a,#2
 205  0033 6b01          	ld	(OFST+0,sp),a
 206                     ; 19 	LED_GPIO_Init();
 208  0035 aded          	call	_LED_GPIO_Init
 210  0037               L301:
 211                     ; 22 		GPIO_Write(GPIOC,temp);
 213  0037 7b01          	ld	a,(OFST+0,sp)
 214  0039 88            	push	a
 215  003a ae500a        	ldw	x,#20490
 216  003d cd0000        	call	_GPIO_Write
 218  0040 84            	pop	a
 219                     ; 23 		delay_ms(200);
 221  0041 ae00c8        	ldw	x,#200
 222  0044 adba          	call	_delay_ms
 224                     ; 24 		temp=temp<<1;//左移一位
 226  0046 0801          	sll	(OFST+0,sp)
 227                     ; 25 		if(temp==0x00) temp=0x02;//如果1从最高位移出，最低位补1
 229  0048 0d01          	tnz	(OFST+0,sp)
 230  004a 26eb          	jrne	L301
 233  004c a602          	ld	a,#2
 234  004e 6b01          	ld	(OFST+0,sp),a
 235  0050 20e5          	jra	L301
 248                     	xdef	_main
 249                     	xdef	_LED_GPIO_Init
 250                     	xdef	_delay_ms
 251                     	xref	_GPIO_Write
 252                     	xref	_GPIO_Init
 271                     	end
