   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2776                     	bsct
2777  0000               _i:
2778  0000 00            	dc.b	0
2813                     ; 8 void Init_Timer4(void)
2813                     ; 9 {
2815                     	switch	.text
2816  0000               _Init_Timer4:
2820                     ; 10 		TIM4_CR1=0x01;//使能计数器
2822  0000 35015340      	mov	_TIM4_CR1,#1
2823                     ; 12 		TIM4_IER=0x01;//更新中断使能
2825  0004 35015341      	mov	_TIM4_IER,#1
2826                     ; 13 		TIM4_EGR=0x01;
2828  0008 35015343      	mov	_TIM4_EGR,#1
2829                     ; 14 		TIM4_CNTR=255;//计数器值
2831  000c 35ff5344      	mov	_TIM4_CNTR,#255
2832                     ; 15 		TIM4_ARR=255;//自动重装的值
2834  0010 35ff5346      	mov	_TIM4_ARR,#255
2835                     ; 16 		TIM4_PSCR=0x07;//分频值
2837  0014 35075345      	mov	_TIM4_PSCR,#7
2838                     ; 18 }
2841  0018 81            	ret
2867                     ; 19 void Init_GPIO(void)
2867                     ; 20 {
2868                     	switch	.text
2869  0019               _Init_GPIO:
2873                     ; 21 		PE_DDR|=0x20;
2875  0019 721a5016      	bset	_PE_DDR,#5
2876                     ; 22 	  PE_CR1|=0x20;
2878  001d 721a5017      	bset	_PE_CR1,#5
2879                     ; 23 	  PE_CR2|=0x00;
2881  0021 c65018        	ld	a,_PE_CR2
2882  0024 97            	ld	xl,a
2883                     ; 24 }
2886  0025 81            	ret
2912                     ; 25 main()
2912                     ; 26 {
2913                     	switch	.text
2914  0026               _main:
2918                     ; 27 	Init_GPIO();
2920  0026 adf1          	call	_Init_GPIO
2922                     ; 28 	Init_Timer4();
2924  0028 add6          	call	_Init_Timer4
2926                     ; 29 	_asm("rim");
2929  002a 9a            rim
2931  002b               L1202:
2932                     ; 31 	while (1);
2934  002b 20fe          	jra	L1202
2961                     ; 34 @far @interrupt void TIM4_UPD_OVF_IRQHandler (void)
2961                     ; 35 {
2963                     	switch	.text
2964  002d               f_TIM4_UPD_OVF_IRQHandler:
2969                     ; 36       i++;
2971  002d 3c00          	inc	_i
2972                     ; 37       TIM4_SR=0x00;
2974  002f 725f5342      	clr	_TIM4_SR
2975                     ; 38       if(i==61)
2977  0033 b600          	ld	a,_i
2978  0035 a13d          	cp	a,#61
2979  0037 260a          	jrne	L5302
2980                     ; 40 					PE_ODR^=0x20;
2982  0039 c65014        	ld	a,_PE_ODR
2983  003c a820          	xor	a,	#32
2984  003e c75014        	ld	_PE_ODR,a
2985                     ; 41 					i=0;
2987  0041 3f00          	clr	_i
2988  0043               L5302:
2989                     ; 43       return;
2992  0043 80            	iret
3015                     	xdef	f_TIM4_UPD_OVF_IRQHandler
3016                     	xdef	_main
3017                     	xdef	_Init_GPIO
3018                     	xdef	_Init_Timer4
3019                     	xdef	_i
3038                     	end
