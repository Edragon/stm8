   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2776                     	bsct
2777  0000               _HexTable:
2778  0000 30            	dc.b	48
2779  0001 31            	dc.b	49
2780  0002 32            	dc.b	50
2781  0003 33            	dc.b	51
2782  0004 34            	dc.b	52
2783  0005 35            	dc.b	53
2784  0006 36            	dc.b	54
2785  0007 37            	dc.b	55
2786  0008 38            	dc.b	56
2787  0009 39            	dc.b	57
2788  000a 41            	dc.b	65
2789  000b 42            	dc.b	66
2790  000c 43            	dc.b	67
2791  000d 44            	dc.b	68
2792  000e 45            	dc.b	69
2793  000f 46            	dc.b	70
2825                     ; 7 void Init_AD(void)
2825                     ; 8 {
2827                     	switch	.text
2828  0000               _Init_AD:
2832                     ; 9 		ADC_CSR=0x00; //选择通道
2834  0000 725f5400      	clr	_ADC_CSR
2835                     ; 10 		ADC_CR2|=0x08; // 数据排列,右对齐
2837  0004 72165402      	bset	_ADC_CR2,#3
2838                     ; 11 		ADC_TDRL=0x01;
2840  0008 35015407      	mov	_ADC_TDRL,#1
2841                     ; 12 }
2844  000c 81            	ret
2872                     ; 13 void Init_UART2(void)
2872                     ; 14 {
2873                     	switch	.text
2874  000d               _Init_UART2:
2878                     ; 15       UART2_CR1=0x00;
2880  000d 725f5244      	clr	_UART2_CR1
2881                     ; 16       UART2_CR2=0x00;
2883  0011 725f5245      	clr	_UART2_CR2
2884                     ; 17       UART2_CR3=0x00;
2886  0015 725f5246      	clr	_UART2_CR3
2887                     ; 26       UART2_BRR2=0x00;
2889  0019 725f5243      	clr	_UART2_BRR2
2890                     ; 27       UART2_BRR1=0x0d;
2892  001d 350d5242      	mov	_UART2_BRR1,#13
2893                     ; 29       UART2_CR2=0x2c;//允许接收，发送，开接收中断
2895  0021 352c5245      	mov	_UART2_CR2,#44
2896                     ; 30 }
2899  0025 81            	ret
2935                     ; 31 void UART2_sendchar(unsigned char c)
2935                     ; 32 {
2936                     	switch	.text
2937  0026               _UART2_sendchar:
2939  0026 88            	push	a
2940       00000000      OFST:	set	0
2943  0027               L1302:
2944                     ; 33       while((UART2_SR & 0x80)==0x00);
2946  0027 c65240        	ld	a,_UART2_SR
2947  002a a580          	bcp	a,#128
2948  002c 27f9          	jreq	L1302
2949                     ; 34       UART2_DR=c;
2951  002e 7b01          	ld	a,(OFST+1,sp)
2952  0030 c75241        	ld	_UART2_DR,a
2953                     ; 35 }
2956  0033 84            	pop	a
2957  0034 81            	ret
2993                     ; 36 void UART2_sendhex(unsigned char dat)
2993                     ; 37 {
2994                     	switch	.text
2995  0035               _UART2_sendhex:
2997  0035 88            	push	a
2998       00000000      OFST:	set	0
3001                     ; 38 		UART2_sendchar('0');
3003  0036 a630          	ld	a,#48
3004  0038 adec          	call	_UART2_sendchar
3006                     ; 39 		UART2_sendchar('x');
3008  003a a678          	ld	a,#120
3009  003c ade8          	call	_UART2_sendchar
3011                     ; 40 		UART2_sendchar(HexTable[dat>>4]);
3013  003e 7b01          	ld	a,(OFST+1,sp)
3014  0040 4e            	swap	a
3015  0041 a40f          	and	a,#15
3016  0043 5f            	clrw	x
3017  0044 97            	ld	xl,a
3018  0045 e600          	ld	a,(_HexTable,x)
3019  0047 addd          	call	_UART2_sendchar
3021                     ; 41 		UART2_sendchar(HexTable[dat&0x0f]);
3023  0049 7b01          	ld	a,(OFST+1,sp)
3024  004b a40f          	and	a,#15
3025  004d 5f            	clrw	x
3026  004e 97            	ld	xl,a
3027  004f e600          	ld	a,(_HexTable,x)
3028  0051 add3          	call	_UART2_sendchar
3030                     ; 42 		UART2_sendchar(' ');
3032  0053 a620          	ld	a,#32
3033  0055 adcf          	call	_UART2_sendchar
3035                     ; 43 }
3038  0057 84            	pop	a
3039  0058 81            	ret
3075                     ; 44 void UART2_sendstr(unsigned char *dat)
3075                     ; 45 {
3076                     	switch	.text
3077  0059               _UART2_sendstr:
3079  0059 89            	pushw	x
3080       00000000      OFST:	set	0
3083  005a 200c          	jra	L3702
3084  005c               L1702:
3085                     ; 48 				UART2_sendchar(*dat);
3087  005c 1e01          	ldw	x,(OFST+1,sp)
3088  005e f6            	ld	a,(x)
3089  005f adc5          	call	_UART2_sendchar
3091                     ; 49 				dat++;
3093  0061 1e01          	ldw	x,(OFST+1,sp)
3094  0063 1c0001        	addw	x,#1
3095  0066 1f01          	ldw	(OFST+1,sp),x
3096  0068               L3702:
3097                     ; 46 		while(*dat!='\0')
3099  0068 1e01          	ldw	x,(OFST+1,sp)
3100  006a 7d            	tnz	(x)
3101  006b 26ef          	jrne	L1702
3102                     ; 52 }
3105  006d 85            	popw	x
3106  006e 81            	ret
3148                     ; 54 main()
3148                     ; 55 {
3149                     	switch	.text
3150  006f               _main:
3152  006f 89            	pushw	x
3153       00000002      OFST:	set	2
3156                     ; 56 		int i=0;
3158  0070 5f            	clrw	x
3159  0071 1f01          	ldw	(OFST-1,sp),x
3160                     ; 57 		Init_UART2();
3162  0073 ad98          	call	_Init_UART2
3164                     ; 58 		Init_AD();
3166  0075 ad89          	call	_Init_AD
3168  0077               L5112:
3169                     ; 61 				ADC_CR1|=0x01;
3171  0077 72105401      	bset	_ADC_CR1,#0
3172                     ; 62 				for(i=0;i<100;i++); // 延时一段时间，至少7uS，保证ADC 模块上电王城
3174  007b 5f            	clrw	x
3175  007c 1f01          	ldw	(OFST-1,sp),x
3176  007e               L1212:
3180  007e 1e01          	ldw	x,(OFST-1,sp)
3181  0080 1c0001        	addw	x,#1
3182  0083 1f01          	ldw	(OFST-1,sp),x
3185  0085 9c            	rvf
3186  0086 1e01          	ldw	x,(OFST-1,sp)
3187  0088 a30064        	cpw	x,#100
3188  008b 2ff1          	jrslt	L1212
3189                     ; 63 				ADC_CR1|=0x01;      // 再次将CR1寄存器的最低位置1,开启AD转换
3191  008d 72105401      	bset	_ADC_CR1,#0
3193  0091               L1312:
3194                     ; 65 				while((ADC_CSR & 0x80)!=0x80); // 等待转换结束
3196  0091 c65400        	ld	a,_ADC_CSR
3197  0094 a480          	and	a,#128
3198  0096 a180          	cp	a,#128
3199  0098 26f7          	jrne	L1312
3200                     ; 68 				UART2_sendhex(ADC_DRH);
3202  009a c65404        	ld	a,_ADC_DRH
3203  009d ad96          	call	_UART2_sendhex
3205                     ; 69 				UART2_sendhex(ADC_DRL);
3207  009f c65405        	ld	a,_ADC_DRL
3208  00a2 ad91          	call	_UART2_sendhex
3210                     ; 70 				UART2_sendstr("\r\n");
3212  00a4 ae0000        	ldw	x,#L5312
3213  00a7 adb0          	call	_UART2_sendstr
3215                     ; 71 				ADC_CSR&=(~0x80);
3217  00a9 721f5400      	bres	_ADC_CSR,#7
3219  00ad 20c8          	jra	L5112
3244                     	xdef	_main
3245                     	xdef	_UART2_sendstr
3246                     	xdef	_UART2_sendhex
3247                     	xdef	_UART2_sendchar
3248                     	xdef	_Init_UART2
3249                     	xdef	_Init_AD
3250                     	xdef	_HexTable
3251                     .const:	section	.text
3252  0000               L5312:
3253  0000 0d0a00        	dc.b	13,10,0
3273                     	end
