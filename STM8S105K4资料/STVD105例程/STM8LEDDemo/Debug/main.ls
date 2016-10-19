   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2827                     ; 8 main()
2827                     ; 9 {
2829                     	switch	.text
2830  0000               _main:
2832  0000 5204          	subw	sp,#4
2833       00000004      OFST:	set	4
2836                     ; 11 	  PE_DDR|=0x20;
2838  0002 721a5016      	bset	_PE_DDR,#5
2839                     ; 12 	  PE_CR1|=0x20;
2841  0006 721a5017      	bset	_PE_CR1,#5
2842                     ; 13 	  PE_CR2|=0x00;
2844  000a c65018        	ld	a,_PE_CR2
2845  000d 97            	ld	xl,a
2846  000e               L3102:
2847                     ; 19 				PE_ODR^=0xf0;
2849  000e c65014        	ld	a,_PE_ODR
2850  0011 a8f0          	xor	a,	#240
2851  0013 c75014        	ld	_PE_ODR,a
2852                     ; 20 				for(i=0;i<200;i++)
2854  0016 5f            	clrw	x
2855  0017 1f01          	ldw	(OFST-3,sp),x
2856  0019               L7102:
2857                     ; 21 				    for(j=0;j<200;j++);
2859  0019 5f            	clrw	x
2860  001a 1f03          	ldw	(OFST-1,sp),x
2861  001c               L5202:
2865  001c 1e03          	ldw	x,(OFST-1,sp)
2866  001e 1c0001        	addw	x,#1
2867  0021 1f03          	ldw	(OFST-1,sp),x
2870  0023 9c            	rvf
2871  0024 1e03          	ldw	x,(OFST-1,sp)
2872  0026 a300c8        	cpw	x,#200
2873  0029 2ff1          	jrslt	L5202
2874                     ; 20 				for(i=0;i<200;i++)
2876  002b 1e01          	ldw	x,(OFST-3,sp)
2877  002d 1c0001        	addw	x,#1
2878  0030 1f01          	ldw	(OFST-3,sp),x
2881  0032 9c            	rvf
2882  0033 1e01          	ldw	x,(OFST-3,sp)
2883  0035 a300c8        	cpw	x,#200
2884  0038 2fdf          	jrslt	L7102
2886  003a 20d2          	jra	L3102
2899                     	xdef	_main
2918                     	end
