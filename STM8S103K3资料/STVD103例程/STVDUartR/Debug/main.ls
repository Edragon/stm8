   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2566                     ; 6 void Init_UART1(void)
2566                     ; 7 {
2568                     	switch	.text
2569  0000               _Init_UART1:
2573                     ; 8       UART1_CR1=0x00;
2575  0000 725f5234      	clr	_UART1_CR1
2576                     ; 9       UART1_CR2=0x00;
2578  0004 725f5235      	clr	_UART1_CR2
2579                     ; 10       UART1_CR3=0x00;
2581  0008 725f5236      	clr	_UART1_CR3
2582                     ; 19       UART1_BRR2=0x00;
2584  000c 725f5233      	clr	_UART1_BRR2
2585                     ; 20       UART1_BRR1=0x0d;
2587  0010 350d5232      	mov	_UART1_BRR1,#13
2588                     ; 22       UART1_CR2=0x2c;//允许接收，发送，开接收中断
2590  0014 352c5235      	mov	_UART1_CR2,#44
2591                     ; 23 }
2594  0018 81            	ret
2630                     ; 24 void UART1_sendchar(unsigned char c)
2630                     ; 25 {
2631                     	switch	.text
2632  0019               _UART1_sendchar:
2634  0019 88            	push	a
2635       00000000      OFST:	set	0
2638  001a               L1761:
2639                     ; 26       while((UART1_SR & 0x80)==0x00);
2641  001a c65230        	ld	a,_UART1_SR
2642  001d a580          	bcp	a,#128
2643  001f 27f9          	jreq	L1761
2644                     ; 27       UART1_DR=c;
2646  0021 7b01          	ld	a,(OFST+1,sp)
2647  0023 c75231        	ld	_UART1_DR,a
2648                     ; 28 }
2651  0026 84            	pop	a
2652  0027 81            	ret
2688                     ; 29 main()
2688                     ; 30 {
2689                     	switch	.text
2690  0028               _main:
2692  0028 88            	push	a
2693       00000001      OFST:	set	1
2696                     ; 31 	unsigned char i=0;
2698  0029 0f01          	clr	(OFST+0,sp)
2699                     ; 32 	Init_UART1();
2701  002b add3          	call	_Init_UART1
2703                     ; 33 	_asm("rim");//开中断，sim为关中断
2706  002d 9a            rim
2708  002e               L3171:
2709                     ; 34 	while (1);
2711  002e 20fe          	jra	L3171
2748                     ; 37 @far @interrupt void UART1_Recv_IRQHandler (void)
2748                     ; 38 {
2750                     	switch	.text
2751  0030               f_UART1_Recv_IRQHandler:
2754       00000001      OFST:	set	1
2755  0030 3b0002        	push	c_x+2
2756  0033 be00          	ldw	x,c_x
2757  0035 89            	pushw	x
2758  0036 3b0002        	push	c_y+2
2759  0039 be00          	ldw	x,c_y
2760  003b 89            	pushw	x
2761  003c 88            	push	a
2764                     ; 40       ch=UART1_DR;
2766  003d c65231        	ld	a,_UART1_DR
2767  0040 6b01          	ld	(OFST+0,sp),a
2768                     ; 41 			UART1_sendchar(ch);
2770  0042 7b01          	ld	a,(OFST+0,sp)
2771  0044 add3          	call	_UART1_sendchar
2773                     ; 42       return;
2776  0046 84            	pop	a
2777  0047 85            	popw	x
2778  0048 bf00          	ldw	c_y,x
2779  004a 320002        	pop	c_y+2
2780  004d 85            	popw	x
2781  004e bf00          	ldw	c_x,x
2782  0050 320002        	pop	c_x+2
2783  0053 80            	iret
2795                     	xdef	f_UART1_Recv_IRQHandler
2796                     	xdef	_main
2797                     	xdef	_UART1_sendchar
2798                     	xdef	_Init_UART1
2799                     	xref.b	c_x
2800                     	xref.b	c_y
2819                     	end
