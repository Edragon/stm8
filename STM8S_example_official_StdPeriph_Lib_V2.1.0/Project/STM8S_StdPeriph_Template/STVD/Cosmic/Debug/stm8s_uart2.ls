   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 47 void UART2_DeInit(void)
  33                     ; 48 {
  35                     .text:	section	.text,new
  36  0000               _UART2_DeInit:
  40                     ; 51     (void) UART2->SR;
  42  0000 c65240        	ld	a,21056
  43                     ; 52     (void)UART2->DR;
  45  0003 c65241        	ld	a,21057
  46                     ; 54     UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  48  0006 725f5243      	clr	21059
  49                     ; 55     UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  51  000a 725f5242      	clr	21058
  52                     ; 57     UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  54  000e 725f5244      	clr	21060
  55                     ; 58     UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  57  0012 725f5245      	clr	21061
  58                     ; 59     UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  60  0016 725f5246      	clr	21062
  61                     ; 60     UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  63  001a 725f5247      	clr	21063
  64                     ; 61     UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  66  001e 725f5248      	clr	21064
  67                     ; 62     UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  69  0022 725f5249      	clr	21065
  70                     ; 64 }
  73  0026 81            	ret	
 385                     .const:	section	.text
 386  0000               L21:
 387  0000 00098969      	dc.l	625001
 388  0004               L27:
 389  0004 00000064      	dc.l	100
 390                     ; 80 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 390                     ; 81 {
 391                     .text:	section	.text,new
 392  0000               _UART2_Init:
 394  0000 520e          	subw	sp,#14
 395       0000000e      OFST:	set	14
 398                     ; 82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
 402                     ; 83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 404  0002 96            	ldw	x,sp
 405  0003 1c000b        	addw	x,#OFST-3
 406  0006 cd0000        	call	c_ltor
 410  0009 96            	ldw	x,sp
 411  000a 1c0007        	addw	x,#OFST-7
 412  000d cd0000        	call	c_ltor
 414                     ; 86     assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 416  0010 96            	ldw	x,sp
 417  0011 1c0011        	addw	x,#OFST+3
 418  0014 cd0000        	call	c_ltor
 420  0017 ae0000        	ldw	x,#L21
 421  001a cd0000        	call	c_lcmp
 423  001d 2506          	jrult	L41
 424  001f ae0056        	ldw	x,#86
 425  0022 cd01bd        	call	LC001
 426  0025               L41:
 427                     ; 87     assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 429  0025 7b15          	ld	a,(OFST+7,sp)
 430  0027 270a          	jreq	L42
 431  0029 a110          	cp	a,#16
 432  002b 2706          	jreq	L42
 433  002d ae0057        	ldw	x,#87
 434  0030 cd01bd        	call	LC001
 435  0033               L42:
 436                     ; 88     assert_param(IS_UART2_STOPBITS_OK(StopBits));
 438  0033 7b16          	ld	a,(OFST+8,sp)
 439  0035 2712          	jreq	L43
 440  0037 a110          	cp	a,#16
 441  0039 270e          	jreq	L43
 442  003b a120          	cp	a,#32
 443  003d 270a          	jreq	L43
 444  003f a130          	cp	a,#48
 445  0041 2706          	jreq	L43
 446  0043 ae0058        	ldw	x,#88
 447  0046 cd01bd        	call	LC001
 448  0049               L43:
 449                     ; 89     assert_param(IS_UART2_PARITY_OK(Parity));
 451  0049 7b17          	ld	a,(OFST+9,sp)
 452  004b 270e          	jreq	L44
 453  004d a104          	cp	a,#4
 454  004f 270a          	jreq	L44
 455  0051 a106          	cp	a,#6
 456  0053 2706          	jreq	L44
 457  0055 ae0059        	ldw	x,#89
 458  0058 cd01bd        	call	LC001
 459  005b               L44:
 460                     ; 90     assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 462  005b 7b19          	ld	a,(OFST+11,sp)
 463  005d a108          	cp	a,#8
 464  005f 2722          	jreq	L45
 465  0061 a140          	cp	a,#64
 466  0063 271e          	jreq	L45
 467  0065 a104          	cp	a,#4
 468  0067 271a          	jreq	L45
 469  0069 a180          	cp	a,#128
 470  006b 2716          	jreq	L45
 471  006d a10c          	cp	a,#12
 472  006f 2712          	jreq	L45
 473  0071 a144          	cp	a,#68
 474  0073 270e          	jreq	L45
 475  0075 a1c0          	cp	a,#192
 476  0077 270a          	jreq	L45
 477  0079 a188          	cp	a,#136
 478  007b 2706          	jreq	L45
 479  007d ae005a        	ldw	x,#90
 480  0080 cd01bd        	call	LC001
 481  0083               L45:
 482                     ; 91     assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 484  0083 7b18          	ld	a,(OFST+10,sp)
 485  0085 a488          	and	a,#136
 486  0087 a188          	cp	a,#136
 487  0089 2718          	jreq	L06
 488  008b 7b18          	ld	a,(OFST+10,sp)
 489  008d a444          	and	a,#68
 490  008f a144          	cp	a,#68
 491  0091 2710          	jreq	L06
 492  0093 7b18          	ld	a,(OFST+10,sp)
 493  0095 a422          	and	a,#34
 494  0097 a122          	cp	a,#34
 495  0099 2708          	jreq	L06
 496  009b 7b18          	ld	a,(OFST+10,sp)
 497  009d a411          	and	a,#17
 498  009f a111          	cp	a,#17
 499  00a1 2606          	jrne	L26
 500  00a3               L06:
 501  00a3 ae005b        	ldw	x,#91
 502  00a6 cd01bd        	call	LC001
 503  00a9               L26:
 504                     ; 94     UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 506  00a9 72195244      	bres	21060,#4
 507                     ; 96     UART2->CR1 |= (uint8_t)WordLength; 
 509  00ad c65244        	ld	a,21060
 510  00b0 1a15          	or	a,(OFST+7,sp)
 511  00b2 c75244        	ld	21060,a
 512                     ; 99     UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 514  00b5 c65246        	ld	a,21062
 515  00b8 a4cf          	and	a,#207
 516  00ba c75246        	ld	21062,a
 517                     ; 101     UART2->CR3 |= (uint8_t)StopBits; 
 519  00bd c65246        	ld	a,21062
 520  00c0 1a16          	or	a,(OFST+8,sp)
 521  00c2 c75246        	ld	21062,a
 522                     ; 104     UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 524  00c5 c65244        	ld	a,21060
 525  00c8 a4f9          	and	a,#249
 526  00ca c75244        	ld	21060,a
 527                     ; 106     UART2->CR1 |= (uint8_t)Parity;
 529  00cd c65244        	ld	a,21060
 530  00d0 1a17          	or	a,(OFST+9,sp)
 531  00d2 c75244        	ld	21060,a
 532                     ; 109     UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 534  00d5 725f5242      	clr	21058
 535                     ; 111     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 537  00d9 c65243        	ld	a,21059
 538  00dc a40f          	and	a,#15
 539  00de c75243        	ld	21059,a
 540                     ; 113     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 542  00e1 c65243        	ld	a,21059
 543  00e4 a4f0          	and	a,#240
 544  00e6 c75243        	ld	21059,a
 545                     ; 116     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 547  00e9 96            	ldw	x,sp
 548  00ea cd01c9        	call	LC002
 550  00ed 96            	ldw	x,sp
 551  00ee 5c            	incw	x
 552  00ef cd0000        	call	c_rtol
 554  00f2 cd0000        	call	_CLK_GetClockFreq
 556  00f5 96            	ldw	x,sp
 557  00f6 5c            	incw	x
 558  00f7 cd0000        	call	c_ludv
 560  00fa 96            	ldw	x,sp
 561  00fb 1c000b        	addw	x,#OFST-3
 562  00fe cd0000        	call	c_rtol
 564                     ; 117     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 566  0101 96            	ldw	x,sp
 567  0102 cd01c9        	call	LC002
 569  0105 96            	ldw	x,sp
 570  0106 5c            	incw	x
 571  0107 cd0000        	call	c_rtol
 573  010a cd0000        	call	_CLK_GetClockFreq
 575  010d a664          	ld	a,#100
 576  010f cd0000        	call	c_smul
 578  0112 96            	ldw	x,sp
 579  0113 5c            	incw	x
 580  0114 cd0000        	call	c_ludv
 582  0117 96            	ldw	x,sp
 583  0118 1c0007        	addw	x,#OFST-7
 584  011b cd0000        	call	c_rtol
 586                     ; 121     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 586                     ; 122                         << 4) / 100) & (uint8_t)0x0F); 
 588  011e 96            	ldw	x,sp
 589  011f 1c000b        	addw	x,#OFST-3
 590  0122 cd0000        	call	c_ltor
 592  0125 a664          	ld	a,#100
 593  0127 cd0000        	call	c_smul
 595  012a 96            	ldw	x,sp
 596  012b 5c            	incw	x
 597  012c cd0000        	call	c_rtol
 599  012f 96            	ldw	x,sp
 600  0130 1c0007        	addw	x,#OFST-7
 601  0133 cd0000        	call	c_ltor
 603  0136 96            	ldw	x,sp
 604  0137 5c            	incw	x
 605  0138 cd0000        	call	c_lsub
 607  013b a604          	ld	a,#4
 608  013d cd0000        	call	c_llsh
 610  0140 ae0004        	ldw	x,#L27
 611  0143 cd0000        	call	c_ludv
 613  0146 b603          	ld	a,c_lreg+3
 614  0148 a40f          	and	a,#15
 615  014a 6b05          	ld	(OFST-9,sp),a
 616                     ; 123     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 618  014c 96            	ldw	x,sp
 619  014d 1c000b        	addw	x,#OFST-3
 620  0150 cd0000        	call	c_ltor
 622  0153 a604          	ld	a,#4
 623  0155 cd0000        	call	c_lursh
 625  0158 b603          	ld	a,c_lreg+3
 626  015a a4f0          	and	a,#240
 627  015c b703          	ld	c_lreg+3,a
 628  015e 3f02          	clr	c_lreg+2
 629  0160 3f01          	clr	c_lreg+1
 630  0162 3f00          	clr	c_lreg
 631  0164 6b06          	ld	(OFST-8,sp),a
 632                     ; 125     UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 634  0166 1a05          	or	a,(OFST-9,sp)
 635  0168 c75243        	ld	21059,a
 636                     ; 127     UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 638  016b 7b0e          	ld	a,(OFST+0,sp)
 639  016d c75242        	ld	21058,a
 640                     ; 130     UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 642  0170 c65245        	ld	a,21061
 643  0173 a4f3          	and	a,#243
 644  0175 c75245        	ld	21061,a
 645                     ; 132     UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 647  0178 c65246        	ld	a,21062
 648  017b a4f8          	and	a,#248
 649  017d c75246        	ld	21062,a
 650                     ; 134     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 650                     ; 135                                               UART2_CR3_CPHA | UART2_CR3_LBCL));
 652  0180 7b18          	ld	a,(OFST+10,sp)
 653  0182 a407          	and	a,#7
 654  0184 ca5246        	or	a,21062
 655  0187 c75246        	ld	21062,a
 656                     ; 137     if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 658  018a 7b19          	ld	a,(OFST+11,sp)
 659  018c a504          	bcp	a,#4
 660  018e 2706          	jreq	L371
 661                     ; 140         UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 663  0190 72165245      	bset	21061,#3
 665  0194 2004          	jra	L571
 666  0196               L371:
 667                     ; 145         UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 669  0196 72175245      	bres	21061,#3
 670  019a               L571:
 671                     ; 147     if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 673  019a a508          	bcp	a,#8
 674  019c 2706          	jreq	L771
 675                     ; 150         UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 677  019e 72145245      	bset	21061,#2
 679  01a2 2004          	jra	L102
 680  01a4               L771:
 681                     ; 155         UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 683  01a4 72155245      	bres	21061,#2
 684  01a8               L102:
 685                     ; 159     if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 687  01a8 7b18          	ld	a,(OFST+10,sp)
 688  01aa 2a06          	jrpl	L302
 689                     ; 162         UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 691  01ac 72175246      	bres	21062,#3
 693  01b0 2008          	jra	L502
 694  01b2               L302:
 695                     ; 166         UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 697  01b2 a408          	and	a,#8
 698  01b4 ca5246        	or	a,21062
 699  01b7 c75246        	ld	21062,a
 700  01ba               L502:
 701                     ; 168 }
 704  01ba 5b0e          	addw	sp,#14
 705  01bc 81            	ret	
 707  01bd               LC001:
 708  01bd 89            	pushw	x
 709  01be 5f            	clrw	x
 710  01bf 89            	pushw	x
 711  01c0 ae0008        	ldw	x,#L171
 712  01c3 cd0000        	call	_assert_failed
 714  01c6 5b04          	addw	sp,#4
 715  01c8 81            	ret	
 716  01c9               LC002:
 717  01c9 1c0011        	addw	x,#OFST+3
 718  01cc cd0000        	call	c_ltor
 720  01cf a604          	ld	a,#4
 721  01d1 cc0000        	jp	c_llsh
 775                     ; 176 void UART2_Cmd(FunctionalState NewState)
 775                     ; 177 {
 776                     .text:	section	.text,new
 777  0000               _UART2_Cmd:
 781                     ; 179     if (NewState != DISABLE)
 783  0000 4d            	tnz	a
 784  0001 2705          	jreq	L532
 785                     ; 182         UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 787  0003 721b5244      	bres	21060,#5
 790  0007 81            	ret	
 791  0008               L532:
 792                     ; 187         UART2->CR1 |= UART2_CR1_UARTD; 
 794  0008 721a5244      	bset	21060,#5
 795                     ; 189 }
 798  000c 81            	ret	
 927                     ; 206 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 927                     ; 207 {
 928                     .text:	section	.text,new
 929  0000               _UART2_ITConfig:
 931  0000 89            	pushw	x
 932  0001 89            	pushw	x
 933       00000002      OFST:	set	2
 936                     ; 208     uint8_t uartreg = 0, itpos = 0x00;
 940                     ; 211     assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 942  0002 1e03          	ldw	x,(OFST+1,sp)
 943  0004 a30100        	cpw	x,#256
 944  0007 2724          	jreq	L401
 945  0009 a30277        	cpw	x,#631
 946  000c 271f          	jreq	L401
 947  000e a30266        	cpw	x,#614
 948  0011 271a          	jreq	L401
 949  0013 a30205        	cpw	x,#517
 950  0016 2715          	jreq	L401
 951  0018 a30244        	cpw	x,#580
 952  001b 2710          	jreq	L401
 953  001d a30412        	cpw	x,#1042
 954  0020 270b          	jreq	L401
 955  0022 a30346        	cpw	x,#838
 956  0025 2706          	jreq	L401
 957  0027 ae00d3        	ldw	x,#211
 958  002a cd00b7        	call	LC007
 959  002d               L401:
 960                     ; 212     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 962  002d 7b07          	ld	a,(OFST+5,sp)
 963  002f 2708          	jreq	L411
 964  0031 4a            	dec	a
 965  0032 2705          	jreq	L411
 966  0034 ae00d4        	ldw	x,#212
 967  0037 ad7e          	call	LC007
 968  0039               L411:
 969                     ; 215     uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 971  0039 7b03          	ld	a,(OFST+1,sp)
 972  003b 6b01          	ld	(OFST-1,sp),a
 973                     ; 218     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 975  003d 7b04          	ld	a,(OFST+2,sp)
 976  003f a40f          	and	a,#15
 977  0041 5f            	clrw	x
 978  0042 97            	ld	xl,a
 979  0043 a601          	ld	a,#1
 980  0045 5d            	tnzw	x
 981  0046 2704          	jreq	L021
 982  0048               L221:
 983  0048 48            	sll	a
 984  0049 5a            	decw	x
 985  004a 26fc          	jrne	L221
 986  004c               L021:
 987  004c 6b02          	ld	(OFST+0,sp),a
 988                     ; 220     if (NewState != DISABLE)
 990  004e 7b07          	ld	a,(OFST+5,sp)
 991  0050 272a          	jreq	L513
 992                     ; 223         if (uartreg == 0x01)
 994  0052 7b01          	ld	a,(OFST-1,sp)
 995  0054 a101          	cp	a,#1
 996  0056 2607          	jrne	L713
 997                     ; 225             UART2->CR1 |= itpos;
 999  0058 c65244        	ld	a,21060
1000  005b 1a02          	or	a,(OFST+0,sp)
1002  005d 2029          	jp	LC005
1003  005f               L713:
1004                     ; 227         else if (uartreg == 0x02)
1006  005f a102          	cp	a,#2
1007  0061 2607          	jrne	L323
1008                     ; 229             UART2->CR2 |= itpos;
1010  0063 c65245        	ld	a,21061
1011  0066 1a02          	or	a,(OFST+0,sp)
1013  0068 202d          	jp	LC004
1014  006a               L323:
1015                     ; 231         else if (uartreg == 0x03)
1017  006a a103          	cp	a,#3
1018  006c 2607          	jrne	L723
1019                     ; 233             UART2->CR4 |= itpos;
1021  006e c65247        	ld	a,21063
1022  0071 1a02          	or	a,(OFST+0,sp)
1024  0073 2031          	jp	LC006
1025  0075               L723:
1026                     ; 237             UART2->CR6 |= itpos;
1028  0075 c65249        	ld	a,21065
1029  0078 1a02          	or	a,(OFST+0,sp)
1030  007a 2035          	jp	LC003
1031  007c               L513:
1032                     ; 243         if (uartreg == 0x01)
1034  007c 7b01          	ld	a,(OFST-1,sp)
1035  007e a101          	cp	a,#1
1036  0080 260b          	jrne	L533
1037                     ; 245             UART2->CR1 &= (uint8_t)(~itpos);
1039  0082 7b02          	ld	a,(OFST+0,sp)
1040  0084 43            	cpl	a
1041  0085 c45244        	and	a,21060
1042  0088               LC005:
1043  0088 c75244        	ld	21060,a
1045  008b 2027          	jra	L333
1046  008d               L533:
1047                     ; 247         else if (uartreg == 0x02)
1049  008d a102          	cp	a,#2
1050  008f 260b          	jrne	L143
1051                     ; 249             UART2->CR2 &= (uint8_t)(~itpos);
1053  0091 7b02          	ld	a,(OFST+0,sp)
1054  0093 43            	cpl	a
1055  0094 c45245        	and	a,21061
1056  0097               LC004:
1057  0097 c75245        	ld	21061,a
1059  009a 2018          	jra	L333
1060  009c               L143:
1061                     ; 251         else if (uartreg == 0x03)
1063  009c a103          	cp	a,#3
1064  009e 260b          	jrne	L543
1065                     ; 253             UART2->CR4 &= (uint8_t)(~itpos);
1067  00a0 7b02          	ld	a,(OFST+0,sp)
1068  00a2 43            	cpl	a
1069  00a3 c45247        	and	a,21063
1070  00a6               LC006:
1071  00a6 c75247        	ld	21063,a
1073  00a9 2009          	jra	L333
1074  00ab               L543:
1075                     ; 257             UART2->CR6 &= (uint8_t)(~itpos);
1077  00ab 7b02          	ld	a,(OFST+0,sp)
1078  00ad 43            	cpl	a
1079  00ae c45249        	and	a,21065
1080  00b1               LC003:
1081  00b1 c75249        	ld	21065,a
1082  00b4               L333:
1083                     ; 260 }
1086  00b4 5b04          	addw	sp,#4
1087  00b6 81            	ret	
1089  00b7               LC007:
1090  00b7 89            	pushw	x
1091  00b8 5f            	clrw	x
1092  00b9 89            	pushw	x
1093  00ba ae0008        	ldw	x,#L171
1094  00bd cd0000        	call	_assert_failed
1096  00c0 5b04          	addw	sp,#4
1097  00c2 81            	ret	
1154                     ; 267 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1154                     ; 268 {
1155                     .text:	section	.text,new
1156  0000               _UART2_IrDAConfig:
1158  0000 88            	push	a
1159       00000000      OFST:	set	0
1162                     ; 269     assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1164  0001 a101          	cp	a,#1
1165  0003 2711          	jreq	L231
1166  0005 4d            	tnz	a
1167  0006 270e          	jreq	L231
1168  0008 ae010d        	ldw	x,#269
1169  000b 89            	pushw	x
1170  000c 5f            	clrw	x
1171  000d 89            	pushw	x
1172  000e ae0008        	ldw	x,#L171
1173  0011 cd0000        	call	_assert_failed
1175  0014 5b04          	addw	sp,#4
1176  0016               L231:
1177                     ; 271     if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1179  0016 7b01          	ld	a,(OFST+1,sp)
1180  0018 2706          	jreq	L773
1181                     ; 273         UART2->CR5 |= UART2_CR5_IRLP;
1183  001a 72145248      	bset	21064,#2
1185  001e 2004          	jra	L104
1186  0020               L773:
1187                     ; 277         UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1189  0020 72155248      	bres	21064,#2
1190  0024               L104:
1191                     ; 279 }
1194  0024 84            	pop	a
1195  0025 81            	ret	
1231                     ; 287 void UART2_IrDACmd(FunctionalState NewState)
1231                     ; 288 {
1232                     .text:	section	.text,new
1233  0000               _UART2_IrDACmd:
1235  0000 88            	push	a
1236       00000000      OFST:	set	0
1239                     ; 290     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1241  0001 4d            	tnz	a
1242  0002 2711          	jreq	L441
1243  0004 4a            	dec	a
1244  0005 270e          	jreq	L441
1245  0007 ae0122        	ldw	x,#290
1246  000a 89            	pushw	x
1247  000b 5f            	clrw	x
1248  000c 89            	pushw	x
1249  000d ae0008        	ldw	x,#L171
1250  0010 cd0000        	call	_assert_failed
1252  0013 5b04          	addw	sp,#4
1253  0015               L441:
1254                     ; 292     if (NewState != DISABLE)
1256  0015 7b01          	ld	a,(OFST+1,sp)
1257  0017 2706          	jreq	L124
1258                     ; 295         UART2->CR5 |= UART2_CR5_IREN;
1260  0019 72125248      	bset	21064,#1
1262  001d 2004          	jra	L324
1263  001f               L124:
1264                     ; 300         UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1266  001f 72135248      	bres	21064,#1
1267  0023               L324:
1268                     ; 302 }
1271  0023 84            	pop	a
1272  0024 81            	ret	
1332                     ; 311 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1332                     ; 312 {
1333                     .text:	section	.text,new
1334  0000               _UART2_LINBreakDetectionConfig:
1336  0000 88            	push	a
1337       00000000      OFST:	set	0
1340                     ; 314     assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1342  0001 4d            	tnz	a
1343  0002 2711          	jreq	L651
1344  0004 4a            	dec	a
1345  0005 270e          	jreq	L651
1346  0007 ae013a        	ldw	x,#314
1347  000a 89            	pushw	x
1348  000b 5f            	clrw	x
1349  000c 89            	pushw	x
1350  000d ae0008        	ldw	x,#L171
1351  0010 cd0000        	call	_assert_failed
1353  0013 5b04          	addw	sp,#4
1354  0015               L651:
1355                     ; 316     if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1357  0015 7b01          	ld	a,(OFST+1,sp)
1358  0017 2706          	jreq	L354
1359                     ; 318         UART2->CR4 |= UART2_CR4_LBDL;
1361  0019 721a5247      	bset	21063,#5
1363  001d 2004          	jra	L554
1364  001f               L354:
1365                     ; 322         UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1367  001f 721b5247      	bres	21063,#5
1368  0023               L554:
1369                     ; 324 }
1372  0023 84            	pop	a
1373  0024 81            	ret	
1495                     ; 336 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1495                     ; 337                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1495                     ; 338                      UART2_LinDivUp_TypeDef UART2_DivUp)
1495                     ; 339 {
1496                     .text:	section	.text,new
1497  0000               _UART2_LINConfig:
1499  0000 89            	pushw	x
1500       00000000      OFST:	set	0
1503                     ; 341     assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1505  0001 9e            	ld	a,xh
1506  0002 4d            	tnz	a
1507  0003 2709          	jreq	L071
1508  0005 9e            	ld	a,xh
1509  0006 4a            	dec	a
1510  0007 2705          	jreq	L071
1511  0009 ae0155        	ldw	x,#341
1512  000c ad46          	call	LC008
1513  000e               L071:
1514                     ; 342     assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1516  000e 7b02          	ld	a,(OFST+2,sp)
1517  0010 4a            	dec	a
1518  0011 2709          	jreq	L002
1519  0013 7b02          	ld	a,(OFST+2,sp)
1520  0015 2705          	jreq	L002
1521  0017 ae0156        	ldw	x,#342
1522  001a ad38          	call	LC008
1523  001c               L002:
1524                     ; 343     assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1526  001c 7b05          	ld	a,(OFST+5,sp)
1527  001e 2708          	jreq	L012
1528  0020 4a            	dec	a
1529  0021 2705          	jreq	L012
1530  0023 ae0157        	ldw	x,#343
1531  0026 ad2c          	call	LC008
1532  0028               L012:
1533                     ; 345     if (UART2_Mode != UART2_LIN_MODE_MASTER)
1535  0028 7b01          	ld	a,(OFST+1,sp)
1536  002a 2706          	jreq	L535
1537                     ; 347         UART2->CR6 |=  UART2_CR6_LSLV;
1539  002c 721a5249      	bset	21065,#5
1541  0030 2004          	jra	L735
1542  0032               L535:
1543                     ; 351         UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1545  0032 721b5249      	bres	21065,#5
1546  0036               L735:
1547                     ; 354     if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1549  0036 7b02          	ld	a,(OFST+2,sp)
1550  0038 2706          	jreq	L145
1551                     ; 356         UART2->CR6 |=  UART2_CR6_LASE ;
1553  003a 72185249      	bset	21065,#4
1555  003e 2004          	jra	L345
1556  0040               L145:
1557                     ; 360         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1559  0040 72195249      	bres	21065,#4
1560  0044               L345:
1561                     ; 363     if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1563  0044 7b05          	ld	a,(OFST+5,sp)
1564  0046 2706          	jreq	L545
1565                     ; 365         UART2->CR6 |=  UART2_CR6_LDUM;
1567  0048 721e5249      	bset	21065,#7
1569  004c 2004          	jra	L745
1570  004e               L545:
1571                     ; 369         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1573  004e 721f5249      	bres	21065,#7
1574  0052               L745:
1575                     ; 371 }
1578  0052 85            	popw	x
1579  0053 81            	ret	
1581  0054               LC008:
1582  0054 89            	pushw	x
1583  0055 5f            	clrw	x
1584  0056 89            	pushw	x
1585  0057 ae0008        	ldw	x,#L171
1586  005a cd0000        	call	_assert_failed
1588  005d 5b04          	addw	sp,#4
1589  005f 81            	ret	
1624                     ; 379 void UART2_LINCmd(FunctionalState NewState)
1624                     ; 380 {
1625                     .text:	section	.text,new
1626  0000               _UART2_LINCmd:
1628  0000 88            	push	a
1629       00000000      OFST:	set	0
1632                     ; 381     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1634  0001 4d            	tnz	a
1635  0002 2711          	jreq	L222
1636  0004 4a            	dec	a
1637  0005 270e          	jreq	L222
1638  0007 ae017d        	ldw	x,#381
1639  000a 89            	pushw	x
1640  000b 5f            	clrw	x
1641  000c 89            	pushw	x
1642  000d ae0008        	ldw	x,#L171
1643  0010 cd0000        	call	_assert_failed
1645  0013 5b04          	addw	sp,#4
1646  0015               L222:
1647                     ; 383     if (NewState != DISABLE)
1649  0015 7b01          	ld	a,(OFST+1,sp)
1650  0017 2706          	jreq	L765
1651                     ; 386         UART2->CR3 |= UART2_CR3_LINEN;
1653  0019 721c5246      	bset	21062,#6
1655  001d 2004          	jra	L175
1656  001f               L765:
1657                     ; 391         UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1659  001f 721d5246      	bres	21062,#6
1660  0023               L175:
1661                     ; 393 }
1664  0023 84            	pop	a
1665  0024 81            	ret	
1701                     ; 400 void UART2_SmartCardCmd(FunctionalState NewState)
1701                     ; 401 {
1702                     .text:	section	.text,new
1703  0000               _UART2_SmartCardCmd:
1705  0000 88            	push	a
1706       00000000      OFST:	set	0
1709                     ; 403     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1711  0001 4d            	tnz	a
1712  0002 2711          	jreq	L432
1713  0004 4a            	dec	a
1714  0005 270e          	jreq	L432
1715  0007 ae0193        	ldw	x,#403
1716  000a 89            	pushw	x
1717  000b 5f            	clrw	x
1718  000c 89            	pushw	x
1719  000d ae0008        	ldw	x,#L171
1720  0010 cd0000        	call	_assert_failed
1722  0013 5b04          	addw	sp,#4
1723  0015               L432:
1724                     ; 405     if (NewState != DISABLE)
1726  0015 7b01          	ld	a,(OFST+1,sp)
1727  0017 2706          	jreq	L116
1728                     ; 408         UART2->CR5 |= UART2_CR5_SCEN;
1730  0019 721a5248      	bset	21064,#5
1732  001d 2004          	jra	L316
1733  001f               L116:
1734                     ; 413         UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1736  001f 721b5248      	bres	21064,#5
1737  0023               L316:
1738                     ; 415 }
1741  0023 84            	pop	a
1742  0024 81            	ret	
1779                     ; 423 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1779                     ; 424 {
1780                     .text:	section	.text,new
1781  0000               _UART2_SmartCardNACKCmd:
1783  0000 88            	push	a
1784       00000000      OFST:	set	0
1787                     ; 426     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1789  0001 4d            	tnz	a
1790  0002 2711          	jreq	L642
1791  0004 4a            	dec	a
1792  0005 270e          	jreq	L642
1793  0007 ae01aa        	ldw	x,#426
1794  000a 89            	pushw	x
1795  000b 5f            	clrw	x
1796  000c 89            	pushw	x
1797  000d ae0008        	ldw	x,#L171
1798  0010 cd0000        	call	_assert_failed
1800  0013 5b04          	addw	sp,#4
1801  0015               L642:
1802                     ; 428     if (NewState != DISABLE)
1804  0015 7b01          	ld	a,(OFST+1,sp)
1805  0017 2706          	jreq	L336
1806                     ; 431         UART2->CR5 |= UART2_CR5_NACK;
1808  0019 72185248      	bset	21064,#4
1810  001d 2004          	jra	L536
1811  001f               L336:
1812                     ; 436         UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1814  001f 72195248      	bres	21064,#4
1815  0023               L536:
1816                     ; 438 }
1819  0023 84            	pop	a
1820  0024 81            	ret	
1878                     ; 446 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1878                     ; 447 {
1879                     .text:	section	.text,new
1880  0000               _UART2_WakeUpConfig:
1882  0000 88            	push	a
1883       00000000      OFST:	set	0
1886                     ; 448     assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1888  0001 4d            	tnz	a
1889  0002 2712          	jreq	L062
1890  0004 a108          	cp	a,#8
1891  0006 270e          	jreq	L062
1892  0008 ae01c0        	ldw	x,#448
1893  000b 89            	pushw	x
1894  000c 5f            	clrw	x
1895  000d 89            	pushw	x
1896  000e ae0008        	ldw	x,#L171
1897  0011 cd0000        	call	_assert_failed
1899  0014 5b04          	addw	sp,#4
1900  0016               L062:
1901                     ; 450     UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1903  0016 72175244      	bres	21060,#3
1904                     ; 451     UART2->CR1 |= (uint8_t)UART2_WakeUp;
1906  001a c65244        	ld	a,21060
1907  001d 1a01          	or	a,(OFST+1,sp)
1908  001f c75244        	ld	21060,a
1909                     ; 452 }
1912  0022 84            	pop	a
1913  0023 81            	ret	
1950                     ; 460 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1950                     ; 461 {
1951                     .text:	section	.text,new
1952  0000               _UART2_ReceiverWakeUpCmd:
1954  0000 88            	push	a
1955       00000000      OFST:	set	0
1958                     ; 462     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1960  0001 4d            	tnz	a
1961  0002 2711          	jreq	L272
1962  0004 4a            	dec	a
1963  0005 270e          	jreq	L272
1964  0007 ae01ce        	ldw	x,#462
1965  000a 89            	pushw	x
1966  000b 5f            	clrw	x
1967  000c 89            	pushw	x
1968  000d ae0008        	ldw	x,#L171
1969  0010 cd0000        	call	_assert_failed
1971  0013 5b04          	addw	sp,#4
1972  0015               L272:
1973                     ; 464     if (NewState != DISABLE)
1975  0015 7b01          	ld	a,(OFST+1,sp)
1976  0017 2706          	jreq	L307
1977                     ; 467         UART2->CR2 |= UART2_CR2_RWU;
1979  0019 72125245      	bset	21061,#1
1981  001d 2004          	jra	L507
1982  001f               L307:
1983                     ; 472         UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1985  001f 72135245      	bres	21061,#1
1986  0023               L507:
1987                     ; 474 }
1990  0023 84            	pop	a
1991  0024 81            	ret	
2014                     ; 481 uint8_t UART2_ReceiveData8(void)
2014                     ; 482 {
2015                     .text:	section	.text,new
2016  0000               _UART2_ReceiveData8:
2020                     ; 483     return ((uint8_t)UART2->DR);
2022  0000 c65241        	ld	a,21057
2025  0003 81            	ret	
2057                     ; 491 uint16_t UART2_ReceiveData9(void)
2057                     ; 492 {
2058                     .text:	section	.text,new
2059  0000               _UART2_ReceiveData9:
2061  0000 89            	pushw	x
2062       00000002      OFST:	set	2
2065                     ; 493   uint16_t temp = 0;
2067                     ; 495   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
2069  0001 c65244        	ld	a,21060
2070  0004 a480          	and	a,#128
2071  0006 5f            	clrw	x
2072  0007 02            	rlwa	x,a
2073  0008 58            	sllw	x
2074  0009 1f01          	ldw	(OFST-1,sp),x
2075                     ; 497   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
2077  000b c65241        	ld	a,21057
2078  000e 5f            	clrw	x
2079  000f 97            	ld	xl,a
2080  0010 01            	rrwa	x,a
2081  0011 1a02          	or	a,(OFST+0,sp)
2082  0013 01            	rrwa	x,a
2083  0014 1a01          	or	a,(OFST-1,sp)
2084  0016 a401          	and	a,#1
2085  0018 01            	rrwa	x,a
2088  0019 5b02          	addw	sp,#2
2089  001b 81            	ret	
2121                     ; 505 void UART2_SendData8(uint8_t Data)
2121                     ; 506 {
2122                     .text:	section	.text,new
2123  0000               _UART2_SendData8:
2127                     ; 508     UART2->DR = Data;
2129  0000 c75241        	ld	21057,a
2130                     ; 509 }
2133  0003 81            	ret	
2165                     ; 516 void UART2_SendData9(uint16_t Data)
2165                     ; 517 {
2166                     .text:	section	.text,new
2167  0000               _UART2_SendData9:
2169  0000 89            	pushw	x
2170       00000000      OFST:	set	0
2173                     ; 519     UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
2175  0001 721d5244      	bres	21060,#6
2176                     ; 522     UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
2178  0005 54            	srlw	x
2179  0006 54            	srlw	x
2180  0007 9f            	ld	a,xl
2181  0008 a440          	and	a,#64
2182  000a ca5244        	or	a,21060
2183  000d c75244        	ld	21060,a
2184                     ; 525     UART2->DR   = (uint8_t)(Data);                    
2186  0010 7b02          	ld	a,(OFST+2,sp)
2187  0012 c75241        	ld	21057,a
2188                     ; 527 }
2191  0015 85            	popw	x
2192  0016 81            	ret	
2215                     ; 534 void UART2_SendBreak(void)
2215                     ; 535 {
2216                     .text:	section	.text,new
2217  0000               _UART2_SendBreak:
2221                     ; 536     UART2->CR2 |= UART2_CR2_SBK;
2223  0000 72105245      	bset	21061,#0
2224                     ; 537 }
2227  0004 81            	ret	
2260                     ; 544 void UART2_SetAddress(uint8_t UART2_Address)
2260                     ; 545 {
2261                     .text:	section	.text,new
2262  0000               _UART2_SetAddress:
2264  0000 88            	push	a
2265       00000000      OFST:	set	0
2268                     ; 547     assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2270  0001 a110          	cp	a,#16
2271  0003 250e          	jrult	L413
2272  0005 ae0223        	ldw	x,#547
2273  0008 89            	pushw	x
2274  0009 5f            	clrw	x
2275  000a 89            	pushw	x
2276  000b ae0008        	ldw	x,#L171
2277  000e cd0000        	call	_assert_failed
2279  0011 5b04          	addw	sp,#4
2280  0013               L413:
2281                     ; 550     UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2283  0013 c65247        	ld	a,21063
2284  0016 a4f0          	and	a,#240
2285  0018 c75247        	ld	21063,a
2286                     ; 552     UART2->CR4 |= UART2_Address;
2288  001b c65247        	ld	a,21063
2289  001e 1a01          	or	a,(OFST+1,sp)
2290  0020 c75247        	ld	21063,a
2291                     ; 553 }
2294  0023 84            	pop	a
2295  0024 81            	ret	
2327                     ; 561 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2327                     ; 562 {
2328                     .text:	section	.text,new
2329  0000               _UART2_SetGuardTime:
2333                     ; 564     UART2->GTR = UART2_GuardTime;
2335  0000 c7524a        	ld	21066,a
2336                     ; 565 }
2339  0003 81            	ret	
2371                     ; 589 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2371                     ; 590 {
2372                     .text:	section	.text,new
2373  0000               _UART2_SetPrescaler:
2377                     ; 592     UART2->PSCR = UART2_Prescaler;
2379  0000 c7524b        	ld	21067,a
2380                     ; 593 }
2383  0003 81            	ret	
2541                     ; 601 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2541                     ; 602 {
2542                     .text:	section	.text,new
2543  0000               _UART2_GetFlagStatus:
2545  0000 89            	pushw	x
2546  0001 88            	push	a
2547       00000001      OFST:	set	1
2550                     ; 603     FlagStatus status = RESET;
2552  0002 0f01          	clr	(OFST+0,sp)
2553                     ; 606     assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2555  0004 a30080        	cpw	x,#128
2556  0007 2745          	jreq	L233
2557  0009 a30040        	cpw	x,#64
2558  000c 2740          	jreq	L233
2559  000e a30020        	cpw	x,#32
2560  0011 273b          	jreq	L233
2561  0013 a30010        	cpw	x,#16
2562  0016 2736          	jreq	L233
2563  0018 a30008        	cpw	x,#8
2564  001b 2731          	jreq	L233
2565  001d a30004        	cpw	x,#4
2566  0020 272c          	jreq	L233
2567  0022 a30002        	cpw	x,#2
2568  0025 2727          	jreq	L233
2569  0027 a30001        	cpw	x,#1
2570  002a 2722          	jreq	L233
2571  002c a30101        	cpw	x,#257
2572  002f 271d          	jreq	L233
2573  0031 a30301        	cpw	x,#769
2574  0034 2718          	jreq	L233
2575  0036 a30302        	cpw	x,#770
2576  0039 2713          	jreq	L233
2577  003b a30210        	cpw	x,#528
2578  003e 270e          	jreq	L233
2579  0040 ae025e        	ldw	x,#606
2580  0043 89            	pushw	x
2581  0044 5f            	clrw	x
2582  0045 89            	pushw	x
2583  0046 ae0008        	ldw	x,#L171
2584  0049 cd0000        	call	_assert_failed
2586  004c 5b04          	addw	sp,#4
2587  004e               L233:
2588                     ; 609     if (UART2_FLAG == UART2_FLAG_LBDF)
2590  004e 1e02          	ldw	x,(OFST+1,sp)
2591  0050 a30210        	cpw	x,#528
2592  0053 2609          	jrne	L5211
2593                     ; 611         if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2595  0055 c65247        	ld	a,21063
2596  0058 1503          	bcp	a,(OFST+2,sp)
2597  005a 2725          	jreq	L1511
2598                     ; 614             status = SET;
2600  005c 201f          	jp	LC010
2601                     ; 619             status = RESET;
2602  005e               L5211:
2603                     ; 622     else if (UART2_FLAG == UART2_FLAG_SBK)
2605  005e a30101        	cpw	x,#257
2606  0061 2609          	jrne	L5311
2607                     ; 624         if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2609  0063 c65245        	ld	a,21061
2610  0066 1503          	bcp	a,(OFST+2,sp)
2611  0068 2717          	jreq	L1511
2612                     ; 627             status = SET;
2614  006a 2011          	jp	LC010
2615                     ; 632             status = RESET;
2616  006c               L5311:
2617                     ; 635     else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2619  006c a30302        	cpw	x,#770
2620  006f 2705          	jreq	L7411
2622  0071 a30301        	cpw	x,#769
2623  0074 260f          	jrne	L5411
2624  0076               L7411:
2625                     ; 637         if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2627  0076 c65249        	ld	a,21065
2628  0079 1503          	bcp	a,(OFST+2,sp)
2629  007b 2704          	jreq	L1511
2630                     ; 640             status = SET;
2632  007d               LC010:
2636  007d a601          	ld	a,#1
2638  007f 2001          	jra	L3311
2639  0081               L1511:
2640                     ; 645             status = RESET;
2645  0081 4f            	clr	a
2646  0082               L3311:
2647                     ; 663     return  status;
2651  0082 5b03          	addw	sp,#3
2652  0084 81            	ret	
2653  0085               L5411:
2654                     ; 650         if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2656  0085 c65240        	ld	a,21056
2657  0088 1503          	bcp	a,(OFST+2,sp)
2658  008a 27f5          	jreq	L1511
2659                     ; 653             status = SET;
2661  008c 20ef          	jp	LC010
2662                     ; 658             status = RESET;
2698                     ; 693 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2698                     ; 694 {
2699                     .text:	section	.text,new
2700  0000               _UART2_ClearFlag:
2702  0000 89            	pushw	x
2703       00000000      OFST:	set	0
2706                     ; 695     assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2708  0001 a30020        	cpw	x,#32
2709  0004 271d          	jreq	L443
2710  0006 a30302        	cpw	x,#770
2711  0009 2718          	jreq	L443
2712  000b a30301        	cpw	x,#769
2713  000e 2713          	jreq	L443
2714  0010 a30210        	cpw	x,#528
2715  0013 270e          	jreq	L443
2716  0015 ae02b7        	ldw	x,#695
2717  0018 89            	pushw	x
2718  0019 5f            	clrw	x
2719  001a 89            	pushw	x
2720  001b ae0008        	ldw	x,#L171
2721  001e cd0000        	call	_assert_failed
2723  0021 5b04          	addw	sp,#4
2724  0023               L443:
2725                     ; 698     if (UART2_FLAG == UART2_FLAG_RXNE)
2727  0023 1e01          	ldw	x,(OFST+1,sp)
2728  0025 a30020        	cpw	x,#32
2729  0028 2606          	jrne	L1021
2730                     ; 700         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2732  002a 35df5240      	mov	21056,#223
2734  002e 201a          	jra	L3021
2735  0030               L1021:
2736                     ; 703     else if (UART2_FLAG == UART2_FLAG_LBDF)
2738  0030 a30210        	cpw	x,#528
2739  0033 2606          	jrne	L5021
2740                     ; 705         UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2742  0035 72195247      	bres	21063,#4
2744  0039 200f          	jra	L3021
2745  003b               L5021:
2746                     ; 708     else if (UART2_FLAG == UART2_FLAG_LHDF)
2748  003b a30302        	cpw	x,#770
2749  003e 2606          	jrne	L1121
2750                     ; 710         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2752  0040 72135249      	bres	21065,#1
2754  0044 2004          	jra	L3021
2755  0046               L1121:
2756                     ; 715         UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2758  0046 72115249      	bres	21065,#0
2759  004a               L3021:
2760                     ; 717 }
2763  004a 85            	popw	x
2764  004b 81            	ret	
2839                     ; 732 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2839                     ; 733 {
2840                     .text:	section	.text,new
2841  0000               _UART2_GetITStatus:
2843  0000 89            	pushw	x
2844  0001 89            	pushw	x
2845       00000002      OFST:	set	2
2848                     ; 734     ITStatus pendingbitstatus = RESET;
2850                     ; 735     uint8_t itpos = 0;
2852                     ; 736     uint8_t itmask1 = 0;
2854                     ; 737     uint8_t itmask2 = 0;
2856                     ; 738     uint8_t enablestatus = 0;
2858                     ; 741     assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2860  0002 1e03          	ldw	x,(OFST+1,sp)
2861  0004 a30277        	cpw	x,#631
2862  0007 2731          	jreq	L653
2863  0009 a30266        	cpw	x,#614
2864  000c 272c          	jreq	L653
2865  000e a30255        	cpw	x,#597
2866  0011 2727          	jreq	L653
2867  0013 a30244        	cpw	x,#580
2868  0016 2722          	jreq	L653
2869  0018 a30235        	cpw	x,#565
2870  001b 271d          	jreq	L653
2871  001d a30346        	cpw	x,#838
2872  0020 2718          	jreq	L653
2873  0022 a30412        	cpw	x,#1042
2874  0025 2713          	jreq	L653
2875  0027 a30100        	cpw	x,#256
2876  002a 270e          	jreq	L653
2877  002c ae02e5        	ldw	x,#741
2878  002f 89            	pushw	x
2879  0030 5f            	clrw	x
2880  0031 89            	pushw	x
2881  0032 ae0008        	ldw	x,#L171
2882  0035 cd0000        	call	_assert_failed
2884  0038 5b04          	addw	sp,#4
2885  003a               L653:
2886                     ; 744     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2888  003a 7b04          	ld	a,(OFST+2,sp)
2889  003c a40f          	and	a,#15
2890  003e 5f            	clrw	x
2891  003f 97            	ld	xl,a
2892  0040 a601          	ld	a,#1
2893  0042 5d            	tnzw	x
2894  0043 2704          	jreq	L263
2895  0045               L463:
2896  0045 48            	sll	a
2897  0046 5a            	decw	x
2898  0047 26fc          	jrne	L463
2899  0049               L263:
2900  0049 6b01          	ld	(OFST-1,sp),a
2901                     ; 746     itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2903  004b 7b04          	ld	a,(OFST+2,sp)
2904  004d 4e            	swap	a
2905  004e a40f          	and	a,#15
2906  0050 6b02          	ld	(OFST+0,sp),a
2907                     ; 748     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2909  0052 5f            	clrw	x
2910  0053 97            	ld	xl,a
2911  0054 a601          	ld	a,#1
2912  0056 5d            	tnzw	x
2913  0057 2704          	jreq	L663
2914  0059               L073:
2915  0059 48            	sll	a
2916  005a 5a            	decw	x
2917  005b 26fc          	jrne	L073
2918  005d               L663:
2919  005d 6b02          	ld	(OFST+0,sp),a
2920                     ; 751     if (UART2_IT == UART2_IT_PE)
2922  005f 1e03          	ldw	x,(OFST+1,sp)
2923  0061 a30100        	cpw	x,#256
2924  0064 260c          	jrne	L7421
2925                     ; 754         enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2927  0066 c65244        	ld	a,21060
2928  0069 1402          	and	a,(OFST+0,sp)
2929  006b 6b02          	ld	(OFST+0,sp),a
2930                     ; 757         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2932  006d c65240        	ld	a,21056
2934                     ; 760             pendingbitstatus = SET;
2936  0070 2020          	jp	LC013
2937                     ; 765             pendingbitstatus = RESET;
2938  0072               L7421:
2939                     ; 768     else if (UART2_IT == UART2_IT_LBDF)
2941  0072 a30346        	cpw	x,#838
2942  0075 260c          	jrne	L7521
2943                     ; 771         enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2945  0077 c65247        	ld	a,21063
2946  007a 1402          	and	a,(OFST+0,sp)
2947  007c 6b02          	ld	(OFST+0,sp),a
2948                     ; 773         if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2950  007e c65247        	ld	a,21063
2952                     ; 776             pendingbitstatus = SET;
2954  0081 200f          	jp	LC013
2955                     ; 781             pendingbitstatus = RESET;
2956  0083               L7521:
2957                     ; 784     else if (UART2_IT == UART2_IT_LHDF)
2959  0083 a30412        	cpw	x,#1042
2960  0086 2616          	jrne	L7621
2961                     ; 787         enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2963  0088 c65249        	ld	a,21065
2964  008b 1402          	and	a,(OFST+0,sp)
2965  008d 6b02          	ld	(OFST+0,sp),a
2966                     ; 789         if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2968  008f c65249        	ld	a,21065
2970  0092               LC013:
2971  0092 1501          	bcp	a,(OFST-1,sp)
2972  0094 271a          	jreq	L7721
2973  0096 7b02          	ld	a,(OFST+0,sp)
2974  0098 2716          	jreq	L7721
2975                     ; 792             pendingbitstatus = SET;
2977  009a               LC012:
2981  009a a601          	ld	a,#1
2983  009c 2013          	jra	L5521
2984                     ; 797             pendingbitstatus = RESET;
2985  009e               L7621:
2986                     ; 803         enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2988  009e c65245        	ld	a,21061
2989  00a1 1402          	and	a,(OFST+0,sp)
2990  00a3 6b02          	ld	(OFST+0,sp),a
2991                     ; 805         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2993  00a5 c65240        	ld	a,21056
2994  00a8 1501          	bcp	a,(OFST-1,sp)
2995  00aa 2704          	jreq	L7721
2997  00ac 7b02          	ld	a,(OFST+0,sp)
2998                     ; 808             pendingbitstatus = SET;
3000  00ae 26ea          	jrne	LC012
3001  00b0               L7721:
3002                     ; 813             pendingbitstatus = RESET;
3007  00b0 4f            	clr	a
3008  00b1               L5521:
3009                     ; 817     return  pendingbitstatus;
3013  00b1 5b04          	addw	sp,#4
3014  00b3 81            	ret	
3051                     ; 846 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
3051                     ; 847 {
3052                     .text:	section	.text,new
3053  0000               _UART2_ClearITPendingBit:
3055  0000 89            	pushw	x
3056       00000000      OFST:	set	0
3059                     ; 848     assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
3061  0001 a30255        	cpw	x,#597
3062  0004 2718          	jreq	L004
3063  0006 a30412        	cpw	x,#1042
3064  0009 2713          	jreq	L004
3065  000b a30346        	cpw	x,#838
3066  000e 270e          	jreq	L004
3067  0010 ae0350        	ldw	x,#848
3068  0013 89            	pushw	x
3069  0014 5f            	clrw	x
3070  0015 89            	pushw	x
3071  0016 ae0008        	ldw	x,#L171
3072  0019 cd0000        	call	_assert_failed
3074  001c 5b04          	addw	sp,#4
3075  001e               L004:
3076                     ; 851     if (UART2_IT == UART2_IT_RXNE)
3078  001e 1e01          	ldw	x,(OFST+1,sp)
3079  0020 a30255        	cpw	x,#597
3080  0023 2606          	jrne	L1231
3081                     ; 853         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
3083  0025 35df5240      	mov	21056,#223
3085  0029 200f          	jra	L3231
3086  002b               L1231:
3087                     ; 856     else if (UART2_IT == UART2_IT_LBDF)
3089  002b a30346        	cpw	x,#838
3090  002e 2606          	jrne	L5231
3091                     ; 858         UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
3093  0030 72195247      	bres	21063,#4
3095  0034 2004          	jra	L3231
3096  0036               L5231:
3097                     ; 863         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
3099  0036 72135249      	bres	21065,#1
3100  003a               L3231:
3101                     ; 865 }
3104  003a 85            	popw	x
3105  003b 81            	ret	
3118                     	xdef	_UART2_ClearITPendingBit
3119                     	xdef	_UART2_GetITStatus
3120                     	xdef	_UART2_ClearFlag
3121                     	xdef	_UART2_GetFlagStatus
3122                     	xdef	_UART2_SetPrescaler
3123                     	xdef	_UART2_SetGuardTime
3124                     	xdef	_UART2_SetAddress
3125                     	xdef	_UART2_SendBreak
3126                     	xdef	_UART2_SendData9
3127                     	xdef	_UART2_SendData8
3128                     	xdef	_UART2_ReceiveData9
3129                     	xdef	_UART2_ReceiveData8
3130                     	xdef	_UART2_ReceiverWakeUpCmd
3131                     	xdef	_UART2_WakeUpConfig
3132                     	xdef	_UART2_SmartCardNACKCmd
3133                     	xdef	_UART2_SmartCardCmd
3134                     	xdef	_UART2_LINCmd
3135                     	xdef	_UART2_LINConfig
3136                     	xdef	_UART2_LINBreakDetectionConfig
3137                     	xdef	_UART2_IrDACmd
3138                     	xdef	_UART2_IrDAConfig
3139                     	xdef	_UART2_ITConfig
3140                     	xdef	_UART2_Cmd
3141                     	xdef	_UART2_Init
3142                     	xdef	_UART2_DeInit
3143                     	xref	_assert_failed
3144                     	xref	_CLK_GetClockFreq
3145                     	switch	.const
3146  0008               L171:
3147  0008 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
3148  001a 6965735c7374  	dc.b	"ies\stm8s_stdperip"
3149  002c 685f64726976  	dc.b	"h_driver\src\stm8s"
3150  003e 5f7561727432  	dc.b	"_uart2.c",0
3151                     	xref.b	c_lreg
3171                     	xref	c_lursh
3172                     	xref	c_lsub
3173                     	xref	c_smul
3174                     	xref	c_ludv
3175                     	xref	c_rtol
3176                     	xref	c_llsh
3177                     	xref	c_lcmp
3178                     	xref	c_ltor
3179                     	end
