   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2424                     	bsct
2425  0000               _i:
2426  0000 00            	dc.b	0
2461                     ; 8 void Init_Timer4(void)
2461                     ; 9 {
2463                     	switch	.text
2464  0000               _Init_Timer4:
2468                     ; 10 		TIM4_CR1=0x01;//使能计数器
2470  0000 35015340      	mov	_TIM4_CR1,#1
2471                     ; 12 		TIM4_IER=0x01;//更新中断使能
2473  0004 35015343      	mov	_TIM4_IER,#1
2474                     ; 13 		TIM4_EGR=0x01;
2476  0008 35015345      	mov	_TIM4_EGR,#1
2477                     ; 14 		TIM4_CNTR=255;//计数器值
2479  000c 35ff5346      	mov	_TIM4_CNTR,#255
2480                     ; 15 		TIM4_ARR=255;//自动重装的值
2482  0010 35ff5348      	mov	_TIM4_ARR,#255
2483                     ; 16 		TIM4_PSCR=0x07;//分频值
2485  0014 35075347      	mov	_TIM4_PSCR,#7
2486                     ; 18 }
2489  0018 81            	ret
2515                     ; 19 void Init_GPIO(void)
2515                     ; 20 {
2516                     	switch	.text
2517  0019               _Init_GPIO:
2521                     ; 21 		PB_DDR|=0x20;
2523  0019 721a5007      	bset	_PB_DDR,#5
2524                     ; 22 	  PB_CR1|=0x20;
2526  001d 721a5008      	bset	_PB_CR1,#5
2527                     ; 23 	  PB_CR2|=0x00;
2529  0021 c65009        	ld	a,_PB_CR2
2530  0024 97            	ld	xl,a
2531                     ; 24 }
2534  0025 81            	ret
2560                     ; 25 main()
2560                     ; 26 {
2561                     	switch	.text
2562  0026               _main:
2566                     ; 27 	Init_GPIO();
2568  0026 adf1          	call	_Init_GPIO
2570                     ; 28 	Init_Timer4();
2572  0028 add6          	call	_Init_Timer4
2574                     ; 29 	_asm("rim");
2577  002a 9a            rim
2579  002b               L1261:
2580                     ; 31 	while (1);
2582  002b 20fe          	jra	L1261
2609                     ; 34 @far @interrupt void TIM4_UPD_OVF_IRQHandler (void)
2609                     ; 35 {
2611                     	switch	.text
2612  002d               f_TIM4_UPD_OVF_IRQHandler:
2617                     ; 36       i++;
2619  002d 3c00          	inc	_i
2620                     ; 37       TIM4_SR=0x00;
2622  002f 725f5344      	clr	_TIM4_SR
2623                     ; 38       if(i==61)
2625  0033 b600          	ld	a,_i
2626  0035 a13d          	cp	a,#61
2627  0037 260a          	jrne	L5361
2628                     ; 40 					PB_ODR^=0x20;
2630  0039 c65005        	ld	a,_PB_ODR
2631  003c a820          	xor	a,	#32
2632  003e c75005        	ld	_PB_ODR,a
2633                     ; 41 					i=0;
2635  0041 3f00          	clr	_i
2636  0043               L5361:
2637                     ; 43       return;
2640  0043 80            	iret
2663                     	xdef	f_TIM4_UPD_OVF_IRQHandler
2664                     	xdef	_main
2665                     	xdef	_Init_GPIO
2666                     	xdef	_Init_Timer4
2667                     	xdef	_i
2686                     	end
