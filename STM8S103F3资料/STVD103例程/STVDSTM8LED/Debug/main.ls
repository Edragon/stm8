   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2475                     ; 8 main()
2475                     ; 9 {
2477                     	switch	.text
2478  0000               _main:
2480  0000 5204          	subw	sp,#4
2481       00000004      OFST:	set	4
2484                     ; 11 	  PB_DDR|=0x20;
2486  0002 721a5007      	bset	_PB_DDR,#5
2487                     ; 12 	  PB_CR1|=0x20;
2489  0006 721a5008      	bset	_PB_CR1,#5
2490                     ; 13 	  PB_CR2|=0x00;
2492  000a c65009        	ld	a,_PB_CR2
2493  000d 97            	ld	xl,a
2494  000e               L3161:
2495                     ; 19 				PB_ODR^=0xf0;
2497  000e c65005        	ld	a,_PB_ODR
2498  0011 a8f0          	xor	a,	#240
2499  0013 c75005        	ld	_PB_ODR,a
2500                     ; 20 				for(i=0;i<200;i++)
2502  0016 5f            	clrw	x
2503  0017 1f01          	ldw	(OFST-3,sp),x
2504  0019               L7161:
2505                     ; 21 				    for(j=0;j<200;j++);
2507  0019 5f            	clrw	x
2508  001a 1f03          	ldw	(OFST-1,sp),x
2509  001c               L5261:
2513  001c 1e03          	ldw	x,(OFST-1,sp)
2514  001e 1c0001        	addw	x,#1
2515  0021 1f03          	ldw	(OFST-1,sp),x
2518  0023 9c            	rvf
2519  0024 1e03          	ldw	x,(OFST-1,sp)
2520  0026 a300c8        	cpw	x,#200
2521  0029 2ff1          	jrslt	L5261
2522                     ; 20 				for(i=0;i<200;i++)
2524  002b 1e01          	ldw	x,(OFST-3,sp)
2525  002d 1c0001        	addw	x,#1
2526  0030 1f01          	ldw	(OFST-3,sp),x
2529  0032 9c            	rvf
2530  0033 1e01          	ldw	x,(OFST-3,sp)
2531  0035 a300c8        	cpw	x,#200
2532  0038 2fdf          	jrslt	L7161
2534  003a 20d2          	jra	L3161
2547                     	xdef	_main
2566                     	end
