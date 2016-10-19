   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2424                     	bsct
2425  0000               _HexTable:
2426  0000 30            	dc.b	48
2427  0001 31            	dc.b	49
2428  0002 32            	dc.b	50
2429  0003 33            	dc.b	51
2430  0004 34            	dc.b	52
2431  0005 35            	dc.b	53
2432  0006 36            	dc.b	54
2433  0007 37            	dc.b	55
2434  0008 38            	dc.b	56
2435  0009 39            	dc.b	57
2436  000a 41            	dc.b	65
2437  000b 42            	dc.b	66
2438  000c 43            	dc.b	67
2439  000d 44            	dc.b	68
2440  000e 45            	dc.b	69
2441  000f 46            	dc.b	70
2473                     ; 7 void Init_AD(void)
2473                     ; 8 {
2475                     	switch	.text
2476  0000               _Init_AD:
2480                     ; 9 		ADC_CSR=0x03; //选择通道AIN3/PD2
2482  0000 35035400      	mov	_ADC_CSR,#3
2483                     ; 10 		ADC_CR2|=0x08; // 数据排列,右对齐
2485  0004 72165402      	bset	_ADC_CR2,#3
2486                     ; 11 		ADC_TDRL=0x01;
2488  0008 35015407      	mov	_ADC_TDRL,#1
2489                     ; 12 }
2492  000c 81            	ret
2520                     ; 13 void Init_UART1(void)
2520                     ; 14 {
2521                     	switch	.text
2522  000d               _Init_UART1:
2526                     ; 15       UART1_CR1=0x00;
2528  000d 725f5234      	clr	_UART1_CR1
2529                     ; 16       UART1_CR2=0x00;
2531  0011 725f5235      	clr	_UART1_CR2
2532                     ; 17       UART1_CR3=0x00;
2534  0015 725f5236      	clr	_UART1_CR3
2535                     ; 26       UART1_BRR2=0x00;
2537  0019 725f5233      	clr	_UART1_BRR2
2538                     ; 27       UART1_BRR1=0x0d;
2540  001d 350d5232      	mov	_UART1_BRR1,#13
2541                     ; 29       UART1_CR2=0x2c;//允许接收，发送，开接收中断
2543  0021 352c5235      	mov	_UART1_CR2,#44
2544                     ; 30 }
2547  0025 81            	ret
2583                     ; 31 void UART1_sendchar(unsigned char c)
2583                     ; 32 {
2584                     	switch	.text
2585  0026               _UART1_sendchar:
2587  0026 88            	push	a
2588       00000000      OFST:	set	0
2591  0027               L1361:
2592                     ; 33       while((UART1_SR & 0x80)==0x00);
2594  0027 c65230        	ld	a,_UART1_SR
2595  002a a580          	bcp	a,#128
2596  002c 27f9          	jreq	L1361
2597                     ; 34       UART1_DR=c;
2599  002e 7b01          	ld	a,(OFST+1,sp)
2600  0030 c75231        	ld	_UART1_DR,a
2601                     ; 35 }
2604  0033 84            	pop	a
2605  0034 81            	ret
2641                     ; 36 void UART1_sendhex(unsigned char dat)
2641                     ; 37 {
2642                     	switch	.text
2643  0035               _UART1_sendhex:
2645  0035 88            	push	a
2646       00000000      OFST:	set	0
2649                     ; 38 		UART1_sendchar('0');
2651  0036 a630          	ld	a,#48
2652  0038 adec          	call	_UART1_sendchar
2654                     ; 39 		UART1_sendchar('x');
2656  003a a678          	ld	a,#120
2657  003c ade8          	call	_UART1_sendchar
2659                     ; 40 		UART1_sendchar(HexTable[dat>>4]);
2661  003e 7b01          	ld	a,(OFST+1,sp)
2662  0040 4e            	swap	a
2663  0041 a40f          	and	a,#15
2664  0043 5f            	clrw	x
2665  0044 97            	ld	xl,a
2666  0045 e600          	ld	a,(_HexTable,x)
2667  0047 addd          	call	_UART1_sendchar
2669                     ; 41 		UART1_sendchar(HexTable[dat&0x0f]);
2671  0049 7b01          	ld	a,(OFST+1,sp)
2672  004b a40f          	and	a,#15
2673  004d 5f            	clrw	x
2674  004e 97            	ld	xl,a
2675  004f e600          	ld	a,(_HexTable,x)
2676  0051 add3          	call	_UART1_sendchar
2678                     ; 42 		UART1_sendchar(' ');
2680  0053 a620          	ld	a,#32
2681  0055 adcf          	call	_UART1_sendchar
2683                     ; 43 }
2686  0057 84            	pop	a
2687  0058 81            	ret
2723                     ; 44 void UART1_sendstr(unsigned char *dat)
2723                     ; 45 {
2724                     	switch	.text
2725  0059               _UART1_sendstr:
2727  0059 89            	pushw	x
2728       00000000      OFST:	set	0
2731  005a 200c          	jra	L3761
2732  005c               L1761:
2733                     ; 48 				UART1_sendchar(*dat);
2735  005c 1e01          	ldw	x,(OFST+1,sp)
2736  005e f6            	ld	a,(x)
2737  005f adc5          	call	_UART1_sendchar
2739                     ; 49 				dat++;
2741  0061 1e01          	ldw	x,(OFST+1,sp)
2742  0063 1c0001        	addw	x,#1
2743  0066 1f01          	ldw	(OFST+1,sp),x
2744  0068               L3761:
2745                     ; 46 		while(*dat!='\0')
2747  0068 1e01          	ldw	x,(OFST+1,sp)
2748  006a 7d            	tnz	(x)
2749  006b 26ef          	jrne	L1761
2750                     ; 52 }
2753  006d 85            	popw	x
2754  006e 81            	ret
2796                     ; 54 main()
2796                     ; 55 {
2797                     	switch	.text
2798  006f               _main:
2800  006f 89            	pushw	x
2801       00000002      OFST:	set	2
2804                     ; 56 		int i=0;
2806  0070 5f            	clrw	x
2807  0071 1f01          	ldw	(OFST-1,sp),x
2808                     ; 57 		Init_UART1();
2810  0073 ad98          	call	_Init_UART1
2812                     ; 58 		Init_AD();
2814  0075 ad89          	call	_Init_AD
2816  0077               L5171:
2817                     ; 61 				ADC_CR1|=0x01;
2819  0077 72105401      	bset	_ADC_CR1,#0
2820                     ; 62 				for(i=0;i<100;i++); // 延时一段时间，至少7uS，保证ADC 模块上电王城
2822  007b 5f            	clrw	x
2823  007c 1f01          	ldw	(OFST-1,sp),x
2824  007e               L1271:
2828  007e 1e01          	ldw	x,(OFST-1,sp)
2829  0080 1c0001        	addw	x,#1
2830  0083 1f01          	ldw	(OFST-1,sp),x
2833  0085 9c            	rvf
2834  0086 1e01          	ldw	x,(OFST-1,sp)
2835  0088 a30064        	cpw	x,#100
2836  008b 2ff1          	jrslt	L1271
2837                     ; 63 				ADC_CR1|=0x01;      // 再次将CR1寄存器的最低位置1,开启AD转换
2839  008d 72105401      	bset	_ADC_CR1,#0
2841  0091               L1371:
2842                     ; 65 				while((ADC_CSR & 0x80)!=0x80); // 等待转换结束
2844  0091 c65400        	ld	a,_ADC_CSR
2845  0094 a480          	and	a,#128
2846  0096 a180          	cp	a,#128
2847  0098 26f7          	jrne	L1371
2848                     ; 68 				UART1_sendhex(ADC_DRH);
2850  009a c65404        	ld	a,_ADC_DRH
2851  009d ad96          	call	_UART1_sendhex
2853                     ; 69 				UART1_sendhex(ADC_DRL);
2855  009f c65405        	ld	a,_ADC_DRL
2856  00a2 ad91          	call	_UART1_sendhex
2858                     ; 70 				UART1_sendstr("\r\n");
2860  00a4 ae0000        	ldw	x,#L5371
2861  00a7 adb0          	call	_UART1_sendstr
2863                     ; 71 				ADC_CSR&=(~0x80);
2865  00a9 721f5400      	bres	_ADC_CSR,#7
2867  00ad 20c8          	jra	L5171
2892                     	xdef	_main
2893                     	xdef	_UART1_sendstr
2894                     	xdef	_UART1_sendhex
2895                     	xdef	_UART1_sendchar
2896                     	xdef	_Init_UART1
2897                     	xdef	_Init_AD
2898                     	xdef	_HexTable
2899                     .const:	section	.text
2900  0000               L5371:
2901  0000 0d0a00        	dc.b	13,10,0
2921                     	end
