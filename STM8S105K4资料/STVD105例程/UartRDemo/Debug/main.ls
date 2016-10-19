   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2808                     ; 7 void Init_UART2(void)
2808                     ; 8 {
2810                     	switch	.text
2811  0000               _Init_UART2:
2815                     ; 9       UART2_CR1=0x00;
2817  0000 725f5244      	clr	_UART2_CR1
2818                     ; 10       UART2_CR2=0x00;
2820  0004 725f5245      	clr	_UART2_CR2
2821                     ; 11       UART2_CR3=0x00;
2823  0008 725f5246      	clr	_UART2_CR3
2824                     ; 20       UART2_BRR2=0x00;
2826  000c 725f5243      	clr	_UART2_BRR2
2827                     ; 21       UART2_BRR1=0x0d;
2829  0010 350d5242      	mov	_UART2_BRR1,#13
2830                     ; 23       UART2_CR2=0x2c;//允许接收，发送，开接收中断
2832  0014 352c5245      	mov	_UART2_CR2,#44
2833                     ; 24 }
2836  0018 81            	ret
2872                     ; 25 void UART2_sendchar(unsigned char c)
2872                     ; 26 {
2873                     	switch	.text
2874  0019               _UART2_sendchar:
2876  0019 88            	push	a
2877       00000000      OFST:	set	0
2880  001a               L1202:
2881                     ; 27       while((UART2_SR & 0x80)==0x00);
2883  001a c65240        	ld	a,_UART2_SR
2884  001d a580          	bcp	a,#128
2885  001f 27f9          	jreq	L1202
2886                     ; 28       UART2_DR=c;
2888  0021 7b01          	ld	a,(OFST+1,sp)
2889  0023 c75241        	ld	_UART2_DR,a
2890                     ; 29 }
2893  0026 84            	pop	a
2894  0027 81            	ret
2930                     ; 30 main()
2930                     ; 31 {
2931                     	switch	.text
2932  0028               _main:
2934  0028 88            	push	a
2935       00000001      OFST:	set	1
2938                     ; 32 	unsigned char i=0;
2940  0029 0f01          	clr	(OFST+0,sp)
2941                     ; 33 	Init_UART2();
2943  002b add3          	call	_Init_UART2
2945                     ; 34 	_asm("rim");//开中断，sim为关中断
2948  002d 9a            rim
2950  002e               L3402:
2951                     ; 35 	while (1);
2953  002e 20fe          	jra	L3402
2990                     ; 38 @far @interrupt void UART2_Recv_IRQHandler (void)
2990                     ; 39 {
2992                     	switch	.text
2993  0030               f_UART2_Recv_IRQHandler:
2996       00000001      OFST:	set	1
2997  0030 3b0002        	push	c_x+2
2998  0033 be00          	ldw	x,c_x
2999  0035 89            	pushw	x
3000  0036 3b0002        	push	c_y+2
3001  0039 be00          	ldw	x,c_y
3002  003b 89            	pushw	x
3003  003c 88            	push	a
3006                     ; 41       ch=UART2_DR;
3008  003d c65241        	ld	a,_UART2_DR
3009  0040 6b01          	ld	(OFST+0,sp),a
3010                     ; 42 			UART2_sendchar(ch);
3012  0042 7b01          	ld	a,(OFST+0,sp)
3013  0044 add3          	call	_UART2_sendchar
3015                     ; 43       return;
3018  0046 84            	pop	a
3019  0047 85            	popw	x
3020  0048 bf00          	ldw	c_y,x
3021  004a 320002        	pop	c_y+2
3022  004d 85            	popw	x
3023  004e bf00          	ldw	c_x,x
3024  0050 320002        	pop	c_x+2
3025  0053 80            	iret
3037                     	xdef	f_UART2_Recv_IRQHandler
3038                     	xdef	_main
3039                     	xdef	_UART2_sendchar
3040                     	xdef	_Init_UART2
3041                     	xref.b	c_x
3042                     	xref.b	c_y
3061                     	end
