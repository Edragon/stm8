   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2456                     ; 6 void Init_UART1(void)
2456                     ; 7 {
2458                     	switch	.text
2459  0000               _Init_UART1:
2463                     ; 8       UART1_CR1=0x00;
2465  0000 725f5234      	clr	_UART1_CR1
2466                     ; 9       UART1_CR2=0x00;
2468  0004 725f5235      	clr	_UART1_CR2
2469                     ; 10       UART1_CR3=0x00;
2471  0008 725f5236      	clr	_UART1_CR3
2472                     ; 19       UART1_BRR2=0x00;
2474  000c 725f5233      	clr	_UART1_BRR2
2475                     ; 20       UART1_BRR1=0x0d;
2477  0010 350d5232      	mov	_UART1_BRR1,#13
2478                     ; 22       UART1_CR2=0x2c;//允许接收，发送，开接收中断
2480  0014 352c5235      	mov	_UART1_CR2,#44
2481                     ; 23 }
2484  0018 81            	ret
2520                     ; 24 void UART1_sendchar(unsigned char c)
2520                     ; 25 {
2521                     	switch	.text
2522  0019               _UART1_sendchar:
2524  0019 88            	push	a
2525       00000000      OFST:	set	0
2528  001a               L1261:
2529                     ; 26       while((UART1_SR & 0x80)==0x00);
2531  001a c65230        	ld	a,_UART1_SR
2532  001d a580          	bcp	a,#128
2533  001f 27f9          	jreq	L1261
2534                     ; 27       UART1_DR=c;
2536  0021 7b01          	ld	a,(OFST+1,sp)
2537  0023 c75231        	ld	_UART1_DR,a
2538                     ; 28 }
2541  0026 84            	pop	a
2542  0027 81            	ret
2578                     ; 29 main()
2578                     ; 30 {
2579                     	switch	.text
2580  0028               _main:
2582  0028 88            	push	a
2583       00000001      OFST:	set	1
2586                     ; 31 	unsigned char i=0;
2588  0029 0f01          	clr	(OFST+0,sp)
2589                     ; 32 	Init_UART1();
2591  002b add3          	call	_Init_UART1
2593                     ; 33 	_asm("rim");//开中断，sim为关中断
2596  002d 9a            rim
2598  002e               L3461:
2599                     ; 34 	while (1);
2601  002e 20fe          	jra	L3461
2638                     ; 37 @far @interrupt void UART1_Recv_IRQHandler (void)
2638                     ; 38 {
2640                     	switch	.text
2641  0030               f_UART1_Recv_IRQHandler:
2644       00000001      OFST:	set	1
2645  0030 3b0002        	push	c_x+2
2646  0033 be00          	ldw	x,c_x
2647  0035 89            	pushw	x
2648  0036 3b0002        	push	c_y+2
2649  0039 be00          	ldw	x,c_y
2650  003b 89            	pushw	x
2651  003c 88            	push	a
2654                     ; 40       ch=UART1_DR;
2656  003d c65231        	ld	a,_UART1_DR
2657  0040 6b01          	ld	(OFST+0,sp),a
2658                     ; 41 			UART1_sendchar(ch);
2660  0042 7b01          	ld	a,(OFST+0,sp)
2661  0044 add3          	call	_UART1_sendchar
2663                     ; 42       return;
2666  0046 84            	pop	a
2667  0047 85            	popw	x
2668  0048 bf00          	ldw	c_y,x
2669  004a 320002        	pop	c_y+2
2670  004d 85            	popw	x
2671  004e bf00          	ldw	c_x,x
2672  0050 320002        	pop	c_x+2
2673  0053 80            	iret
2685                     	xdef	f_UART1_Recv_IRQHandler
2686                     	xdef	_main
2687                     	xdef	_UART1_sendchar
2688                     	xdef	_Init_UART1
2689                     	xref.b	c_x
2690                     	xref.b	c_y
2709                     	end
