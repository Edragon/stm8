   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 57 uint8_t ITC_GetCPUCC(void)
  43                     ; 58 {
  45                     	switch	.text
  46  0000               _ITC_GetCPUCC:
  50                     ; 60   _asm("push cc");
  53  0000 8a            push cc
  55                     ; 61   _asm("pop a");
  58  0001 84            pop a
  60                     ; 62   return; /* Ignore compiler warning, the returned value is in A register */
  63  0002 81            	ret
  86                     ; 76 void ITC_DeInit(void)
  86                     ; 77 {
  87                     	switch	.text
  88  0003               _ITC_DeInit:
  92                     ; 78   ITC->ISPR1 = ITC_SPR1_RESET_VALUE;
  94  0003 35ff7f70      	mov	32624,#255
  95                     ; 79   ITC->ISPR2 = ITC_SPR2_RESET_VALUE;
  97  0007 35ff7f71      	mov	32625,#255
  98                     ; 80   ITC->ISPR3 = ITC_SPR3_RESET_VALUE;
 100  000b 35ff7f72      	mov	32626,#255
 101                     ; 81   ITC->ISPR4 = ITC_SPR4_RESET_VALUE;
 103  000f 35ff7f73      	mov	32627,#255
 104                     ; 82   ITC->ISPR5 = ITC_SPR5_RESET_VALUE;
 106  0013 35ff7f74      	mov	32628,#255
 107                     ; 83   ITC->ISPR6 = ITC_SPR6_RESET_VALUE;
 109  0017 35ff7f75      	mov	32629,#255
 110                     ; 84   ITC->ISPR7 = ITC_SPR7_RESET_VALUE;
 112  001b 35ff7f76      	mov	32630,#255
 113                     ; 85   ITC->ISPR8 = ITC_SPR8_RESET_VALUE;
 115  001f 35ff7f77      	mov	32631,#255
 116                     ; 86 }
 119  0023 81            	ret
 144                     ; 93 uint8_t ITC_GetSoftIntStatus(void)
 144                     ; 94 {
 145                     	switch	.text
 146  0024               _ITC_GetSoftIntStatus:
 150                     ; 95   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 152  0024 adda          	call	_ITC_GetCPUCC
 154  0026 a428          	and	a,#40
 157  0028 81            	ret
 412                     .const:	section	.text
 413  0000               L22:
 414  0000 004d          	dc.w	L14
 415  0002 0093          	dc.w	L702
 416  0004 0093          	dc.w	L702
 417  0006 0056          	dc.w	L34
 418  0008 0093          	dc.w	L702
 419  000a 0056          	dc.w	L34
 420  000c 0056          	dc.w	L34
 421  000e 005f          	dc.w	L54
 422  0010 005f          	dc.w	L54
 423  0012 005f          	dc.w	L54
 424  0014 005f          	dc.w	L54
 425  0016 0068          	dc.w	L74
 426  0018 0068          	dc.w	L74
 427  001a 0068          	dc.w	L74
 428  001c 0068          	dc.w	L74
 429  001e 0093          	dc.w	L702
 430  0020 0093          	dc.w	L702
 431  0022 0071          	dc.w	L15
 432  0024 0071          	dc.w	L15
 433  0026 007a          	dc.w	L35
 434  0028 007a          	dc.w	L35
 435  002a 007a          	dc.w	L35
 436  002c 0093          	dc.w	L702
 437  002e 0093          	dc.w	L702
 438  0030 0083          	dc.w	L55
 439  0032 0083          	dc.w	L55
 440  0034 0083          	dc.w	L55
 441  0036 008c          	dc.w	L75
 442  0038 008c          	dc.w	L75
 443                     ; 126 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 443                     ; 127 {
 444                     	switch	.text
 445  0029               _ITC_GetSoftwarePriority:
 447  0029 88            	push	a
 448  002a 89            	pushw	x
 449       00000002      OFST:	set	2
 452                     ; 128   uint8_t Value = 0;
 454  002b 0f02          	clr	(OFST+0,sp)
 455                     ; 129   uint8_t Mask = 0;
 457                     ; 132   assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 459                     ; 135   Mask = (uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U));
 461  002d a403          	and	a,#3
 462  002f 48            	sll	a
 463  0030 5f            	clrw	x
 464  0031 97            	ld	xl,a
 465  0032 a603          	ld	a,#3
 466  0034 5d            	tnzw	x
 467  0035 2704          	jreq	L41
 468  0037               L61:
 469  0037 48            	sll	a
 470  0038 5a            	decw	x
 471  0039 26fc          	jrne	L61
 472  003b               L41:
 473  003b 6b01          	ld	(OFST-1,sp),a
 474                     ; 137   switch (IRQn)
 476  003d 7b03          	ld	a,(OFST+1,sp)
 478                     ; 185     default:
 478                     ; 186       break;
 479  003f 4a            	dec	a
 480  0040 a11d          	cp	a,#29
 481  0042 2407          	jruge	L02
 482  0044 5f            	clrw	x
 483  0045 97            	ld	xl,a
 484  0046 58            	sllw	x
 485  0047 de0000        	ldw	x,(L22,x)
 486  004a fc            	jp	(x)
 487  004b               L02:
 488  004b 2046          	jra	L702
 489  004d               L14:
 490                     ; 139     case FLASH_IRQn:
 490                     ; 140       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 492  004d c67f70        	ld	a,32624
 493  0050 1401          	and	a,(OFST-1,sp)
 494  0052 6b02          	ld	(OFST+0,sp),a
 495                     ; 141       break;
 497  0054 203d          	jra	L702
 498  0056               L34:
 499                     ; 143     case AWU_IRQn:
 499                     ; 144     case EXTIB_IRQn:
 499                     ; 145     case EXTID_IRQn:
 499                     ; 146       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 501  0056 c67f71        	ld	a,32625
 502  0059 1401          	and	a,(OFST-1,sp)
 503  005b 6b02          	ld	(OFST+0,sp),a
 504                     ; 147       break;
 506  005d 2034          	jra	L702
 507  005f               L54:
 508                     ; 149     case EXTI0_IRQn:
 508                     ; 150     case EXTI1_IRQn:
 508                     ; 151     case EXTI2_IRQn:
 508                     ; 152     case EXTI3_IRQn:
 508                     ; 153       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 510  005f c67f72        	ld	a,32626
 511  0062 1401          	and	a,(OFST-1,sp)
 512  0064 6b02          	ld	(OFST+0,sp),a
 513                     ; 154       break;
 515  0066 202b          	jra	L702
 516  0068               L74:
 517                     ; 156     case EXTI4_IRQn:
 517                     ; 157     case EXTI5_IRQn:
 517                     ; 158     case EXTI6_IRQn:
 517                     ; 159     case EXTI7_IRQn:
 517                     ; 160       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 519  0068 c67f73        	ld	a,32627
 520  006b 1401          	and	a,(OFST-1,sp)
 521  006d 6b02          	ld	(OFST+0,sp),a
 522                     ; 161       break;
 524  006f 2022          	jra	L702
 525  0071               L15:
 526                     ; 163     case COMP_IRQn:
 526                     ; 164     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 526                     ; 165       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 528  0071 c67f74        	ld	a,32628
 529  0074 1401          	and	a,(OFST-1,sp)
 530  0076 6b02          	ld	(OFST+0,sp),a
 531                     ; 166       break;
 533  0078 2019          	jra	L702
 534  007a               L35:
 535                     ; 168     case TIM2_CAP_IRQn:
 535                     ; 169     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 535                     ; 170     case TIM3_CAP_IRQn:
 535                     ; 171       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 537  007a c67f75        	ld	a,32629
 538  007d 1401          	and	a,(OFST-1,sp)
 539  007f 6b02          	ld	(OFST+0,sp),a
 540                     ; 172       break;
 542  0081 2010          	jra	L702
 543  0083               L55:
 544                     ; 174     case TIM4_UPD_OVF_IRQn:
 544                     ; 175     case SPI_IRQn:
 544                     ; 176     case USART_TX_IRQn:
 544                     ; 177       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 546  0083 c67f76        	ld	a,32630
 547  0086 1401          	and	a,(OFST-1,sp)
 548  0088 6b02          	ld	(OFST+0,sp),a
 549                     ; 178       break;
 551  008a 2007          	jra	L702
 552  008c               L75:
 553                     ; 180     case USART_RX_IRQn:
 553                     ; 181     case I2C_IRQn:
 553                     ; 182       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 555  008c c67f77        	ld	a,32631
 556  008f 1401          	and	a,(OFST-1,sp)
 557  0091 6b02          	ld	(OFST+0,sp),a
 558                     ; 183       break;
 560  0093               L16:
 561                     ; 185     default:
 561                     ; 186       break;
 563  0093               L702:
 564                     ; 189   Value >>= (uint8_t)(((uint8_t)IRQn % 4u) * 2u);
 566  0093 7b03          	ld	a,(OFST+1,sp)
 567  0095 a403          	and	a,#3
 568  0097 48            	sll	a
 569  0098 5f            	clrw	x
 570  0099 97            	ld	xl,a
 571  009a 7b02          	ld	a,(OFST+0,sp)
 572  009c 5d            	tnzw	x
 573  009d 2704          	jreq	L42
 574  009f               L62:
 575  009f 44            	srl	a
 576  00a0 5a            	decw	x
 577  00a1 26fc          	jrne	L62
 578  00a3               L42:
 579  00a3 6b02          	ld	(OFST+0,sp),a
 580                     ; 191   return((ITC_PriorityLevel_TypeDef)Value);
 582  00a5 7b02          	ld	a,(OFST+0,sp)
 585  00a7 5b03          	addw	sp,#3
 586  00a9 81            	ret
 650                     	switch	.const
 651  003a               L44:
 652  003a 00e2          	dc.w	L112
 653  003c 0170          	dc.w	L762
 654  003e 0170          	dc.w	L762
 655  0040 00f4          	dc.w	L312
 656  0042 0170          	dc.w	L762
 657  0044 00f4          	dc.w	L312
 658  0046 00f4          	dc.w	L312
 659  0048 0106          	dc.w	L512
 660  004a 0106          	dc.w	L512
 661  004c 0106          	dc.w	L512
 662  004e 0106          	dc.w	L512
 663  0050 0118          	dc.w	L712
 664  0052 0118          	dc.w	L712
 665  0054 0118          	dc.w	L712
 666  0056 0118          	dc.w	L712
 667  0058 0170          	dc.w	L762
 668  005a 0170          	dc.w	L762
 669  005c 012a          	dc.w	L122
 670  005e 012a          	dc.w	L122
 671  0060 013c          	dc.w	L322
 672  0062 013c          	dc.w	L322
 673  0064 013c          	dc.w	L322
 674  0066 0170          	dc.w	L762
 675  0068 0170          	dc.w	L762
 676  006a 014e          	dc.w	L522
 677  006c 014e          	dc.w	L522
 678  006e 014e          	dc.w	L522
 679  0070 0160          	dc.w	L722
 680  0072 0160          	dc.w	L722
 681                     ; 234 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 681                     ; 235 {
 682                     	switch	.text
 683  00aa               _ITC_SetSoftwarePriority:
 685  00aa 89            	pushw	x
 686  00ab 89            	pushw	x
 687       00000002      OFST:	set	2
 690                     ; 236   uint8_t Mask = 0;
 692                     ; 237   uint8_t NewPriority = 0;
 694                     ; 240   assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 696                     ; 241   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 698                     ; 244   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 700                     ; 248   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U)));
 702  00ac 9e            	ld	a,xh
 703  00ad a403          	and	a,#3
 704  00af 48            	sll	a
 705  00b0 5f            	clrw	x
 706  00b1 97            	ld	xl,a
 707  00b2 a603          	ld	a,#3
 708  00b4 5d            	tnzw	x
 709  00b5 2704          	jreq	L23
 710  00b7               L43:
 711  00b7 48            	sll	a
 712  00b8 5a            	decw	x
 713  00b9 26fc          	jrne	L43
 714  00bb               L23:
 715  00bb 43            	cpl	a
 716  00bc 6b01          	ld	(OFST-1,sp),a
 717                     ; 251   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << (((uint8_t)IRQn % 4U) * 2U));
 719  00be 7b03          	ld	a,(OFST+1,sp)
 720  00c0 a403          	and	a,#3
 721  00c2 48            	sll	a
 722  00c3 5f            	clrw	x
 723  00c4 97            	ld	xl,a
 724  00c5 7b04          	ld	a,(OFST+2,sp)
 725  00c7 5d            	tnzw	x
 726  00c8 2704          	jreq	L63
 727  00ca               L04:
 728  00ca 48            	sll	a
 729  00cb 5a            	decw	x
 730  00cc 26fc          	jrne	L04
 731  00ce               L63:
 732  00ce 6b02          	ld	(OFST+0,sp),a
 733                     ; 253   switch (IRQn)
 735  00d0 7b03          	ld	a,(OFST+1,sp)
 737                     ; 309     default:
 737                     ; 310       break;
 738  00d2 4a            	dec	a
 739  00d3 a11d          	cp	a,#29
 740  00d5 2407          	jruge	L24
 741  00d7 5f            	clrw	x
 742  00d8 97            	ld	xl,a
 743  00d9 58            	sllw	x
 744  00da de003a        	ldw	x,(L44,x)
 745  00dd fc            	jp	(x)
 746  00de               L24:
 747  00de ac700170      	jpf	L762
 748  00e2               L112:
 749                     ; 255     case FLASH_IRQn:
 749                     ; 256       ITC->ISPR1 &= Mask;
 751  00e2 c67f70        	ld	a,32624
 752  00e5 1401          	and	a,(OFST-1,sp)
 753  00e7 c77f70        	ld	32624,a
 754                     ; 257       ITC->ISPR1 |= NewPriority;
 756  00ea c67f70        	ld	a,32624
 757  00ed 1a02          	or	a,(OFST+0,sp)
 758  00ef c77f70        	ld	32624,a
 759                     ; 258       break;
 761  00f2 207c          	jra	L762
 762  00f4               L312:
 763                     ; 260     case AWU_IRQn:
 763                     ; 261     case EXTIB_IRQn:
 763                     ; 262     case EXTID_IRQn:
 763                     ; 263       ITC->ISPR2 &= Mask;
 765  00f4 c67f71        	ld	a,32625
 766  00f7 1401          	and	a,(OFST-1,sp)
 767  00f9 c77f71        	ld	32625,a
 768                     ; 264       ITC->ISPR2 |= NewPriority;
 770  00fc c67f71        	ld	a,32625
 771  00ff 1a02          	or	a,(OFST+0,sp)
 772  0101 c77f71        	ld	32625,a
 773                     ; 265       break;
 775  0104 206a          	jra	L762
 776  0106               L512:
 777                     ; 267     case EXTI0_IRQn:
 777                     ; 268     case EXTI1_IRQn:
 777                     ; 269     case EXTI2_IRQn:
 777                     ; 270     case EXTI3_IRQn:
 777                     ; 271       ITC->ISPR3 &= Mask;
 779  0106 c67f72        	ld	a,32626
 780  0109 1401          	and	a,(OFST-1,sp)
 781  010b c77f72        	ld	32626,a
 782                     ; 272       ITC->ISPR3 |= NewPriority;
 784  010e c67f72        	ld	a,32626
 785  0111 1a02          	or	a,(OFST+0,sp)
 786  0113 c77f72        	ld	32626,a
 787                     ; 273       break;
 789  0116 2058          	jra	L762
 790  0118               L712:
 791                     ; 275     case EXTI4_IRQn:
 791                     ; 276     case EXTI5_IRQn:
 791                     ; 277     case EXTI6_IRQn:
 791                     ; 278     case EXTI7_IRQn:
 791                     ; 279       ITC->ISPR4 &= Mask;
 793  0118 c67f73        	ld	a,32627
 794  011b 1401          	and	a,(OFST-1,sp)
 795  011d c77f73        	ld	32627,a
 796                     ; 280       ITC->ISPR4 |= NewPriority;
 798  0120 c67f73        	ld	a,32627
 799  0123 1a02          	or	a,(OFST+0,sp)
 800  0125 c77f73        	ld	32627,a
 801                     ; 281       break;
 803  0128 2046          	jra	L762
 804  012a               L122:
 805                     ; 283     case COMP_IRQn:
 805                     ; 284     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 805                     ; 285       ITC->ISPR5 &= Mask;
 807  012a c67f74        	ld	a,32628
 808  012d 1401          	and	a,(OFST-1,sp)
 809  012f c77f74        	ld	32628,a
 810                     ; 286       ITC->ISPR5 |= NewPriority;
 812  0132 c67f74        	ld	a,32628
 813  0135 1a02          	or	a,(OFST+0,sp)
 814  0137 c77f74        	ld	32628,a
 815                     ; 287       break;
 817  013a 2034          	jra	L762
 818  013c               L322:
 819                     ; 289     case TIM2_CAP_IRQn:
 819                     ; 290     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 819                     ; 291     case TIM3_CAP_IRQn:
 819                     ; 292       ITC->ISPR6 &= Mask;
 821  013c c67f75        	ld	a,32629
 822  013f 1401          	and	a,(OFST-1,sp)
 823  0141 c77f75        	ld	32629,a
 824                     ; 293       ITC->ISPR6 |= NewPriority;
 826  0144 c67f75        	ld	a,32629
 827  0147 1a02          	or	a,(OFST+0,sp)
 828  0149 c77f75        	ld	32629,a
 829                     ; 294       break;
 831  014c 2022          	jra	L762
 832  014e               L522:
 833                     ; 296     case TIM4_UPD_OVF_IRQn:
 833                     ; 297     case SPI_IRQn:
 833                     ; 298     case USART_TX_IRQn:
 833                     ; 299       ITC->ISPR7 &= Mask;
 835  014e c67f76        	ld	a,32630
 836  0151 1401          	and	a,(OFST-1,sp)
 837  0153 c77f76        	ld	32630,a
 838                     ; 300       ITC->ISPR7 |= NewPriority;
 840  0156 c67f76        	ld	a,32630
 841  0159 1a02          	or	a,(OFST+0,sp)
 842  015b c77f76        	ld	32630,a
 843                     ; 301       break;
 845  015e 2010          	jra	L762
 846  0160               L722:
 847                     ; 303     case USART_RX_IRQn:
 847                     ; 304     case I2C_IRQn:
 847                     ; 305       ITC->ISPR8 &= Mask;
 849  0160 c67f77        	ld	a,32631
 850  0163 1401          	and	a,(OFST-1,sp)
 851  0165 c77f77        	ld	32631,a
 852                     ; 306       ITC->ISPR8 |= NewPriority;
 854  0168 c67f77        	ld	a,32631
 855  016b 1a02          	or	a,(OFST+0,sp)
 856  016d c77f77        	ld	32631,a
 857                     ; 307       break;
 859  0170               L132:
 860                     ; 309     default:
 860                     ; 310       break;
 862  0170               L762:
 863                     ; 312 }
 866  0170 5b04          	addw	sp,#4
 867  0172 81            	ret
 880                     	xdef	_ITC_SetSoftwarePriority
 881                     	xdef	_ITC_GetSoftwarePriority
 882                     	xdef	_ITC_GetSoftIntStatus
 883                     	xdef	_ITC_DeInit
 884                     	xdef	_ITC_GetCPUCC
 903                     	end
