   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 47 void UART2_DeInit(void)
  32                     ; 48 {
  34                     	switch	.text
  35  0000               _UART2_DeInit:
  39                     ; 51     (void) UART2->SR;
  41  0000 c65240        	ld	a,21056
  42  0003 97            	ld	xl,a
  43                     ; 52     (void)UART2->DR;
  45  0004 c65241        	ld	a,21057
  46  0007 97            	ld	xl,a
  47                     ; 54     UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  49  0008 725f5243      	clr	21059
  50                     ; 55     UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  52  000c 725f5242      	clr	21058
  53                     ; 57     UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  55  0010 725f5244      	clr	21060
  56                     ; 58     UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  58  0014 725f5245      	clr	21061
  59                     ; 59     UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  61  0018 725f5246      	clr	21062
  62                     ; 60     UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  64  001c 725f5247      	clr	21063
  65                     ; 61     UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  67  0020 725f5248      	clr	21064
  68                     ; 62     UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  70  0024 725f5249      	clr	21065
  71                     ; 64 }
  74  0028 81            	ret
 396                     .const:	section	.text
 397  0000               L21:
 398  0000 00098969      	dc.l	625001
 399  0004               L25:
 400  0004 00000064      	dc.l	100
 401                     ; 80 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 401                     ; 81 {
 402                     	switch	.text
 403  0029               _UART2_Init:
 405  0029 520e          	subw	sp,#14
 406       0000000e      OFST:	set	14
 409                     ; 82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
 411  002b 7b05          	ld	a,(OFST-9,sp)
 412  002d 97            	ld	xl,a
 415  002e 7b06          	ld	a,(OFST-8,sp)
 416  0030 97            	ld	xl,a
 417                     ; 83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 419  0031 96            	ldw	x,sp
 420  0032 1c000b        	addw	x,#OFST-3
 421  0035 cd0000        	call	c_ltor
 425  0038 96            	ldw	x,sp
 426  0039 1c0007        	addw	x,#OFST-7
 427  003c cd0000        	call	c_ltor
 429                     ; 86     assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 431  003f 96            	ldw	x,sp
 432  0040 1c0011        	addw	x,#OFST+3
 433  0043 cd0000        	call	c_ltor
 435  0046 ae0000        	ldw	x,#L21
 436  0049 cd0000        	call	c_lcmp
 438  004c 2403          	jruge	L01
 439  004e 4f            	clr	a
 440  004f 2010          	jra	L41
 441  0051               L01:
 442  0051 ae0056        	ldw	x,#86
 443  0054 89            	pushw	x
 444  0055 ae0000        	ldw	x,#0
 445  0058 89            	pushw	x
 446  0059 ae0008        	ldw	x,#L302
 447  005c cd0000        	call	_assert_failed
 449  005f 5b04          	addw	sp,#4
 450  0061               L41:
 451                     ; 87     assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 453  0061 0d15          	tnz	(OFST+7,sp)
 454  0063 2706          	jreq	L02
 455  0065 7b15          	ld	a,(OFST+7,sp)
 456  0067 a110          	cp	a,#16
 457  0069 2603          	jrne	L61
 458  006b               L02:
 459  006b 4f            	clr	a
 460  006c 2010          	jra	L22
 461  006e               L61:
 462  006e ae0057        	ldw	x,#87
 463  0071 89            	pushw	x
 464  0072 ae0000        	ldw	x,#0
 465  0075 89            	pushw	x
 466  0076 ae0008        	ldw	x,#L302
 467  0079 cd0000        	call	_assert_failed
 469  007c 5b04          	addw	sp,#4
 470  007e               L22:
 471                     ; 88     assert_param(IS_UART2_STOPBITS_OK(StopBits));
 473  007e 0d16          	tnz	(OFST+8,sp)
 474  0080 2712          	jreq	L62
 475  0082 7b16          	ld	a,(OFST+8,sp)
 476  0084 a110          	cp	a,#16
 477  0086 270c          	jreq	L62
 478  0088 7b16          	ld	a,(OFST+8,sp)
 479  008a a120          	cp	a,#32
 480  008c 2706          	jreq	L62
 481  008e 7b16          	ld	a,(OFST+8,sp)
 482  0090 a130          	cp	a,#48
 483  0092 2603          	jrne	L42
 484  0094               L62:
 485  0094 4f            	clr	a
 486  0095 2010          	jra	L03
 487  0097               L42:
 488  0097 ae0058        	ldw	x,#88
 489  009a 89            	pushw	x
 490  009b ae0000        	ldw	x,#0
 491  009e 89            	pushw	x
 492  009f ae0008        	ldw	x,#L302
 493  00a2 cd0000        	call	_assert_failed
 495  00a5 5b04          	addw	sp,#4
 496  00a7               L03:
 497                     ; 89     assert_param(IS_UART2_PARITY_OK(Parity));
 499  00a7 0d17          	tnz	(OFST+9,sp)
 500  00a9 270c          	jreq	L43
 501  00ab 7b17          	ld	a,(OFST+9,sp)
 502  00ad a104          	cp	a,#4
 503  00af 2706          	jreq	L43
 504  00b1 7b17          	ld	a,(OFST+9,sp)
 505  00b3 a106          	cp	a,#6
 506  00b5 2603          	jrne	L23
 507  00b7               L43:
 508  00b7 4f            	clr	a
 509  00b8 2010          	jra	L63
 510  00ba               L23:
 511  00ba ae0059        	ldw	x,#89
 512  00bd 89            	pushw	x
 513  00be ae0000        	ldw	x,#0
 514  00c1 89            	pushw	x
 515  00c2 ae0008        	ldw	x,#L302
 516  00c5 cd0000        	call	_assert_failed
 518  00c8 5b04          	addw	sp,#4
 519  00ca               L63:
 520                     ; 90     assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 522  00ca 7b19          	ld	a,(OFST+11,sp)
 523  00cc a108          	cp	a,#8
 524  00ce 2730          	jreq	L24
 525  00d0 7b19          	ld	a,(OFST+11,sp)
 526  00d2 a140          	cp	a,#64
 527  00d4 272a          	jreq	L24
 528  00d6 7b19          	ld	a,(OFST+11,sp)
 529  00d8 a104          	cp	a,#4
 530  00da 2724          	jreq	L24
 531  00dc 7b19          	ld	a,(OFST+11,sp)
 532  00de a180          	cp	a,#128
 533  00e0 271e          	jreq	L24
 534  00e2 7b19          	ld	a,(OFST+11,sp)
 535  00e4 a10c          	cp	a,#12
 536  00e6 2718          	jreq	L24
 537  00e8 7b19          	ld	a,(OFST+11,sp)
 538  00ea a10c          	cp	a,#12
 539  00ec 2712          	jreq	L24
 540  00ee 7b19          	ld	a,(OFST+11,sp)
 541  00f0 a144          	cp	a,#68
 542  00f2 270c          	jreq	L24
 543  00f4 7b19          	ld	a,(OFST+11,sp)
 544  00f6 a1c0          	cp	a,#192
 545  00f8 2706          	jreq	L24
 546  00fa 7b19          	ld	a,(OFST+11,sp)
 547  00fc a188          	cp	a,#136
 548  00fe 2603          	jrne	L04
 549  0100               L24:
 550  0100 4f            	clr	a
 551  0101 2010          	jra	L44
 552  0103               L04:
 553  0103 ae005a        	ldw	x,#90
 554  0106 89            	pushw	x
 555  0107 ae0000        	ldw	x,#0
 556  010a 89            	pushw	x
 557  010b ae0008        	ldw	x,#L302
 558  010e cd0000        	call	_assert_failed
 560  0111 5b04          	addw	sp,#4
 561  0113               L44:
 562                     ; 91     assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 564  0113 7b18          	ld	a,(OFST+10,sp)
 565  0115 a488          	and	a,#136
 566  0117 a188          	cp	a,#136
 567  0119 271b          	jreq	L64
 568  011b 7b18          	ld	a,(OFST+10,sp)
 569  011d a444          	and	a,#68
 570  011f a144          	cp	a,#68
 571  0121 2713          	jreq	L64
 572  0123 7b18          	ld	a,(OFST+10,sp)
 573  0125 a422          	and	a,#34
 574  0127 a122          	cp	a,#34
 575  0129 270b          	jreq	L64
 576  012b 7b18          	ld	a,(OFST+10,sp)
 577  012d a411          	and	a,#17
 578  012f a111          	cp	a,#17
 579  0131 2703          	jreq	L64
 580  0133 4f            	clr	a
 581  0134 2010          	jra	L05
 582  0136               L64:
 583  0136 ae005b        	ldw	x,#91
 584  0139 89            	pushw	x
 585  013a ae0000        	ldw	x,#0
 586  013d 89            	pushw	x
 587  013e ae0008        	ldw	x,#L302
 588  0141 cd0000        	call	_assert_failed
 590  0144 5b04          	addw	sp,#4
 591  0146               L05:
 592                     ; 94     UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 594  0146 72195244      	bres	21060,#4
 595                     ; 96     UART2->CR1 |= (uint8_t)WordLength; 
 597  014a c65244        	ld	a,21060
 598  014d 1a15          	or	a,(OFST+7,sp)
 599  014f c75244        	ld	21060,a
 600                     ; 99     UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 602  0152 c65246        	ld	a,21062
 603  0155 a4cf          	and	a,#207
 604  0157 c75246        	ld	21062,a
 605                     ; 101     UART2->CR3 |= (uint8_t)StopBits; 
 607  015a c65246        	ld	a,21062
 608  015d 1a16          	or	a,(OFST+8,sp)
 609  015f c75246        	ld	21062,a
 610                     ; 104     UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 612  0162 c65244        	ld	a,21060
 613  0165 a4f9          	and	a,#249
 614  0167 c75244        	ld	21060,a
 615                     ; 106     UART2->CR1 |= (uint8_t)Parity;
 617  016a c65244        	ld	a,21060
 618  016d 1a17          	or	a,(OFST+9,sp)
 619  016f c75244        	ld	21060,a
 620                     ; 109     UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 622  0172 725f5242      	clr	21058
 623                     ; 111     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 625  0176 c65243        	ld	a,21059
 626  0179 a40f          	and	a,#15
 627  017b c75243        	ld	21059,a
 628                     ; 113     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 630  017e c65243        	ld	a,21059
 631  0181 a4f0          	and	a,#240
 632  0183 c75243        	ld	21059,a
 633                     ; 116     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 635  0186 96            	ldw	x,sp
 636  0187 1c0011        	addw	x,#OFST+3
 637  018a cd0000        	call	c_ltor
 639  018d a604          	ld	a,#4
 640  018f cd0000        	call	c_llsh
 642  0192 96            	ldw	x,sp
 643  0193 1c0001        	addw	x,#OFST-13
 644  0196 cd0000        	call	c_rtol
 646  0199 cd0000        	call	_CLK_GetClockFreq
 648  019c 96            	ldw	x,sp
 649  019d 1c0001        	addw	x,#OFST-13
 650  01a0 cd0000        	call	c_ludv
 652  01a3 96            	ldw	x,sp
 653  01a4 1c000b        	addw	x,#OFST-3
 654  01a7 cd0000        	call	c_rtol
 656                     ; 117     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 658  01aa 96            	ldw	x,sp
 659  01ab 1c0011        	addw	x,#OFST+3
 660  01ae cd0000        	call	c_ltor
 662  01b1 a604          	ld	a,#4
 663  01b3 cd0000        	call	c_llsh
 665  01b6 96            	ldw	x,sp
 666  01b7 1c0001        	addw	x,#OFST-13
 667  01ba cd0000        	call	c_rtol
 669  01bd cd0000        	call	_CLK_GetClockFreq
 671  01c0 a664          	ld	a,#100
 672  01c2 cd0000        	call	c_smul
 674  01c5 96            	ldw	x,sp
 675  01c6 1c0001        	addw	x,#OFST-13
 676  01c9 cd0000        	call	c_ludv
 678  01cc 96            	ldw	x,sp
 679  01cd 1c0007        	addw	x,#OFST-7
 680  01d0 cd0000        	call	c_rtol
 682                     ; 121     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 682                     ; 122                         << 4) / 100) & (uint8_t)0x0F); 
 684  01d3 96            	ldw	x,sp
 685  01d4 1c000b        	addw	x,#OFST-3
 686  01d7 cd0000        	call	c_ltor
 688  01da a664          	ld	a,#100
 689  01dc cd0000        	call	c_smul
 691  01df 96            	ldw	x,sp
 692  01e0 1c0001        	addw	x,#OFST-13
 693  01e3 cd0000        	call	c_rtol
 695  01e6 96            	ldw	x,sp
 696  01e7 1c0007        	addw	x,#OFST-7
 697  01ea cd0000        	call	c_ltor
 699  01ed 96            	ldw	x,sp
 700  01ee 1c0001        	addw	x,#OFST-13
 701  01f1 cd0000        	call	c_lsub
 703  01f4 a604          	ld	a,#4
 704  01f6 cd0000        	call	c_llsh
 706  01f9 ae0004        	ldw	x,#L25
 707  01fc cd0000        	call	c_ludv
 709  01ff b603          	ld	a,c_lreg+3
 710  0201 a40f          	and	a,#15
 711  0203 6b05          	ld	(OFST-9,sp),a
 712                     ; 123     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 714  0205 96            	ldw	x,sp
 715  0206 1c000b        	addw	x,#OFST-3
 716  0209 cd0000        	call	c_ltor
 718  020c a604          	ld	a,#4
 719  020e cd0000        	call	c_lursh
 721  0211 b603          	ld	a,c_lreg+3
 722  0213 a4f0          	and	a,#240
 723  0215 b703          	ld	c_lreg+3,a
 724  0217 3f02          	clr	c_lreg+2
 725  0219 3f01          	clr	c_lreg+1
 726  021b 3f00          	clr	c_lreg
 727  021d b603          	ld	a,c_lreg+3
 728  021f 6b06          	ld	(OFST-8,sp),a
 729                     ; 125     UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 731  0221 7b05          	ld	a,(OFST-9,sp)
 732  0223 1a06          	or	a,(OFST-8,sp)
 733  0225 c75243        	ld	21059,a
 734                     ; 127     UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 736  0228 7b0e          	ld	a,(OFST+0,sp)
 737  022a c75242        	ld	21058,a
 738                     ; 130     UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 740  022d c65245        	ld	a,21061
 741  0230 a4f3          	and	a,#243
 742  0232 c75245        	ld	21061,a
 743                     ; 132     UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 745  0235 c65246        	ld	a,21062
 746  0238 a4f8          	and	a,#248
 747  023a c75246        	ld	21062,a
 748                     ; 134     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 748                     ; 135                                               UART2_CR3_CPHA | UART2_CR3_LBCL));
 750  023d 7b18          	ld	a,(OFST+10,sp)
 751  023f a407          	and	a,#7
 752  0241 ca5246        	or	a,21062
 753  0244 c75246        	ld	21062,a
 754                     ; 137     if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 756  0247 7b19          	ld	a,(OFST+11,sp)
 757  0249 a504          	bcp	a,#4
 758  024b 2706          	jreq	L502
 759                     ; 140         UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 761  024d 72165245      	bset	21061,#3
 763  0251 2004          	jra	L702
 764  0253               L502:
 765                     ; 145         UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 767  0253 72175245      	bres	21061,#3
 768  0257               L702:
 769                     ; 147     if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 771  0257 7b19          	ld	a,(OFST+11,sp)
 772  0259 a508          	bcp	a,#8
 773  025b 2706          	jreq	L112
 774                     ; 150         UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 776  025d 72145245      	bset	21061,#2
 778  0261 2004          	jra	L312
 779  0263               L112:
 780                     ; 155         UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 782  0263 72155245      	bres	21061,#2
 783  0267               L312:
 784                     ; 159     if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 786  0267 7b18          	ld	a,(OFST+10,sp)
 787  0269 a580          	bcp	a,#128
 788  026b 2706          	jreq	L512
 789                     ; 162         UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 791  026d 72175246      	bres	21062,#3
 793  0271 200a          	jra	L712
 794  0273               L512:
 795                     ; 166         UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 797  0273 7b18          	ld	a,(OFST+10,sp)
 798  0275 a408          	and	a,#8
 799  0277 ca5246        	or	a,21062
 800  027a c75246        	ld	21062,a
 801  027d               L712:
 802                     ; 168 }
 805  027d 5b0e          	addw	sp,#14
 806  027f 81            	ret
 861                     ; 176 void UART2_Cmd(FunctionalState NewState)
 861                     ; 177 {
 862                     	switch	.text
 863  0280               _UART2_Cmd:
 867                     ; 179     if (NewState != DISABLE)
 869  0280 4d            	tnz	a
 870  0281 2706          	jreq	L742
 871                     ; 182         UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 873  0283 721b5244      	bres	21060,#5
 875  0287 2004          	jra	L152
 876  0289               L742:
 877                     ; 187         UART2->CR1 |= UART2_CR1_UARTD; 
 879  0289 721a5244      	bset	21060,#5
 880  028d               L152:
 881                     ; 189 }
 884  028d 81            	ret
1017                     ; 206 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
1017                     ; 207 {
1018                     	switch	.text
1019  028e               _UART2_ITConfig:
1021  028e 89            	pushw	x
1022  028f 89            	pushw	x
1023       00000002      OFST:	set	2
1026                     ; 208     uint8_t uartreg = 0, itpos = 0x00;
1028  0290 7b01          	ld	a,(OFST-1,sp)
1029  0292 97            	ld	xl,a
1032  0293 7b02          	ld	a,(OFST+0,sp)
1033  0295 97            	ld	xl,a
1034                     ; 211     assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
1036  0296 1e03          	ldw	x,(OFST+1,sp)
1037  0298 a30100        	cpw	x,#256
1038  029b 272a          	jreq	L26
1039  029d 1e03          	ldw	x,(OFST+1,sp)
1040  029f a30277        	cpw	x,#631
1041  02a2 2723          	jreq	L26
1042  02a4 1e03          	ldw	x,(OFST+1,sp)
1043  02a6 a30266        	cpw	x,#614
1044  02a9 271c          	jreq	L26
1045  02ab 1e03          	ldw	x,(OFST+1,sp)
1046  02ad a30205        	cpw	x,#517
1047  02b0 2715          	jreq	L26
1048  02b2 1e03          	ldw	x,(OFST+1,sp)
1049  02b4 a30244        	cpw	x,#580
1050  02b7 270e          	jreq	L26
1051  02b9 1e03          	ldw	x,(OFST+1,sp)
1052  02bb a30412        	cpw	x,#1042
1053  02be 2707          	jreq	L26
1054  02c0 1e03          	ldw	x,(OFST+1,sp)
1055  02c2 a30346        	cpw	x,#838
1056  02c5 2603          	jrne	L06
1057  02c7               L26:
1058  02c7 4f            	clr	a
1059  02c8 2010          	jra	L46
1060  02ca               L06:
1061  02ca ae00d3        	ldw	x,#211
1062  02cd 89            	pushw	x
1063  02ce ae0000        	ldw	x,#0
1064  02d1 89            	pushw	x
1065  02d2 ae0008        	ldw	x,#L302
1066  02d5 cd0000        	call	_assert_failed
1068  02d8 5b04          	addw	sp,#4
1069  02da               L46:
1070                     ; 212     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1072  02da 0d07          	tnz	(OFST+5,sp)
1073  02dc 2706          	jreq	L07
1074  02de 7b07          	ld	a,(OFST+5,sp)
1075  02e0 a101          	cp	a,#1
1076  02e2 2603          	jrne	L66
1077  02e4               L07:
1078  02e4 4f            	clr	a
1079  02e5 2010          	jra	L27
1080  02e7               L66:
1081  02e7 ae00d4        	ldw	x,#212
1082  02ea 89            	pushw	x
1083  02eb ae0000        	ldw	x,#0
1084  02ee 89            	pushw	x
1085  02ef ae0008        	ldw	x,#L302
1086  02f2 cd0000        	call	_assert_failed
1088  02f5 5b04          	addw	sp,#4
1089  02f7               L27:
1090                     ; 215     uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
1092  02f7 7b03          	ld	a,(OFST+1,sp)
1093  02f9 6b01          	ld	(OFST-1,sp),a
1094                     ; 218     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
1096  02fb 7b04          	ld	a,(OFST+2,sp)
1097  02fd a40f          	and	a,#15
1098  02ff 5f            	clrw	x
1099  0300 97            	ld	xl,a
1100  0301 a601          	ld	a,#1
1101  0303 5d            	tnzw	x
1102  0304 2704          	jreq	L47
1103  0306               L67:
1104  0306 48            	sll	a
1105  0307 5a            	decw	x
1106  0308 26fc          	jrne	L67
1107  030a               L47:
1108  030a 6b02          	ld	(OFST+0,sp),a
1109                     ; 220     if (NewState != DISABLE)
1111  030c 0d07          	tnz	(OFST+5,sp)
1112  030e 273a          	jreq	L333
1113                     ; 223         if (uartreg == 0x01)
1115  0310 7b01          	ld	a,(OFST-1,sp)
1116  0312 a101          	cp	a,#1
1117  0314 260a          	jrne	L533
1118                     ; 225             UART2->CR1 |= itpos;
1120  0316 c65244        	ld	a,21060
1121  0319 1a02          	or	a,(OFST+0,sp)
1122  031b c75244        	ld	21060,a
1124  031e 2066          	jra	L153
1125  0320               L533:
1126                     ; 227         else if (uartreg == 0x02)
1128  0320 7b01          	ld	a,(OFST-1,sp)
1129  0322 a102          	cp	a,#2
1130  0324 260a          	jrne	L143
1131                     ; 229             UART2->CR2 |= itpos;
1133  0326 c65245        	ld	a,21061
1134  0329 1a02          	or	a,(OFST+0,sp)
1135  032b c75245        	ld	21061,a
1137  032e 2056          	jra	L153
1138  0330               L143:
1139                     ; 231         else if (uartreg == 0x03)
1141  0330 7b01          	ld	a,(OFST-1,sp)
1142  0332 a103          	cp	a,#3
1143  0334 260a          	jrne	L543
1144                     ; 233             UART2->CR4 |= itpos;
1146  0336 c65247        	ld	a,21063
1147  0339 1a02          	or	a,(OFST+0,sp)
1148  033b c75247        	ld	21063,a
1150  033e 2046          	jra	L153
1151  0340               L543:
1152                     ; 237             UART2->CR6 |= itpos;
1154  0340 c65249        	ld	a,21065
1155  0343 1a02          	or	a,(OFST+0,sp)
1156  0345 c75249        	ld	21065,a
1157  0348 203c          	jra	L153
1158  034a               L333:
1159                     ; 243         if (uartreg == 0x01)
1161  034a 7b01          	ld	a,(OFST-1,sp)
1162  034c a101          	cp	a,#1
1163  034e 260b          	jrne	L353
1164                     ; 245             UART2->CR1 &= (uint8_t)(~itpos);
1166  0350 7b02          	ld	a,(OFST+0,sp)
1167  0352 43            	cpl	a
1168  0353 c45244        	and	a,21060
1169  0356 c75244        	ld	21060,a
1171  0359 202b          	jra	L153
1172  035b               L353:
1173                     ; 247         else if (uartreg == 0x02)
1175  035b 7b01          	ld	a,(OFST-1,sp)
1176  035d a102          	cp	a,#2
1177  035f 260b          	jrne	L753
1178                     ; 249             UART2->CR2 &= (uint8_t)(~itpos);
1180  0361 7b02          	ld	a,(OFST+0,sp)
1181  0363 43            	cpl	a
1182  0364 c45245        	and	a,21061
1183  0367 c75245        	ld	21061,a
1185  036a 201a          	jra	L153
1186  036c               L753:
1187                     ; 251         else if (uartreg == 0x03)
1189  036c 7b01          	ld	a,(OFST-1,sp)
1190  036e a103          	cp	a,#3
1191  0370 260b          	jrne	L363
1192                     ; 253             UART2->CR4 &= (uint8_t)(~itpos);
1194  0372 7b02          	ld	a,(OFST+0,sp)
1195  0374 43            	cpl	a
1196  0375 c45247        	and	a,21063
1197  0378 c75247        	ld	21063,a
1199  037b 2009          	jra	L153
1200  037d               L363:
1201                     ; 257             UART2->CR6 &= (uint8_t)(~itpos);
1203  037d 7b02          	ld	a,(OFST+0,sp)
1204  037f 43            	cpl	a
1205  0380 c45249        	and	a,21065
1206  0383 c75249        	ld	21065,a
1207  0386               L153:
1208                     ; 260 }
1211  0386 5b04          	addw	sp,#4
1212  0388 81            	ret
1270                     ; 267 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1270                     ; 268 {
1271                     	switch	.text
1272  0389               _UART2_IrDAConfig:
1274  0389 88            	push	a
1275       00000000      OFST:	set	0
1278                     ; 269     assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1280  038a a101          	cp	a,#1
1281  038c 2703          	jreq	L401
1282  038e 4d            	tnz	a
1283  038f 2603          	jrne	L201
1284  0391               L401:
1285  0391 4f            	clr	a
1286  0392 2010          	jra	L601
1287  0394               L201:
1288  0394 ae010d        	ldw	x,#269
1289  0397 89            	pushw	x
1290  0398 ae0000        	ldw	x,#0
1291  039b 89            	pushw	x
1292  039c ae0008        	ldw	x,#L302
1293  039f cd0000        	call	_assert_failed
1295  03a2 5b04          	addw	sp,#4
1296  03a4               L601:
1297                     ; 271     if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1299  03a4 0d01          	tnz	(OFST+1,sp)
1300  03a6 2706          	jreq	L514
1301                     ; 273         UART2->CR5 |= UART2_CR5_IRLP;
1303  03a8 72145248      	bset	21064,#2
1305  03ac 2004          	jra	L714
1306  03ae               L514:
1307                     ; 277         UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1309  03ae 72155248      	bres	21064,#2
1310  03b2               L714:
1311                     ; 279 }
1314  03b2 84            	pop	a
1315  03b3 81            	ret
1351                     ; 287 void UART2_IrDACmd(FunctionalState NewState)
1351                     ; 288 {
1352                     	switch	.text
1353  03b4               _UART2_IrDACmd:
1355  03b4 88            	push	a
1356       00000000      OFST:	set	0
1359                     ; 290     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1361  03b5 4d            	tnz	a
1362  03b6 2704          	jreq	L411
1363  03b8 a101          	cp	a,#1
1364  03ba 2603          	jrne	L211
1365  03bc               L411:
1366  03bc 4f            	clr	a
1367  03bd 2010          	jra	L611
1368  03bf               L211:
1369  03bf ae0122        	ldw	x,#290
1370  03c2 89            	pushw	x
1371  03c3 ae0000        	ldw	x,#0
1372  03c6 89            	pushw	x
1373  03c7 ae0008        	ldw	x,#L302
1374  03ca cd0000        	call	_assert_failed
1376  03cd 5b04          	addw	sp,#4
1377  03cf               L611:
1378                     ; 292     if (NewState != DISABLE)
1380  03cf 0d01          	tnz	(OFST+1,sp)
1381  03d1 2706          	jreq	L734
1382                     ; 295         UART2->CR5 |= UART2_CR5_IREN;
1384  03d3 72125248      	bset	21064,#1
1386  03d7 2004          	jra	L144
1387  03d9               L734:
1388                     ; 300         UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1390  03d9 72135248      	bres	21064,#1
1391  03dd               L144:
1392                     ; 302 }
1395  03dd 84            	pop	a
1396  03de 81            	ret
1456                     ; 311 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1456                     ; 312 {
1457                     	switch	.text
1458  03df               _UART2_LINBreakDetectionConfig:
1460  03df 88            	push	a
1461       00000000      OFST:	set	0
1464                     ; 314     assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1466  03e0 4d            	tnz	a
1467  03e1 2704          	jreq	L421
1468  03e3 a101          	cp	a,#1
1469  03e5 2603          	jrne	L221
1470  03e7               L421:
1471  03e7 4f            	clr	a
1472  03e8 2010          	jra	L621
1473  03ea               L221:
1474  03ea ae013a        	ldw	x,#314
1475  03ed 89            	pushw	x
1476  03ee ae0000        	ldw	x,#0
1477  03f1 89            	pushw	x
1478  03f2 ae0008        	ldw	x,#L302
1479  03f5 cd0000        	call	_assert_failed
1481  03f8 5b04          	addw	sp,#4
1482  03fa               L621:
1483                     ; 316     if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1485  03fa 0d01          	tnz	(OFST+1,sp)
1486  03fc 2706          	jreq	L174
1487                     ; 318         UART2->CR4 |= UART2_CR4_LBDL;
1489  03fe 721a5247      	bset	21063,#5
1491  0402 2004          	jra	L374
1492  0404               L174:
1493                     ; 322         UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1495  0404 721b5247      	bres	21063,#5
1496  0408               L374:
1497                     ; 324 }
1500  0408 84            	pop	a
1501  0409 81            	ret
1623                     ; 336 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1623                     ; 337                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1623                     ; 338                      UART2_LinDivUp_TypeDef UART2_DivUp)
1623                     ; 339 {
1624                     	switch	.text
1625  040a               _UART2_LINConfig:
1627  040a 89            	pushw	x
1628       00000000      OFST:	set	0
1631                     ; 341     assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1633  040b 9e            	ld	a,xh
1634  040c 4d            	tnz	a
1635  040d 2705          	jreq	L431
1636  040f 9e            	ld	a,xh
1637  0410 a101          	cp	a,#1
1638  0412 2603          	jrne	L231
1639  0414               L431:
1640  0414 4f            	clr	a
1641  0415 2010          	jra	L631
1642  0417               L231:
1643  0417 ae0155        	ldw	x,#341
1644  041a 89            	pushw	x
1645  041b ae0000        	ldw	x,#0
1646  041e 89            	pushw	x
1647  041f ae0008        	ldw	x,#L302
1648  0422 cd0000        	call	_assert_failed
1650  0425 5b04          	addw	sp,#4
1651  0427               L631:
1652                     ; 342     assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1654  0427 7b02          	ld	a,(OFST+2,sp)
1655  0429 a101          	cp	a,#1
1656  042b 2704          	jreq	L241
1657  042d 0d02          	tnz	(OFST+2,sp)
1658  042f 2603          	jrne	L041
1659  0431               L241:
1660  0431 4f            	clr	a
1661  0432 2010          	jra	L441
1662  0434               L041:
1663  0434 ae0156        	ldw	x,#342
1664  0437 89            	pushw	x
1665  0438 ae0000        	ldw	x,#0
1666  043b 89            	pushw	x
1667  043c ae0008        	ldw	x,#L302
1668  043f cd0000        	call	_assert_failed
1670  0442 5b04          	addw	sp,#4
1671  0444               L441:
1672                     ; 343     assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1674  0444 0d05          	tnz	(OFST+5,sp)
1675  0446 2706          	jreq	L051
1676  0448 7b05          	ld	a,(OFST+5,sp)
1677  044a a101          	cp	a,#1
1678  044c 2603          	jrne	L641
1679  044e               L051:
1680  044e 4f            	clr	a
1681  044f 2010          	jra	L251
1682  0451               L641:
1683  0451 ae0157        	ldw	x,#343
1684  0454 89            	pushw	x
1685  0455 ae0000        	ldw	x,#0
1686  0458 89            	pushw	x
1687  0459 ae0008        	ldw	x,#L302
1688  045c cd0000        	call	_assert_failed
1690  045f 5b04          	addw	sp,#4
1691  0461               L251:
1692                     ; 345     if (UART2_Mode != UART2_LIN_MODE_MASTER)
1694  0461 0d01          	tnz	(OFST+1,sp)
1695  0463 2706          	jreq	L355
1696                     ; 347         UART2->CR6 |=  UART2_CR6_LSLV;
1698  0465 721a5249      	bset	21065,#5
1700  0469 2004          	jra	L555
1701  046b               L355:
1702                     ; 351         UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1704  046b 721b5249      	bres	21065,#5
1705  046f               L555:
1706                     ; 354     if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1708  046f 0d02          	tnz	(OFST+2,sp)
1709  0471 2706          	jreq	L755
1710                     ; 356         UART2->CR6 |=  UART2_CR6_LASE ;
1712  0473 72185249      	bset	21065,#4
1714  0477 2004          	jra	L165
1715  0479               L755:
1716                     ; 360         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1718  0479 72195249      	bres	21065,#4
1719  047d               L165:
1720                     ; 363     if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1722  047d 0d05          	tnz	(OFST+5,sp)
1723  047f 2706          	jreq	L365
1724                     ; 365         UART2->CR6 |=  UART2_CR6_LDUM;
1726  0481 721e5249      	bset	21065,#7
1728  0485 2004          	jra	L565
1729  0487               L365:
1730                     ; 369         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1732  0487 721f5249      	bres	21065,#7
1733  048b               L565:
1734                     ; 371 }
1737  048b 85            	popw	x
1738  048c 81            	ret
1774                     ; 379 void UART2_LINCmd(FunctionalState NewState)
1774                     ; 380 {
1775                     	switch	.text
1776  048d               _UART2_LINCmd:
1778  048d 88            	push	a
1779       00000000      OFST:	set	0
1782                     ; 381     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1784  048e 4d            	tnz	a
1785  048f 2704          	jreq	L061
1786  0491 a101          	cp	a,#1
1787  0493 2603          	jrne	L651
1788  0495               L061:
1789  0495 4f            	clr	a
1790  0496 2010          	jra	L261
1791  0498               L651:
1792  0498 ae017d        	ldw	x,#381
1793  049b 89            	pushw	x
1794  049c ae0000        	ldw	x,#0
1795  049f 89            	pushw	x
1796  04a0 ae0008        	ldw	x,#L302
1797  04a3 cd0000        	call	_assert_failed
1799  04a6 5b04          	addw	sp,#4
1800  04a8               L261:
1801                     ; 383     if (NewState != DISABLE)
1803  04a8 0d01          	tnz	(OFST+1,sp)
1804  04aa 2706          	jreq	L506
1805                     ; 386         UART2->CR3 |= UART2_CR3_LINEN;
1807  04ac 721c5246      	bset	21062,#6
1809  04b0 2004          	jra	L706
1810  04b2               L506:
1811                     ; 391         UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1813  04b2 721d5246      	bres	21062,#6
1814  04b6               L706:
1815                     ; 393 }
1818  04b6 84            	pop	a
1819  04b7 81            	ret
1855                     ; 400 void UART2_SmartCardCmd(FunctionalState NewState)
1855                     ; 401 {
1856                     	switch	.text
1857  04b8               _UART2_SmartCardCmd:
1859  04b8 88            	push	a
1860       00000000      OFST:	set	0
1863                     ; 403     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1865  04b9 4d            	tnz	a
1866  04ba 2704          	jreq	L071
1867  04bc a101          	cp	a,#1
1868  04be 2603          	jrne	L661
1869  04c0               L071:
1870  04c0 4f            	clr	a
1871  04c1 2010          	jra	L271
1872  04c3               L661:
1873  04c3 ae0193        	ldw	x,#403
1874  04c6 89            	pushw	x
1875  04c7 ae0000        	ldw	x,#0
1876  04ca 89            	pushw	x
1877  04cb ae0008        	ldw	x,#L302
1878  04ce cd0000        	call	_assert_failed
1880  04d1 5b04          	addw	sp,#4
1881  04d3               L271:
1882                     ; 405     if (NewState != DISABLE)
1884  04d3 0d01          	tnz	(OFST+1,sp)
1885  04d5 2706          	jreq	L726
1886                     ; 408         UART2->CR5 |= UART2_CR5_SCEN;
1888  04d7 721a5248      	bset	21064,#5
1890  04db 2004          	jra	L136
1891  04dd               L726:
1892                     ; 413         UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1894  04dd 721b5248      	bres	21064,#5
1895  04e1               L136:
1896                     ; 415 }
1899  04e1 84            	pop	a
1900  04e2 81            	ret
1937                     ; 423 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1937                     ; 424 {
1938                     	switch	.text
1939  04e3               _UART2_SmartCardNACKCmd:
1941  04e3 88            	push	a
1942       00000000      OFST:	set	0
1945                     ; 426     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1947  04e4 4d            	tnz	a
1948  04e5 2704          	jreq	L002
1949  04e7 a101          	cp	a,#1
1950  04e9 2603          	jrne	L671
1951  04eb               L002:
1952  04eb 4f            	clr	a
1953  04ec 2010          	jra	L202
1954  04ee               L671:
1955  04ee ae01aa        	ldw	x,#426
1956  04f1 89            	pushw	x
1957  04f2 ae0000        	ldw	x,#0
1958  04f5 89            	pushw	x
1959  04f6 ae0008        	ldw	x,#L302
1960  04f9 cd0000        	call	_assert_failed
1962  04fc 5b04          	addw	sp,#4
1963  04fe               L202:
1964                     ; 428     if (NewState != DISABLE)
1966  04fe 0d01          	tnz	(OFST+1,sp)
1967  0500 2706          	jreq	L156
1968                     ; 431         UART2->CR5 |= UART2_CR5_NACK;
1970  0502 72185248      	bset	21064,#4
1972  0506 2004          	jra	L356
1973  0508               L156:
1974                     ; 436         UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1976  0508 72195248      	bres	21064,#4
1977  050c               L356:
1978                     ; 438 }
1981  050c 84            	pop	a
1982  050d 81            	ret
2040                     ; 446 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
2040                     ; 447 {
2041                     	switch	.text
2042  050e               _UART2_WakeUpConfig:
2044  050e 88            	push	a
2045       00000000      OFST:	set	0
2048                     ; 448     assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
2050  050f 4d            	tnz	a
2051  0510 2704          	jreq	L012
2052  0512 a108          	cp	a,#8
2053  0514 2603          	jrne	L602
2054  0516               L012:
2055  0516 4f            	clr	a
2056  0517 2010          	jra	L212
2057  0519               L602:
2058  0519 ae01c0        	ldw	x,#448
2059  051c 89            	pushw	x
2060  051d ae0000        	ldw	x,#0
2061  0520 89            	pushw	x
2062  0521 ae0008        	ldw	x,#L302
2063  0524 cd0000        	call	_assert_failed
2065  0527 5b04          	addw	sp,#4
2066  0529               L212:
2067                     ; 450     UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
2069  0529 72175244      	bres	21060,#3
2070                     ; 451     UART2->CR1 |= (uint8_t)UART2_WakeUp;
2072  052d c65244        	ld	a,21060
2073  0530 1a01          	or	a,(OFST+1,sp)
2074  0532 c75244        	ld	21060,a
2075                     ; 452 }
2078  0535 84            	pop	a
2079  0536 81            	ret
2116                     ; 460 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
2116                     ; 461 {
2117                     	switch	.text
2118  0537               _UART2_ReceiverWakeUpCmd:
2120  0537 88            	push	a
2121       00000000      OFST:	set	0
2124                     ; 462     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2126  0538 4d            	tnz	a
2127  0539 2704          	jreq	L022
2128  053b a101          	cp	a,#1
2129  053d 2603          	jrne	L612
2130  053f               L022:
2131  053f 4f            	clr	a
2132  0540 2010          	jra	L222
2133  0542               L612:
2134  0542 ae01ce        	ldw	x,#462
2135  0545 89            	pushw	x
2136  0546 ae0000        	ldw	x,#0
2137  0549 89            	pushw	x
2138  054a ae0008        	ldw	x,#L302
2139  054d cd0000        	call	_assert_failed
2141  0550 5b04          	addw	sp,#4
2142  0552               L222:
2143                     ; 464     if (NewState != DISABLE)
2145  0552 0d01          	tnz	(OFST+1,sp)
2146  0554 2706          	jreq	L127
2147                     ; 467         UART2->CR2 |= UART2_CR2_RWU;
2149  0556 72125245      	bset	21061,#1
2151  055a 2004          	jra	L327
2152  055c               L127:
2153                     ; 472         UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
2155  055c 72135245      	bres	21061,#1
2156  0560               L327:
2157                     ; 474 }
2160  0560 84            	pop	a
2161  0561 81            	ret
2184                     ; 481 uint8_t UART2_ReceiveData8(void)
2184                     ; 482 {
2185                     	switch	.text
2186  0562               _UART2_ReceiveData8:
2190                     ; 483     return ((uint8_t)UART2->DR);
2192  0562 c65241        	ld	a,21057
2195  0565 81            	ret
2229                     ; 491 uint16_t UART2_ReceiveData9(void)
2229                     ; 492 {
2230                     	switch	.text
2231  0566               _UART2_ReceiveData9:
2233  0566 89            	pushw	x
2234       00000002      OFST:	set	2
2237                     ; 493   uint16_t temp = 0;
2239  0567 5f            	clrw	x
2240  0568 1f01          	ldw	(OFST-1,sp),x
2241                     ; 495   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
2243  056a c65244        	ld	a,21060
2244  056d 5f            	clrw	x
2245  056e a480          	and	a,#128
2246  0570 5f            	clrw	x
2247  0571 02            	rlwa	x,a
2248  0572 58            	sllw	x
2249  0573 1f01          	ldw	(OFST-1,sp),x
2250                     ; 497   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
2252  0575 c65241        	ld	a,21057
2253  0578 5f            	clrw	x
2254  0579 97            	ld	xl,a
2255  057a 01            	rrwa	x,a
2256  057b 1a02          	or	a,(OFST+0,sp)
2257  057d 01            	rrwa	x,a
2258  057e 1a01          	or	a,(OFST-1,sp)
2259  0580 01            	rrwa	x,a
2260  0581 01            	rrwa	x,a
2261  0582 a4ff          	and	a,#255
2262  0584 01            	rrwa	x,a
2263  0585 a401          	and	a,#1
2264  0587 01            	rrwa	x,a
2267  0588 5b02          	addw	sp,#2
2268  058a 81            	ret
2302                     ; 505 void UART2_SendData8(uint8_t Data)
2302                     ; 506 {
2303                     	switch	.text
2304  058b               _UART2_SendData8:
2308                     ; 508     UART2->DR = Data;
2310  058b c75241        	ld	21057,a
2311                     ; 509 }
2314  058e 81            	ret
2348                     ; 516 void UART2_SendData9(uint16_t Data)
2348                     ; 517 {
2349                     	switch	.text
2350  058f               _UART2_SendData9:
2352  058f 89            	pushw	x
2353       00000000      OFST:	set	0
2356                     ; 519     UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
2358  0590 721d5244      	bres	21060,#6
2359                     ; 522     UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
2361  0594 54            	srlw	x
2362  0595 54            	srlw	x
2363  0596 9f            	ld	a,xl
2364  0597 a440          	and	a,#64
2365  0599 ca5244        	or	a,21060
2366  059c c75244        	ld	21060,a
2367                     ; 525     UART2->DR   = (uint8_t)(Data);                    
2369  059f 7b02          	ld	a,(OFST+2,sp)
2370  05a1 c75241        	ld	21057,a
2371                     ; 527 }
2374  05a4 85            	popw	x
2375  05a5 81            	ret
2398                     ; 534 void UART2_SendBreak(void)
2398                     ; 535 {
2399                     	switch	.text
2400  05a6               _UART2_SendBreak:
2404                     ; 536     UART2->CR2 |= UART2_CR2_SBK;
2406  05a6 72105245      	bset	21061,#0
2407                     ; 537 }
2410  05aa 81            	ret
2445                     ; 544 void UART2_SetAddress(uint8_t UART2_Address)
2445                     ; 545 {
2446                     	switch	.text
2447  05ab               _UART2_SetAddress:
2449  05ab 88            	push	a
2450       00000000      OFST:	set	0
2453                     ; 547     assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2455  05ac a110          	cp	a,#16
2456  05ae 2403          	jruge	L042
2457  05b0 4f            	clr	a
2458  05b1 2010          	jra	L242
2459  05b3               L042:
2460  05b3 ae0223        	ldw	x,#547
2461  05b6 89            	pushw	x
2462  05b7 ae0000        	ldw	x,#0
2463  05ba 89            	pushw	x
2464  05bb ae0008        	ldw	x,#L302
2465  05be cd0000        	call	_assert_failed
2467  05c1 5b04          	addw	sp,#4
2468  05c3               L242:
2469                     ; 550     UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2471  05c3 c65247        	ld	a,21063
2472  05c6 a4f0          	and	a,#240
2473  05c8 c75247        	ld	21063,a
2474                     ; 552     UART2->CR4 |= UART2_Address;
2476  05cb c65247        	ld	a,21063
2477  05ce 1a01          	or	a,(OFST+1,sp)
2478  05d0 c75247        	ld	21063,a
2479                     ; 553 }
2482  05d3 84            	pop	a
2483  05d4 81            	ret
2517                     ; 561 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2517                     ; 562 {
2518                     	switch	.text
2519  05d5               _UART2_SetGuardTime:
2523                     ; 564     UART2->GTR = UART2_GuardTime;
2525  05d5 c7524a        	ld	21066,a
2526                     ; 565 }
2529  05d8 81            	ret
2563                     ; 589 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2563                     ; 590 {
2564                     	switch	.text
2565  05d9               _UART2_SetPrescaler:
2569                     ; 592     UART2->PSCR = UART2_Prescaler;
2571  05d9 c7524b        	ld	21067,a
2572                     ; 593 }
2575  05dc 81            	ret
2733                     ; 601 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2733                     ; 602 {
2734                     	switch	.text
2735  05dd               _UART2_GetFlagStatus:
2737  05dd 89            	pushw	x
2738  05de 88            	push	a
2739       00000001      OFST:	set	1
2742                     ; 603     FlagStatus status = RESET;
2744  05df 0f01          	clr	(OFST+0,sp)
2745                     ; 606     assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2747  05e1 a30080        	cpw	x,#128
2748  05e4 2737          	jreq	L452
2749  05e6 a30040        	cpw	x,#64
2750  05e9 2732          	jreq	L452
2751  05eb a30020        	cpw	x,#32
2752  05ee 272d          	jreq	L452
2753  05f0 a30010        	cpw	x,#16
2754  05f3 2728          	jreq	L452
2755  05f5 a30008        	cpw	x,#8
2756  05f8 2723          	jreq	L452
2757  05fa a30004        	cpw	x,#4
2758  05fd 271e          	jreq	L452
2759  05ff a30002        	cpw	x,#2
2760  0602 2719          	jreq	L452
2761  0604 a30001        	cpw	x,#1
2762  0607 2714          	jreq	L452
2763  0609 a30101        	cpw	x,#257
2764  060c 270f          	jreq	L452
2765  060e a30301        	cpw	x,#769
2766  0611 270a          	jreq	L452
2767  0613 a30302        	cpw	x,#770
2768  0616 2705          	jreq	L452
2769  0618 a30210        	cpw	x,#528
2770  061b 2603          	jrne	L252
2771  061d               L452:
2772  061d 4f            	clr	a
2773  061e 2010          	jra	L652
2774  0620               L252:
2775  0620 ae025e        	ldw	x,#606
2776  0623 89            	pushw	x
2777  0624 ae0000        	ldw	x,#0
2778  0627 89            	pushw	x
2779  0628 ae0008        	ldw	x,#L302
2780  062b cd0000        	call	_assert_failed
2782  062e 5b04          	addw	sp,#4
2783  0630               L652:
2784                     ; 609     if (UART2_FLAG == UART2_FLAG_LBDF)
2786  0630 1e02          	ldw	x,(OFST+1,sp)
2787  0632 a30210        	cpw	x,#528
2788  0635 2611          	jrne	L7511
2789                     ; 611         if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2791  0637 c65247        	ld	a,21063
2792  063a 1503          	bcp	a,(OFST+2,sp)
2793  063c 2706          	jreq	L1611
2794                     ; 614             status = SET;
2796  063e a601          	ld	a,#1
2797  0640 6b01          	ld	(OFST+0,sp),a
2799  0642 2039          	jra	L5611
2800  0644               L1611:
2801                     ; 619             status = RESET;
2803  0644 0f01          	clr	(OFST+0,sp)
2804  0646 2035          	jra	L5611
2805  0648               L7511:
2806                     ; 622     else if (UART2_FLAG == UART2_FLAG_SBK)
2808  0648 1e02          	ldw	x,(OFST+1,sp)
2809  064a a30101        	cpw	x,#257
2810  064d 2611          	jrne	L7611
2811                     ; 624         if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2813  064f c65245        	ld	a,21061
2814  0652 1503          	bcp	a,(OFST+2,sp)
2815  0654 2706          	jreq	L1711
2816                     ; 627             status = SET;
2818  0656 a601          	ld	a,#1
2819  0658 6b01          	ld	(OFST+0,sp),a
2821  065a 2021          	jra	L5611
2822  065c               L1711:
2823                     ; 632             status = RESET;
2825  065c 0f01          	clr	(OFST+0,sp)
2826  065e 201d          	jra	L5611
2827  0660               L7611:
2828                     ; 635     else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2830  0660 1e02          	ldw	x,(OFST+1,sp)
2831  0662 a30302        	cpw	x,#770
2832  0665 2707          	jreq	L1021
2834  0667 1e02          	ldw	x,(OFST+1,sp)
2835  0669 a30301        	cpw	x,#769
2836  066c 2614          	jrne	L7711
2837  066e               L1021:
2838                     ; 637         if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2840  066e c65249        	ld	a,21065
2841  0671 1503          	bcp	a,(OFST+2,sp)
2842  0673 2706          	jreq	L3021
2843                     ; 640             status = SET;
2845  0675 a601          	ld	a,#1
2846  0677 6b01          	ld	(OFST+0,sp),a
2848  0679 2002          	jra	L5611
2849  067b               L3021:
2850                     ; 645             status = RESET;
2852  067b 0f01          	clr	(OFST+0,sp)
2853  067d               L5611:
2854                     ; 663     return  status;
2856  067d 7b01          	ld	a,(OFST+0,sp)
2859  067f 5b03          	addw	sp,#3
2860  0681 81            	ret
2861  0682               L7711:
2862                     ; 650         if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2864  0682 c65240        	ld	a,21056
2865  0685 1503          	bcp	a,(OFST+2,sp)
2866  0687 2706          	jreq	L1121
2867                     ; 653             status = SET;
2869  0689 a601          	ld	a,#1
2870  068b 6b01          	ld	(OFST+0,sp),a
2872  068d 20ee          	jra	L5611
2873  068f               L1121:
2874                     ; 658             status = RESET;
2876  068f 0f01          	clr	(OFST+0,sp)
2877  0691 20ea          	jra	L5611
2913                     ; 693 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2913                     ; 694 {
2914                     	switch	.text
2915  0693               _UART2_ClearFlag:
2917  0693 89            	pushw	x
2918       00000000      OFST:	set	0
2921                     ; 695     assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2923  0694 a30020        	cpw	x,#32
2924  0697 270f          	jreq	L462
2925  0699 a30302        	cpw	x,#770
2926  069c 270a          	jreq	L462
2927  069e a30301        	cpw	x,#769
2928  06a1 2705          	jreq	L462
2929  06a3 a30210        	cpw	x,#528
2930  06a6 2603          	jrne	L262
2931  06a8               L462:
2932  06a8 4f            	clr	a
2933  06a9 2010          	jra	L662
2934  06ab               L262:
2935  06ab ae02b7        	ldw	x,#695
2936  06ae 89            	pushw	x
2937  06af ae0000        	ldw	x,#0
2938  06b2 89            	pushw	x
2939  06b3 ae0008        	ldw	x,#L302
2940  06b6 cd0000        	call	_assert_failed
2942  06b9 5b04          	addw	sp,#4
2943  06bb               L662:
2944                     ; 698     if (UART2_FLAG == UART2_FLAG_RXNE)
2946  06bb 1e01          	ldw	x,(OFST+1,sp)
2947  06bd a30020        	cpw	x,#32
2948  06c0 2606          	jrne	L3321
2949                     ; 700         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2951  06c2 35df5240      	mov	21056,#223
2953  06c6 201e          	jra	L5321
2954  06c8               L3321:
2955                     ; 703     else if (UART2_FLAG == UART2_FLAG_LBDF)
2957  06c8 1e01          	ldw	x,(OFST+1,sp)
2958  06ca a30210        	cpw	x,#528
2959  06cd 2606          	jrne	L7321
2960                     ; 705         UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2962  06cf 72195247      	bres	21063,#4
2964  06d3 2011          	jra	L5321
2965  06d5               L7321:
2966                     ; 708     else if (UART2_FLAG == UART2_FLAG_LHDF)
2968  06d5 1e01          	ldw	x,(OFST+1,sp)
2969  06d7 a30302        	cpw	x,#770
2970  06da 2606          	jrne	L3421
2971                     ; 710         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2973  06dc 72135249      	bres	21065,#1
2975  06e0 2004          	jra	L5321
2976  06e2               L3421:
2977                     ; 715         UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2979  06e2 72115249      	bres	21065,#0
2980  06e6               L5321:
2981                     ; 717 }
2984  06e6 85            	popw	x
2985  06e7 81            	ret
3068                     ; 732 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
3068                     ; 733 {
3069                     	switch	.text
3070  06e8               _UART2_GetITStatus:
3072  06e8 89            	pushw	x
3073  06e9 89            	pushw	x
3074       00000002      OFST:	set	2
3077                     ; 734     ITStatus pendingbitstatus = RESET;
3079  06ea 7b02          	ld	a,(OFST+0,sp)
3080  06ec 97            	ld	xl,a
3081                     ; 735     uint8_t itpos = 0;
3083  06ed 7b01          	ld	a,(OFST-1,sp)
3084  06ef 97            	ld	xl,a
3085                     ; 736     uint8_t itmask1 = 0;
3087  06f0 7b02          	ld	a,(OFST+0,sp)
3088  06f2 97            	ld	xl,a
3089                     ; 737     uint8_t itmask2 = 0;
3091  06f3 7b02          	ld	a,(OFST+0,sp)
3092  06f5 97            	ld	xl,a
3093                     ; 738     uint8_t enablestatus = 0;
3095  06f6 7b02          	ld	a,(OFST+0,sp)
3096  06f8 97            	ld	xl,a
3097                     ; 741     assert_param(IS_UART2_GET_IT_OK(UART2_IT));
3099  06f9 1e03          	ldw	x,(OFST+1,sp)
3100  06fb a30277        	cpw	x,#631
3101  06fe 2731          	jreq	L472
3102  0700 1e03          	ldw	x,(OFST+1,sp)
3103  0702 a30266        	cpw	x,#614
3104  0705 272a          	jreq	L472
3105  0707 1e03          	ldw	x,(OFST+1,sp)
3106  0709 a30255        	cpw	x,#597
3107  070c 2723          	jreq	L472
3108  070e 1e03          	ldw	x,(OFST+1,sp)
3109  0710 a30244        	cpw	x,#580
3110  0713 271c          	jreq	L472
3111  0715 1e03          	ldw	x,(OFST+1,sp)
3112  0717 a30235        	cpw	x,#565
3113  071a 2715          	jreq	L472
3114  071c 1e03          	ldw	x,(OFST+1,sp)
3115  071e a30346        	cpw	x,#838
3116  0721 270e          	jreq	L472
3117  0723 1e03          	ldw	x,(OFST+1,sp)
3118  0725 a30412        	cpw	x,#1042
3119  0728 2707          	jreq	L472
3120  072a 1e03          	ldw	x,(OFST+1,sp)
3121  072c a30100        	cpw	x,#256
3122  072f 2603          	jrne	L272
3123  0731               L472:
3124  0731 4f            	clr	a
3125  0732 2010          	jra	L672
3126  0734               L272:
3127  0734 ae02e5        	ldw	x,#741
3128  0737 89            	pushw	x
3129  0738 ae0000        	ldw	x,#0
3130  073b 89            	pushw	x
3131  073c ae0008        	ldw	x,#L302
3132  073f cd0000        	call	_assert_failed
3134  0742 5b04          	addw	sp,#4
3135  0744               L672:
3136                     ; 744     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
3138  0744 7b04          	ld	a,(OFST+2,sp)
3139  0746 a40f          	and	a,#15
3140  0748 5f            	clrw	x
3141  0749 97            	ld	xl,a
3142  074a a601          	ld	a,#1
3143  074c 5d            	tnzw	x
3144  074d 2704          	jreq	L003
3145  074f               L203:
3146  074f 48            	sll	a
3147  0750 5a            	decw	x
3148  0751 26fc          	jrne	L203
3149  0753               L003:
3150  0753 6b01          	ld	(OFST-1,sp),a
3151                     ; 746     itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
3153  0755 7b04          	ld	a,(OFST+2,sp)
3154  0757 4e            	swap	a
3155  0758 a40f          	and	a,#15
3156  075a 6b02          	ld	(OFST+0,sp),a
3157                     ; 748     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
3159  075c 7b02          	ld	a,(OFST+0,sp)
3160  075e 5f            	clrw	x
3161  075f 97            	ld	xl,a
3162  0760 a601          	ld	a,#1
3163  0762 5d            	tnzw	x
3164  0763 2704          	jreq	L403
3165  0765               L603:
3166  0765 48            	sll	a
3167  0766 5a            	decw	x
3168  0767 26fc          	jrne	L603
3169  0769               L403:
3170  0769 6b02          	ld	(OFST+0,sp),a
3171                     ; 751     if (UART2_IT == UART2_IT_PE)
3173  076b 1e03          	ldw	x,(OFST+1,sp)
3174  076d a30100        	cpw	x,#256
3175  0770 261c          	jrne	L1131
3176                     ; 754         enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
3178  0772 c65244        	ld	a,21060
3179  0775 1402          	and	a,(OFST+0,sp)
3180  0777 6b02          	ld	(OFST+0,sp),a
3181                     ; 757         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
3183  0779 c65240        	ld	a,21056
3184  077c 1501          	bcp	a,(OFST-1,sp)
3185  077e 270a          	jreq	L3131
3187  0780 0d02          	tnz	(OFST+0,sp)
3188  0782 2706          	jreq	L3131
3189                     ; 760             pendingbitstatus = SET;
3191  0784 a601          	ld	a,#1
3192  0786 6b02          	ld	(OFST+0,sp),a
3194  0788 2064          	jra	L7131
3195  078a               L3131:
3196                     ; 765             pendingbitstatus = RESET;
3198  078a 0f02          	clr	(OFST+0,sp)
3199  078c 2060          	jra	L7131
3200  078e               L1131:
3201                     ; 768     else if (UART2_IT == UART2_IT_LBDF)
3203  078e 1e03          	ldw	x,(OFST+1,sp)
3204  0790 a30346        	cpw	x,#838
3205  0793 261c          	jrne	L1231
3206                     ; 771         enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
3208  0795 c65247        	ld	a,21063
3209  0798 1402          	and	a,(OFST+0,sp)
3210  079a 6b02          	ld	(OFST+0,sp),a
3211                     ; 773         if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
3213  079c c65247        	ld	a,21063
3214  079f 1501          	bcp	a,(OFST-1,sp)
3215  07a1 270a          	jreq	L3231
3217  07a3 0d02          	tnz	(OFST+0,sp)
3218  07a5 2706          	jreq	L3231
3219                     ; 776             pendingbitstatus = SET;
3221  07a7 a601          	ld	a,#1
3222  07a9 6b02          	ld	(OFST+0,sp),a
3224  07ab 2041          	jra	L7131
3225  07ad               L3231:
3226                     ; 781             pendingbitstatus = RESET;
3228  07ad 0f02          	clr	(OFST+0,sp)
3229  07af 203d          	jra	L7131
3230  07b1               L1231:
3231                     ; 784     else if (UART2_IT == UART2_IT_LHDF)
3233  07b1 1e03          	ldw	x,(OFST+1,sp)
3234  07b3 a30412        	cpw	x,#1042
3235  07b6 261c          	jrne	L1331
3236                     ; 787         enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
3238  07b8 c65249        	ld	a,21065
3239  07bb 1402          	and	a,(OFST+0,sp)
3240  07bd 6b02          	ld	(OFST+0,sp),a
3241                     ; 789         if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
3243  07bf c65249        	ld	a,21065
3244  07c2 1501          	bcp	a,(OFST-1,sp)
3245  07c4 270a          	jreq	L3331
3247  07c6 0d02          	tnz	(OFST+0,sp)
3248  07c8 2706          	jreq	L3331
3249                     ; 792             pendingbitstatus = SET;
3251  07ca a601          	ld	a,#1
3252  07cc 6b02          	ld	(OFST+0,sp),a
3254  07ce 201e          	jra	L7131
3255  07d0               L3331:
3256                     ; 797             pendingbitstatus = RESET;
3258  07d0 0f02          	clr	(OFST+0,sp)
3259  07d2 201a          	jra	L7131
3260  07d4               L1331:
3261                     ; 803         enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
3263  07d4 c65245        	ld	a,21061
3264  07d7 1402          	and	a,(OFST+0,sp)
3265  07d9 6b02          	ld	(OFST+0,sp),a
3266                     ; 805         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
3268  07db c65240        	ld	a,21056
3269  07de 1501          	bcp	a,(OFST-1,sp)
3270  07e0 270a          	jreq	L1431
3272  07e2 0d02          	tnz	(OFST+0,sp)
3273  07e4 2706          	jreq	L1431
3274                     ; 808             pendingbitstatus = SET;
3276  07e6 a601          	ld	a,#1
3277  07e8 6b02          	ld	(OFST+0,sp),a
3279  07ea 2002          	jra	L7131
3280  07ec               L1431:
3281                     ; 813             pendingbitstatus = RESET;
3283  07ec 0f02          	clr	(OFST+0,sp)
3284  07ee               L7131:
3285                     ; 817     return  pendingbitstatus;
3287  07ee 7b02          	ld	a,(OFST+0,sp)
3290  07f0 5b04          	addw	sp,#4
3291  07f2 81            	ret
3328                     ; 846 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
3328                     ; 847 {
3329                     	switch	.text
3330  07f3               _UART2_ClearITPendingBit:
3332  07f3 89            	pushw	x
3333       00000000      OFST:	set	0
3336                     ; 848     assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
3338  07f4 a30255        	cpw	x,#597
3339  07f7 270a          	jreq	L413
3340  07f9 a30412        	cpw	x,#1042
3341  07fc 2705          	jreq	L413
3342  07fe a30346        	cpw	x,#838
3343  0801 2603          	jrne	L213
3344  0803               L413:
3345  0803 4f            	clr	a
3346  0804 2010          	jra	L613
3347  0806               L213:
3348  0806 ae0350        	ldw	x,#848
3349  0809 89            	pushw	x
3350  080a ae0000        	ldw	x,#0
3351  080d 89            	pushw	x
3352  080e ae0008        	ldw	x,#L302
3353  0811 cd0000        	call	_assert_failed
3355  0814 5b04          	addw	sp,#4
3356  0816               L613:
3357                     ; 851     if (UART2_IT == UART2_IT_RXNE)
3359  0816 1e01          	ldw	x,(OFST+1,sp)
3360  0818 a30255        	cpw	x,#597
3361  081b 2606          	jrne	L3631
3362                     ; 853         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
3364  081d 35df5240      	mov	21056,#223
3366  0821 2011          	jra	L5631
3367  0823               L3631:
3368                     ; 856     else if (UART2_IT == UART2_IT_LBDF)
3370  0823 1e01          	ldw	x,(OFST+1,sp)
3371  0825 a30346        	cpw	x,#838
3372  0828 2606          	jrne	L7631
3373                     ; 858         UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
3375  082a 72195247      	bres	21063,#4
3377  082e 2004          	jra	L5631
3378  0830               L7631:
3379                     ; 863         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
3381  0830 72135249      	bres	21065,#1
3382  0834               L5631:
3383                     ; 865 }
3386  0834 85            	popw	x
3387  0835 81            	ret
3400                     	xdef	_UART2_ClearITPendingBit
3401                     	xdef	_UART2_GetITStatus
3402                     	xdef	_UART2_ClearFlag
3403                     	xdef	_UART2_GetFlagStatus
3404                     	xdef	_UART2_SetPrescaler
3405                     	xdef	_UART2_SetGuardTime
3406                     	xdef	_UART2_SetAddress
3407                     	xdef	_UART2_SendBreak
3408                     	xdef	_UART2_SendData9
3409                     	xdef	_UART2_SendData8
3410                     	xdef	_UART2_ReceiveData9
3411                     	xdef	_UART2_ReceiveData8
3412                     	xdef	_UART2_ReceiverWakeUpCmd
3413                     	xdef	_UART2_WakeUpConfig
3414                     	xdef	_UART2_SmartCardNACKCmd
3415                     	xdef	_UART2_SmartCardCmd
3416                     	xdef	_UART2_LINCmd
3417                     	xdef	_UART2_LINConfig
3418                     	xdef	_UART2_LINBreakDetectionConfig
3419                     	xdef	_UART2_IrDACmd
3420                     	xdef	_UART2_IrDAConfig
3421                     	xdef	_UART2_ITConfig
3422                     	xdef	_UART2_Cmd
3423                     	xdef	_UART2_Init
3424                     	xdef	_UART2_DeInit
3425                     	xref	_assert_failed
3426                     	xref	_CLK_GetClockFreq
3427                     	switch	.const
3428  0008               L302:
3429  0008 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
3430  001a 697665725c73  	dc.b	"iver\src\stm8s_uar"
3431  002c 74322e6300    	dc.b	"t2.c",0
3432                     	xref.b	c_lreg
3452                     	xref	c_lursh
3453                     	xref	c_lsub
3454                     	xref	c_smul
3455                     	xref	c_ludv
3456                     	xref	c_rtol
3457                     	xref	c_llsh
3458                     	xref	c_lcmp
3459                     	xref	c_ltor
3460                     	end
