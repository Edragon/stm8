   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2806                     ; 8 void Init_GPIO(void)
2806                     ; 9 {
2808                     	switch	.text
2809  0000               _Init_GPIO:
2813                     ; 10        PE_DDR = 0x20;
2815  0000 35205016      	mov	_PE_DDR,#32
2816                     ; 11        PE_CR1 = 0x20; 
2818  0004 35205017      	mov	_PE_CR1,#32
2819                     ; 12        PE_CR2 = 0x00;
2821  0008 725f5018      	clr	_PE_CR2
2822                     ; 13 }
2825  000c 81            	ret
2868                     ; 14 void delay_ms(unsigned int ms)
2868                     ; 15 {
2869                     	switch	.text
2870  000d               _delay_ms:
2872  000d 89            	pushw	x
2873  000e 88            	push	a
2874       00000001      OFST:	set	1
2877  000f 201b          	jra	L5202
2878  0011               L3202:
2879                     ; 19               for(i=0;i<250;i++)
2881  0011 0f01          	clr	(OFST+0,sp)
2882  0013               L1302:
2885  0013 0c01          	inc	(OFST+0,sp)
2888  0015 7b01          	ld	a,(OFST+0,sp)
2889  0017 a1fa          	cp	a,#250
2890  0019 25f8          	jrult	L1302
2891                     ; 21               for(i=0;i<75;i++)
2893  001b 0f01          	clr	(OFST+0,sp)
2894  001d               L7302:
2897  001d 0c01          	inc	(OFST+0,sp)
2900  001f 7b01          	ld	a,(OFST+0,sp)
2901  0021 a14b          	cp	a,#75
2902  0023 25f8          	jrult	L7302
2903                     ; 23               ms--;
2905  0025 1e02          	ldw	x,(OFST+1,sp)
2906  0027 1d0001        	subw	x,#1
2907  002a 1f02          	ldw	(OFST+1,sp),x
2908  002c               L5202:
2909                     ; 17        while(ms!=0)
2911  002c 1e02          	ldw	x,(OFST+1,sp)
2912  002e 26e1          	jrne	L3202
2913                     ; 25 }
2916  0030 5b03          	addw	sp,#3
2917  0032 81            	ret
2958                     ; 27 main()
2958                     ; 28 {
2959                     	switch	.text
2960  0033               _main:
2962  0033 88            	push	a
2963       00000001      OFST:	set	1
2966                     ; 30 		Init_GPIO();   //初始化I/O
2968  0034 adca          	call	_Init_GPIO
2970                     ; 32 		CLK_ICKR|=0x01;      //开启内部HSI
2972  0036 721050c0      	bset	_CLK_ICKR,#0
2974  003a               L5602:
2975                     ; 33 		while(!(CLK_ICKR&0x02));//HSI准备就绪
2977  003a c650c0        	ld	a,_CLK_ICKR
2978  003d a502          	bcp	a,#2
2979  003f 27f9          	jreq	L5602
2980                     ; 34 		CLK_SWR=0xe1;        //HSI为主时钟源
2982  0041 35e150c4      	mov	_CLK_SWR,#225
2983                     ; 35 		CLK_CKDIVR=0x00;     //HSI不分频
2985  0045 725f50c6      	clr	_CLK_CKDIVR
2986                     ; 36 		for(i=0;i<10;i++)    //闪烁LED
2988  0049 0f01          	clr	(OFST+0,sp)
2989  004b               L1702:
2990                     ; 38 				LED_PORT^=0x20;
2992  004b c65014        	ld	a,_PE_ODR
2993  004e a820          	xor	a,	#32
2994  0050 c75014        	ld	_PE_ODR,a
2995                     ; 39 				delay_ms(500);
2997  0053 ae01f4        	ldw	x,#500
2998  0056 adb5          	call	_delay_ms
3000                     ; 36 		for(i=0;i<10;i++)    //闪烁LED
3002  0058 0c01          	inc	(OFST+0,sp)
3005  005a 7b01          	ld	a,(OFST+0,sp)
3006  005c a10a          	cp	a,#10
3007  005e 25eb          	jrult	L1702
3008                     ; 42 		CLK_CKDIVR=0x18;   //HSI8分频，2M，复位后的默认值
3010  0060 351850c6      	mov	_CLK_CKDIVR,#24
3011                     ; 43 		for(i=0;i<10;i++)   //闪烁LED
3013  0064 0f01          	clr	(OFST+0,sp)
3014  0066               L7702:
3015                     ; 45 				LED_PORT^=0x20;
3017  0066 c65014        	ld	a,_PE_ODR
3018  0069 a820          	xor	a,	#32
3019  006b c75014        	ld	_PE_ODR,a
3020                     ; 46 				delay_ms(500);
3022  006e ae01f4        	ldw	x,#500
3023  0071 ad9a          	call	_delay_ms
3025                     ; 43 		for(i=0;i<10;i++)   //闪烁LED
3027  0073 0c01          	inc	(OFST+0,sp)
3030  0075 7b01          	ld	a,(OFST+0,sp)
3031  0077 a10a          	cp	a,#10
3032  0079 25eb          	jrult	L7702
3033  007b               L5012:
3034                     ; 53         CLK_SWCR|=0x02; //开启切换
3036  007b 721250c5      	bset	_CLK_SWCR,#1
3037                     ; 54         CLK_ICKR|=0x01;      //开启内部HSI
3039  007f 721050c0      	bset	_CLK_ICKR,#0
3041  0083               L3112:
3042                     ; 55 				while(!(CLK_ICKR&0x02));//HSI准备就绪
3044  0083 c650c0        	ld	a,_CLK_ICKR
3045  0086 a502          	bcp	a,#2
3046  0088 27f9          	jreq	L3112
3047                     ; 56 				CLK_SWR=0xe1;        //HSI为主时钟源
3049  008a 35e150c4      	mov	_CLK_SWR,#225
3051  008e               L3212:
3052                     ; 57         while((CLK_SWCR & 0x01)==0x01);//等待切换完成
3054  008e c650c5        	ld	a,_CLK_SWCR
3055  0091 a401          	and	a,#1
3056  0093 a101          	cp	a,#1
3057  0095 27f7          	jreq	L3212
3058                     ; 58         CLK_CKDIVR=0x00;     //HSI不分频
3060  0097 725f50c6      	clr	_CLK_CKDIVR
3061                     ; 59         CLK_SWCR&=(~0x02); //关闭切换
3063  009b 721350c5      	bres	_CLK_SWCR,#1
3064                     ; 60         for(i=0;i<20;i++)
3066  009f 0f01          	clr	(OFST+0,sp)
3067  00a1               L7212:
3068                     ; 62 						LED_PORT^=0x20;
3070  00a1 c65014        	ld	a,_PE_ODR
3071  00a4 a820          	xor	a,	#32
3072  00a6 c75014        	ld	_PE_ODR,a
3073                     ; 63 						delay_ms(500);
3075  00a9 ae01f4        	ldw	x,#500
3076  00ac cd000d        	call	_delay_ms
3078                     ; 60         for(i=0;i<20;i++)
3080  00af 0c01          	inc	(OFST+0,sp)
3083  00b1 7b01          	ld	a,(OFST+0,sp)
3084  00b3 a114          	cp	a,#20
3085  00b5 25ea          	jrult	L7212
3086                     ; 65 				LED_PORT|=0x20;//熄灭LED以区别
3088  00b7 721a5014      	bset	_PE_ODR,#5
3089                     ; 66 				delay_ms(500);
3091  00bb ae01f4        	ldw	x,#500
3092  00be cd000d        	call	_delay_ms
3094                     ; 67 				delay_ms(500);
3096  00c1 ae01f4        	ldw	x,#500
3097  00c4 cd000d        	call	_delay_ms
3099                     ; 68 				delay_ms(500);
3101  00c7 ae01f4        	ldw	x,#500
3102  00ca cd000d        	call	_delay_ms
3104                     ; 69 				delay_ms(500);
3106  00cd ae01f4        	ldw	x,#500
3107  00d0 cd000d        	call	_delay_ms
3109                     ; 71         CLK_CKDIVR=0x18;
3111  00d3 351850c6      	mov	_CLK_CKDIVR,#24
3112                     ; 72         for(i=0;i<20;i++)
3114  00d7 0f01          	clr	(OFST+0,sp)
3115  00d9               L5312:
3116                     ; 74 						LED_PORT^=0x20;
3118  00d9 c65014        	ld	a,_PE_ODR
3119  00dc a820          	xor	a,	#32
3120  00de c75014        	ld	_PE_ODR,a
3121                     ; 75 						delay_ms(500);
3123  00e1 ae01f4        	ldw	x,#500
3124  00e4 cd000d        	call	_delay_ms
3126                     ; 72         for(i=0;i<20;i++)
3128  00e7 0c01          	inc	(OFST+0,sp)
3131  00e9 7b01          	ld	a,(OFST+0,sp)
3132  00eb a114          	cp	a,#20
3133  00ed 25ea          	jrult	L5312
3134                     ; 77 				LED_PORT|=0x20;//熄灭LED以区别
3136  00ef 721a5014      	bset	_PE_ODR,#5
3137                     ; 78 				delay_ms(500);
3139  00f3 ae01f4        	ldw	x,#500
3140  00f6 cd000d        	call	_delay_ms
3142                     ; 79 				delay_ms(500);
3144  00f9 ae01f4        	ldw	x,#500
3145  00fc cd000d        	call	_delay_ms
3147                     ; 82         CLK_SWCR|=0x02; //开启切换
3149  00ff 721250c5      	bset	_CLK_SWCR,#1
3150                     ; 83         CLK_ICKR|=0x08; //开启LSI
3152  0103 721650c0      	bset	_CLK_ICKR,#3
3154  0107               L5412:
3155                     ; 84 				while(!(CLK_ICKR&0x10));//HSI准备就绪
3157  0107 c650c0        	ld	a,_CLK_ICKR
3158  010a a510          	bcp	a,#16
3159  010c 27f9          	jreq	L5412
3160                     ; 85 				CLK_SWR=0xd2;   //LSR为主时钟源
3162  010e 35d250c4      	mov	_CLK_SWR,#210
3164  0112               L5512:
3165                     ; 86         while((CLK_SWCR & 0x01)==0x01);//等待切换完成
3167  0112 c650c5        	ld	a,_CLK_SWCR
3168  0115 a401          	and	a,#1
3169  0117 a101          	cp	a,#1
3170  0119 27f7          	jreq	L5512
3171                     ; 87         CLK_CKDIVR=0x00;   //LSI不分频
3173  011b 725f50c6      	clr	_CLK_CKDIVR
3174                     ; 88         CLK_SWCR&=(~0x02); //关闭切换
3176  011f 721350c5      	bres	_CLK_SWCR,#1
3177                     ; 89         for(i=0;i<20;i++)
3179  0123 0f01          	clr	(OFST+0,sp)
3180  0125               L1612:
3181                     ; 91 						LED_PORT^=0x20;
3183  0125 c65014        	ld	a,_PE_ODR
3184  0128 a820          	xor	a,	#32
3185  012a c75014        	ld	_PE_ODR,a
3186                     ; 92 						delay_ms(500);
3188  012d ae01f4        	ldw	x,#500
3189  0130 cd000d        	call	_delay_ms
3191                     ; 89         for(i=0;i<20;i++)
3193  0133 0c01          	inc	(OFST+0,sp)
3196  0135 7b01          	ld	a,(OFST+0,sp)
3197  0137 a114          	cp	a,#20
3198  0139 25ea          	jrult	L1612
3199                     ; 94 			  LED_PORT|=0x20;//熄灭LED以区别
3201  013b 721a5014      	bset	_PE_ODR,#5
3202                     ; 95 				delay_ms(500);
3204  013f ae01f4        	ldw	x,#500
3205  0142 cd000d        	call	_delay_ms
3207                     ; 96 				delay_ms(500);
3209  0145 ae01f4        	ldw	x,#500
3210  0148 cd000d        	call	_delay_ms
3212                     ; 97 				delay_ms(500);
3214  014b ae01f4        	ldw	x,#500
3215  014e cd000d        	call	_delay_ms
3217                     ; 98 				delay_ms(500);
3219  0151 ae01f4        	ldw	x,#500
3220  0154 cd000d        	call	_delay_ms
3223  0157 ac7b007b      	jpf	L5012
3236                     	xdef	_main
3237                     	xdef	_delay_ms
3238                     	xdef	_Init_GPIO
3257                     	end
