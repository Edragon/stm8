   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 63 void TIM2_DeInit(void)
  43                     ; 64 {
  45                     	switch	.text
  46  0000               _TIM2_DeInit:
  50                     ; 65   TIM2->CR1 = TIM_CR1_RESET_VALUE;
  52  0000 725f5250      	clr	21072
  53                     ; 66   TIM2->CR2 = TIM_CR2_RESET_VALUE;
  55  0004 725f5251      	clr	21073
  56                     ; 67   TIM2->SMCR = TIM_SMCR_RESET_VALUE;
  58  0008 725f5252      	clr	21074
  59                     ; 68   TIM2->ETR = TIM_ETR_RESET_VALUE;
  61  000c 725f5253      	clr	21075
  62                     ; 69   TIM2->IER = TIM_IER_RESET_VALUE;
  64  0010 725f5254      	clr	21076
  65                     ; 70   TIM2->SR2 = TIM_SR2_RESET_VALUE;
  67  0014 725f5256      	clr	21078
  68                     ; 73   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  70  0018 725f525a      	clr	21082
  71                     ; 75   TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
  73  001c 35015258      	mov	21080,#1
  74                     ; 76   TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
  76  0020 35015259      	mov	21081,#1
  77                     ; 79   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  79  0024 725f525a      	clr	21082
  80                     ; 80   TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
  82  0028 725f5258      	clr	21080
  83                     ; 81   TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
  85  002c 725f5259      	clr	21081
  86                     ; 83   TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
  88  0030 725f525b      	clr	21083
  89                     ; 84   TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
  91  0034 725f525c      	clr	21084
  92                     ; 86   TIM2->PSCR = TIM_PSCR_RESET_VALUE;
  94  0038 725f525d      	clr	21085
  95                     ; 88   TIM2->ARRH = TIM_ARRH_RESET_VALUE;
  97  003c 35ff525e      	mov	21086,#255
  98                     ; 89   TIM2->ARRL = TIM_ARRL_RESET_VALUE;
 100  0040 35ff525f      	mov	21087,#255
 101                     ; 91   TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
 103  0044 725f5260      	clr	21088
 104                     ; 92   TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
 106  0048 725f5261      	clr	21089
 107                     ; 93   TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
 109  004c 725f5262      	clr	21090
 110                     ; 94   TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
 112  0050 725f5263      	clr	21091
 113                     ; 96   TIM2->OISR = TIM_OISR_RESET_VALUE;
 115  0054 725f5265      	clr	21093
 116                     ; 97   TIM2->EGR = 0x01;/*TIM_EGR_UG;*/
 118  0058 35015257      	mov	21079,#1
 119                     ; 98   TIM2->BKR = TIM_BKR_RESET_VALUE;
 121  005c 725f5264      	clr	21092
 122                     ; 99   TIM2->SR1 = TIM_SR1_RESET_VALUE;
 124  0060 725f5255      	clr	21077
 125                     ; 100 }
 128  0064 81            	ret
 290                     ; 124 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
 290                     ; 125                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
 290                     ; 126                        uint16_t TIM2_Period)
 290                     ; 127 {
 291                     	switch	.text
 292  0065               _TIM2_TimeBaseInit:
 294  0065 89            	pushw	x
 295       00000000      OFST:	set	0
 298                     ; 129   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
 300                     ; 130   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 302                     ; 133   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
 304  0066 7b05          	ld	a,(OFST+5,sp)
 305  0068 c7525e        	ld	21086,a
 306                     ; 134   TIM2->ARRL = (uint8_t)(TIM2_Period);
 308  006b 7b06          	ld	a,(OFST+6,sp)
 309  006d c7525f        	ld	21087,a
 310                     ; 137   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 312  0070 9e            	ld	a,xh
 313  0071 c7525d        	ld	21085,a
 314                     ; 140   TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 316  0074 c65250        	ld	a,21072
 317  0077 a48f          	and	a,#143
 318  0079 c75250        	ld	21072,a
 319                     ; 141   TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
 321  007c 9f            	ld	a,xl
 322  007d ca5250        	or	a,21072
 323  0080 c75250        	ld	21072,a
 324                     ; 142 }
 327  0083 85            	popw	x
 328  0084 81            	ret
 526                     ; 169 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 526                     ; 170                   TIM2_OutputState_TypeDef TIM2_OutputState,
 526                     ; 171                   uint16_t TIM2_Pulse,
 526                     ; 172                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 526                     ; 173                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 526                     ; 174 {
 527                     	switch	.text
 528  0085               _TIM2_OC1Init:
 530  0085 89            	pushw	x
 531  0086 88            	push	a
 532       00000001      OFST:	set	1
 535                     ; 175   uint8_t tmpccmr1 = 0;
 537                     ; 178   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 539                     ; 179   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 541                     ; 180   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 543                     ; 181   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 545                     ; 183   tmpccmr1 = TIM2->CCMR1;
 547  0087 c65258        	ld	a,21080
 548  008a 6b01          	ld	(OFST+0,sp),a
 549                     ; 186   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 551  008c 7211525a      	bres	21082,#0
 552                     ; 188   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 554  0090 7b01          	ld	a,(OFST+0,sp)
 555  0092 a48f          	and	a,#143
 556  0094 6b01          	ld	(OFST+0,sp),a
 557                     ; 191   tmpccmr1 |= (uint8_t)TIM2_OCMode;
 559  0096 9e            	ld	a,xh
 560  0097 1a01          	or	a,(OFST+0,sp)
 561  0099 6b01          	ld	(OFST+0,sp),a
 562                     ; 193   TIM2->CCMR1 = tmpccmr1;
 564  009b 7b01          	ld	a,(OFST+0,sp)
 565  009d c75258        	ld	21080,a
 566                     ; 196   if (TIM2_OutputState == TIM2_OutputState_Enable)
 568  00a0 9f            	ld	a,xl
 569  00a1 a101          	cp	a,#1
 570  00a3 2606          	jrne	L722
 571                     ; 198     TIM2->CCER1 |= TIM_CCER1_CC1E;
 573  00a5 7210525a      	bset	21082,#0
 575  00a9 2004          	jra	L132
 576  00ab               L722:
 577                     ; 202     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 579  00ab 7211525a      	bres	21082,#0
 580  00af               L132:
 581                     ; 206   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 583  00af 7b08          	ld	a,(OFST+7,sp)
 584  00b1 a101          	cp	a,#1
 585  00b3 2606          	jrne	L332
 586                     ; 208     TIM2->CCER1 |= TIM_CCER1_CC1P;
 588  00b5 7212525a      	bset	21082,#1
 590  00b9 2004          	jra	L532
 591  00bb               L332:
 592                     ; 212     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 594  00bb 7213525a      	bres	21082,#1
 595  00bf               L532:
 596                     ; 216   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 598  00bf 7b09          	ld	a,(OFST+8,sp)
 599  00c1 a101          	cp	a,#1
 600  00c3 2606          	jrne	L732
 601                     ; 218     TIM2->OISR |= TIM_OISR_OIS1;
 603  00c5 72105265      	bset	21093,#0
 605  00c9 2004          	jra	L142
 606  00cb               L732:
 607                     ; 222     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 609  00cb 72115265      	bres	21093,#0
 610  00cf               L142:
 611                     ; 226   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 613  00cf 7b06          	ld	a,(OFST+5,sp)
 614  00d1 c75260        	ld	21088,a
 615                     ; 227   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 617  00d4 7b07          	ld	a,(OFST+6,sp)
 618  00d6 c75261        	ld	21089,a
 619                     ; 228 }
 622  00d9 5b03          	addw	sp,#3
 623  00db 81            	ret
 706                     ; 255 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 706                     ; 256                   TIM2_OutputState_TypeDef TIM2_OutputState,
 706                     ; 257                   uint16_t TIM2_Pulse,
 706                     ; 258                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 706                     ; 259                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 706                     ; 260 {
 707                     	switch	.text
 708  00dc               _TIM2_OC2Init:
 710  00dc 89            	pushw	x
 711  00dd 88            	push	a
 712       00000001      OFST:	set	1
 715                     ; 261   uint8_t tmpccmr2 = 0;
 717                     ; 264   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 719                     ; 265   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 721                     ; 266   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 723                     ; 267   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 725                     ; 269   tmpccmr2 = TIM2->CCMR2;
 727  00de c65259        	ld	a,21081
 728  00e1 6b01          	ld	(OFST+0,sp),a
 729                     ; 272   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 731  00e3 7219525a      	bres	21082,#4
 732                     ; 275   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 734  00e7 7b01          	ld	a,(OFST+0,sp)
 735  00e9 a48f          	and	a,#143
 736  00eb 6b01          	ld	(OFST+0,sp),a
 737                     ; 278   tmpccmr2 |= (uint8_t)TIM2_OCMode;
 739  00ed 9e            	ld	a,xh
 740  00ee 1a01          	or	a,(OFST+0,sp)
 741  00f0 6b01          	ld	(OFST+0,sp),a
 742                     ; 280   TIM2->CCMR2 = tmpccmr2;
 744  00f2 7b01          	ld	a,(OFST+0,sp)
 745  00f4 c75259        	ld	21081,a
 746                     ; 283   if (TIM2_OutputState == TIM2_OutputState_Enable)
 748  00f7 9f            	ld	a,xl
 749  00f8 a101          	cp	a,#1
 750  00fa 2606          	jrne	L503
 751                     ; 285     TIM2->CCER1 |= TIM_CCER1_CC2E;
 753  00fc 7218525a      	bset	21082,#4
 755  0100 2004          	jra	L703
 756  0102               L503:
 757                     ; 289     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 759  0102 7219525a      	bres	21082,#4
 760  0106               L703:
 761                     ; 293   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 763  0106 7b08          	ld	a,(OFST+7,sp)
 764  0108 a101          	cp	a,#1
 765  010a 2606          	jrne	L113
 766                     ; 295     TIM2->CCER1 |= TIM_CCER1_CC2P;
 768  010c 721a525a      	bset	21082,#5
 770  0110 2004          	jra	L313
 771  0112               L113:
 772                     ; 299     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 774  0112 721b525a      	bres	21082,#5
 775  0116               L313:
 776                     ; 304   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 778  0116 7b09          	ld	a,(OFST+8,sp)
 779  0118 a101          	cp	a,#1
 780  011a 2606          	jrne	L513
 781                     ; 306     TIM2->OISR |= TIM_OISR_OIS2;
 783  011c 72145265      	bset	21093,#2
 785  0120 2004          	jra	L713
 786  0122               L513:
 787                     ; 310     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 789  0122 72155265      	bres	21093,#2
 790  0126               L713:
 791                     ; 314   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 793  0126 7b06          	ld	a,(OFST+5,sp)
 794  0128 c75262        	ld	21090,a
 795                     ; 315   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 797  012b 7b07          	ld	a,(OFST+6,sp)
 798  012d c75263        	ld	21091,a
 799                     ; 316 }
 802  0130 5b03          	addw	sp,#3
 803  0132 81            	ret
1001                     ; 344 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
1001                     ; 345                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
1001                     ; 346                     TIM2_BreakState_TypeDef TIM2_BreakState,
1001                     ; 347                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
1001                     ; 348                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
1001                     ; 349 
1001                     ; 350 {
1002                     	switch	.text
1003  0133               _TIM2_BKRConfig:
1005  0133 89            	pushw	x
1006       00000000      OFST:	set	0
1009                     ; 352   assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
1011                     ; 353   assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
1013                     ; 354   assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
1015                     ; 355   assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
1017                     ; 356   assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
1019                     ; 361   TIM2->BKR = (uint8_t)((uint8_t)TIM2_OSSIState | (uint8_t)TIM2_LockLevel | \
1019                     ; 362                         (uint8_t)TIM2_BreakState | (uint8_t)TIM2_BreakPolarity | \
1019                     ; 363                         (uint8_t)TIM2_AutomaticOutput);
1021  0134 9f            	ld	a,xl
1022  0135 1a01          	or	a,(OFST+1,sp)
1023  0137 1a05          	or	a,(OFST+5,sp)
1024  0139 1a06          	or	a,(OFST+6,sp)
1025  013b 1a07          	or	a,(OFST+7,sp)
1026  013d c75264        	ld	21092,a
1027                     ; 364 }
1030  0140 85            	popw	x
1031  0141 81            	ret
1215                     ; 390 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1215                     ; 391                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1215                     ; 392                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1215                     ; 393                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1215                     ; 394                  uint8_t TIM2_ICFilter)
1215                     ; 395 {
1216                     	switch	.text
1217  0142               _TIM2_ICInit:
1219  0142 89            	pushw	x
1220       00000000      OFST:	set	0
1223                     ; 397   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1225                     ; 399   if (TIM2_Channel == TIM2_Channel_1)
1227  0143 9e            	ld	a,xh
1228  0144 4d            	tnz	a
1229  0145 2614          	jrne	L735
1230                     ; 402     TI1_Config(TIM2_ICPolarity,
1230                     ; 403                TIM2_ICSelection,
1230                     ; 404                TIM2_ICFilter);
1232  0147 7b07          	ld	a,(OFST+7,sp)
1233  0149 88            	push	a
1234  014a 7b06          	ld	a,(OFST+6,sp)
1235  014c 97            	ld	xl,a
1236  014d 7b03          	ld	a,(OFST+3,sp)
1237  014f 95            	ld	xh,a
1238  0150 cd05e5        	call	L3_TI1_Config
1240  0153 84            	pop	a
1241                     ; 407     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1243  0154 7b06          	ld	a,(OFST+6,sp)
1244  0156 cd04dc        	call	_TIM2_SetIC1Prescaler
1247  0159 2012          	jra	L145
1248  015b               L735:
1249                     ; 412     TI2_Config(TIM2_ICPolarity,
1249                     ; 413                TIM2_ICSelection,
1249                     ; 414                TIM2_ICFilter);
1251  015b 7b07          	ld	a,(OFST+7,sp)
1252  015d 88            	push	a
1253  015e 7b06          	ld	a,(OFST+6,sp)
1254  0160 97            	ld	xl,a
1255  0161 7b03          	ld	a,(OFST+3,sp)
1256  0163 95            	ld	xh,a
1257  0164 cd0622        	call	L5_TI2_Config
1259  0167 84            	pop	a
1260                     ; 416     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1262  0168 7b06          	ld	a,(OFST+6,sp)
1263  016a cd04f6        	call	_TIM2_SetIC2Prescaler
1265  016d               L145:
1266                     ; 418 }
1269  016d 85            	popw	x
1270  016e 81            	ret
1366                     ; 444 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1366                     ; 445                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1366                     ; 446                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1366                     ; 447                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1366                     ; 448                      uint8_t TIM2_ICFilter)
1366                     ; 449 {
1367                     	switch	.text
1368  016f               _TIM2_PWMIConfig:
1370  016f 89            	pushw	x
1371  0170 89            	pushw	x
1372       00000002      OFST:	set	2
1375                     ; 450   uint8_t icpolarity = (uint8_t)TIM2_ICPolarity_Rising;
1377                     ; 451   uint8_t icselection = (uint8_t)TIM2_ICSelection_DirectTI;
1379                     ; 454   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1381                     ; 457   if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
1383  0171 9f            	ld	a,xl
1384  0172 4d            	tnz	a
1385  0173 2606          	jrne	L116
1386                     ; 459     icpolarity = (uint8_t)TIM2_ICPolarity_Falling;
1388  0175 a601          	ld	a,#1
1389  0177 6b01          	ld	(OFST-1,sp),a
1391  0179 2002          	jra	L316
1392  017b               L116:
1393                     ; 463     icpolarity = (uint8_t)TIM2_ICPolarity_Rising;
1395  017b 0f01          	clr	(OFST-1,sp)
1396  017d               L316:
1397                     ; 467   if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
1399  017d 7b07          	ld	a,(OFST+5,sp)
1400  017f a101          	cp	a,#1
1401  0181 2606          	jrne	L516
1402                     ; 469     icselection = (uint8_t)TIM2_ICSelection_IndirectTI;
1404  0183 a602          	ld	a,#2
1405  0185 6b02          	ld	(OFST+0,sp),a
1407  0187 2004          	jra	L716
1408  0189               L516:
1409                     ; 473     icselection = (uint8_t)TIM2_ICSelection_DirectTI;
1411  0189 a601          	ld	a,#1
1412  018b 6b02          	ld	(OFST+0,sp),a
1413  018d               L716:
1414                     ; 476   if (TIM2_Channel == TIM2_Channel_1)
1416  018d 0d03          	tnz	(OFST+1,sp)
1417  018f 2626          	jrne	L126
1418                     ; 479     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
1418                     ; 480                TIM2_ICFilter);
1420  0191 7b09          	ld	a,(OFST+7,sp)
1421  0193 88            	push	a
1422  0194 7b08          	ld	a,(OFST+6,sp)
1423  0196 97            	ld	xl,a
1424  0197 7b05          	ld	a,(OFST+3,sp)
1425  0199 95            	ld	xh,a
1426  019a cd05e5        	call	L3_TI1_Config
1428  019d 84            	pop	a
1429                     ; 483     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1431  019e 7b08          	ld	a,(OFST+6,sp)
1432  01a0 cd04dc        	call	_TIM2_SetIC1Prescaler
1434                     ; 486     TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1436  01a3 7b09          	ld	a,(OFST+7,sp)
1437  01a5 88            	push	a
1438  01a6 7b03          	ld	a,(OFST+1,sp)
1439  01a8 97            	ld	xl,a
1440  01a9 7b02          	ld	a,(OFST+0,sp)
1441  01ab 95            	ld	xh,a
1442  01ac cd0622        	call	L5_TI2_Config
1444  01af 84            	pop	a
1445                     ; 489     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1447  01b0 7b08          	ld	a,(OFST+6,sp)
1448  01b2 cd04f6        	call	_TIM2_SetIC2Prescaler
1451  01b5 2024          	jra	L326
1452  01b7               L126:
1453                     ; 494     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
1453                     ; 495                TIM2_ICFilter);
1455  01b7 7b09          	ld	a,(OFST+7,sp)
1456  01b9 88            	push	a
1457  01ba 7b08          	ld	a,(OFST+6,sp)
1458  01bc 97            	ld	xl,a
1459  01bd 7b05          	ld	a,(OFST+3,sp)
1460  01bf 95            	ld	xh,a
1461  01c0 cd0622        	call	L5_TI2_Config
1463  01c3 84            	pop	a
1464                     ; 498     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1466  01c4 7b08          	ld	a,(OFST+6,sp)
1467  01c6 cd04f6        	call	_TIM2_SetIC2Prescaler
1469                     ; 501     TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1471  01c9 7b09          	ld	a,(OFST+7,sp)
1472  01cb 88            	push	a
1473  01cc 7b03          	ld	a,(OFST+1,sp)
1474  01ce 97            	ld	xl,a
1475  01cf 7b02          	ld	a,(OFST+0,sp)
1476  01d1 95            	ld	xh,a
1477  01d2 cd05e5        	call	L3_TI1_Config
1479  01d5 84            	pop	a
1480                     ; 504     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1482  01d6 7b08          	ld	a,(OFST+6,sp)
1483  01d8 cd04dc        	call	_TIM2_SetIC1Prescaler
1485  01db               L326:
1486                     ; 506 }
1489  01db 5b04          	addw	sp,#4
1490  01dd 81            	ret
1545                     ; 514 void TIM2_Cmd(FunctionalState NewState)
1545                     ; 515 {
1546                     	switch	.text
1547  01de               _TIM2_Cmd:
1551                     ; 517   assert_param(IS_FUNCTIONAL_STATE(NewState));
1553                     ; 520   if (NewState != DISABLE)
1555  01de 4d            	tnz	a
1556  01df 2706          	jreq	L356
1557                     ; 522     TIM2->CR1 |= TIM_CR1_CEN;
1559  01e1 72105250      	bset	21072,#0
1561  01e5 2004          	jra	L556
1562  01e7               L356:
1563                     ; 526     TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1565  01e7 72115250      	bres	21072,#0
1566  01eb               L556:
1567                     ; 528 }
1570  01eb 81            	ret
1606                     ; 536 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
1606                     ; 537 {
1607                     	switch	.text
1608  01ec               _TIM2_CtrlPWMOutputs:
1612                     ; 539   assert_param(IS_FUNCTIONAL_STATE(NewState));
1614                     ; 543   if (NewState != DISABLE)
1616  01ec 4d            	tnz	a
1617  01ed 2706          	jreq	L576
1618                     ; 545     TIM2->BKR |= TIM_BKR_MOE ;
1620  01ef 721e5264      	bset	21092,#7
1622  01f3 2004          	jra	L776
1623  01f5               L576:
1624                     ; 549     TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1626  01f5 721f5264      	bres	21092,#7
1627  01f9               L776:
1628                     ; 551 }
1631  01f9 81            	ret
1717                     ; 566 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1717                     ; 567 {
1718                     	switch	.text
1719  01fa               _TIM2_ITConfig:
1721  01fa 89            	pushw	x
1722       00000000      OFST:	set	0
1725                     ; 569   assert_param(IS_TIM2_IT(TIM2_IT));
1727                     ; 570   assert_param(IS_FUNCTIONAL_STATE(NewState));
1729                     ; 572   if (NewState != DISABLE)
1731  01fb 9f            	ld	a,xl
1732  01fc 4d            	tnz	a
1733  01fd 2709          	jreq	L147
1734                     ; 575     TIM2->IER |= (uint8_t)TIM2_IT;
1736  01ff 9e            	ld	a,xh
1737  0200 ca5254        	or	a,21076
1738  0203 c75254        	ld	21076,a
1740  0206 2009          	jra	L347
1741  0208               L147:
1742                     ; 580     TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
1744  0208 7b01          	ld	a,(OFST+1,sp)
1745  020a 43            	cpl	a
1746  020b c45254        	and	a,21076
1747  020e c75254        	ld	21076,a
1748  0211               L347:
1749                     ; 582 }
1752  0211 85            	popw	x
1753  0212 81            	ret
1777                     ; 589 void TIM2_InternalClockConfig(void)
1777                     ; 590 {
1778                     	switch	.text
1779  0213               _TIM2_InternalClockConfig:
1783                     ; 592   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1785  0213 c65252        	ld	a,21074
1786  0216 a4f8          	and	a,#248
1787  0218 c75252        	ld	21074,a
1788                     ; 593 }
1791  021b 81            	ret
1908                     ; 611 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
1908                     ; 612                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
1908                     ; 613                               uint8_t TIM2_ExtTRGFilter)
1908                     ; 614 {
1909                     	switch	.text
1910  021c               _TIM2_ETRClockMode1Config:
1912  021c 89            	pushw	x
1913       00000000      OFST:	set	0
1916                     ; 616   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
1918  021d 7b05          	ld	a,(OFST+5,sp)
1919  021f 88            	push	a
1920  0220 9f            	ld	a,xl
1921  0221 97            	ld	xl,a
1922  0222 7b02          	ld	a,(OFST+2,sp)
1923  0224 95            	ld	xh,a
1924  0225 ad35          	call	_TIM2_ETRConfig
1926  0227 84            	pop	a
1927                     ; 619   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1929  0228 c65252        	ld	a,21074
1930  022b a4f8          	and	a,#248
1931  022d c75252        	ld	21074,a
1932                     ; 620   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
1934  0230 c65252        	ld	a,21074
1935  0233 aa07          	or	a,#7
1936  0235 c75252        	ld	21074,a
1937                     ; 623   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1939  0238 c65252        	ld	a,21074
1940  023b a48f          	and	a,#143
1941  023d c75252        	ld	21074,a
1942                     ; 624   TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
1944  0240 c65252        	ld	a,21074
1945  0243 aa70          	or	a,#112
1946  0245 c75252        	ld	21074,a
1947                     ; 625 }
1950  0248 85            	popw	x
1951  0249 81            	ret
2009                     ; 634 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2009                     ; 635                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2009                     ; 636                               uint8_t TIM2_ExtTRGFilter)
2009                     ; 637 {
2010                     	switch	.text
2011  024a               _TIM2_ETRClockMode2Config:
2013  024a 89            	pushw	x
2014       00000000      OFST:	set	0
2017                     ; 639   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
2019  024b 7b05          	ld	a,(OFST+5,sp)
2020  024d 88            	push	a
2021  024e 9f            	ld	a,xl
2022  024f 97            	ld	xl,a
2023  0250 7b02          	ld	a,(OFST+2,sp)
2024  0252 95            	ld	xh,a
2025  0253 ad07          	call	_TIM2_ETRConfig
2027  0255 84            	pop	a
2028                     ; 642   TIM2->ETR |= TIM_ETR_ECE ;
2030  0256 721c5253      	bset	21075,#6
2031                     ; 643 }
2034  025a 85            	popw	x
2035  025b 81            	ret
2091                     ; 660 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2091                     ; 661                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2091                     ; 662                     uint8_t TIM2_ExtTRGFilter)
2091                     ; 663 {
2092                     	switch	.text
2093  025c               _TIM2_ETRConfig:
2095  025c 89            	pushw	x
2096       00000000      OFST:	set	0
2099                     ; 665   assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
2101                     ; 666   assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
2103                     ; 667   assert_param(IS_TIM2_EXT_FILTER(TIM2_ExtTRGFilter));
2105                     ; 669   TIM2->ETR |= (uint8_t)((uint8_t)TIM2_ExtTRGPrescaler | (uint8_t)TIM2_ExtTRGPolarity | (uint8_t)TIM2_ExtTRGFilter);
2107  025d 9f            	ld	a,xl
2108  025e 1a01          	or	a,(OFST+1,sp)
2109  0260 1a05          	or	a,(OFST+5,sp)
2110  0262 ca5253        	or	a,21075
2111  0265 c75253        	ld	21075,a
2112                     ; 670 }
2115  0268 85            	popw	x
2116  0269 81            	ret
2205                     ; 687 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
2205                     ; 688                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2205                     ; 689                                  uint8_t TIM2_ICFilter)
2205                     ; 690 {
2206                     	switch	.text
2207  026a               _TIM2_TIxExternalClockConfig:
2209  026a 89            	pushw	x
2210       00000000      OFST:	set	0
2213                     ; 692   assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
2215                     ; 693   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
2217                     ; 694   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
2219                     ; 697   if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
2221  026b 9e            	ld	a,xh
2222  026c a160          	cp	a,#96
2223  026e 260f          	jrne	L3411
2224                     ; 699     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2226  0270 7b05          	ld	a,(OFST+5,sp)
2227  0272 88            	push	a
2228  0273 ae0001        	ldw	x,#1
2229  0276 7b03          	ld	a,(OFST+3,sp)
2230  0278 95            	ld	xh,a
2231  0279 cd0622        	call	L5_TI2_Config
2233  027c 84            	pop	a
2235  027d 200d          	jra	L5411
2236  027f               L3411:
2237                     ; 703     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2239  027f 7b05          	ld	a,(OFST+5,sp)
2240  0281 88            	push	a
2241  0282 ae0001        	ldw	x,#1
2242  0285 7b03          	ld	a,(OFST+3,sp)
2243  0287 95            	ld	xh,a
2244  0288 cd05e5        	call	L3_TI1_Config
2246  028b 84            	pop	a
2247  028c               L5411:
2248                     ; 707   TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
2250  028c 7b01          	ld	a,(OFST+1,sp)
2251  028e ad0a          	call	_TIM2_SelectInputTrigger
2253                     ; 710   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
2255  0290 c65252        	ld	a,21074
2256  0293 aa07          	or	a,#7
2257  0295 c75252        	ld	21074,a
2258                     ; 711 }
2261  0298 85            	popw	x
2262  0299 81            	ret
2362                     ; 727 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
2362                     ; 728 {
2363                     	switch	.text
2364  029a               _TIM2_SelectInputTrigger:
2366  029a 88            	push	a
2367  029b 88            	push	a
2368       00000001      OFST:	set	1
2371                     ; 729   uint8_t tmpsmcr = 0;
2373                     ; 732   assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
2375                     ; 734   tmpsmcr = TIM2->SMCR;
2377  029c c65252        	ld	a,21074
2378  029f 6b01          	ld	(OFST+0,sp),a
2379                     ; 737   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2381  02a1 7b01          	ld	a,(OFST+0,sp)
2382  02a3 a48f          	and	a,#143
2383  02a5 6b01          	ld	(OFST+0,sp),a
2384                     ; 738   tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
2386  02a7 7b01          	ld	a,(OFST+0,sp)
2387  02a9 1a02          	or	a,(OFST+1,sp)
2388  02ab 6b01          	ld	(OFST+0,sp),a
2389                     ; 740   TIM2->SMCR = (uint8_t)tmpsmcr;
2391  02ad 7b01          	ld	a,(OFST+0,sp)
2392  02af c75252        	ld	21074,a
2393                     ; 741 }
2396  02b2 85            	popw	x
2397  02b3 81            	ret
2433                     ; 749 void TIM2_UpdateDisableConfig(FunctionalState NewState)
2433                     ; 750 {
2434                     	switch	.text
2435  02b4               _TIM2_UpdateDisableConfig:
2439                     ; 752   assert_param(IS_FUNCTIONAL_STATE(NewState));
2441                     ; 755   if (NewState != DISABLE)
2443  02b4 4d            	tnz	a
2444  02b5 2706          	jreq	L7221
2445                     ; 757     TIM2->CR1 |= TIM_CR1_UDIS;
2447  02b7 72125250      	bset	21072,#1
2449  02bb 2004          	jra	L1321
2450  02bd               L7221:
2451                     ; 761     TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2453  02bd 72135250      	bres	21072,#1
2454  02c1               L1321:
2455                     ; 763 }
2458  02c1 81            	ret
2516                     ; 773 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2516                     ; 774 {
2517                     	switch	.text
2518  02c2               _TIM2_UpdateRequestConfig:
2522                     ; 776   assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
2524                     ; 779   if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
2526  02c2 a101          	cp	a,#1
2527  02c4 2606          	jrne	L1621
2528                     ; 781     TIM2->CR1 |= TIM_CR1_URS ;
2530  02c6 72145250      	bset	21072,#2
2532  02ca 2004          	jra	L3621
2533  02cc               L1621:
2534                     ; 785     TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
2536  02cc 72155250      	bres	21072,#2
2537  02d0               L3621:
2538                     ; 787 }
2541  02d0 81            	ret
2577                     ; 795 void TIM2_SelectHallSensor(FunctionalState NewState)
2577                     ; 796 {
2578                     	switch	.text
2579  02d1               _TIM2_SelectHallSensor:
2583                     ; 798   assert_param(IS_FUNCTIONAL_STATE(NewState));
2585                     ; 801   if (NewState != DISABLE)
2587  02d1 4d            	tnz	a
2588  02d2 2706          	jreq	L3031
2589                     ; 803     TIM2->CR2 |= TIM_CR2_TI1S;
2591  02d4 721e5251      	bset	21073,#7
2593  02d8 2004          	jra	L5031
2594  02da               L3031:
2595                     ; 807     TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2597  02da 721f5251      	bres	21073,#7
2598  02de               L5031:
2599                     ; 809 }
2602  02de 81            	ret
2659                     ; 819 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2659                     ; 820 {
2660                     	switch	.text
2661  02df               _TIM2_SelectOnePulseMode:
2665                     ; 822   assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
2667                     ; 825   if (TIM2_OPMode == TIM2_OPMode_Single)
2669  02df a101          	cp	a,#1
2670  02e1 2606          	jrne	L5331
2671                     ; 827     TIM2->CR1 |= TIM_CR1_OPM ;
2673  02e3 72165250      	bset	21072,#3
2675  02e7 2004          	jra	L7331
2676  02e9               L5331:
2677                     ; 831     TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2679  02e9 72175250      	bres	21072,#3
2680  02ed               L7331:
2681                     ; 833 }
2684  02ed 81            	ret
2783                     ; 847 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
2783                     ; 848 {
2784                     	switch	.text
2785  02ee               _TIM2_SelectOutputTrigger:
2787  02ee 88            	push	a
2788  02ef 88            	push	a
2789       00000001      OFST:	set	1
2792                     ; 849   uint8_t tmpcr2 = 0;
2794                     ; 852   assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
2796                     ; 854   tmpcr2 = TIM2->CR2;
2798  02f0 c65251        	ld	a,21073
2799  02f3 6b01          	ld	(OFST+0,sp),a
2800                     ; 857   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2802  02f5 7b01          	ld	a,(OFST+0,sp)
2803  02f7 a48f          	and	a,#143
2804  02f9 6b01          	ld	(OFST+0,sp),a
2805                     ; 860   tmpcr2 |= (uint8_t)TIM2_TRGOSource;
2807  02fb 7b01          	ld	a,(OFST+0,sp)
2808  02fd 1a02          	or	a,(OFST+1,sp)
2809  02ff 6b01          	ld	(OFST+0,sp),a
2810                     ; 862   TIM2->CR2 = tmpcr2;
2812  0301 7b01          	ld	a,(OFST+0,sp)
2813  0303 c75251        	ld	21073,a
2814                     ; 863 }
2817  0306 85            	popw	x
2818  0307 81            	ret
2901                     ; 875 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
2901                     ; 876 {
2902                     	switch	.text
2903  0308               _TIM2_SelectSlaveMode:
2905  0308 88            	push	a
2906  0309 88            	push	a
2907       00000001      OFST:	set	1
2910                     ; 877   uint8_t tmpsmcr = 0;
2912                     ; 880   assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
2914                     ; 882   tmpsmcr = TIM2->SMCR;
2916  030a c65252        	ld	a,21074
2917  030d 6b01          	ld	(OFST+0,sp),a
2918                     ; 885   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2920  030f 7b01          	ld	a,(OFST+0,sp)
2921  0311 a4f8          	and	a,#248
2922  0313 6b01          	ld	(OFST+0,sp),a
2923                     ; 888   tmpsmcr |= (uint8_t)TIM2_SlaveMode;
2925  0315 7b01          	ld	a,(OFST+0,sp)
2926  0317 1a02          	or	a,(OFST+1,sp)
2927  0319 6b01          	ld	(OFST+0,sp),a
2928                     ; 890   TIM2->SMCR = tmpsmcr;
2930  031b 7b01          	ld	a,(OFST+0,sp)
2931  031d c75252        	ld	21074,a
2932                     ; 891 }
2935  0320 85            	popw	x
2936  0321 81            	ret
2972                     ; 899 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
2972                     ; 900 {
2973                     	switch	.text
2974  0322               _TIM2_SelectMasterSlaveMode:
2978                     ; 902   assert_param(IS_FUNCTIONAL_STATE(NewState));
2980                     ; 905   if (NewState != DISABLE)
2982  0322 4d            	tnz	a
2983  0323 2706          	jreq	L7541
2984                     ; 907     TIM2->SMCR |= TIM_SMCR_MSM;
2986  0325 721e5252      	bset	21074,#7
2988  0329 2004          	jra	L1641
2989  032b               L7541:
2990                     ; 911     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
2992  032b 721f5252      	bres	21074,#7
2993  032f               L1641:
2994                     ; 913 }
2997  032f 81            	ret
3110                     ; 932 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
3110                     ; 933                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
3110                     ; 934                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
3110                     ; 935 {
3111                     	switch	.text
3112  0330               _TIM2_EncoderInterfaceConfig:
3114  0330 89            	pushw	x
3115  0331 5203          	subw	sp,#3
3116       00000003      OFST:	set	3
3119                     ; 936   uint8_t tmpsmcr = 0;
3121                     ; 937   uint8_t tmpccmr1 = 0;
3123                     ; 938   uint8_t tmpccmr2 = 0;
3125                     ; 941   assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
3127                     ; 942   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
3129                     ; 943   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
3131                     ; 945   tmpsmcr = TIM2->SMCR;
3133  0333 c65252        	ld	a,21074
3134  0336 6b01          	ld	(OFST-2,sp),a
3135                     ; 946   tmpccmr1 = TIM2->CCMR1;
3137  0338 c65258        	ld	a,21080
3138  033b 6b02          	ld	(OFST-1,sp),a
3139                     ; 947   tmpccmr2 = TIM2->CCMR2;
3141  033d c65259        	ld	a,21081
3142  0340 6b03          	ld	(OFST+0,sp),a
3143                     ; 950   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3145  0342 7b01          	ld	a,(OFST-2,sp)
3146  0344 a4f0          	and	a,#240
3147  0346 6b01          	ld	(OFST-2,sp),a
3148                     ; 951   tmpsmcr |= (uint8_t)TIM2_EncoderMode;
3150  0348 9e            	ld	a,xh
3151  0349 1a01          	or	a,(OFST-2,sp)
3152  034b 6b01          	ld	(OFST-2,sp),a
3153                     ; 954   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3155  034d 7b02          	ld	a,(OFST-1,sp)
3156  034f a4fc          	and	a,#252
3157  0351 6b02          	ld	(OFST-1,sp),a
3158                     ; 955   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3160  0353 7b03          	ld	a,(OFST+0,sp)
3161  0355 a4fc          	and	a,#252
3162  0357 6b03          	ld	(OFST+0,sp),a
3163                     ; 956   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3165  0359 7b02          	ld	a,(OFST-1,sp)
3166  035b aa01          	or	a,#1
3167  035d 6b02          	ld	(OFST-1,sp),a
3168                     ; 957   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3170  035f 7b03          	ld	a,(OFST+0,sp)
3171  0361 aa01          	or	a,#1
3172  0363 6b03          	ld	(OFST+0,sp),a
3173                     ; 960   if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
3175  0365 9f            	ld	a,xl
3176  0366 a101          	cp	a,#1
3177  0368 2606          	jrne	L7351
3178                     ; 962     TIM2->CCER1 |= TIM_CCER1_CC1P ;
3180  036a 7212525a      	bset	21082,#1
3182  036e 2004          	jra	L1451
3183  0370               L7351:
3184                     ; 966     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3186  0370 7213525a      	bres	21082,#1
3187  0374               L1451:
3188                     ; 969   if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
3190  0374 7b08          	ld	a,(OFST+5,sp)
3191  0376 a101          	cp	a,#1
3192  0378 2606          	jrne	L3451
3193                     ; 971     TIM2->CCER1 |= TIM_CCER1_CC2P ;
3195  037a 721a525a      	bset	21082,#5
3197  037e 2004          	jra	L5451
3198  0380               L3451:
3199                     ; 975     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3201  0380 721b525a      	bres	21082,#5
3202  0384               L5451:
3203                     ; 978   TIM2->SMCR = tmpsmcr;
3205  0384 7b01          	ld	a,(OFST-2,sp)
3206  0386 c75252        	ld	21074,a
3207                     ; 979   TIM2->CCMR1 = tmpccmr1;
3209  0389 7b02          	ld	a,(OFST-1,sp)
3210  038b c75258        	ld	21080,a
3211                     ; 980   TIM2->CCMR2 = tmpccmr2;
3213  038e 7b03          	ld	a,(OFST+0,sp)
3214  0390 c75259        	ld	21081,a
3215                     ; 981 }
3218  0393 5b05          	addw	sp,#5
3219  0395 81            	ret
3287                     ; 1001 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef TIM2_Prescaler,
3287                     ; 1002                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
3287                     ; 1003 {
3288                     	switch	.text
3289  0396               _TIM2_PrescalerConfig:
3293                     ; 1005   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
3295                     ; 1006   assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
3297                     ; 1009   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
3299  0396 9e            	ld	a,xh
3300  0397 c7525d        	ld	21085,a
3301                     ; 1012   if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
3303  039a 9f            	ld	a,xl
3304  039b a101          	cp	a,#1
3305  039d 2606          	jrne	L1061
3306                     ; 1014     TIM2->EGR |= TIM_EGR_UG ;
3308  039f 72105257      	bset	21079,#0
3310  03a3 2004          	jra	L3061
3311  03a5               L1061:
3312                     ; 1018     TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3314  03a5 72115257      	bres	21079,#0
3315  03a9               L3061:
3316                     ; 1020 }
3319  03a9 81            	ret
3364                     ; 1033 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
3364                     ; 1034 {
3365                     	switch	.text
3366  03aa               _TIM2_CounterModeConfig:
3368  03aa 88            	push	a
3369  03ab 88            	push	a
3370       00000001      OFST:	set	1
3373                     ; 1035   uint8_t tmpcr1 = 0;
3375                     ; 1038   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
3377                     ; 1040   tmpcr1 = TIM2->CR1;
3379  03ac c65250        	ld	a,21072
3380  03af 6b01          	ld	(OFST+0,sp),a
3381                     ; 1043   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3383  03b1 7b01          	ld	a,(OFST+0,sp)
3384  03b3 a48f          	and	a,#143
3385  03b5 6b01          	ld	(OFST+0,sp),a
3386                     ; 1046   tmpcr1 |= (uint8_t)TIM2_CounterMode;
3388  03b7 7b01          	ld	a,(OFST+0,sp)
3389  03b9 1a02          	or	a,(OFST+1,sp)
3390  03bb 6b01          	ld	(OFST+0,sp),a
3391                     ; 1048   TIM2->CR1 = tmpcr1;
3393  03bd 7b01          	ld	a,(OFST+0,sp)
3394  03bf c75250        	ld	21072,a
3395                     ; 1049 }
3398  03c2 85            	popw	x
3399  03c3 81            	ret
3466                     ; 1059 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3466                     ; 1060 {
3467                     	switch	.text
3468  03c4               _TIM2_ForcedOC1Config:
3470  03c4 88            	push	a
3471  03c5 88            	push	a
3472       00000001      OFST:	set	1
3475                     ; 1061   uint8_t tmpccmr1 = 0;
3477                     ; 1064   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3479                     ; 1066   tmpccmr1 = TIM2->CCMR1;
3481  03c6 c65258        	ld	a,21080
3482  03c9 6b01          	ld	(OFST+0,sp),a
3483                     ; 1069   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3485  03cb 7b01          	ld	a,(OFST+0,sp)
3486  03cd a48f          	and	a,#143
3487  03cf 6b01          	ld	(OFST+0,sp),a
3488                     ; 1072   tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
3490  03d1 7b01          	ld	a,(OFST+0,sp)
3491  03d3 1a02          	or	a,(OFST+1,sp)
3492  03d5 6b01          	ld	(OFST+0,sp),a
3493                     ; 1074   TIM2->CCMR1 = tmpccmr1;
3495  03d7 7b01          	ld	a,(OFST+0,sp)
3496  03d9 c75258        	ld	21080,a
3497                     ; 1075 }
3500  03dc 85            	popw	x
3501  03dd 81            	ret
3546                     ; 1085 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3546                     ; 1086 {
3547                     	switch	.text
3548  03de               _TIM2_ForcedOC2Config:
3550  03de 88            	push	a
3551  03df 88            	push	a
3552       00000001      OFST:	set	1
3555                     ; 1087   uint8_t tmpccmr2 = 0;
3557                     ; 1090   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3559                     ; 1092   tmpccmr2 = TIM2->CCMR2;
3561  03e0 c65259        	ld	a,21081
3562  03e3 6b01          	ld	(OFST+0,sp),a
3563                     ; 1095   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3565  03e5 7b01          	ld	a,(OFST+0,sp)
3566  03e7 a48f          	and	a,#143
3567  03e9 6b01          	ld	(OFST+0,sp),a
3568                     ; 1098   tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
3570  03eb 7b01          	ld	a,(OFST+0,sp)
3571  03ed 1a02          	or	a,(OFST+1,sp)
3572  03ef 6b01          	ld	(OFST+0,sp),a
3573                     ; 1100   TIM2->CCMR2 = tmpccmr2;
3575  03f1 7b01          	ld	a,(OFST+0,sp)
3576  03f3 c75259        	ld	21081,a
3577                     ; 1101 }
3580  03f6 85            	popw	x
3581  03f7 81            	ret
3617                     ; 1109 void TIM2_ARRPreloadConfig(FunctionalState NewState)
3617                     ; 1110 {
3618                     	switch	.text
3619  03f8               _TIM2_ARRPreloadConfig:
3623                     ; 1112   assert_param(IS_FUNCTIONAL_STATE(NewState));
3625                     ; 1115   if (NewState != DISABLE)
3627  03f8 4d            	tnz	a
3628  03f9 2706          	jreq	L1271
3629                     ; 1117     TIM2->CR1 |= TIM_CR1_ARPE;
3631  03fb 721e5250      	bset	21072,#7
3633  03ff 2004          	jra	L3271
3634  0401               L1271:
3635                     ; 1121     TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3637  0401 721f5250      	bres	21072,#7
3638  0405               L3271:
3639                     ; 1123 }
3642  0405 81            	ret
3678                     ; 1131 void TIM2_OC1PreloadConfig(FunctionalState NewState)
3678                     ; 1132 {
3679                     	switch	.text
3680  0406               _TIM2_OC1PreloadConfig:
3684                     ; 1134   assert_param(IS_FUNCTIONAL_STATE(NewState));
3686                     ; 1137   if (NewState != DISABLE)
3688  0406 4d            	tnz	a
3689  0407 2706          	jreq	L3471
3690                     ; 1139     TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
3692  0409 72165258      	bset	21080,#3
3694  040d 2004          	jra	L5471
3695  040f               L3471:
3696                     ; 1143     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3698  040f 72175258      	bres	21080,#3
3699  0413               L5471:
3700                     ; 1145 }
3703  0413 81            	ret
3739                     ; 1153 void TIM2_OC2PreloadConfig(FunctionalState NewState)
3739                     ; 1154 {
3740                     	switch	.text
3741  0414               _TIM2_OC2PreloadConfig:
3745                     ; 1156   assert_param(IS_FUNCTIONAL_STATE(NewState));
3747                     ; 1159   if (NewState != DISABLE)
3749  0414 4d            	tnz	a
3750  0415 2706          	jreq	L5671
3751                     ; 1161     TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
3753  0417 72165259      	bset	21081,#3
3755  041b 2004          	jra	L7671
3756  041d               L5671:
3757                     ; 1165     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3759  041d 72175259      	bres	21081,#3
3760  0421               L7671:
3761                     ; 1167 }
3764  0421 81            	ret
3799                     ; 1174 void TIM2_OC1FastCmd(FunctionalState NewState)
3799                     ; 1175 {
3800                     	switch	.text
3801  0422               _TIM2_OC1FastCmd:
3805                     ; 1177   assert_param(IS_FUNCTIONAL_STATE(NewState));
3807                     ; 1180   if (NewState != DISABLE)
3809  0422 4d            	tnz	a
3810  0423 2706          	jreq	L7002
3811                     ; 1182     TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
3813  0425 72145258      	bset	21080,#2
3815  0429 2004          	jra	L1102
3816  042b               L7002:
3817                     ; 1186     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3819  042b 72155258      	bres	21080,#2
3820  042f               L1102:
3821                     ; 1188 }
3824  042f 81            	ret
3859                     ; 1195 void TIM2_OC2FastCmd(FunctionalState NewState)
3859                     ; 1196 {
3860                     	switch	.text
3861  0430               _TIM2_OC2FastCmd:
3865                     ; 1198   assert_param(IS_FUNCTIONAL_STATE(NewState));
3867                     ; 1201   if (NewState != DISABLE)
3869  0430 4d            	tnz	a
3870  0431 2706          	jreq	L1302
3871                     ; 1203     TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
3873  0433 72145259      	bset	21081,#2
3875  0437 2004          	jra	L3302
3876  0439               L1302:
3877                     ; 1207     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3879  0439 72155259      	bres	21081,#2
3880  043d               L3302:
3881                     ; 1209 }
3884  043d 81            	ret
3965                     ; 1222 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
3965                     ; 1223 {
3966                     	switch	.text
3967  043e               _TIM2_GenerateEvent:
3971                     ; 1225   assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
3973                     ; 1228   TIM2->EGR |= (uint8_t)TIM2_EventSource;
3975  043e ca5257        	or	a,21079
3976  0441 c75257        	ld	21079,a
3977                     ; 1229 }
3980  0444 81            	ret
4016                     ; 1239 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4016                     ; 1240 {
4017                     	switch	.text
4018  0445               _TIM2_OC1PolarityConfig:
4022                     ; 1242   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4024                     ; 1245   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4026  0445 a101          	cp	a,#1
4027  0447 2606          	jrne	L7012
4028                     ; 1247     TIM2->CCER1 |= TIM_CCER1_CC1P ;
4030  0449 7212525a      	bset	21082,#1
4032  044d 2004          	jra	L1112
4033  044f               L7012:
4034                     ; 1251     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
4036  044f 7213525a      	bres	21082,#1
4037  0453               L1112:
4038                     ; 1253 }
4041  0453 81            	ret
4077                     ; 1263 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4077                     ; 1264 {
4078                     	switch	.text
4079  0454               _TIM2_OC2PolarityConfig:
4083                     ; 1266   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4085                     ; 1269   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4087  0454 a101          	cp	a,#1
4088  0456 2606          	jrne	L1312
4089                     ; 1271     TIM2->CCER1 |= TIM_CCER1_CC2P ;
4091  0458 721a525a      	bset	21082,#5
4093  045c 2004          	jra	L3312
4094  045e               L1312:
4095                     ; 1275     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4097  045e 721b525a      	bres	21082,#5
4098  0462               L3312:
4099                     ; 1277 }
4102  0462 81            	ret
4147                     ; 1289 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
4147                     ; 1290                  FunctionalState NewState)
4147                     ; 1291 {
4148                     	switch	.text
4149  0463               _TIM2_CCxCmd:
4151  0463 89            	pushw	x
4152       00000000      OFST:	set	0
4155                     ; 1293   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4157                     ; 1294   assert_param(IS_FUNCTIONAL_STATE(NewState));
4159                     ; 1296   if (TIM2_Channel == TIM2_Channel_1)
4161  0464 9e            	ld	a,xh
4162  0465 4d            	tnz	a
4163  0466 2610          	jrne	L7512
4164                     ; 1299     if (NewState != DISABLE)
4166  0468 9f            	ld	a,xl
4167  0469 4d            	tnz	a
4168  046a 2706          	jreq	L1612
4169                     ; 1301       TIM2->CCER1 |= TIM_CCER1_CC1E ;
4171  046c 7210525a      	bset	21082,#0
4173  0470 2014          	jra	L5612
4174  0472               L1612:
4175                     ; 1305       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4177  0472 7211525a      	bres	21082,#0
4178  0476 200e          	jra	L5612
4179  0478               L7512:
4180                     ; 1312     if (NewState != DISABLE)
4182  0478 0d02          	tnz	(OFST+2,sp)
4183  047a 2706          	jreq	L7612
4184                     ; 1314       TIM2->CCER1 |= TIM_CCER1_CC2E;
4186  047c 7218525a      	bset	21082,#4
4188  0480 2004          	jra	L5612
4189  0482               L7612:
4190                     ; 1318       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4192  0482 7219525a      	bres	21082,#4
4193  0486               L5612:
4194                     ; 1322 }
4197  0486 85            	popw	x
4198  0487 81            	ret
4243                     ; 1342 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
4243                     ; 1343                      TIM2_OCMode_TypeDef TIM2_OCMode)
4243                     ; 1344 {
4244                     	switch	.text
4245  0488               _TIM2_SelectOCxM:
4247  0488 89            	pushw	x
4248       00000000      OFST:	set	0
4251                     ; 1346   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4253                     ; 1347   assert_param(IS_TIM2_OCM(TIM2_OCMode));
4255                     ; 1349   if (TIM2_Channel == TIM2_Channel_1)
4257  0489 9e            	ld	a,xh
4258  048a 4d            	tnz	a
4259  048b 2615          	jrne	L5122
4260                     ; 1352     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4262  048d 7211525a      	bres	21082,#0
4263                     ; 1355     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4265  0491 c65258        	ld	a,21080
4266  0494 a48f          	and	a,#143
4267  0496 c75258        	ld	21080,a
4268                     ; 1358     TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
4270  0499 9f            	ld	a,xl
4271  049a ca5258        	or	a,21080
4272  049d c75258        	ld	21080,a
4274  04a0 2014          	jra	L7122
4275  04a2               L5122:
4276                     ; 1363     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4278  04a2 7219525a      	bres	21082,#4
4279                     ; 1366     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4281  04a6 c65259        	ld	a,21081
4282  04a9 a48f          	and	a,#143
4283  04ab c75259        	ld	21081,a
4284                     ; 1369     TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
4286  04ae c65259        	ld	a,21081
4287  04b1 1a02          	or	a,(OFST+2,sp)
4288  04b3 c75259        	ld	21081,a
4289  04b6               L7122:
4290                     ; 1371 }
4293  04b6 85            	popw	x
4294  04b7 81            	ret
4328                     ; 1379 void TIM2_SetCounter(uint16_t TIM2_Counter)
4328                     ; 1380 {
4329                     	switch	.text
4330  04b8               _TIM2_SetCounter:
4334                     ; 1383   TIM2->CNTRH = (uint8_t)(TIM2_Counter >> 8);
4336  04b8 9e            	ld	a,xh
4337  04b9 c7525b        	ld	21083,a
4338                     ; 1384   TIM2->CNTRL = (uint8_t)(TIM2_Counter);
4340  04bc 9f            	ld	a,xl
4341  04bd c7525c        	ld	21084,a
4342                     ; 1385 }
4345  04c0 81            	ret
4379                     ; 1393 void TIM2_SetAutoreload(uint16_t TIM2_Autoreload)
4379                     ; 1394 {
4380                     	switch	.text
4381  04c1               _TIM2_SetAutoreload:
4385                     ; 1396   TIM2->ARRH = (uint8_t)(TIM2_Autoreload >> 8);
4387  04c1 9e            	ld	a,xh
4388  04c2 c7525e        	ld	21086,a
4389                     ; 1397   TIM2->ARRL = (uint8_t)(TIM2_Autoreload);
4391  04c5 9f            	ld	a,xl
4392  04c6 c7525f        	ld	21087,a
4393                     ; 1398 }
4396  04c9 81            	ret
4430                     ; 1406 void TIM2_SetCompare1(uint16_t TIM2_Compare)
4430                     ; 1407 {
4431                     	switch	.text
4432  04ca               _TIM2_SetCompare1:
4436                     ; 1409   TIM2->CCR1H = (uint8_t)(TIM2_Compare >> 8);
4438  04ca 9e            	ld	a,xh
4439  04cb c75260        	ld	21088,a
4440                     ; 1410   TIM2->CCR1L = (uint8_t)(TIM2_Compare);
4442  04ce 9f            	ld	a,xl
4443  04cf c75261        	ld	21089,a
4444                     ; 1411 }
4447  04d2 81            	ret
4481                     ; 1419 void TIM2_SetCompare2(uint16_t TIM2_Compare)
4481                     ; 1420 {
4482                     	switch	.text
4483  04d3               _TIM2_SetCompare2:
4487                     ; 1422   TIM2->CCR2H = (uint8_t)(TIM2_Compare >> 8);
4489  04d3 9e            	ld	a,xh
4490  04d4 c75262        	ld	21090,a
4491                     ; 1423   TIM2->CCR2L = (uint8_t)(TIM2_Compare);
4493  04d7 9f            	ld	a,xl
4494  04d8 c75263        	ld	21091,a
4495                     ; 1424 }
4498  04db 81            	ret
4543                     ; 1436 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
4543                     ; 1437 {
4544                     	switch	.text
4545  04dc               _TIM2_SetIC1Prescaler:
4547  04dc 88            	push	a
4548  04dd 88            	push	a
4549       00000001      OFST:	set	1
4552                     ; 1438   uint8_t tmpccmr1 = 0;
4554                     ; 1441   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
4556                     ; 1443   tmpccmr1 = TIM2->CCMR1;
4558  04de c65258        	ld	a,21080
4559  04e1 6b01          	ld	(OFST+0,sp),a
4560                     ; 1446   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4562  04e3 7b01          	ld	a,(OFST+0,sp)
4563  04e5 a4f3          	and	a,#243
4564  04e7 6b01          	ld	(OFST+0,sp),a
4565                     ; 1449   tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
4567  04e9 7b01          	ld	a,(OFST+0,sp)
4568  04eb 1a02          	or	a,(OFST+1,sp)
4569  04ed 6b01          	ld	(OFST+0,sp),a
4570                     ; 1451   TIM2->CCMR1 = tmpccmr1;
4572  04ef 7b01          	ld	a,(OFST+0,sp)
4573  04f1 c75258        	ld	21080,a
4574                     ; 1452 }
4577  04f4 85            	popw	x
4578  04f5 81            	ret
4623                     ; 1464 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
4623                     ; 1465 {
4624                     	switch	.text
4625  04f6               _TIM2_SetIC2Prescaler:
4627  04f6 88            	push	a
4628  04f7 88            	push	a
4629       00000001      OFST:	set	1
4632                     ; 1466   uint8_t tmpccmr2 = 0;
4634                     ; 1469   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
4636                     ; 1471   tmpccmr2 = TIM2->CCMR2;
4638  04f8 c65259        	ld	a,21081
4639  04fb 6b01          	ld	(OFST+0,sp),a
4640                     ; 1474   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4642  04fd 7b01          	ld	a,(OFST+0,sp)
4643  04ff a4f3          	and	a,#243
4644  0501 6b01          	ld	(OFST+0,sp),a
4645                     ; 1477   tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
4647  0503 7b01          	ld	a,(OFST+0,sp)
4648  0505 1a02          	or	a,(OFST+1,sp)
4649  0507 6b01          	ld	(OFST+0,sp),a
4650                     ; 1479   TIM2->CCMR2 = tmpccmr2;
4652  0509 7b01          	ld	a,(OFST+0,sp)
4653  050b c75259        	ld	21081,a
4654                     ; 1480 }
4657  050e 85            	popw	x
4658  050f 81            	ret
4710                     ; 1487 uint16_t TIM2_GetCapture1(void)
4710                     ; 1488 {
4711                     	switch	.text
4712  0510               _TIM2_GetCapture1:
4714  0510 5204          	subw	sp,#4
4715       00000004      OFST:	set	4
4718                     ; 1489   uint16_t tmpccr1 = 0;
4720                     ; 1492   tmpccr1h = TIM2->CCR1H;
4722  0512 c65260        	ld	a,21088
4723  0515 6b02          	ld	(OFST-2,sp),a
4724                     ; 1493   tmpccr1l = TIM2->CCR1L;
4726  0517 c65261        	ld	a,21089
4727  051a 6b01          	ld	(OFST-3,sp),a
4728                     ; 1495   tmpccr1 = (uint16_t)(tmpccr1l);
4730  051c 7b01          	ld	a,(OFST-3,sp)
4731  051e 5f            	clrw	x
4732  051f 97            	ld	xl,a
4733  0520 1f03          	ldw	(OFST-1,sp),x
4734                     ; 1496   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4736  0522 7b02          	ld	a,(OFST-2,sp)
4737  0524 5f            	clrw	x
4738  0525 97            	ld	xl,a
4739  0526 4f            	clr	a
4740  0527 02            	rlwa	x,a
4741  0528 01            	rrwa	x,a
4742  0529 1a04          	or	a,(OFST+0,sp)
4743  052b 01            	rrwa	x,a
4744  052c 1a03          	or	a,(OFST-1,sp)
4745  052e 01            	rrwa	x,a
4746  052f 1f03          	ldw	(OFST-1,sp),x
4747                     ; 1498   return ((uint16_t)tmpccr1);
4749  0531 1e03          	ldw	x,(OFST-1,sp)
4752  0533 5b04          	addw	sp,#4
4753  0535 81            	ret
4805                     ; 1506 uint16_t TIM2_GetCapture2(void)
4805                     ; 1507 {
4806                     	switch	.text
4807  0536               _TIM2_GetCapture2:
4809  0536 5204          	subw	sp,#4
4810       00000004      OFST:	set	4
4813                     ; 1508   uint16_t tmpccr2 = 0;
4815                     ; 1511   tmpccr2h = TIM2->CCR2H;
4817  0538 c65262        	ld	a,21090
4818  053b 6b02          	ld	(OFST-2,sp),a
4819                     ; 1512   tmpccr2l = TIM2->CCR2L;
4821  053d c65263        	ld	a,21091
4822  0540 6b01          	ld	(OFST-3,sp),a
4823                     ; 1514   tmpccr2 = (uint16_t)(tmpccr2l);
4825  0542 7b01          	ld	a,(OFST-3,sp)
4826  0544 5f            	clrw	x
4827  0545 97            	ld	xl,a
4828  0546 1f03          	ldw	(OFST-1,sp),x
4829                     ; 1515   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4831  0548 7b02          	ld	a,(OFST-2,sp)
4832  054a 5f            	clrw	x
4833  054b 97            	ld	xl,a
4834  054c 4f            	clr	a
4835  054d 02            	rlwa	x,a
4836  054e 01            	rrwa	x,a
4837  054f 1a04          	or	a,(OFST+0,sp)
4838  0551 01            	rrwa	x,a
4839  0552 1a03          	or	a,(OFST-1,sp)
4840  0554 01            	rrwa	x,a
4841  0555 1f03          	ldw	(OFST-1,sp),x
4842                     ; 1517   return ((uint16_t)tmpccr2);
4844  0557 1e03          	ldw	x,(OFST-1,sp)
4847  0559 5b04          	addw	sp,#4
4848  055b 81            	ret
4900                     ; 1525 uint16_t TIM2_GetCounter(void)
4900                     ; 1526 {
4901                     	switch	.text
4902  055c               _TIM2_GetCounter:
4904  055c 5204          	subw	sp,#4
4905       00000004      OFST:	set	4
4908                     ; 1527   uint16_t tmpcnt = 0;
4910                     ; 1530   tmpcntrh = TIM2->CNTRH;
4912  055e c6525b        	ld	a,21083
4913  0561 6b02          	ld	(OFST-2,sp),a
4914                     ; 1531   tmpcntrl = TIM2->CNTRL;
4916  0563 c6525c        	ld	a,21084
4917  0566 6b01          	ld	(OFST-3,sp),a
4918                     ; 1533   tmpcnt = (uint16_t)(tmpcntrl);
4920  0568 7b01          	ld	a,(OFST-3,sp)
4921  056a 5f            	clrw	x
4922  056b 97            	ld	xl,a
4923  056c 1f03          	ldw	(OFST-1,sp),x
4924                     ; 1534   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
4926  056e 7b02          	ld	a,(OFST-2,sp)
4927  0570 5f            	clrw	x
4928  0571 97            	ld	xl,a
4929  0572 4f            	clr	a
4930  0573 02            	rlwa	x,a
4931  0574 01            	rrwa	x,a
4932  0575 1a04          	or	a,(OFST+0,sp)
4933  0577 01            	rrwa	x,a
4934  0578 1a03          	or	a,(OFST-1,sp)
4935  057a 01            	rrwa	x,a
4936  057b 1f03          	ldw	(OFST-1,sp),x
4937                     ; 1536   return ((uint16_t)tmpcnt);
4939  057d 1e03          	ldw	x,(OFST-1,sp)
4942  057f 5b04          	addw	sp,#4
4943  0581 81            	ret
4967                     ; 1544 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4967                     ; 1545 {
4968                     	switch	.text
4969  0582               _TIM2_GetPrescaler:
4973                     ; 1547   return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
4975  0582 c6525d        	ld	a,21085
4978  0585 81            	ret
5117                     ; 1563 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
5117                     ; 1564 {
5118                     	switch	.text
5119  0586               _TIM2_GetFlagStatus:
5121  0586 89            	pushw	x
5122  0587 89            	pushw	x
5123       00000002      OFST:	set	2
5126                     ; 1565   FlagStatus bitstatus = RESET;
5128                     ; 1569   assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
5130                     ; 1571   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)(TIM2_FLAG));
5132  0588 9f            	ld	a,xl
5133  0589 c45255        	and	a,21077
5134  058c 6b01          	ld	(OFST-1,sp),a
5135                     ; 1572   tim2_flag_h = (uint8_t)(TIM2->SR2 & (uint8_t)((uint16_t)TIM2_FLAG >> 8));
5137  058e c65256        	ld	a,21078
5138  0591 1403          	and	a,(OFST+1,sp)
5139  0593 6b02          	ld	(OFST+0,sp),a
5140                     ; 1574   if ((uint8_t)(tim2_flag_l | tim2_flag_h) != 0)
5142  0595 7b01          	ld	a,(OFST-1,sp)
5143  0597 1a02          	or	a,(OFST+0,sp)
5144  0599 2706          	jreq	L3552
5145                     ; 1576     bitstatus = SET;
5147  059b a601          	ld	a,#1
5148  059d 6b02          	ld	(OFST+0,sp),a
5150  059f 2002          	jra	L5552
5151  05a1               L3552:
5152                     ; 1580     bitstatus = RESET;
5154  05a1 0f02          	clr	(OFST+0,sp)
5155  05a3               L5552:
5156                     ; 1582   return ((FlagStatus)bitstatus);
5158  05a3 7b02          	ld	a,(OFST+0,sp)
5161  05a5 5b04          	addw	sp,#4
5162  05a7 81            	ret
5197                     ; 1596 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
5197                     ; 1597 {
5198                     	switch	.text
5199  05a8               _TIM2_ClearFlag:
5201  05a8 89            	pushw	x
5202       00000000      OFST:	set	0
5205                     ; 1599   assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
5207                     ; 1601   TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
5209  05a9 9f            	ld	a,xl
5210  05aa 43            	cpl	a
5211  05ab c75255        	ld	21077,a
5212                     ; 1602   TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
5214  05ae 7b01          	ld	a,(OFST+1,sp)
5215  05b0 43            	cpl	a
5216  05b1 c75256        	ld	21078,a
5217                     ; 1603 }
5220  05b4 85            	popw	x
5221  05b5 81            	ret
5285                     ; 1616 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
5285                     ; 1617 {
5286                     	switch	.text
5287  05b6               _TIM2_GetITStatus:
5289  05b6 88            	push	a
5290  05b7 5203          	subw	sp,#3
5291       00000003      OFST:	set	3
5294                     ; 1618   __IO ITStatus bitstatus = RESET;
5296  05b9 0f03          	clr	(OFST+0,sp)
5297                     ; 1620   __IO uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
5299  05bb 0f01          	clr	(OFST-2,sp)
5302  05bd 0f02          	clr	(OFST-1,sp)
5303                     ; 1623   assert_param(IS_TIM2_GET_IT(TIM2_IT));
5305                     ; 1625   TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
5307  05bf c45255        	and	a,21077
5308  05c2 6b01          	ld	(OFST-2,sp),a
5309                     ; 1627   TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
5311  05c4 c65254        	ld	a,21076
5312  05c7 1404          	and	a,(OFST+1,sp)
5313  05c9 6b02          	ld	(OFST-1,sp),a
5314                     ; 1629   if ((TIM2_itStatus != (uint8_t)RESET) && (TIM2_itEnable != (uint8_t)RESET))
5316  05cb 0d01          	tnz	(OFST-2,sp)
5317  05cd 270a          	jreq	L7262
5319  05cf 0d02          	tnz	(OFST-1,sp)
5320  05d1 2706          	jreq	L7262
5321                     ; 1631     bitstatus = (ITStatus)SET;
5323  05d3 a601          	ld	a,#1
5324  05d5 6b03          	ld	(OFST+0,sp),a
5326  05d7 2002          	jra	L1362
5327  05d9               L7262:
5328                     ; 1635     bitstatus = (ITStatus)RESET;
5330  05d9 0f03          	clr	(OFST+0,sp)
5331  05db               L1362:
5332                     ; 1637   return ((ITStatus)bitstatus);
5334  05db 7b03          	ld	a,(OFST+0,sp)
5337  05dd 5b04          	addw	sp,#4
5338  05df 81            	ret
5374                     ; 1651 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
5374                     ; 1652 {
5375                     	switch	.text
5376  05e0               _TIM2_ClearITPendingBit:
5380                     ; 1654   assert_param(IS_TIM2_IT(TIM2_IT));
5382                     ; 1657   TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
5384  05e0 43            	cpl	a
5385  05e1 c75255        	ld	21077,a
5386                     ; 1658 }
5389  05e4 81            	ret
5461                     ; 1675 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \
5461                     ; 1676                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \
5461                     ; 1677                        uint8_t TIM2_ICFilter)
5461                     ; 1678 {
5462                     	switch	.text
5463  05e5               L3_TI1_Config:
5465  05e5 89            	pushw	x
5466  05e6 89            	pushw	x
5467       00000002      OFST:	set	2
5470                     ; 1679   uint8_t tmpccmr1 = 0;
5472                     ; 1680   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5474  05e7 9e            	ld	a,xh
5475  05e8 6b01          	ld	(OFST-1,sp),a
5476                     ; 1681   tmpccmr1 = TIM2->CCMR1;
5478  05ea c65258        	ld	a,21080
5479  05ed 6b02          	ld	(OFST+0,sp),a
5480                     ; 1684   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5482                     ; 1685   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5484                     ; 1686   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5486                     ; 1689   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5488  05ef 7211525a      	bres	21082,#0
5489                     ; 1692   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5491  05f3 7b02          	ld	a,(OFST+0,sp)
5492  05f5 a40c          	and	a,#12
5493  05f7 6b02          	ld	(OFST+0,sp),a
5494                     ; 1693   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5496  05f9 7b07          	ld	a,(OFST+5,sp)
5497  05fb 97            	ld	xl,a
5498  05fc a610          	ld	a,#16
5499  05fe 42            	mul	x,a
5500  05ff 9f            	ld	a,xl
5501  0600 1a04          	or	a,(OFST+2,sp)
5502  0602 1a02          	or	a,(OFST+0,sp)
5503  0604 6b02          	ld	(OFST+0,sp),a
5504                     ; 1695   TIM2->CCMR1 = tmpccmr1;
5506  0606 7b02          	ld	a,(OFST+0,sp)
5507  0608 c75258        	ld	21080,a
5508                     ; 1698   if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
5510  060b 7b01          	ld	a,(OFST-1,sp)
5511  060d a101          	cp	a,#1
5512  060f 2606          	jrne	L7072
5513                     ; 1700     TIM2->CCER1 |= TIM_CCER1_CC1P;
5515  0611 7212525a      	bset	21082,#1
5517  0615 2004          	jra	L1172
5518  0617               L7072:
5519                     ; 1704     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5521  0617 7213525a      	bres	21082,#1
5522  061b               L1172:
5523                     ; 1708   TIM2->CCER1 |=  TIM_CCER1_CC1E;
5525  061b 7210525a      	bset	21082,#0
5526                     ; 1709 }
5529  061f 5b04          	addw	sp,#4
5530  0621 81            	ret
5602                     ; 1726 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
5602                     ; 1727                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
5602                     ; 1728                        uint8_t TIM2_ICFilter)
5602                     ; 1729 {
5603                     	switch	.text
5604  0622               L5_TI2_Config:
5606  0622 89            	pushw	x
5607  0623 89            	pushw	x
5608       00000002      OFST:	set	2
5611                     ; 1730   uint8_t tmpccmr2 = 0;
5613                     ; 1731   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5615  0624 9e            	ld	a,xh
5616  0625 6b01          	ld	(OFST-1,sp),a
5617                     ; 1734   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5619                     ; 1735   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5621                     ; 1736   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5623                     ; 1738   tmpccmr2 = TIM2->CCMR2;
5625  0627 c65259        	ld	a,21081
5626  062a 6b02          	ld	(OFST+0,sp),a
5627                     ; 1741   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
5629  062c 7219525a      	bres	21082,#4
5630                     ; 1744   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5632  0630 7b02          	ld	a,(OFST+0,sp)
5633  0632 a40c          	and	a,#12
5634  0634 6b02          	ld	(OFST+0,sp),a
5635                     ; 1745   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5637  0636 7b07          	ld	a,(OFST+5,sp)
5638  0638 97            	ld	xl,a
5639  0639 a610          	ld	a,#16
5640  063b 42            	mul	x,a
5641  063c 9f            	ld	a,xl
5642  063d 1a04          	or	a,(OFST+2,sp)
5643  063f 1a02          	or	a,(OFST+0,sp)
5644  0641 6b02          	ld	(OFST+0,sp),a
5645                     ; 1747   TIM2->CCMR2 = tmpccmr2;
5647  0643 7b02          	ld	a,(OFST+0,sp)
5648  0645 c75259        	ld	21081,a
5649                     ; 1750   if (tmpicpolarity == (uint8_t)TIM2_ICPolarity_Falling)
5651  0648 7b01          	ld	a,(OFST-1,sp)
5652  064a a101          	cp	a,#1
5653  064c 2606          	jrne	L1572
5654                     ; 1752     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5656  064e 721a525a      	bset	21082,#5
5658  0652 2004          	jra	L3572
5659  0654               L1572:
5660                     ; 1756     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5662  0654 721b525a      	bres	21082,#5
5663  0658               L3572:
5664                     ; 1760   TIM2->CCER1 |=  TIM_CCER1_CC2E;
5666  0658 7218525a      	bset	21082,#4
5667                     ; 1761 }
5670  065c 5b04          	addw	sp,#4
5671  065e 81            	ret
5739                     ; 1771 uint32_t TIM2_ComputeLsiClockFreq(uint32_t TIM2_TimerClockFreq)
5739                     ; 1772 {
5740                     	switch	.text
5741  065f               _TIM2_ComputeLsiClockFreq:
5743  065f 520c          	subw	sp,#12
5744       0000000c      OFST:	set	12
5747                     ; 1777   TIM2_ICInit(TIM2_Channel_1, TIM2_ICPolarity_Rising, TIM2_ICSelection_DirectTI, TIM2_ICPSC_Div8, 0x0);
5749  0661 4b00          	push	#0
5750  0663 4b0c          	push	#12
5751  0665 4b01          	push	#1
5752  0667 5f            	clrw	x
5753  0668 4f            	clr	a
5754  0669 95            	ld	xh,a
5755  066a cd0142        	call	_TIM2_ICInit
5757  066d 5b03          	addw	sp,#3
5758                     ; 1780   TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
5760  066f ae0001        	ldw	x,#1
5761  0672 a602          	ld	a,#2
5762  0674 95            	ld	xh,a
5763  0675 cd01fa        	call	_TIM2_ITConfig
5765                     ; 1783   TIM2_Cmd(ENABLE);
5767  0678 a601          	ld	a,#1
5768  067a cd01de        	call	_TIM2_Cmd
5770                     ; 1785   TIM2->SR1 = 0x00;
5772  067d 725f5255      	clr	21077
5773                     ; 1786   TIM2->SR2 = 0x00;
5775  0681 725f5256      	clr	21078
5776                     ; 1789   TIM2_ClearFlag(TIM2_FLAG_CC1);
5778  0685 ae0002        	ldw	x,#2
5779  0688 cd05a8        	call	_TIM2_ClearFlag
5782  068b               L1103:
5783                     ; 1792   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
5785  068b c65255        	ld	a,21077
5786  068e a402          	and	a,#2
5787  0690 a102          	cp	a,#2
5788  0692 26f7          	jrne	L1103
5789                     ; 1795   ICValue1 = TIM2_GetCapture1();
5791  0694 cd0510        	call	_TIM2_GetCapture1
5793  0697 1f09          	ldw	(OFST-3,sp),x
5794                     ; 1796   TIM2_ClearFlag(TIM2_FLAG_CC1);
5796  0699 ae0002        	ldw	x,#2
5797  069c cd05a8        	call	_TIM2_ClearFlag
5800  069f               L7103:
5801                     ; 1799   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
5803  069f c65255        	ld	a,21077
5804  06a2 a402          	and	a,#2
5805  06a4 a102          	cp	a,#2
5806  06a6 26f7          	jrne	L7103
5807                     ; 1802   ICValue2 = TIM2_GetCapture1();
5809  06a8 cd0510        	call	_TIM2_GetCapture1
5811  06ab 1f0b          	ldw	(OFST-1,sp),x
5812                     ; 1803   TIM2_ClearFlag(TIM2_FLAG_CC1);
5814  06ad ae0002        	ldw	x,#2
5815  06b0 cd05a8        	call	_TIM2_ClearFlag
5817                     ; 1806   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5819  06b3 7211525a      	bres	21082,#0
5820                     ; 1808   TIM2->CCMR1 = 0x00;
5822  06b7 725f5258      	clr	21080
5823                     ; 1810   TIM2_Cmd(DISABLE);
5825  06bb 4f            	clr	a
5826  06bc cd01de        	call	_TIM2_Cmd
5828                     ; 1813   LSIClockFreq = (8 * TIM2_TimerClockFreq) / (ICValue2 - ICValue1);
5830  06bf 1e0b          	ldw	x,(OFST-1,sp)
5831  06c1 72f009        	subw	x,(OFST-3,sp)
5832  06c4 cd0000        	call	c_uitolx
5834  06c7 96            	ldw	x,sp
5835  06c8 1c0001        	addw	x,#OFST-11
5836  06cb cd0000        	call	c_rtol
5838  06ce 96            	ldw	x,sp
5839  06cf 1c000f        	addw	x,#OFST+3
5840  06d2 cd0000        	call	c_ltor
5842  06d5 a603          	ld	a,#3
5843  06d7 cd0000        	call	c_llsh
5845  06da 96            	ldw	x,sp
5846  06db 1c0001        	addw	x,#OFST-11
5847  06de cd0000        	call	c_ludv
5849  06e1 96            	ldw	x,sp
5850  06e2 1c0005        	addw	x,#OFST-7
5851  06e5 cd0000        	call	c_rtol
5853                     ; 1814   return LSIClockFreq;
5855  06e8 96            	ldw	x,sp
5856  06e9 1c0005        	addw	x,#OFST-7
5857  06ec cd0000        	call	c_ltor
5861  06ef 5b0c          	addw	sp,#12
5862  06f1 81            	ret
5886                     ; 1822 FunctionalState TIM2_GetStatus(void)
5886                     ; 1823 {
5887                     	switch	.text
5888  06f2               _TIM2_GetStatus:
5892                     ; 1824   return ((FunctionalState)(TIM2->CR1 & TIM_CR1_CEN));
5894  06f2 c65250        	ld	a,21072
5895  06f5 a401          	and	a,#1
5898  06f7 81            	ret
5911                     	xdef	_TIM2_GetStatus
5912                     	xdef	_TIM2_ComputeLsiClockFreq
5913                     	xdef	_TIM2_ClearITPendingBit
5914                     	xdef	_TIM2_GetITStatus
5915                     	xdef	_TIM2_ClearFlag
5916                     	xdef	_TIM2_GetFlagStatus
5917                     	xdef	_TIM2_GetPrescaler
5918                     	xdef	_TIM2_GetCounter
5919                     	xdef	_TIM2_GetCapture2
5920                     	xdef	_TIM2_GetCapture1
5921                     	xdef	_TIM2_SetIC2Prescaler
5922                     	xdef	_TIM2_SetIC1Prescaler
5923                     	xdef	_TIM2_SetCompare2
5924                     	xdef	_TIM2_SetCompare1
5925                     	xdef	_TIM2_SetAutoreload
5926                     	xdef	_TIM2_SetCounter
5927                     	xdef	_TIM2_SelectOCxM
5928                     	xdef	_TIM2_CCxCmd
5929                     	xdef	_TIM2_OC2PolarityConfig
5930                     	xdef	_TIM2_OC1PolarityConfig
5931                     	xdef	_TIM2_GenerateEvent
5932                     	xdef	_TIM2_OC2FastCmd
5933                     	xdef	_TIM2_OC1FastCmd
5934                     	xdef	_TIM2_OC2PreloadConfig
5935                     	xdef	_TIM2_OC1PreloadConfig
5936                     	xdef	_TIM2_ARRPreloadConfig
5937                     	xdef	_TIM2_ForcedOC2Config
5938                     	xdef	_TIM2_ForcedOC1Config
5939                     	xdef	_TIM2_CounterModeConfig
5940                     	xdef	_TIM2_PrescalerConfig
5941                     	xdef	_TIM2_EncoderInterfaceConfig
5942                     	xdef	_TIM2_SelectMasterSlaveMode
5943                     	xdef	_TIM2_SelectSlaveMode
5944                     	xdef	_TIM2_SelectOutputTrigger
5945                     	xdef	_TIM2_SelectOnePulseMode
5946                     	xdef	_TIM2_SelectHallSensor
5947                     	xdef	_TIM2_UpdateRequestConfig
5948                     	xdef	_TIM2_UpdateDisableConfig
5949                     	xdef	_TIM2_SelectInputTrigger
5950                     	xdef	_TIM2_TIxExternalClockConfig
5951                     	xdef	_TIM2_ETRConfig
5952                     	xdef	_TIM2_ETRClockMode2Config
5953                     	xdef	_TIM2_ETRClockMode1Config
5954                     	xdef	_TIM2_InternalClockConfig
5955                     	xdef	_TIM2_ITConfig
5956                     	xdef	_TIM2_CtrlPWMOutputs
5957                     	xdef	_TIM2_Cmd
5958                     	xdef	_TIM2_PWMIConfig
5959                     	xdef	_TIM2_ICInit
5960                     	xdef	_TIM2_BKRConfig
5961                     	xdef	_TIM2_OC2Init
5962                     	xdef	_TIM2_OC1Init
5963                     	xdef	_TIM2_TimeBaseInit
5964                     	xdef	_TIM2_DeInit
5965                     	xref.b	c_x
5984                     	xref	c_ludv
5985                     	xref	c_rtol
5986                     	xref	c_uitolx
5987                     	xref	c_llsh
5988                     	xref	c_ltor
5989                     	end
