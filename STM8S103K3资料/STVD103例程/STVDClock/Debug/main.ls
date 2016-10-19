   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2564                     ; 9 void Init_GPIO(void)
2564                     ; 10 {
2566                     	switch	.text
2567  0000               _Init_GPIO:
2571                     ; 11        PE_DDR = 0x20;
2573  0000 35205016      	mov	_PE_DDR,#32
2574                     ; 12        PE_CR1 = 0x20; 
2576  0004 35205017      	mov	_PE_CR1,#32
2577                     ; 13        PE_CR2 = 0x00;
2579  0008 725f5018      	clr	_PE_CR2
2580                     ; 14 }
2583  000c 81            	ret
2626                     ; 15 void delay_ms(unsigned int ms)
2626                     ; 16 {
2627                     	switch	.text
2628  000d               _delay_ms:
2630  000d 89            	pushw	x
2631  000e 88            	push	a
2632       00000001      OFST:	set	1
2635  000f 201b          	jra	L5761
2636  0011               L3761:
2637                     ; 20               for(i=0;i<250;i++)
2639  0011 0f01          	clr	(OFST+0,sp)
2640  0013               L1071:
2643  0013 0c01          	inc	(OFST+0,sp)
2646  0015 7b01          	ld	a,(OFST+0,sp)
2647  0017 a1fa          	cp	a,#250
2648  0019 25f8          	jrult	L1071
2649                     ; 22               for(i=0;i<75;i++)
2651  001b 0f01          	clr	(OFST+0,sp)
2652  001d               L7071:
2655  001d 0c01          	inc	(OFST+0,sp)
2658  001f 7b01          	ld	a,(OFST+0,sp)
2659  0021 a14b          	cp	a,#75
2660  0023 25f8          	jrult	L7071
2661                     ; 24               ms--;
2663  0025 1e02          	ldw	x,(OFST+1,sp)
2664  0027 1d0001        	subw	x,#1
2665  002a 1f02          	ldw	(OFST+1,sp),x
2666  002c               L5761:
2667                     ; 18        while(ms!=0)
2669  002c 1e02          	ldw	x,(OFST+1,sp)
2670  002e 26e1          	jrne	L3761
2671                     ; 26 }
2674  0030 5b03          	addw	sp,#3
2675  0032 81            	ret
2716                     ; 28 main()
2716                     ; 29 {
2717                     	switch	.text
2718  0033               _main:
2720  0033 88            	push	a
2721       00000001      OFST:	set	1
2724                     ; 31 		Init_GPIO();   //初始化I/O
2726  0034 adca          	call	_Init_GPIO
2728                     ; 33 		CLK_ICKR|=0x01;      //开启内部HSI
2730  0036 721050c0      	bset	_CLK_ICKR,#0
2732  003a               L5371:
2733                     ; 34 		while(!(CLK_ICKR&0x02));//HSI准备就绪
2735  003a c650c0        	ld	a,_CLK_ICKR
2736  003d a502          	bcp	a,#2
2737  003f 27f9          	jreq	L5371
2738                     ; 35 		CLK_SWR=0xe1;        //HSI为主时钟源
2740  0041 35e150c4      	mov	_CLK_SWR,#225
2741                     ; 36 		CLK_CKDIVR=0x00;     //HSI不分频
2743  0045 725f50c6      	clr	_CLK_CKDIVR
2744                     ; 37 		for(i=0;i<10;i++)    //闪烁LED
2746  0049 0f01          	clr	(OFST+0,sp)
2747  004b               L1471:
2748                     ; 39 				LED_PORT^=0x20;
2750  004b c65014        	ld	a,_PE_ODR
2751  004e a820          	xor	a,	#32
2752  0050 c75014        	ld	_PE_ODR,a
2753                     ; 40 				delay_ms(500);
2755  0053 ae01f4        	ldw	x,#500
2756  0056 adb5          	call	_delay_ms
2758                     ; 37 		for(i=0;i<10;i++)    //闪烁LED
2760  0058 0c01          	inc	(OFST+0,sp)
2763  005a 7b01          	ld	a,(OFST+0,sp)
2764  005c a10a          	cp	a,#10
2765  005e 25eb          	jrult	L1471
2766                     ; 43 		CLK_CKDIVR=0x18;   //HSI8分频，2M，复位后的默认值
2768  0060 351850c6      	mov	_CLK_CKDIVR,#24
2769                     ; 44 		for(i=0;i<10;i++)   //闪烁LED
2771  0064 0f01          	clr	(OFST+0,sp)
2772  0066               L7471:
2773                     ; 46 				LED_PORT^=0x20;
2775  0066 c65014        	ld	a,_PE_ODR
2776  0069 a820          	xor	a,	#32
2777  006b c75014        	ld	_PE_ODR,a
2778                     ; 47 				delay_ms(500);
2780  006e ae01f4        	ldw	x,#500
2781  0071 ad9a          	call	_delay_ms
2783                     ; 44 		for(i=0;i<10;i++)   //闪烁LED
2785  0073 0c01          	inc	(OFST+0,sp)
2788  0075 7b01          	ld	a,(OFST+0,sp)
2789  0077 a10a          	cp	a,#10
2790  0079 25eb          	jrult	L7471
2791  007b               L5571:
2792                     ; 54         CLK_SWCR|=0x02; //开启切换
2794  007b 721250c5      	bset	_CLK_SWCR,#1
2795                     ; 55         CLK_ICKR|=0x01;      //开启内部HSI
2797  007f 721050c0      	bset	_CLK_ICKR,#0
2799  0083               L3671:
2800                     ; 56 				while(!(CLK_ICKR&0x02));//HSI准备就绪
2802  0083 c650c0        	ld	a,_CLK_ICKR
2803  0086 a502          	bcp	a,#2
2804  0088 27f9          	jreq	L3671
2805                     ; 57 				CLK_SWR=0xe1;        //HSI为主时钟源
2807  008a 35e150c4      	mov	_CLK_SWR,#225
2809  008e               L3771:
2810                     ; 58         while((CLK_SWCR & 0x01)==0x01);//等待切换完成
2812  008e c650c5        	ld	a,_CLK_SWCR
2813  0091 a401          	and	a,#1
2814  0093 a101          	cp	a,#1
2815  0095 27f7          	jreq	L3771
2816                     ; 59         CLK_CKDIVR=0x00;     //HSI不分频
2818  0097 725f50c6      	clr	_CLK_CKDIVR
2819                     ; 60         CLK_SWCR&=(~0x02); //关闭切换
2821  009b 721350c5      	bres	_CLK_SWCR,#1
2822                     ; 61         for(i=0;i<20;i++)
2824  009f 0f01          	clr	(OFST+0,sp)
2825  00a1               L7771:
2826                     ; 63 						LED_PORT^=0x20;
2828  00a1 c65014        	ld	a,_PE_ODR
2829  00a4 a820          	xor	a,	#32
2830  00a6 c75014        	ld	_PE_ODR,a
2831                     ; 64 						delay_ms(500);
2833  00a9 ae01f4        	ldw	x,#500
2834  00ac cd000d        	call	_delay_ms
2836                     ; 61         for(i=0;i<20;i++)
2838  00af 0c01          	inc	(OFST+0,sp)
2841  00b1 7b01          	ld	a,(OFST+0,sp)
2842  00b3 a114          	cp	a,#20
2843  00b5 25ea          	jrult	L7771
2844                     ; 66 				LED_PORT|=0x20;//熄灭LED以区别
2846  00b7 721a5014      	bset	_PE_ODR,#5
2847                     ; 67 				delay_ms(500);
2849  00bb ae01f4        	ldw	x,#500
2850  00be cd000d        	call	_delay_ms
2852                     ; 68 				delay_ms(500);
2854  00c1 ae01f4        	ldw	x,#500
2855  00c4 cd000d        	call	_delay_ms
2857                     ; 69 				delay_ms(500);
2859  00c7 ae01f4        	ldw	x,#500
2860  00ca cd000d        	call	_delay_ms
2862                     ; 70 				delay_ms(500);
2864  00cd ae01f4        	ldw	x,#500
2865  00d0 cd000d        	call	_delay_ms
2867                     ; 72         CLK_CKDIVR=0x18;
2869  00d3 351850c6      	mov	_CLK_CKDIVR,#24
2870                     ; 73         for(i=0;i<20;i++)
2872  00d7 0f01          	clr	(OFST+0,sp)
2873  00d9               L5002:
2874                     ; 75 						LED_PORT^=0x20;
2876  00d9 c65014        	ld	a,_PE_ODR
2877  00dc a820          	xor	a,	#32
2878  00de c75014        	ld	_PE_ODR,a
2879                     ; 76 						delay_ms(500);
2881  00e1 ae01f4        	ldw	x,#500
2882  00e4 cd000d        	call	_delay_ms
2884                     ; 73         for(i=0;i<20;i++)
2886  00e7 0c01          	inc	(OFST+0,sp)
2889  00e9 7b01          	ld	a,(OFST+0,sp)
2890  00eb a114          	cp	a,#20
2891  00ed 25ea          	jrult	L5002
2892                     ; 78 				LED_PORT|=0x20;//熄灭LED以区别
2894  00ef 721a5014      	bset	_PE_ODR,#5
2895                     ; 79 				delay_ms(500);
2897  00f3 ae01f4        	ldw	x,#500
2898  00f6 cd000d        	call	_delay_ms
2900                     ; 80 				delay_ms(500);
2902  00f9 ae01f4        	ldw	x,#500
2903  00fc cd000d        	call	_delay_ms
2905                     ; 83         CLK_SWCR|=0x02; //开启切换
2907  00ff 721250c5      	bset	_CLK_SWCR,#1
2908                     ; 84         CLK_ICKR|=0x08; //开启LSI
2910  0103 721650c0      	bset	_CLK_ICKR,#3
2912  0107               L5102:
2913                     ; 85 				while(!(CLK_ICKR&0x10));//HSI准备就绪
2915  0107 c650c0        	ld	a,_CLK_ICKR
2916  010a a510          	bcp	a,#16
2917  010c 27f9          	jreq	L5102
2918                     ; 86 				CLK_SWR=0xd2;   //LSR为主时钟源
2920  010e 35d250c4      	mov	_CLK_SWR,#210
2922  0112               L5202:
2923                     ; 87         while((CLK_SWCR & 0x01)==0x01);//等待切换完成
2925  0112 c650c5        	ld	a,_CLK_SWCR
2926  0115 a401          	and	a,#1
2927  0117 a101          	cp	a,#1
2928  0119 27f7          	jreq	L5202
2929                     ; 88         CLK_CKDIVR=0x00;   //LSI不分频
2931  011b 725f50c6      	clr	_CLK_CKDIVR
2932                     ; 89         CLK_SWCR&=(~0x02); //关闭切换
2934  011f 721350c5      	bres	_CLK_SWCR,#1
2935                     ; 90         for(i=0;i<20;i++)
2937  0123 0f01          	clr	(OFST+0,sp)
2938  0125               L1302:
2939                     ; 92 						LED_PORT^=0x20;
2941  0125 c65014        	ld	a,_PE_ODR
2942  0128 a820          	xor	a,	#32
2943  012a c75014        	ld	_PE_ODR,a
2944                     ; 93 						delay_ms(500);
2946  012d ae01f4        	ldw	x,#500
2947  0130 cd000d        	call	_delay_ms
2949                     ; 90         for(i=0;i<20;i++)
2951  0133 0c01          	inc	(OFST+0,sp)
2954  0135 7b01          	ld	a,(OFST+0,sp)
2955  0137 a114          	cp	a,#20
2956  0139 25ea          	jrult	L1302
2957                     ; 95 			  LED_PORT|=0x20;//熄灭LED以区别
2959  013b 721a5014      	bset	_PE_ODR,#5
2960                     ; 96 				delay_ms(500);
2962  013f ae01f4        	ldw	x,#500
2963  0142 cd000d        	call	_delay_ms
2965                     ; 97 				delay_ms(500);
2967  0145 ae01f4        	ldw	x,#500
2968  0148 cd000d        	call	_delay_ms
2970                     ; 98 				delay_ms(500);
2972  014b ae01f4        	ldw	x,#500
2973  014e cd000d        	call	_delay_ms
2975                     ; 99 				delay_ms(500);
2977  0151 ae01f4        	ldw	x,#500
2978  0154 cd000d        	call	_delay_ms
2981  0157 ac7b007b      	jpf	L5571
2994                     	xdef	_main
2995                     	xdef	_delay_ms
2996                     	xdef	_Init_GPIO
3015                     	end
