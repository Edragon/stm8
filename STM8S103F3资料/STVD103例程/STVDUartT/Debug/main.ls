   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2456                     ; 8 void Init_UART1(void)
2456                     ; 9 {
2458                     	switch	.text
2459  0000               _Init_UART1:
2463                     ; 10       UART1_CR1=0x00;
2465  0000 725f5234      	clr	_UART1_CR1
2466                     ; 11       UART1_CR2=0x00;
2468  0004 725f5235      	clr	_UART1_CR2
2469                     ; 12       UART1_CR3=0x00;
2471  0008 725f5236      	clr	_UART1_CR3
2472                     ; 21       UART1_BRR2=0x00;
2474  000c 725f5233      	clr	_UART1_BRR2
2475                     ; 22       UART1_BRR1=0x0d;
2477  0010 350d5232      	mov	_UART1_BRR1,#13
2478                     ; 24       UART1_CR2=0x2c;//允许接收，发送，开接收中断
2480  0014 352c5235      	mov	_UART1_CR2,#44
2481                     ; 25 }
2484  0018 81            	ret
2520                     ; 26 void UART1_sendchar(unsigned char c)
2520                     ; 27 {
2521                     	switch	.text
2522  0019               _UART1_sendchar:
2524  0019 88            	push	a
2525       00000000      OFST:	set	0
2528  001a               L1261:
2529                     ; 28       while((UART1_SR & 0x80)==0x00);
2531  001a c65230        	ld	a,_UART1_SR
2532  001d a580          	bcp	a,#128
2533  001f 27f9          	jreq	L1261
2534                     ; 29       UART1_DR=c;
2536  0021 7b01          	ld	a,(OFST+1,sp)
2537  0023 c75231        	ld	_UART1_DR,a
2538                     ; 30 }
2541  0026 84            	pop	a
2542  0027 81            	ret
2578                     ; 32 main()
2578                     ; 33 {
2579                     	switch	.text
2580  0028               _main:
2582  0028 88            	push	a
2583       00000001      OFST:	set	1
2586                     ; 34 	unsigned char i=0;
2588  0029 0f01          	clr	(OFST+0,sp)
2589                     ; 35 	Init_UART1();
2591  002b add3          	call	_Init_UART1
2593  002d               L3461:
2594                     ; 38 		UART1_sendchar(i);
2596  002d 7b01          	ld	a,(OFST+0,sp)
2597  002f ade8          	call	_UART1_sendchar
2599                     ; 39 		i++; 
2601  0031 0c01          	inc	(OFST+0,sp)
2603  0033 20f8          	jra	L3461
2616                     	xdef	_main
2617                     	xdef	_UART1_sendchar
2618                     	xdef	_Init_UART1
2637                     	end
