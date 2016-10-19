   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2585                     ; 8 main()
2585                     ; 9 {
2587                     	switch	.text
2588  0000               _main:
2590  0000 5204          	subw	sp,#4
2591       00000004      OFST:	set	4
2594                     ; 11 	  PE_DDR|=0x20;
2596  0002 721a5016      	bset	_PE_DDR,#5
2597                     ; 12 	  PE_CR1|=0x20;
2599  0006 721a5017      	bset	_PE_CR1,#5
2600                     ; 13 	  PE_CR2|=0x00;
2602  000a c65018        	ld	a,_PE_CR2
2603  000d 97            	ld	xl,a
2604  000e               L3661:
2605                     ; 19 				PE_ODR^=0xf0;
2607  000e c65014        	ld	a,_PE_ODR
2608  0011 a8f0          	xor	a,	#240
2609  0013 c75014        	ld	_PE_ODR,a
2610                     ; 20 				for(i=0;i<200;i++)
2612  0016 5f            	clrw	x
2613  0017 1f01          	ldw	(OFST-3,sp),x
2614  0019               L7661:
2615                     ; 21 				    for(j=0;j<200;j++);
2617  0019 5f            	clrw	x
2618  001a 1f03          	ldw	(OFST-1,sp),x
2619  001c               L5761:
2623  001c 1e03          	ldw	x,(OFST-1,sp)
2624  001e 1c0001        	addw	x,#1
2625  0021 1f03          	ldw	(OFST-1,sp),x
2628  0023 9c            	rvf
2629  0024 1e03          	ldw	x,(OFST-1,sp)
2630  0026 a300c8        	cpw	x,#200
2631  0029 2ff1          	jrslt	L5761
2632                     ; 20 				for(i=0;i<200;i++)
2634  002b 1e01          	ldw	x,(OFST-3,sp)
2635  002d 1c0001        	addw	x,#1
2636  0030 1f01          	ldw	(OFST-3,sp),x
2639  0032 9c            	rvf
2640  0033 1e01          	ldw	x,(OFST-3,sp)
2641  0035 a300c8        	cpw	x,#200
2642  0038 2fdf          	jrslt	L7661
2644  003a 20d2          	jra	L3661
2657                     	xdef	_main
2676                     	end
