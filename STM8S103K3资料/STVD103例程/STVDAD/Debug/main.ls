   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2534                     	bsct
2535  0000               _HexTable:
2536  0000 30            	dc.b	48
2537  0001 31            	dc.b	49
2538  0002 32            	dc.b	50
2539  0003 33            	dc.b	51
2540  0004 34            	dc.b	52
2541  0005 35            	dc.b	53
2542  0006 36            	dc.b	54
2543  0007 37            	dc.b	55
2544  0008 38            	dc.b	56
2545  0009 39            	dc.b	57
2546  000a 41            	dc.b	65
2547  000b 42            	dc.b	66
2548  000c 43            	dc.b	67
2549  000d 44            	dc.b	68
2550  000e 45            	dc.b	69
2551  000f 46            	dc.b	70
2583                     ; 7 void Init_AD(void)
2583                     ; 8 {
2585                     	switch	.text
2586  0000               _Init_AD:
2590                     ; 9 		ADC_CSR=0x03; //选择通道AIN3/PD2
2592  0000 35035400      	mov	_ADC_CSR,#3
2593                     ; 10 		ADC_CR2|=0x08; // 数据排列,右对齐
2595  0004 72165402      	bset	_ADC_CR2,#3
2596                     ; 11 		ADC_TDRL=0x01;
2598  0008 35015407      	mov	_ADC_TDRL,#1
2599                     ; 12 }
2602  000c 81            	ret
2630                     ; 13 void Init_UART1(void)
2630                     ; 14 {
2631                     	switch	.text
2632  000d               _Init_UART1:
2636                     ; 15       UART1_CR1=0x00;
2638  000d 725f5234      	clr	_UART1_CR1
2639                     ; 16       UART1_CR2=0x00;
2641  0011 725f5235      	clr	_UART1_CR2
2642                     ; 17       UART1_CR3=0x00;
2644  0015 725f5236      	clr	_UART1_CR3
2645                     ; 26       UART1_BRR2=0x00;
2647  0019 725f5233      	clr	_UART1_BRR2
2648                     ; 27       UART1_BRR1=0x0d;
2650  001d 350d5232      	mov	_UART1_BRR1,#13
2651                     ; 29       UART1_CR2=0x2c;//允许接收，发送，开接收中断
2653  0021 352c5235      	mov	_UART1_CR2,#44
2654                     ; 30 }
2657  0025 81            	ret
2693                     ; 31 void UART1_sendchar(unsigned char c)
2693                     ; 32 {
2694                     	switch	.text
2695  0026               _UART1_sendchar:
2697  0026 88            	push	a
2698       00000000      OFST:	set	0
2701  0027               L1071:
2702                     ; 33       while((UART1_SR & 0x80)==0x00);
2704  0027 c65230        	ld	a,_UART1_SR
2705  002a a580          	bcp	a,#128
2706  002c 27f9          	jreq	L1071
2707                     ; 34       UART1_DR=c;
2709  002e 7b01          	ld	a,(OFST+1,sp)
2710  0030 c75231        	ld	_UART1_DR,a
2711                     ; 35 }
2714  0033 84            	pop	a
2715  0034 81            	ret
2751                     ; 36 void UART1_sendhex(unsigned char dat)
2751                     ; 37 {
2752                     	switch	.text
2753  0035               _UART1_sendhex:
2755  0035 88            	push	a
2756       00000000      OFST:	set	0
2759                     ; 38 		UART1_sendchar('0');
2761  0036 a630          	ld	a,#48
2762  0038 adec          	call	_UART1_sendchar
2764                     ; 39 		UART1_sendchar('x');
2766  003a a678          	ld	a,#120
2767  003c ade8          	call	_UART1_sendchar
2769                     ; 40 		UART1_sendchar(HexTable[dat>>4]);
2771  003e 7b01          	ld	a,(OFST+1,sp)
2772  0040 4e            	swap	a
2773  0041 a40f          	and	a,#15
2774  0043 5f            	clrw	x
2775  0044 97            	ld	xl,a
2776  0045 e600          	ld	a,(_HexTable,x)
2777  0047 addd          	call	_UART1_sendchar
2779                     ; 41 		UART1_sendchar(HexTable[dat&0x0f]);
2781  0049 7b01          	ld	a,(OFST+1,sp)
2782  004b a40f          	and	a,#15
2783  004d 5f            	clrw	x
2784  004e 97            	ld	xl,a
2785  004f e600          	ld	a,(_HexTable,x)
2786  0051 add3          	call	_UART1_sendchar
2788                     ; 42 		UART1_sendchar(' ');
2790  0053 a620          	ld	a,#32
2791  0055 adcf          	call	_UART1_sendchar
2793                     ; 43 }
2796  0057 84            	pop	a
2797  0058 81            	ret
2833                     ; 44 void UART1_sendstr(unsigned char *dat)
2833                     ; 45 {
2834                     	switch	.text
2835  0059               _UART1_sendstr:
2837  0059 89            	pushw	x
2838       00000000      OFST:	set	0
2841  005a 200c          	jra	L3471
2842  005c               L1471:
2843                     ; 48 				UART1_sendchar(*dat);
2845  005c 1e01          	ldw	x,(OFST+1,sp)
2846  005e f6            	ld	a,(x)
2847  005f adc5          	call	_UART1_sendchar
2849                     ; 49 				dat++;
2851  0061 1e01          	ldw	x,(OFST+1,sp)
2852  0063 1c0001        	addw	x,#1
2853  0066 1f01          	ldw	(OFST+1,sp),x
2854  0068               L3471:
2855                     ; 46 		while(*dat!='\0')
2857  0068 1e01          	ldw	x,(OFST+1,sp)
2858  006a 7d            	tnz	(x)
2859  006b 26ef          	jrne	L1471
2860                     ; 52 }
2863  006d 85            	popw	x
2864  006e 81            	ret
2906                     ; 54 main()
2906                     ; 55 {
2907                     	switch	.text
2908  006f               _main:
2910  006f 89            	pushw	x
2911       00000002      OFST:	set	2
2914                     ; 56 		int i=0;
2916  0070 5f            	clrw	x
2917  0071 1f01          	ldw	(OFST-1,sp),x
2918                     ; 57 		Init_UART1();
2920  0073 ad98          	call	_Init_UART1
2922                     ; 58 		Init_AD();
2924  0075 ad89          	call	_Init_AD
2926  0077               L5671:
2927                     ; 61 				ADC_CR1|=0x01;
2929  0077 72105401      	bset	_ADC_CR1,#0
2930                     ; 62 				for(i=0;i<100;i++); // 延时一段时间，至少7uS，保证ADC 模块上电王城
2932  007b 5f            	clrw	x
2933  007c 1f01          	ldw	(OFST-1,sp),x
2934  007e               L1771:
2938  007e 1e01          	ldw	x,(OFST-1,sp)
2939  0080 1c0001        	addw	x,#1
2940  0083 1f01          	ldw	(OFST-1,sp),x
2943  0085 9c            	rvf
2944  0086 1e01          	ldw	x,(OFST-1,sp)
2945  0088 a30064        	cpw	x,#100
2946  008b 2ff1          	jrslt	L1771
2947                     ; 63 				ADC_CR1|=0x01;      // 再次将CR1寄存器的最低位置1,开启AD转换
2949  008d 72105401      	bset	_ADC_CR1,#0
2951  0091               L1002:
2952                     ; 65 				while((ADC_CSR & 0x80)!=0x80); // 等待转换结束
2954  0091 c65400        	ld	a,_ADC_CSR
2955  0094 a480          	and	a,#128
2956  0096 a180          	cp	a,#128
2957  0098 26f7          	jrne	L1002
2958                     ; 68 				UART1_sendhex(ADC_DRH);
2960  009a c65404        	ld	a,_ADC_DRH
2961  009d ad96          	call	_UART1_sendhex
2963                     ; 69 				UART1_sendhex(ADC_DRL);
2965  009f c65405        	ld	a,_ADC_DRL
2966  00a2 ad91          	call	_UART1_sendhex
2968                     ; 70 				UART1_sendstr("\r\n");
2970  00a4 ae0000        	ldw	x,#L5002
2971  00a7 adb0          	call	_UART1_sendstr
2973                     ; 71 				ADC_CSR&=(~0x80);
2975  00a9 721f5400      	bres	_ADC_CSR,#7
2977  00ad 20c8          	jra	L5671
3002                     	xdef	_main
3003                     	xdef	_UART1_sendstr
3004                     	xdef	_UART1_sendhex
3005                     	xdef	_UART1_sendchar
3006                     	xdef	_Init_UART1
3007                     	xdef	_Init_AD
3008                     	xdef	_HexTable
3009                     .const:	section	.text
3010  0000               L5002:
3011  0000 0d0a00        	dc.b	13,10,0
3031                     	end
