   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 46 void UART1_DeInit(void)
  32                     ; 47 {
  34                     	switch	.text
  35  0000               _UART1_DeInit:
  39                     ; 50     (void)UART1->SR;
  41  0000 c65230        	ld	a,21040
  42  0003 97            	ld	xl,a
  43                     ; 51     (void)UART1->DR;
  45  0004 c65231        	ld	a,21041
  46  0007 97            	ld	xl,a
  47                     ; 53     UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  49  0008 725f5233      	clr	21043
  50                     ; 54     UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  52  000c 725f5232      	clr	21042
  53                     ; 56     UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  55  0010 725f5234      	clr	21044
  56                     ; 57     UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  58  0014 725f5235      	clr	21045
  59                     ; 58     UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  61  0018 725f5236      	clr	21046
  62                     ; 59     UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  64  001c 725f5237      	clr	21047
  65                     ; 60     UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  67  0020 725f5238      	clr	21048
  68                     ; 62     UART1->GTR = UART1_GTR_RESET_VALUE;
  70  0024 725f5239      	clr	21049
  71                     ; 63     UART1->PSCR = UART1_PSCR_RESET_VALUE;
  73  0028 725f523a      	clr	21050
  74                     ; 64 }
  77  002c 81            	ret
 381                     .const:	section	.text
 382  0000               L21:
 383  0000 00098969      	dc.l	625001
 384  0004               L25:
 385  0004 00000064      	dc.l	100
 386                     ; 83 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 386                     ; 84                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 386                     ; 85                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 386                     ; 86 {
 387                     	switch	.text
 388  002d               _UART1_Init:
 390  002d 520c          	subw	sp,#12
 391       0000000c      OFST:	set	12
 394                     ; 87     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 396  002f 96            	ldw	x,sp
 397  0030 1c0009        	addw	x,#OFST-3
 398  0033 cd0000        	call	c_ltor
 402  0036 96            	ldw	x,sp
 403  0037 1c0005        	addw	x,#OFST-7
 404  003a cd0000        	call	c_ltor
 406                     ; 90     assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 408  003d 96            	ldw	x,sp
 409  003e 1c000f        	addw	x,#OFST+3
 410  0041 cd0000        	call	c_ltor
 412  0044 ae0000        	ldw	x,#L21
 413  0047 cd0000        	call	c_lcmp
 415  004a 2403          	jruge	L01
 416  004c 4f            	clr	a
 417  004d 2010          	jra	L41
 418  004f               L01:
 419  004f ae005a        	ldw	x,#90
 420  0052 89            	pushw	x
 421  0053 ae0000        	ldw	x,#0
 422  0056 89            	pushw	x
 423  0057 ae0008        	ldw	x,#L371
 424  005a cd0000        	call	_assert_failed
 426  005d 5b04          	addw	sp,#4
 427  005f               L41:
 428                     ; 91     assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 430  005f 0d13          	tnz	(OFST+7,sp)
 431  0061 2706          	jreq	L02
 432  0063 7b13          	ld	a,(OFST+7,sp)
 433  0065 a110          	cp	a,#16
 434  0067 2603          	jrne	L61
 435  0069               L02:
 436  0069 4f            	clr	a
 437  006a 2010          	jra	L22
 438  006c               L61:
 439  006c ae005b        	ldw	x,#91
 440  006f 89            	pushw	x
 441  0070 ae0000        	ldw	x,#0
 442  0073 89            	pushw	x
 443  0074 ae0008        	ldw	x,#L371
 444  0077 cd0000        	call	_assert_failed
 446  007a 5b04          	addw	sp,#4
 447  007c               L22:
 448                     ; 92     assert_param(IS_UART1_STOPBITS_OK(StopBits));
 450  007c 0d14          	tnz	(OFST+8,sp)
 451  007e 2712          	jreq	L62
 452  0080 7b14          	ld	a,(OFST+8,sp)
 453  0082 a110          	cp	a,#16
 454  0084 270c          	jreq	L62
 455  0086 7b14          	ld	a,(OFST+8,sp)
 456  0088 a120          	cp	a,#32
 457  008a 2706          	jreq	L62
 458  008c 7b14          	ld	a,(OFST+8,sp)
 459  008e a130          	cp	a,#48
 460  0090 2603          	jrne	L42
 461  0092               L62:
 462  0092 4f            	clr	a
 463  0093 2010          	jra	L03
 464  0095               L42:
 465  0095 ae005c        	ldw	x,#92
 466  0098 89            	pushw	x
 467  0099 ae0000        	ldw	x,#0
 468  009c 89            	pushw	x
 469  009d ae0008        	ldw	x,#L371
 470  00a0 cd0000        	call	_assert_failed
 472  00a3 5b04          	addw	sp,#4
 473  00a5               L03:
 474                     ; 93     assert_param(IS_UART1_PARITY_OK(Parity));
 476  00a5 0d15          	tnz	(OFST+9,sp)
 477  00a7 270c          	jreq	L43
 478  00a9 7b15          	ld	a,(OFST+9,sp)
 479  00ab a104          	cp	a,#4
 480  00ad 2706          	jreq	L43
 481  00af 7b15          	ld	a,(OFST+9,sp)
 482  00b1 a106          	cp	a,#6
 483  00b3 2603          	jrne	L23
 484  00b5               L43:
 485  00b5 4f            	clr	a
 486  00b6 2010          	jra	L63
 487  00b8               L23:
 488  00b8 ae005d        	ldw	x,#93
 489  00bb 89            	pushw	x
 490  00bc ae0000        	ldw	x,#0
 491  00bf 89            	pushw	x
 492  00c0 ae0008        	ldw	x,#L371
 493  00c3 cd0000        	call	_assert_failed
 495  00c6 5b04          	addw	sp,#4
 496  00c8               L63:
 497                     ; 94     assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 499  00c8 7b17          	ld	a,(OFST+11,sp)
 500  00ca a108          	cp	a,#8
 501  00cc 2730          	jreq	L24
 502  00ce 7b17          	ld	a,(OFST+11,sp)
 503  00d0 a140          	cp	a,#64
 504  00d2 272a          	jreq	L24
 505  00d4 7b17          	ld	a,(OFST+11,sp)
 506  00d6 a104          	cp	a,#4
 507  00d8 2724          	jreq	L24
 508  00da 7b17          	ld	a,(OFST+11,sp)
 509  00dc a180          	cp	a,#128
 510  00de 271e          	jreq	L24
 511  00e0 7b17          	ld	a,(OFST+11,sp)
 512  00e2 a10c          	cp	a,#12
 513  00e4 2718          	jreq	L24
 514  00e6 7b17          	ld	a,(OFST+11,sp)
 515  00e8 a10c          	cp	a,#12
 516  00ea 2712          	jreq	L24
 517  00ec 7b17          	ld	a,(OFST+11,sp)
 518  00ee a144          	cp	a,#68
 519  00f0 270c          	jreq	L24
 520  00f2 7b17          	ld	a,(OFST+11,sp)
 521  00f4 a1c0          	cp	a,#192
 522  00f6 2706          	jreq	L24
 523  00f8 7b17          	ld	a,(OFST+11,sp)
 524  00fa a188          	cp	a,#136
 525  00fc 2603          	jrne	L04
 526  00fe               L24:
 527  00fe 4f            	clr	a
 528  00ff 2010          	jra	L44
 529  0101               L04:
 530  0101 ae005e        	ldw	x,#94
 531  0104 89            	pushw	x
 532  0105 ae0000        	ldw	x,#0
 533  0108 89            	pushw	x
 534  0109 ae0008        	ldw	x,#L371
 535  010c cd0000        	call	_assert_failed
 537  010f 5b04          	addw	sp,#4
 538  0111               L44:
 539                     ; 95     assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 541  0111 7b16          	ld	a,(OFST+10,sp)
 542  0113 a488          	and	a,#136
 543  0115 a188          	cp	a,#136
 544  0117 271b          	jreq	L64
 545  0119 7b16          	ld	a,(OFST+10,sp)
 546  011b a444          	and	a,#68
 547  011d a144          	cp	a,#68
 548  011f 2713          	jreq	L64
 549  0121 7b16          	ld	a,(OFST+10,sp)
 550  0123 a422          	and	a,#34
 551  0125 a122          	cp	a,#34
 552  0127 270b          	jreq	L64
 553  0129 7b16          	ld	a,(OFST+10,sp)
 554  012b a411          	and	a,#17
 555  012d a111          	cp	a,#17
 556  012f 2703          	jreq	L64
 557  0131 4f            	clr	a
 558  0132 2010          	jra	L05
 559  0134               L64:
 560  0134 ae005f        	ldw	x,#95
 561  0137 89            	pushw	x
 562  0138 ae0000        	ldw	x,#0
 563  013b 89            	pushw	x
 564  013c ae0008        	ldw	x,#L371
 565  013f cd0000        	call	_assert_failed
 567  0142 5b04          	addw	sp,#4
 568  0144               L05:
 569                     ; 98     UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 571  0144 72195234      	bres	21044,#4
 572                     ; 101     UART1->CR1 |= (uint8_t)WordLength;
 574  0148 c65234        	ld	a,21044
 575  014b 1a13          	or	a,(OFST+7,sp)
 576  014d c75234        	ld	21044,a
 577                     ; 104     UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 579  0150 c65236        	ld	a,21046
 580  0153 a4cf          	and	a,#207
 581  0155 c75236        	ld	21046,a
 582                     ; 106     UART1->CR3 |= (uint8_t)StopBits;  
 584  0158 c65236        	ld	a,21046
 585  015b 1a14          	or	a,(OFST+8,sp)
 586  015d c75236        	ld	21046,a
 587                     ; 109     UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 589  0160 c65234        	ld	a,21044
 590  0163 a4f9          	and	a,#249
 591  0165 c75234        	ld	21044,a
 592                     ; 111     UART1->CR1 |= (uint8_t)Parity;  
 594  0168 c65234        	ld	a,21044
 595  016b 1a15          	or	a,(OFST+9,sp)
 596  016d c75234        	ld	21044,a
 597                     ; 114     UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 599  0170 725f5232      	clr	21042
 600                     ; 116     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 602  0174 c65233        	ld	a,21043
 603  0177 a40f          	and	a,#15
 604  0179 c75233        	ld	21043,a
 605                     ; 118     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 607  017c c65233        	ld	a,21043
 608  017f a4f0          	and	a,#240
 609  0181 c75233        	ld	21043,a
 610                     ; 121     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 612  0184 96            	ldw	x,sp
 613  0185 1c000f        	addw	x,#OFST+3
 614  0188 cd0000        	call	c_ltor
 616  018b a604          	ld	a,#4
 617  018d cd0000        	call	c_llsh
 619  0190 96            	ldw	x,sp
 620  0191 1c0001        	addw	x,#OFST-11
 621  0194 cd0000        	call	c_rtol
 623  0197 cd0000        	call	_CLK_GetClockFreq
 625  019a 96            	ldw	x,sp
 626  019b 1c0001        	addw	x,#OFST-11
 627  019e cd0000        	call	c_ludv
 629  01a1 96            	ldw	x,sp
 630  01a2 1c0009        	addw	x,#OFST-3
 631  01a5 cd0000        	call	c_rtol
 633                     ; 122     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 635  01a8 96            	ldw	x,sp
 636  01a9 1c000f        	addw	x,#OFST+3
 637  01ac cd0000        	call	c_ltor
 639  01af a604          	ld	a,#4
 640  01b1 cd0000        	call	c_llsh
 642  01b4 96            	ldw	x,sp
 643  01b5 1c0001        	addw	x,#OFST-11
 644  01b8 cd0000        	call	c_rtol
 646  01bb cd0000        	call	_CLK_GetClockFreq
 648  01be a664          	ld	a,#100
 649  01c0 cd0000        	call	c_smul
 651  01c3 96            	ldw	x,sp
 652  01c4 1c0001        	addw	x,#OFST-11
 653  01c7 cd0000        	call	c_ludv
 655  01ca 96            	ldw	x,sp
 656  01cb 1c0005        	addw	x,#OFST-7
 657  01ce cd0000        	call	c_rtol
 659                     ; 124     UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 661  01d1 96            	ldw	x,sp
 662  01d2 1c0009        	addw	x,#OFST-3
 663  01d5 cd0000        	call	c_ltor
 665  01d8 a664          	ld	a,#100
 666  01da cd0000        	call	c_smul
 668  01dd 96            	ldw	x,sp
 669  01de 1c0001        	addw	x,#OFST-11
 670  01e1 cd0000        	call	c_rtol
 672  01e4 96            	ldw	x,sp
 673  01e5 1c0005        	addw	x,#OFST-7
 674  01e8 cd0000        	call	c_ltor
 676  01eb 96            	ldw	x,sp
 677  01ec 1c0001        	addw	x,#OFST-11
 678  01ef cd0000        	call	c_lsub
 680  01f2 a604          	ld	a,#4
 681  01f4 cd0000        	call	c_llsh
 683  01f7 ae0004        	ldw	x,#L25
 684  01fa cd0000        	call	c_ludv
 686  01fd b603          	ld	a,c_lreg+3
 687  01ff a40f          	and	a,#15
 688  0201 ca5233        	or	a,21043
 689  0204 c75233        	ld	21043,a
 690                     ; 126     UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 692  0207 96            	ldw	x,sp
 693  0208 1c0009        	addw	x,#OFST-3
 694  020b cd0000        	call	c_ltor
 696  020e a604          	ld	a,#4
 697  0210 cd0000        	call	c_lursh
 699  0213 b603          	ld	a,c_lreg+3
 700  0215 a4f0          	and	a,#240
 701  0217 b703          	ld	c_lreg+3,a
 702  0219 3f02          	clr	c_lreg+2
 703  021b 3f01          	clr	c_lreg+1
 704  021d 3f00          	clr	c_lreg
 705  021f b603          	ld	a,c_lreg+3
 706  0221 ca5233        	or	a,21043
 707  0224 c75233        	ld	21043,a
 708                     ; 128     UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 710  0227 c65232        	ld	a,21042
 711  022a 1a0c          	or	a,(OFST+0,sp)
 712  022c c75232        	ld	21042,a
 713                     ; 131     UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 715  022f c65235        	ld	a,21045
 716  0232 a4f3          	and	a,#243
 717  0234 c75235        	ld	21045,a
 718                     ; 133     UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 720  0237 c65236        	ld	a,21046
 721  023a a4f8          	and	a,#248
 722  023c c75236        	ld	21046,a
 723                     ; 135     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 723                     ; 136                                               UART1_CR3_CPHA | UART1_CR3_LBCL));  
 725  023f 7b16          	ld	a,(OFST+10,sp)
 726  0241 a407          	and	a,#7
 727  0243 ca5236        	or	a,21046
 728  0246 c75236        	ld	21046,a
 729                     ; 138     if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 731  0249 7b17          	ld	a,(OFST+11,sp)
 732  024b a504          	bcp	a,#4
 733  024d 2706          	jreq	L571
 734                     ; 141         UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 736  024f 72165235      	bset	21045,#3
 738  0253 2004          	jra	L771
 739  0255               L571:
 740                     ; 146         UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 742  0255 72175235      	bres	21045,#3
 743  0259               L771:
 744                     ; 148     if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 746  0259 7b17          	ld	a,(OFST+11,sp)
 747  025b a508          	bcp	a,#8
 748  025d 2706          	jreq	L102
 749                     ; 151         UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 751  025f 72145235      	bset	21045,#2
 753  0263 2004          	jra	L302
 754  0265               L102:
 755                     ; 156         UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 757  0265 72155235      	bres	21045,#2
 758  0269               L302:
 759                     ; 160     if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 761  0269 7b16          	ld	a,(OFST+10,sp)
 762  026b a580          	bcp	a,#128
 763  026d 2706          	jreq	L502
 764                     ; 163         UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 766  026f 72175236      	bres	21046,#3
 768  0273 200a          	jra	L702
 769  0275               L502:
 770                     ; 167         UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 772  0275 7b16          	ld	a,(OFST+10,sp)
 773  0277 a408          	and	a,#8
 774  0279 ca5236        	or	a,21046
 775  027c c75236        	ld	21046,a
 776  027f               L702:
 777                     ; 169 }
 780  027f 5b0c          	addw	sp,#12
 781  0281 81            	ret
 836                     ; 177 void UART1_Cmd(FunctionalState NewState)
 836                     ; 178 {
 837                     	switch	.text
 838  0282               _UART1_Cmd:
 842                     ; 179     if (NewState != DISABLE)
 844  0282 4d            	tnz	a
 845  0283 2706          	jreq	L732
 846                     ; 182         UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 848  0285 721b5234      	bres	21044,#5
 850  0289 2004          	jra	L142
 851  028b               L732:
 852                     ; 187         UART1->CR1 |= UART1_CR1_UARTD;  
 854  028b 721a5234      	bset	21044,#5
 855  028f               L142:
 856                     ; 189 }
 859  028f 81            	ret
 985                     ; 205 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 985                     ; 206 {
 986                     	switch	.text
 987  0290               _UART1_ITConfig:
 989  0290 89            	pushw	x
 990  0291 89            	pushw	x
 991       00000002      OFST:	set	2
 994                     ; 207     uint8_t uartreg = 0, itpos = 0x00;
 996  0292 7b01          	ld	a,(OFST-1,sp)
 997  0294 97            	ld	xl,a
1000  0295 7b02          	ld	a,(OFST+0,sp)
1001  0297 97            	ld	xl,a
1002                     ; 210     assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
1004  0298 1e03          	ldw	x,(OFST+1,sp)
1005  029a a30100        	cpw	x,#256
1006  029d 2723          	jreq	L26
1007  029f 1e03          	ldw	x,(OFST+1,sp)
1008  02a1 a30277        	cpw	x,#631
1009  02a4 271c          	jreq	L26
1010  02a6 1e03          	ldw	x,(OFST+1,sp)
1011  02a8 a30266        	cpw	x,#614
1012  02ab 2715          	jreq	L26
1013  02ad 1e03          	ldw	x,(OFST+1,sp)
1014  02af a30205        	cpw	x,#517
1015  02b2 270e          	jreq	L26
1016  02b4 1e03          	ldw	x,(OFST+1,sp)
1017  02b6 a30244        	cpw	x,#580
1018  02b9 2707          	jreq	L26
1019  02bb 1e03          	ldw	x,(OFST+1,sp)
1020  02bd a30346        	cpw	x,#838
1021  02c0 2603          	jrne	L06
1022  02c2               L26:
1023  02c2 4f            	clr	a
1024  02c3 2010          	jra	L46
1025  02c5               L06:
1026  02c5 ae00d2        	ldw	x,#210
1027  02c8 89            	pushw	x
1028  02c9 ae0000        	ldw	x,#0
1029  02cc 89            	pushw	x
1030  02cd ae0008        	ldw	x,#L371
1031  02d0 cd0000        	call	_assert_failed
1033  02d3 5b04          	addw	sp,#4
1034  02d5               L46:
1035                     ; 211     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1037  02d5 0d07          	tnz	(OFST+5,sp)
1038  02d7 2706          	jreq	L07
1039  02d9 7b07          	ld	a,(OFST+5,sp)
1040  02db a101          	cp	a,#1
1041  02dd 2603          	jrne	L66
1042  02df               L07:
1043  02df 4f            	clr	a
1044  02e0 2010          	jra	L27
1045  02e2               L66:
1046  02e2 ae00d3        	ldw	x,#211
1047  02e5 89            	pushw	x
1048  02e6 ae0000        	ldw	x,#0
1049  02e9 89            	pushw	x
1050  02ea ae0008        	ldw	x,#L371
1051  02ed cd0000        	call	_assert_failed
1053  02f0 5b04          	addw	sp,#4
1054  02f2               L27:
1055                     ; 214     uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
1057  02f2 7b03          	ld	a,(OFST+1,sp)
1058  02f4 6b01          	ld	(OFST-1,sp),a
1059                     ; 216     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
1061  02f6 7b04          	ld	a,(OFST+2,sp)
1062  02f8 a40f          	and	a,#15
1063  02fa 5f            	clrw	x
1064  02fb 97            	ld	xl,a
1065  02fc a601          	ld	a,#1
1066  02fe 5d            	tnzw	x
1067  02ff 2704          	jreq	L47
1068  0301               L67:
1069  0301 48            	sll	a
1070  0302 5a            	decw	x
1071  0303 26fc          	jrne	L67
1072  0305               L47:
1073  0305 6b02          	ld	(OFST+0,sp),a
1074                     ; 218     if (NewState != DISABLE)
1076  0307 0d07          	tnz	(OFST+5,sp)
1077  0309 272a          	jreq	L123
1078                     ; 221         if (uartreg == 0x01)
1080  030b 7b01          	ld	a,(OFST-1,sp)
1081  030d a101          	cp	a,#1
1082  030f 260a          	jrne	L323
1083                     ; 223             UART1->CR1 |= itpos;
1085  0311 c65234        	ld	a,21044
1086  0314 1a02          	or	a,(OFST+0,sp)
1087  0316 c75234        	ld	21044,a
1089  0319 2045          	jra	L333
1090  031b               L323:
1091                     ; 225         else if (uartreg == 0x02)
1093  031b 7b01          	ld	a,(OFST-1,sp)
1094  031d a102          	cp	a,#2
1095  031f 260a          	jrne	L723
1096                     ; 227             UART1->CR2 |= itpos;
1098  0321 c65235        	ld	a,21045
1099  0324 1a02          	or	a,(OFST+0,sp)
1100  0326 c75235        	ld	21045,a
1102  0329 2035          	jra	L333
1103  032b               L723:
1104                     ; 231             UART1->CR4 |= itpos;
1106  032b c65237        	ld	a,21047
1107  032e 1a02          	or	a,(OFST+0,sp)
1108  0330 c75237        	ld	21047,a
1109  0333 202b          	jra	L333
1110  0335               L123:
1111                     ; 237         if (uartreg == 0x01)
1113  0335 7b01          	ld	a,(OFST-1,sp)
1114  0337 a101          	cp	a,#1
1115  0339 260b          	jrne	L533
1116                     ; 239             UART1->CR1 &= (uint8_t)(~itpos);
1118  033b 7b02          	ld	a,(OFST+0,sp)
1119  033d 43            	cpl	a
1120  033e c45234        	and	a,21044
1121  0341 c75234        	ld	21044,a
1123  0344 201a          	jra	L333
1124  0346               L533:
1125                     ; 241         else if (uartreg == 0x02)
1127  0346 7b01          	ld	a,(OFST-1,sp)
1128  0348 a102          	cp	a,#2
1129  034a 260b          	jrne	L143
1130                     ; 243             UART1->CR2 &= (uint8_t)(~itpos);
1132  034c 7b02          	ld	a,(OFST+0,sp)
1133  034e 43            	cpl	a
1134  034f c45235        	and	a,21045
1135  0352 c75235        	ld	21045,a
1137  0355 2009          	jra	L333
1138  0357               L143:
1139                     ; 247             UART1->CR4 &= (uint8_t)(~itpos);
1141  0357 7b02          	ld	a,(OFST+0,sp)
1142  0359 43            	cpl	a
1143  035a c45237        	and	a,21047
1144  035d c75237        	ld	21047,a
1145  0360               L333:
1146                     ; 251 }
1149  0360 5b04          	addw	sp,#4
1150  0362 81            	ret
1187                     ; 258 void UART1_HalfDuplexCmd(FunctionalState NewState)
1187                     ; 259 {
1188                     	switch	.text
1189  0363               _UART1_HalfDuplexCmd:
1191  0363 88            	push	a
1192       00000000      OFST:	set	0
1195                     ; 260     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1197  0364 4d            	tnz	a
1198  0365 2704          	jreq	L401
1199  0367 a101          	cp	a,#1
1200  0369 2603          	jrne	L201
1201  036b               L401:
1202  036b 4f            	clr	a
1203  036c 2010          	jra	L601
1204  036e               L201:
1205  036e ae0104        	ldw	x,#260
1206  0371 89            	pushw	x
1207  0372 ae0000        	ldw	x,#0
1208  0375 89            	pushw	x
1209  0376 ae0008        	ldw	x,#L371
1210  0379 cd0000        	call	_assert_failed
1212  037c 5b04          	addw	sp,#4
1213  037e               L601:
1214                     ; 262     if (NewState != DISABLE)
1216  037e 0d01          	tnz	(OFST+1,sp)
1217  0380 2706          	jreq	L363
1218                     ; 264         UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1220  0382 72165238      	bset	21048,#3
1222  0386 2004          	jra	L563
1223  0388               L363:
1224                     ; 268         UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1226  0388 72175238      	bres	21048,#3
1227  038c               L563:
1228                     ; 270 }
1231  038c 84            	pop	a
1232  038d 81            	ret
1290                     ; 278 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1290                     ; 279 {
1291                     	switch	.text
1292  038e               _UART1_IrDAConfig:
1294  038e 88            	push	a
1295       00000000      OFST:	set	0
1298                     ; 280     assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1300  038f a101          	cp	a,#1
1301  0391 2703          	jreq	L411
1302  0393 4d            	tnz	a
1303  0394 2603          	jrne	L211
1304  0396               L411:
1305  0396 4f            	clr	a
1306  0397 2010          	jra	L611
1307  0399               L211:
1308  0399 ae0118        	ldw	x,#280
1309  039c 89            	pushw	x
1310  039d ae0000        	ldw	x,#0
1311  03a0 89            	pushw	x
1312  03a1 ae0008        	ldw	x,#L371
1313  03a4 cd0000        	call	_assert_failed
1315  03a7 5b04          	addw	sp,#4
1316  03a9               L611:
1317                     ; 282     if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1319  03a9 0d01          	tnz	(OFST+1,sp)
1320  03ab 2706          	jreq	L514
1321                     ; 284         UART1->CR5 |= UART1_CR5_IRLP;
1323  03ad 72145238      	bset	21048,#2
1325  03b1 2004          	jra	L714
1326  03b3               L514:
1327                     ; 288         UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1329  03b3 72155238      	bres	21048,#2
1330  03b7               L714:
1331                     ; 290 }
1334  03b7 84            	pop	a
1335  03b8 81            	ret
1371                     ; 298 void UART1_IrDACmd(FunctionalState NewState)
1371                     ; 299 {
1372                     	switch	.text
1373  03b9               _UART1_IrDACmd:
1375  03b9 88            	push	a
1376       00000000      OFST:	set	0
1379                     ; 302     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1381  03ba 4d            	tnz	a
1382  03bb 2704          	jreq	L421
1383  03bd a101          	cp	a,#1
1384  03bf 2603          	jrne	L221
1385  03c1               L421:
1386  03c1 4f            	clr	a
1387  03c2 2010          	jra	L621
1388  03c4               L221:
1389  03c4 ae012e        	ldw	x,#302
1390  03c7 89            	pushw	x
1391  03c8 ae0000        	ldw	x,#0
1392  03cb 89            	pushw	x
1393  03cc ae0008        	ldw	x,#L371
1394  03cf cd0000        	call	_assert_failed
1396  03d2 5b04          	addw	sp,#4
1397  03d4               L621:
1398                     ; 304     if (NewState != DISABLE)
1400  03d4 0d01          	tnz	(OFST+1,sp)
1401  03d6 2706          	jreq	L734
1402                     ; 307         UART1->CR5 |= UART1_CR5_IREN;
1404  03d8 72125238      	bset	21048,#1
1406  03dc 2004          	jra	L144
1407  03de               L734:
1408                     ; 312         UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1410  03de 72135238      	bres	21048,#1
1411  03e2               L144:
1412                     ; 314 }
1415  03e2 84            	pop	a
1416  03e3 81            	ret
1476                     ; 323 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1476                     ; 324 {
1477                     	switch	.text
1478  03e4               _UART1_LINBreakDetectionConfig:
1480  03e4 88            	push	a
1481       00000000      OFST:	set	0
1484                     ; 325     assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1486  03e5 4d            	tnz	a
1487  03e6 2704          	jreq	L431
1488  03e8 a101          	cp	a,#1
1489  03ea 2603          	jrne	L231
1490  03ec               L431:
1491  03ec 4f            	clr	a
1492  03ed 2010          	jra	L631
1493  03ef               L231:
1494  03ef ae0145        	ldw	x,#325
1495  03f2 89            	pushw	x
1496  03f3 ae0000        	ldw	x,#0
1497  03f6 89            	pushw	x
1498  03f7 ae0008        	ldw	x,#L371
1499  03fa cd0000        	call	_assert_failed
1501  03fd 5b04          	addw	sp,#4
1502  03ff               L631:
1503                     ; 327     if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1505  03ff 0d01          	tnz	(OFST+1,sp)
1506  0401 2706          	jreq	L174
1507                     ; 329         UART1->CR4 |= UART1_CR4_LBDL;
1509  0403 721a5237      	bset	21047,#5
1511  0407 2004          	jra	L374
1512  0409               L174:
1513                     ; 333         UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1515  0409 721b5237      	bres	21047,#5
1516  040d               L374:
1517                     ; 335 }
1520  040d 84            	pop	a
1521  040e 81            	ret
1557                     ; 343 void UART1_LINCmd(FunctionalState NewState)
1557                     ; 344 {
1558                     	switch	.text
1559  040f               _UART1_LINCmd:
1561  040f 88            	push	a
1562       00000000      OFST:	set	0
1565                     ; 345     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1567  0410 4d            	tnz	a
1568  0411 2704          	jreq	L441
1569  0413 a101          	cp	a,#1
1570  0415 2603          	jrne	L241
1571  0417               L441:
1572  0417 4f            	clr	a
1573  0418 2010          	jra	L641
1574  041a               L241:
1575  041a ae0159        	ldw	x,#345
1576  041d 89            	pushw	x
1577  041e ae0000        	ldw	x,#0
1578  0421 89            	pushw	x
1579  0422 ae0008        	ldw	x,#L371
1580  0425 cd0000        	call	_assert_failed
1582  0428 5b04          	addw	sp,#4
1583  042a               L641:
1584                     ; 347     if (NewState != DISABLE)
1586  042a 0d01          	tnz	(OFST+1,sp)
1587  042c 2706          	jreq	L315
1588                     ; 350         UART1->CR3 |= UART1_CR3_LINEN;
1590  042e 721c5236      	bset	21046,#6
1592  0432 2004          	jra	L515
1593  0434               L315:
1594                     ; 355         UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1596  0434 721d5236      	bres	21046,#6
1597  0438               L515:
1598                     ; 357 }
1601  0438 84            	pop	a
1602  0439 81            	ret
1638                     ; 364 void UART1_SmartCardCmd(FunctionalState NewState)
1638                     ; 365 {
1639                     	switch	.text
1640  043a               _UART1_SmartCardCmd:
1642  043a 88            	push	a
1643       00000000      OFST:	set	0
1646                     ; 366     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1648  043b 4d            	tnz	a
1649  043c 2704          	jreq	L451
1650  043e a101          	cp	a,#1
1651  0440 2603          	jrne	L251
1652  0442               L451:
1653  0442 4f            	clr	a
1654  0443 2010          	jra	L651
1655  0445               L251:
1656  0445 ae016e        	ldw	x,#366
1657  0448 89            	pushw	x
1658  0449 ae0000        	ldw	x,#0
1659  044c 89            	pushw	x
1660  044d ae0008        	ldw	x,#L371
1661  0450 cd0000        	call	_assert_failed
1663  0453 5b04          	addw	sp,#4
1664  0455               L651:
1665                     ; 368     if (NewState != DISABLE)
1667  0455 0d01          	tnz	(OFST+1,sp)
1668  0457 2706          	jreq	L535
1669                     ; 371         UART1->CR5 |= UART1_CR5_SCEN;
1671  0459 721a5238      	bset	21048,#5
1673  045d 2004          	jra	L735
1674  045f               L535:
1675                     ; 376         UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1677  045f 721b5238      	bres	21048,#5
1678  0463               L735:
1679                     ; 378 }
1682  0463 84            	pop	a
1683  0464 81            	ret
1720                     ; 387 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1720                     ; 388 {
1721                     	switch	.text
1722  0465               _UART1_SmartCardNACKCmd:
1724  0465 88            	push	a
1725       00000000      OFST:	set	0
1728                     ; 389     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1730  0466 4d            	tnz	a
1731  0467 2704          	jreq	L461
1732  0469 a101          	cp	a,#1
1733  046b 2603          	jrne	L261
1734  046d               L461:
1735  046d 4f            	clr	a
1736  046e 2010          	jra	L661
1737  0470               L261:
1738  0470 ae0185        	ldw	x,#389
1739  0473 89            	pushw	x
1740  0474 ae0000        	ldw	x,#0
1741  0477 89            	pushw	x
1742  0478 ae0008        	ldw	x,#L371
1743  047b cd0000        	call	_assert_failed
1745  047e 5b04          	addw	sp,#4
1746  0480               L661:
1747                     ; 391     if (NewState != DISABLE)
1749  0480 0d01          	tnz	(OFST+1,sp)
1750  0482 2706          	jreq	L755
1751                     ; 394         UART1->CR5 |= UART1_CR5_NACK;
1753  0484 72185238      	bset	21048,#4
1755  0488 2004          	jra	L165
1756  048a               L755:
1757                     ; 399         UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1759  048a 72195238      	bres	21048,#4
1760  048e               L165:
1761                     ; 401 }
1764  048e 84            	pop	a
1765  048f 81            	ret
1823                     ; 409 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1823                     ; 410 {
1824                     	switch	.text
1825  0490               _UART1_WakeUpConfig:
1827  0490 88            	push	a
1828       00000000      OFST:	set	0
1831                     ; 411     assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1833  0491 4d            	tnz	a
1834  0492 2704          	jreq	L471
1835  0494 a108          	cp	a,#8
1836  0496 2603          	jrne	L271
1837  0498               L471:
1838  0498 4f            	clr	a
1839  0499 2010          	jra	L671
1840  049b               L271:
1841  049b ae019b        	ldw	x,#411
1842  049e 89            	pushw	x
1843  049f ae0000        	ldw	x,#0
1844  04a2 89            	pushw	x
1845  04a3 ae0008        	ldw	x,#L371
1846  04a6 cd0000        	call	_assert_failed
1848  04a9 5b04          	addw	sp,#4
1849  04ab               L671:
1850                     ; 413     UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1852  04ab 72175234      	bres	21044,#3
1853                     ; 414     UART1->CR1 |= (uint8_t)UART1_WakeUp;
1855  04af c65234        	ld	a,21044
1856  04b2 1a01          	or	a,(OFST+1,sp)
1857  04b4 c75234        	ld	21044,a
1858                     ; 415 }
1861  04b7 84            	pop	a
1862  04b8 81            	ret
1899                     ; 422 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1899                     ; 423 {
1900                     	switch	.text
1901  04b9               _UART1_ReceiverWakeUpCmd:
1903  04b9 88            	push	a
1904       00000000      OFST:	set	0
1907                     ; 424     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1909  04ba 4d            	tnz	a
1910  04bb 2704          	jreq	L402
1911  04bd a101          	cp	a,#1
1912  04bf 2603          	jrne	L202
1913  04c1               L402:
1914  04c1 4f            	clr	a
1915  04c2 2010          	jra	L602
1916  04c4               L202:
1917  04c4 ae01a8        	ldw	x,#424
1918  04c7 89            	pushw	x
1919  04c8 ae0000        	ldw	x,#0
1920  04cb 89            	pushw	x
1921  04cc ae0008        	ldw	x,#L371
1922  04cf cd0000        	call	_assert_failed
1924  04d2 5b04          	addw	sp,#4
1925  04d4               L602:
1926                     ; 426     if (NewState != DISABLE)
1928  04d4 0d01          	tnz	(OFST+1,sp)
1929  04d6 2706          	jreq	L726
1930                     ; 429         UART1->CR2 |= UART1_CR2_RWU;
1932  04d8 72125235      	bset	21045,#1
1934  04dc 2004          	jra	L136
1935  04de               L726:
1936                     ; 434         UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1938  04de 72135235      	bres	21045,#1
1939  04e2               L136:
1940                     ; 436 }
1943  04e2 84            	pop	a
1944  04e3 81            	ret
1967                     ; 443 uint8_t UART1_ReceiveData8(void)
1967                     ; 444 {
1968                     	switch	.text
1969  04e4               _UART1_ReceiveData8:
1973                     ; 445     return ((uint8_t)UART1->DR);
1975  04e4 c65231        	ld	a,21041
1978  04e7 81            	ret
2012                     ; 453 uint16_t UART1_ReceiveData9(void)
2012                     ; 454 {
2013                     	switch	.text
2014  04e8               _UART1_ReceiveData9:
2016  04e8 89            	pushw	x
2017       00000002      OFST:	set	2
2020                     ; 455   uint16_t temp = 0;
2022  04e9 5f            	clrw	x
2023  04ea 1f01          	ldw	(OFST-1,sp),x
2024                     ; 457   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
2026  04ec c65234        	ld	a,21044
2027  04ef 5f            	clrw	x
2028  04f0 a480          	and	a,#128
2029  04f2 5f            	clrw	x
2030  04f3 02            	rlwa	x,a
2031  04f4 58            	sllw	x
2032  04f5 1f01          	ldw	(OFST-1,sp),x
2033                     ; 458   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
2035  04f7 c65231        	ld	a,21041
2036  04fa 5f            	clrw	x
2037  04fb 97            	ld	xl,a
2038  04fc 01            	rrwa	x,a
2039  04fd 1a02          	or	a,(OFST+0,sp)
2040  04ff 01            	rrwa	x,a
2041  0500 1a01          	or	a,(OFST-1,sp)
2042  0502 01            	rrwa	x,a
2043  0503 01            	rrwa	x,a
2044  0504 a4ff          	and	a,#255
2045  0506 01            	rrwa	x,a
2046  0507 a401          	and	a,#1
2047  0509 01            	rrwa	x,a
2050  050a 5b02          	addw	sp,#2
2051  050c 81            	ret
2085                     ; 466 void UART1_SendData8(uint8_t Data)
2085                     ; 467 {
2086                     	switch	.text
2087  050d               _UART1_SendData8:
2091                     ; 469     UART1->DR = Data;
2093  050d c75231        	ld	21041,a
2094                     ; 470 }
2097  0510 81            	ret
2131                     ; 478 void UART1_SendData9(uint16_t Data)
2131                     ; 479 {
2132                     	switch	.text
2133  0511               _UART1_SendData9:
2135  0511 89            	pushw	x
2136       00000000      OFST:	set	0
2139                     ; 481     UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2141  0512 721d5234      	bres	21044,#6
2142                     ; 483     UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2144  0516 54            	srlw	x
2145  0517 54            	srlw	x
2146  0518 9f            	ld	a,xl
2147  0519 a440          	and	a,#64
2148  051b ca5234        	or	a,21044
2149  051e c75234        	ld	21044,a
2150                     ; 485     UART1->DR   = (uint8_t)(Data);
2152  0521 7b02          	ld	a,(OFST+2,sp)
2153  0523 c75231        	ld	21041,a
2154                     ; 486 }
2157  0526 85            	popw	x
2158  0527 81            	ret
2181                     ; 493 void UART1_SendBreak(void)
2181                     ; 494 {
2182                     	switch	.text
2183  0528               _UART1_SendBreak:
2187                     ; 495     UART1->CR2 |= UART1_CR2_SBK;
2189  0528 72105235      	bset	21045,#0
2190                     ; 496 }
2193  052c 81            	ret
2228                     ; 503 void UART1_SetAddress(uint8_t UART1_Address)
2228                     ; 504 {
2229                     	switch	.text
2230  052d               _UART1_SetAddress:
2232  052d 88            	push	a
2233       00000000      OFST:	set	0
2236                     ; 506     assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2238  052e a110          	cp	a,#16
2239  0530 2403          	jruge	L422
2240  0532 4f            	clr	a
2241  0533 2010          	jra	L622
2242  0535               L422:
2243  0535 ae01fa        	ldw	x,#506
2244  0538 89            	pushw	x
2245  0539 ae0000        	ldw	x,#0
2246  053c 89            	pushw	x
2247  053d ae0008        	ldw	x,#L371
2248  0540 cd0000        	call	_assert_failed
2250  0543 5b04          	addw	sp,#4
2251  0545               L622:
2252                     ; 509     UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2254  0545 c65237        	ld	a,21047
2255  0548 a4f0          	and	a,#240
2256  054a c75237        	ld	21047,a
2257                     ; 511     UART1->CR4 |= UART1_Address;
2259  054d c65237        	ld	a,21047
2260  0550 1a01          	or	a,(OFST+1,sp)
2261  0552 c75237        	ld	21047,a
2262                     ; 512 }
2265  0555 84            	pop	a
2266  0556 81            	ret
2300                     ; 520 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2300                     ; 521 {
2301                     	switch	.text
2302  0557               _UART1_SetGuardTime:
2306                     ; 523     UART1->GTR = UART1_GuardTime;
2308  0557 c75239        	ld	21049,a
2309                     ; 524 }
2312  055a 81            	ret
2346                     ; 548 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2346                     ; 549 {
2347                     	switch	.text
2348  055b               _UART1_SetPrescaler:
2352                     ; 551     UART1->PSCR = UART1_Prescaler;
2354  055b c7523a        	ld	21050,a
2355                     ; 552 }
2358  055e 81            	ret
2502                     ; 560 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2502                     ; 561 {
2503                     	switch	.text
2504  055f               _UART1_GetFlagStatus:
2506  055f 89            	pushw	x
2507  0560 88            	push	a
2508       00000001      OFST:	set	1
2511                     ; 562     FlagStatus status = RESET;
2513  0561 0f01          	clr	(OFST+0,sp)
2514                     ; 565     assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2516  0563 a30080        	cpw	x,#128
2517  0566 272d          	jreq	L042
2518  0568 a30040        	cpw	x,#64
2519  056b 2728          	jreq	L042
2520  056d a30020        	cpw	x,#32
2521  0570 2723          	jreq	L042
2522  0572 a30010        	cpw	x,#16
2523  0575 271e          	jreq	L042
2524  0577 a30008        	cpw	x,#8
2525  057a 2719          	jreq	L042
2526  057c a30004        	cpw	x,#4
2527  057f 2714          	jreq	L042
2528  0581 a30002        	cpw	x,#2
2529  0584 270f          	jreq	L042
2530  0586 a30001        	cpw	x,#1
2531  0589 270a          	jreq	L042
2532  058b a30101        	cpw	x,#257
2533  058e 2705          	jreq	L042
2534  0590 a30210        	cpw	x,#528
2535  0593 2603          	jrne	L632
2536  0595               L042:
2537  0595 4f            	clr	a
2538  0596 2010          	jra	L242
2539  0598               L632:
2540  0598 ae0235        	ldw	x,#565
2541  059b 89            	pushw	x
2542  059c ae0000        	ldw	x,#0
2543  059f 89            	pushw	x
2544  05a0 ae0008        	ldw	x,#L371
2545  05a3 cd0000        	call	_assert_failed
2547  05a6 5b04          	addw	sp,#4
2548  05a8               L242:
2549                     ; 569     if (UART1_FLAG == UART1_FLAG_LBDF)
2551  05a8 1e02          	ldw	x,(OFST+1,sp)
2552  05aa a30210        	cpw	x,#528
2553  05ad 2611          	jrne	L1601
2554                     ; 571         if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2556  05af c65237        	ld	a,21047
2557  05b2 1503          	bcp	a,(OFST+2,sp)
2558  05b4 2706          	jreq	L3601
2559                     ; 574             status = SET;
2561  05b6 a601          	ld	a,#1
2562  05b8 6b01          	ld	(OFST+0,sp),a
2564  05ba 202b          	jra	L7601
2565  05bc               L3601:
2566                     ; 579             status = RESET;
2568  05bc 0f01          	clr	(OFST+0,sp)
2569  05be 2027          	jra	L7601
2570  05c0               L1601:
2571                     ; 582     else if (UART1_FLAG == UART1_FLAG_SBK)
2573  05c0 1e02          	ldw	x,(OFST+1,sp)
2574  05c2 a30101        	cpw	x,#257
2575  05c5 2611          	jrne	L1701
2576                     ; 584         if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2578  05c7 c65235        	ld	a,21045
2579  05ca 1503          	bcp	a,(OFST+2,sp)
2580  05cc 2706          	jreq	L3701
2581                     ; 587             status = SET;
2583  05ce a601          	ld	a,#1
2584  05d0 6b01          	ld	(OFST+0,sp),a
2586  05d2 2013          	jra	L7601
2587  05d4               L3701:
2588                     ; 592             status = RESET;
2590  05d4 0f01          	clr	(OFST+0,sp)
2591  05d6 200f          	jra	L7601
2592  05d8               L1701:
2593                     ; 597         if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2595  05d8 c65230        	ld	a,21040
2596  05db 1503          	bcp	a,(OFST+2,sp)
2597  05dd 2706          	jreq	L1011
2598                     ; 600             status = SET;
2600  05df a601          	ld	a,#1
2601  05e1 6b01          	ld	(OFST+0,sp),a
2603  05e3 2002          	jra	L7601
2604  05e5               L1011:
2605                     ; 605             status = RESET;
2607  05e5 0f01          	clr	(OFST+0,sp)
2608  05e7               L7601:
2609                     ; 609     return status;
2611  05e7 7b01          	ld	a,(OFST+0,sp)
2614  05e9 5b03          	addw	sp,#3
2615  05eb 81            	ret
2651                     ; 639 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2651                     ; 640 {
2652                     	switch	.text
2653  05ec               _UART1_ClearFlag:
2655  05ec 89            	pushw	x
2656       00000000      OFST:	set	0
2659                     ; 641     assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2661  05ed a30020        	cpw	x,#32
2662  05f0 2705          	jreq	L052
2663  05f2 a30210        	cpw	x,#528
2664  05f5 2603          	jrne	L642
2665  05f7               L052:
2666  05f7 4f            	clr	a
2667  05f8 2010          	jra	L252
2668  05fa               L642:
2669  05fa ae0281        	ldw	x,#641
2670  05fd 89            	pushw	x
2671  05fe ae0000        	ldw	x,#0
2672  0601 89            	pushw	x
2673  0602 ae0008        	ldw	x,#L371
2674  0605 cd0000        	call	_assert_failed
2676  0608 5b04          	addw	sp,#4
2677  060a               L252:
2678                     ; 644     if (UART1_FLAG == UART1_FLAG_RXNE)
2680  060a 1e01          	ldw	x,(OFST+1,sp)
2681  060c a30020        	cpw	x,#32
2682  060f 2606          	jrne	L3211
2683                     ; 646         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2685  0611 35df5230      	mov	21040,#223
2687  0615 2004          	jra	L5211
2688  0617               L3211:
2689                     ; 651         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2691  0617 72195237      	bres	21047,#4
2692  061b               L5211:
2693                     ; 653 }
2696  061b 85            	popw	x
2697  061c 81            	ret
2780                     ; 668 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2780                     ; 669 {
2781                     	switch	.text
2782  061d               _UART1_GetITStatus:
2784  061d 89            	pushw	x
2785  061e 89            	pushw	x
2786       00000002      OFST:	set	2
2789                     ; 670     ITStatus pendingbitstatus = RESET;
2791  061f 7b02          	ld	a,(OFST+0,sp)
2792  0621 97            	ld	xl,a
2793                     ; 671     uint8_t itpos = 0;
2795  0622 7b01          	ld	a,(OFST-1,sp)
2796  0624 97            	ld	xl,a
2797                     ; 672     uint8_t itmask1 = 0;
2799  0625 7b02          	ld	a,(OFST+0,sp)
2800  0627 97            	ld	xl,a
2801                     ; 673     uint8_t itmask2 = 0;
2803  0628 7b02          	ld	a,(OFST+0,sp)
2804  062a 97            	ld	xl,a
2805                     ; 674     uint8_t enablestatus = 0;
2807  062b 7b02          	ld	a,(OFST+0,sp)
2808  062d 97            	ld	xl,a
2809                     ; 677     assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2811  062e 1e03          	ldw	x,(OFST+1,sp)
2812  0630 a30277        	cpw	x,#631
2813  0633 272a          	jreq	L062
2814  0635 1e03          	ldw	x,(OFST+1,sp)
2815  0637 a30266        	cpw	x,#614
2816  063a 2723          	jreq	L062
2817  063c 1e03          	ldw	x,(OFST+1,sp)
2818  063e a30255        	cpw	x,#597
2819  0641 271c          	jreq	L062
2820  0643 1e03          	ldw	x,(OFST+1,sp)
2821  0645 a30244        	cpw	x,#580
2822  0648 2715          	jreq	L062
2823  064a 1e03          	ldw	x,(OFST+1,sp)
2824  064c a30235        	cpw	x,#565
2825  064f 270e          	jreq	L062
2826  0651 1e03          	ldw	x,(OFST+1,sp)
2827  0653 a30346        	cpw	x,#838
2828  0656 2707          	jreq	L062
2829  0658 1e03          	ldw	x,(OFST+1,sp)
2830  065a a30100        	cpw	x,#256
2831  065d 2603          	jrne	L652
2832  065f               L062:
2833  065f 4f            	clr	a
2834  0660 2010          	jra	L262
2835  0662               L652:
2836  0662 ae02a5        	ldw	x,#677
2837  0665 89            	pushw	x
2838  0666 ae0000        	ldw	x,#0
2839  0669 89            	pushw	x
2840  066a ae0008        	ldw	x,#L371
2841  066d cd0000        	call	_assert_failed
2843  0670 5b04          	addw	sp,#4
2844  0672               L262:
2845                     ; 680     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2847  0672 7b04          	ld	a,(OFST+2,sp)
2848  0674 a40f          	and	a,#15
2849  0676 5f            	clrw	x
2850  0677 97            	ld	xl,a
2851  0678 a601          	ld	a,#1
2852  067a 5d            	tnzw	x
2853  067b 2704          	jreq	L462
2854  067d               L662:
2855  067d 48            	sll	a
2856  067e 5a            	decw	x
2857  067f 26fc          	jrne	L662
2858  0681               L462:
2859  0681 6b01          	ld	(OFST-1,sp),a
2860                     ; 682     itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2862  0683 7b04          	ld	a,(OFST+2,sp)
2863  0685 4e            	swap	a
2864  0686 a40f          	and	a,#15
2865  0688 6b02          	ld	(OFST+0,sp),a
2866                     ; 684     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2868  068a 7b02          	ld	a,(OFST+0,sp)
2869  068c 5f            	clrw	x
2870  068d 97            	ld	xl,a
2871  068e a601          	ld	a,#1
2872  0690 5d            	tnzw	x
2873  0691 2704          	jreq	L072
2874  0693               L272:
2875  0693 48            	sll	a
2876  0694 5a            	decw	x
2877  0695 26fc          	jrne	L272
2878  0697               L072:
2879  0697 6b02          	ld	(OFST+0,sp),a
2880                     ; 688     if (UART1_IT == UART1_IT_PE)
2882  0699 1e03          	ldw	x,(OFST+1,sp)
2883  069b a30100        	cpw	x,#256
2884  069e 261c          	jrne	L1711
2885                     ; 691         enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2887  06a0 c65234        	ld	a,21044
2888  06a3 1402          	and	a,(OFST+0,sp)
2889  06a5 6b02          	ld	(OFST+0,sp),a
2890                     ; 694         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2892  06a7 c65230        	ld	a,21040
2893  06aa 1501          	bcp	a,(OFST-1,sp)
2894  06ac 270a          	jreq	L3711
2896  06ae 0d02          	tnz	(OFST+0,sp)
2897  06b0 2706          	jreq	L3711
2898                     ; 697             pendingbitstatus = SET;
2900  06b2 a601          	ld	a,#1
2901  06b4 6b02          	ld	(OFST+0,sp),a
2903  06b6 2041          	jra	L7711
2904  06b8               L3711:
2905                     ; 702             pendingbitstatus = RESET;
2907  06b8 0f02          	clr	(OFST+0,sp)
2908  06ba 203d          	jra	L7711
2909  06bc               L1711:
2910                     ; 706     else if (UART1_IT == UART1_IT_LBDF)
2912  06bc 1e03          	ldw	x,(OFST+1,sp)
2913  06be a30346        	cpw	x,#838
2914  06c1 261c          	jrne	L1021
2915                     ; 709         enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2917  06c3 c65237        	ld	a,21047
2918  06c6 1402          	and	a,(OFST+0,sp)
2919  06c8 6b02          	ld	(OFST+0,sp),a
2920                     ; 711         if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2922  06ca c65237        	ld	a,21047
2923  06cd 1501          	bcp	a,(OFST-1,sp)
2924  06cf 270a          	jreq	L3021
2926  06d1 0d02          	tnz	(OFST+0,sp)
2927  06d3 2706          	jreq	L3021
2928                     ; 714             pendingbitstatus = SET;
2930  06d5 a601          	ld	a,#1
2931  06d7 6b02          	ld	(OFST+0,sp),a
2933  06d9 201e          	jra	L7711
2934  06db               L3021:
2935                     ; 719             pendingbitstatus = RESET;
2937  06db 0f02          	clr	(OFST+0,sp)
2938  06dd 201a          	jra	L7711
2939  06df               L1021:
2940                     ; 725         enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2942  06df c65235        	ld	a,21045
2943  06e2 1402          	and	a,(OFST+0,sp)
2944  06e4 6b02          	ld	(OFST+0,sp),a
2945                     ; 727         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2947  06e6 c65230        	ld	a,21040
2948  06e9 1501          	bcp	a,(OFST-1,sp)
2949  06eb 270a          	jreq	L1121
2951  06ed 0d02          	tnz	(OFST+0,sp)
2952  06ef 2706          	jreq	L1121
2953                     ; 730             pendingbitstatus = SET;
2955  06f1 a601          	ld	a,#1
2956  06f3 6b02          	ld	(OFST+0,sp),a
2958  06f5 2002          	jra	L7711
2959  06f7               L1121:
2960                     ; 735             pendingbitstatus = RESET;
2962  06f7 0f02          	clr	(OFST+0,sp)
2963  06f9               L7711:
2964                     ; 740     return  pendingbitstatus;
2966  06f9 7b02          	ld	a,(OFST+0,sp)
2969  06fb 5b04          	addw	sp,#4
2970  06fd 81            	ret
3007                     ; 768 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
3007                     ; 769 {
3008                     	switch	.text
3009  06fe               _UART1_ClearITPendingBit:
3011  06fe 89            	pushw	x
3012       00000000      OFST:	set	0
3015                     ; 770     assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
3017  06ff a30255        	cpw	x,#597
3018  0702 2705          	jreq	L003
3019  0704 a30346        	cpw	x,#838
3020  0707 2603          	jrne	L672
3021  0709               L003:
3022  0709 4f            	clr	a
3023  070a 2010          	jra	L203
3024  070c               L672:
3025  070c ae0302        	ldw	x,#770
3026  070f 89            	pushw	x
3027  0710 ae0000        	ldw	x,#0
3028  0713 89            	pushw	x
3029  0714 ae0008        	ldw	x,#L371
3030  0717 cd0000        	call	_assert_failed
3032  071a 5b04          	addw	sp,#4
3033  071c               L203:
3034                     ; 773     if (UART1_IT == UART1_IT_RXNE)
3036  071c 1e01          	ldw	x,(OFST+1,sp)
3037  071e a30255        	cpw	x,#597
3038  0721 2606          	jrne	L3321
3039                     ; 775         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
3041  0723 35df5230      	mov	21040,#223
3043  0727 2004          	jra	L5321
3044  0729               L3321:
3045                     ; 780         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
3047  0729 72195237      	bres	21047,#4
3048  072d               L5321:
3049                     ; 782 }
3052  072d 85            	popw	x
3053  072e 81            	ret
3066                     	xdef	_UART1_ClearITPendingBit
3067                     	xdef	_UART1_GetITStatus
3068                     	xdef	_UART1_ClearFlag
3069                     	xdef	_UART1_GetFlagStatus
3070                     	xdef	_UART1_SetPrescaler
3071                     	xdef	_UART1_SetGuardTime
3072                     	xdef	_UART1_SetAddress
3073                     	xdef	_UART1_SendBreak
3074                     	xdef	_UART1_SendData9
3075                     	xdef	_UART1_SendData8
3076                     	xdef	_UART1_ReceiveData9
3077                     	xdef	_UART1_ReceiveData8
3078                     	xdef	_UART1_ReceiverWakeUpCmd
3079                     	xdef	_UART1_WakeUpConfig
3080                     	xdef	_UART1_SmartCardNACKCmd
3081                     	xdef	_UART1_SmartCardCmd
3082                     	xdef	_UART1_LINCmd
3083                     	xdef	_UART1_LINBreakDetectionConfig
3084                     	xdef	_UART1_IrDACmd
3085                     	xdef	_UART1_IrDAConfig
3086                     	xdef	_UART1_HalfDuplexCmd
3087                     	xdef	_UART1_ITConfig
3088                     	xdef	_UART1_Cmd
3089                     	xdef	_UART1_Init
3090                     	xdef	_UART1_DeInit
3091                     	xref	_assert_failed
3092                     	xref	_CLK_GetClockFreq
3093                     	switch	.const
3094  0008               L371:
3095  0008 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
3096  001a 697665725c73  	dc.b	"iver\src\stm8s_uar"
3097  002c 74312e6300    	dc.b	"t1.c",0
3098                     	xref.b	c_lreg
3118                     	xref	c_lursh
3119                     	xref	c_lsub
3120                     	xref	c_smul
3121                     	xref	c_ludv
3122                     	xref	c_rtol
3123                     	xref	c_llsh
3124                     	xref	c_lcmp
3125                     	xref	c_ltor
3126                     	end
