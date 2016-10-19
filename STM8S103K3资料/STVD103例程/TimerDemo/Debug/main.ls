   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2534                     	bsct
2535  0000               _i:
2536  0000 00            	dc.b	0
2571                     ; 8 void Init_Timer4(void)
2571                     ; 9 {
2573                     	switch	.text
2574  0000               _Init_Timer4:
2578                     ; 10 		TIM4_CR1=0x01;//使能计数器
2580  0000 35015340      	mov	_TIM4_CR1,#1
2581                     ; 12 		TIM4_IER=0x01;//更新中断使能
2583  0004 35015343      	mov	_TIM4_IER,#1
2584                     ; 13 		TIM4_EGR=0x01;
2586  0008 35015345      	mov	_TIM4_EGR,#1
2587                     ; 14 		TIM4_CNTR=255;//计数器值
2589  000c 35ff5346      	mov	_TIM4_CNTR,#255
2590                     ; 15 		TIM4_ARR=255;//自动重装的值
2592  0010 35ff5348      	mov	_TIM4_ARR,#255
2593                     ; 16 		TIM4_PSCR=0x07;//分频值
2595  0014 35075347      	mov	_TIM4_PSCR,#7
2596                     ; 18 }
2599  0018 81            	ret
2625                     ; 19 void Init_GPIO(void)
2625                     ; 20 {
2626                     	switch	.text
2627  0019               _Init_GPIO:
2631                     ; 21 		PB_DDR|=0x20;
2633  0019 721a5007      	bset	_PB_DDR,#5
2634                     ; 22 	  PB_CR1|=0x20;
2636  001d 721a5008      	bset	_PB_CR1,#5
2637                     ; 23 	  PB_CR2|=0x00;
2639  0021 c65009        	ld	a,_PB_CR2
2640  0024 97            	ld	xl,a
2641                     ; 24 }
2644  0025 81            	ret
2670                     ; 25 main()
2670                     ; 26 {
2671                     	switch	.text
2672  0026               _main:
2676                     ; 27 	Init_GPIO();
2678  0026 adf1          	call	_Init_GPIO
2680                     ; 28 	Init_Timer4();
2682  0028 add6          	call	_Init_Timer4
2684                     ; 29 	_asm("rim");
2687  002a 9a            rim
2689  002b               L1761:
2690                     ; 31 	while (1);
2692  002b 20fe          	jra	L1761
2719                     ; 34 @far @interrupt void TIM4_UPD_OVF_IRQHandler (void)
2719                     ; 35 {
2721                     	switch	.text
2722  002d               f_TIM4_UPD_OVF_IRQHandler:
2727                     ; 36       i++;
2729  002d 3c00          	inc	_i
2730                     ; 37       TIM4_SR=0x00;
2732  002f 725f5344      	clr	_TIM4_SR
2733                     ; 38       if(i==61)
2735  0033 b600          	ld	a,_i
2736  0035 a13d          	cp	a,#61
2737  0037 260a          	jrne	L5071
2738                     ; 40 					PB_ODR^=0x20;
2740  0039 c65005        	ld	a,_PB_ODR
2741  003c a820          	xor	a,	#32
2742  003e c75005        	ld	_PB_ODR,a
2743                     ; 41 					i=0;
2745  0041 3f00          	clr	_i
2746  0043               L5071:
2747                     ; 43       return;
2750  0043 80            	iret
2773                     	xdef	f_TIM4_UPD_OVF_IRQHandler
2774                     	xdef	_main
2775                     	xdef	_Init_GPIO
2776                     	xdef	_Init_Timer4
2777                     	xdef	_i
2796                     	end
