   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2566                     ; 8 void Init_UART1(void)
2566                     ; 9 {
2568                     	switch	.text
2569  0000               _Init_UART1:
2573                     ; 10       UART1_CR1=0x00;
2575  0000 725f5234      	clr	_UART1_CR1
2576                     ; 11       UART1_CR2=0x00;
2578  0004 725f5235      	clr	_UART1_CR2
2579                     ; 12       UART1_CR3=0x00;
2581  0008 725f5236      	clr	_UART1_CR3
2582                     ; 21       UART1_BRR2=0x00;
2584  000c 725f5233      	clr	_UART1_BRR2
2585                     ; 22       UART1_BRR1=0x0d;
2587  0010 350d5232      	mov	_UART1_BRR1,#13
2588                     ; 24       UART1_CR2=0x2c;//允许接收，发送，开接收中断
2590  0014 352c5235      	mov	_UART1_CR2,#44
2591                     ; 25 }
2594  0018 81            	ret
2630                     ; 26 void UART1_sendchar(unsigned char c)
2630                     ; 27 {
2631                     	switch	.text
2632  0019               _UART1_sendchar:
2634  0019 88            	push	a
2635       00000000      OFST:	set	0
2638  001a               L1761:
2639                     ; 28       while((UART1_SR & 0x80)==0x00);
2641  001a c65230        	ld	a,_UART1_SR
2642  001d a580          	bcp	a,#128
2643  001f 27f9          	jreq	L1761
2644                     ; 29       UART1_DR=c;
2646  0021 7b01          	ld	a,(OFST+1,sp)
2647  0023 c75231        	ld	_UART1_DR,a
2648                     ; 30 }
2651  0026 84            	pop	a
2652  0027 81            	ret
2688                     ; 32 main()
2688                     ; 33 {
2689                     	switch	.text
2690  0028               _main:
2692  0028 88            	push	a
2693       00000001      OFST:	set	1
2696                     ; 34 	unsigned char i=0;
2698  0029 0f01          	clr	(OFST+0,sp)
2699                     ; 35 	Init_UART1();
2701  002b add3          	call	_Init_UART1
2703  002d               L3171:
2704                     ; 38 		UART1_sendchar(i);
2706  002d 7b01          	ld	a,(OFST+0,sp)
2707  002f ade8          	call	_UART1_sendchar
2709                     ; 39 		i++; 
2711  0031 0c01          	inc	(OFST+0,sp)
2713  0033 20f8          	jra	L3171
2726                     	xdef	_main
2727                     	xdef	_UART1_sendchar
2728                     	xdef	_Init_UART1
2747                     	end
