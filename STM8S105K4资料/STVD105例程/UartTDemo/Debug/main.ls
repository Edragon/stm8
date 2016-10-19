   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2808                     ; 8 void Init_UART2(void)
2808                     ; 9 {
2810                     	switch	.text
2811  0000               _Init_UART2:
2815                     ; 10       UART2_CR1=0x00;
2817  0000 725f5244      	clr	_UART2_CR1
2818                     ; 11       UART2_CR2=0x00;
2820  0004 725f5245      	clr	_UART2_CR2
2821                     ; 12       UART2_CR3=0x00;
2823  0008 725f5246      	clr	_UART2_CR3
2824                     ; 21       UART2_BRR2=0x00;
2826  000c 725f5243      	clr	_UART2_BRR2
2827                     ; 22       UART2_BRR1=0x0d;
2829  0010 350d5242      	mov	_UART2_BRR1,#13
2830                     ; 24       UART2_CR2=0x2c;//允许接收，发送，开接收中断
2832  0014 352c5245      	mov	_UART2_CR2,#44
2833                     ; 25 }
2836  0018 81            	ret
2872                     ; 26 void UART2_sendchar(unsigned char c)
2872                     ; 27 {
2873                     	switch	.text
2874  0019               _UART2_sendchar:
2876  0019 88            	push	a
2877       00000000      OFST:	set	0
2880  001a               L1202:
2881                     ; 28       while((UART2_SR & 0x80)==0x00);
2883  001a c65240        	ld	a,_UART2_SR
2884  001d a580          	bcp	a,#128
2885  001f 27f9          	jreq	L1202
2886                     ; 29       UART2_DR=c;
2888  0021 7b01          	ld	a,(OFST+1,sp)
2889  0023 c75241        	ld	_UART2_DR,a
2890                     ; 30 }
2893  0026 84            	pop	a
2894  0027 81            	ret
2930                     ; 32 main()
2930                     ; 33 {
2931                     	switch	.text
2932  0028               _main:
2934  0028 88            	push	a
2935       00000001      OFST:	set	1
2938                     ; 34 	unsigned char i=0;
2940  0029 0f01          	clr	(OFST+0,sp)
2941                     ; 35 	Init_UART2();
2943  002b add3          	call	_Init_UART2
2945  002d               L3402:
2946                     ; 38 		UART2_sendchar(i);
2948  002d 7b01          	ld	a,(OFST+0,sp)
2949  002f ade8          	call	_UART2_sendchar
2951                     ; 39 		i++; 
2953  0031 0c01          	inc	(OFST+0,sp)
2955  0033 20f8          	jra	L3402
2968                     	xdef	_main
2969                     	xdef	_UART2_sendchar
2970                     	xdef	_Init_UART2
2989                     	end
