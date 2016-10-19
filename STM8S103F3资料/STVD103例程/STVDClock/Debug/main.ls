   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2454                     ; 9 void Init_GPIO(void)
2454                     ; 10 {
2456                     	switch	.text
2457  0000               _Init_GPIO:
2461                     ; 11        PB_DDR = 0x20;
2463  0000 35205007      	mov	_PB_DDR,#32
2464                     ; 12        PB_CR1 = 0x20; 
2466  0004 35205008      	mov	_PB_CR1,#32
2467                     ; 13        PB_CR2 = 0x00;
2469  0008 725f5009      	clr	_PB_CR2
2470                     ; 14 }
2473  000c 81            	ret
2516                     ; 15 void delay_ms(unsigned int ms)
2516                     ; 16 {
2517                     	switch	.text
2518  000d               _delay_ms:
2520  000d 89            	pushw	x
2521  000e 88            	push	a
2522       00000001      OFST:	set	1
2525  000f 201b          	jra	L5261
2526  0011               L3261:
2527                     ; 20               for(i=0;i<250;i++)
2529  0011 0f01          	clr	(OFST+0,sp)
2530  0013               L1361:
2533  0013 0c01          	inc	(OFST+0,sp)
2536  0015 7b01          	ld	a,(OFST+0,sp)
2537  0017 a1fa          	cp	a,#250
2538  0019 25f8          	jrult	L1361
2539                     ; 22               for(i=0;i<75;i++)
2541  001b 0f01          	clr	(OFST+0,sp)
2542  001d               L7361:
2545  001d 0c01          	inc	(OFST+0,sp)
2548  001f 7b01          	ld	a,(OFST+0,sp)
2549  0021 a14b          	cp	a,#75
2550  0023 25f8          	jrult	L7361
2551                     ; 24               ms--;
2553  0025 1e02          	ldw	x,(OFST+1,sp)
2554  0027 1d0001        	subw	x,#1
2555  002a 1f02          	ldw	(OFST+1,sp),x
2556  002c               L5261:
2557                     ; 18        while(ms!=0)
2559  002c 1e02          	ldw	x,(OFST+1,sp)
2560  002e 26e1          	jrne	L3261
2561                     ; 26 }
2564  0030 5b03          	addw	sp,#3
2565  0032 81            	ret
2606                     ; 28 main()
2606                     ; 29 {
2607                     	switch	.text
2608  0033               _main:
2610  0033 88            	push	a
2611       00000001      OFST:	set	1
2614                     ; 31 		Init_GPIO();   //初始化I/O
2616  0034 adca          	call	_Init_GPIO
2618                     ; 33 		CLK_ICKR|=0x01;      //开启内部HSI
2620  0036 721050c0      	bset	_CLK_ICKR,#0
2622  003a               L5661:
2623                     ; 34 		while(!(CLK_ICKR&0x02));//HSI准备就绪
2625  003a c650c0        	ld	a,_CLK_ICKR
2626  003d a502          	bcp	a,#2
2627  003f 27f9          	jreq	L5661
2628                     ; 35 		CLK_SWR=0xe1;        //HSI为主时钟源
2630  0041 35e150c4      	mov	_CLK_SWR,#225
2631                     ; 36 		CLK_CKDIVR=0x00;     //HSI不分频
2633  0045 725f50c6      	clr	_CLK_CKDIVR
2634                     ; 37 		for(i=0;i<10;i++)    //闪烁LED
2636  0049 0f01          	clr	(OFST+0,sp)
2637  004b               L1761:
2638                     ; 39 				LED_PORT^=0x20;
2640  004b c65005        	ld	a,_PB_ODR
2641  004e a820          	xor	a,	#32
2642  0050 c75005        	ld	_PB_ODR,a
2643                     ; 40 				delay_ms(500);
2645  0053 ae01f4        	ldw	x,#500
2646  0056 adb5          	call	_delay_ms
2648                     ; 37 		for(i=0;i<10;i++)    //闪烁LED
2650  0058 0c01          	inc	(OFST+0,sp)
2653  005a 7b01          	ld	a,(OFST+0,sp)
2654  005c a10a          	cp	a,#10
2655  005e 25eb          	jrult	L1761
2656                     ; 43 		CLK_CKDIVR=0x18;   //HSI8分频，2M，复位后的默认值
2658  0060 351850c6      	mov	_CLK_CKDIVR,#24
2659                     ; 44 		for(i=0;i<10;i++)   //闪烁LED
2661  0064 0f01          	clr	(OFST+0,sp)
2662  0066               L7761:
2663                     ; 46 				LED_PORT^=0x20;
2665  0066 c65005        	ld	a,_PB_ODR
2666  0069 a820          	xor	a,	#32
2667  006b c75005        	ld	_PB_ODR,a
2668                     ; 47 				delay_ms(500);
2670  006e ae01f4        	ldw	x,#500
2671  0071 ad9a          	call	_delay_ms
2673                     ; 44 		for(i=0;i<10;i++)   //闪烁LED
2675  0073 0c01          	inc	(OFST+0,sp)
2678  0075 7b01          	ld	a,(OFST+0,sp)
2679  0077 a10a          	cp	a,#10
2680  0079 25eb          	jrult	L7761
2681  007b               L5071:
2682                     ; 54         CLK_SWCR|=0x02; //开启切换
2684  007b 721250c5      	bset	_CLK_SWCR,#1
2685                     ; 55         CLK_ICKR|=0x01;      //开启内部HSI
2687  007f 721050c0      	bset	_CLK_ICKR,#0
2689  0083               L3171:
2690                     ; 56 				while(!(CLK_ICKR&0x02));//HSI准备就绪
2692  0083 c650c0        	ld	a,_CLK_ICKR
2693  0086 a502          	bcp	a,#2
2694  0088 27f9          	jreq	L3171
2695                     ; 57 				CLK_SWR=0xe1;        //HSI为主时钟源
2697  008a 35e150c4      	mov	_CLK_SWR,#225
2699  008e               L3271:
2700                     ; 58         while((CLK_SWCR & 0x01)==0x01);//等待切换完成
2702  008e c650c5        	ld	a,_CLK_SWCR
2703  0091 a401          	and	a,#1
2704  0093 a101          	cp	a,#1
2705  0095 27f7          	jreq	L3271
2706                     ; 59         CLK_CKDIVR=0x00;     //HSI不分频
2708  0097 725f50c6      	clr	_CLK_CKDIVR
2709                     ; 60         CLK_SWCR&=(~0x02); //关闭切换
2711  009b 721350c5      	bres	_CLK_SWCR,#1
2712                     ; 61         for(i=0;i<20;i++)
2714  009f 0f01          	clr	(OFST+0,sp)
2715  00a1               L7271:
2716                     ; 63 						LED_PORT^=0x20;
2718  00a1 c65005        	ld	a,_PB_ODR
2719  00a4 a820          	xor	a,	#32
2720  00a6 c75005        	ld	_PB_ODR,a
2721                     ; 64 						delay_ms(500);
2723  00a9 ae01f4        	ldw	x,#500
2724  00ac cd000d        	call	_delay_ms
2726                     ; 61         for(i=0;i<20;i++)
2728  00af 0c01          	inc	(OFST+0,sp)
2731  00b1 7b01          	ld	a,(OFST+0,sp)
2732  00b3 a114          	cp	a,#20
2733  00b5 25ea          	jrult	L7271
2734                     ; 66 				LED_PORT|=0x20;//熄灭LED以区别
2736  00b7 721a5005      	bset	_PB_ODR,#5
2737                     ; 67 				delay_ms(500);
2739  00bb ae01f4        	ldw	x,#500
2740  00be cd000d        	call	_delay_ms
2742                     ; 68 				delay_ms(500);
2744  00c1 ae01f4        	ldw	x,#500
2745  00c4 cd000d        	call	_delay_ms
2747                     ; 69 				delay_ms(500);
2749  00c7 ae01f4        	ldw	x,#500
2750  00ca cd000d        	call	_delay_ms
2752                     ; 70 				delay_ms(500);
2754  00cd ae01f4        	ldw	x,#500
2755  00d0 cd000d        	call	_delay_ms
2757                     ; 72         CLK_CKDIVR=0x18;
2759  00d3 351850c6      	mov	_CLK_CKDIVR,#24
2760                     ; 73         for(i=0;i<20;i++)
2762  00d7 0f01          	clr	(OFST+0,sp)
2763  00d9               L5371:
2764                     ; 75 						LED_PORT^=0x20;
2766  00d9 c65005        	ld	a,_PB_ODR
2767  00dc a820          	xor	a,	#32
2768  00de c75005        	ld	_PB_ODR,a
2769                     ; 76 						delay_ms(500);
2771  00e1 ae01f4        	ldw	x,#500
2772  00e4 cd000d        	call	_delay_ms
2774                     ; 73         for(i=0;i<20;i++)
2776  00e7 0c01          	inc	(OFST+0,sp)
2779  00e9 7b01          	ld	a,(OFST+0,sp)
2780  00eb a114          	cp	a,#20
2781  00ed 25ea          	jrult	L5371
2782                     ; 78 				LED_PORT|=0x20;//熄灭LED以区别
2784  00ef 721a5005      	bset	_PB_ODR,#5
2785                     ; 79 				delay_ms(500);
2787  00f3 ae01f4        	ldw	x,#500
2788  00f6 cd000d        	call	_delay_ms
2790                     ; 80 				delay_ms(500);
2792  00f9 ae01f4        	ldw	x,#500
2793  00fc cd000d        	call	_delay_ms
2795                     ; 83         CLK_SWCR|=0x02; //开启切换
2797  00ff 721250c5      	bset	_CLK_SWCR,#1
2798                     ; 84         CLK_ICKR|=0x08; //开启LSI
2800  0103 721650c0      	bset	_CLK_ICKR,#3
2802  0107               L5471:
2803                     ; 85 				while(!(CLK_ICKR&0x10));//HSI准备就绪
2805  0107 c650c0        	ld	a,_CLK_ICKR
2806  010a a510          	bcp	a,#16
2807  010c 27f9          	jreq	L5471
2808                     ; 86 				CLK_SWR=0xd2;   //LSR为主时钟源
2810  010e 35d250c4      	mov	_CLK_SWR,#210
2812  0112               L5571:
2813                     ; 87         while((CLK_SWCR & 0x01)==0x01);//等待切换完成
2815  0112 c650c5        	ld	a,_CLK_SWCR
2816  0115 a401          	and	a,#1
2817  0117 a101          	cp	a,#1
2818  0119 27f7          	jreq	L5571
2819                     ; 88         CLK_CKDIVR=0x00;   //LSI不分频
2821  011b 725f50c6      	clr	_CLK_CKDIVR
2822                     ; 89         CLK_SWCR&=(~0x02); //关闭切换
2824  011f 721350c5      	bres	_CLK_SWCR,#1
2825                     ; 90         for(i=0;i<20;i++)
2827  0123 0f01          	clr	(OFST+0,sp)
2828  0125               L1671:
2829                     ; 92 						LED_PORT^=0x20;
2831  0125 c65005        	ld	a,_PB_ODR
2832  0128 a820          	xor	a,	#32
2833  012a c75005        	ld	_PB_ODR,a
2834                     ; 93 						delay_ms(500);
2836  012d ae01f4        	ldw	x,#500
2837  0130 cd000d        	call	_delay_ms
2839                     ; 90         for(i=0;i<20;i++)
2841  0133 0c01          	inc	(OFST+0,sp)
2844  0135 7b01          	ld	a,(OFST+0,sp)
2845  0137 a114          	cp	a,#20
2846  0139 25ea          	jrult	L1671
2847                     ; 95 			  LED_PORT|=0x20;//熄灭LED以区别
2849  013b 721a5005      	bset	_PB_ODR,#5
2850                     ; 96 				delay_ms(500);
2852  013f ae01f4        	ldw	x,#500
2853  0142 cd000d        	call	_delay_ms
2855                     ; 97 				delay_ms(500);
2857  0145 ae01f4        	ldw	x,#500
2858  0148 cd000d        	call	_delay_ms
2860                     ; 98 				delay_ms(500);
2862  014b ae01f4        	ldw	x,#500
2863  014e cd000d        	call	_delay_ms
2865                     ; 99 				delay_ms(500);
2867  0151 ae01f4        	ldw	x,#500
2868  0154 cd000d        	call	_delay_ms
2871  0157 ac7b007b      	jpf	L5071
2884                     	xdef	_main
2885                     	xdef	_delay_ms
2886                     	xdef	_Init_GPIO
2905                     	end
