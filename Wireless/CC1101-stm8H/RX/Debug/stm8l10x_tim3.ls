   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 64 void TIM3_DeInit(void)
  43                     ; 65 {
  45                     	switch	.text
  46  0000               _TIM3_DeInit:
  50                     ; 66   TIM3->CR1 = TIM_CR1_RESET_VALUE;
  52  0000 725f5280      	clr	21120
  53                     ; 67   TIM3->CR2 = TIM_CR2_RESET_VALUE;
  55  0004 725f5281      	clr	21121
  56                     ; 68   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  58  0008 725f5282      	clr	21122
  59                     ; 69   TIM3->ETR = TIM_ETR_RESET_VALUE;
  61  000c 725f5283      	clr	21123
  62                     ; 70   TIM3->IER = TIM_IER_RESET_VALUE;
  64  0010 725f5284      	clr	21124
  65                     ; 71   TIM3->SR2 = TIM_SR2_RESET_VALUE;
  67  0014 725f5286      	clr	21126
  68                     ; 74   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  70  0018 725f528a      	clr	21130
  71                     ; 76   TIM3->CCMR1 = 0x01;/*TIM3_ICxSource_TIxFPx */
  73  001c 35015288      	mov	21128,#1
  74                     ; 77   TIM3->CCMR2 = 0x01;/*TIM3_ICxSource_TIxFPx */
  76  0020 35015289      	mov	21129,#1
  77                     ; 80   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  79  0024 725f528a      	clr	21130
  80                     ; 81   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  82  0028 725f5288      	clr	21128
  83                     ; 82   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  85  002c 725f5289      	clr	21129
  86                     ; 84   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  88  0030 725f528b      	clr	21131
  89                     ; 85   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  91  0034 725f528c      	clr	21132
  92                     ; 87   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
  94  0038 725f528d      	clr	21133
  95                     ; 89   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
  97  003c 35ff528e      	mov	21134,#255
  98                     ; 90   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
 100  0040 35ff528f      	mov	21135,#255
 101                     ; 92   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
 103  0044 725f5290      	clr	21136
 104                     ; 93   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
 106  0048 725f5291      	clr	21137
 107                     ; 94   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
 109  004c 725f5292      	clr	21138
 110                     ; 95   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
 112  0050 725f5293      	clr	21139
 113                     ; 98   TIM3->OISR = TIM_OISR_RESET_VALUE;
 115  0054 725f5295      	clr	21141
 116                     ; 99   TIM3->EGR = 0x01;/*TIM_EGR_UG;*/
 118  0058 35015287      	mov	21127,#1
 119                     ; 100   TIM3->BKR = TIM_BKR_RESET_VALUE;
 121  005c 725f5294      	clr	21140
 122                     ; 101   TIM3->SR1 = TIM_SR1_RESET_VALUE;
 124  0060 725f5285      	clr	21125
 125                     ; 102 }
 128  0064 81            	ret
 290                     ; 127 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
 290                     ; 128                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
 290                     ; 129                        uint16_t TIM3_Period)
 290                     ; 130 {
 291                     	switch	.text
 292  0065               _TIM3_TimeBaseInit:
 294  0065 89            	pushw	x
 295       00000000      OFST:	set	0
 298                     ; 132   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
 300                     ; 133   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 302                     ; 138   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
 304  0066 7b05          	ld	a,(OFST+5,sp)
 305  0068 c7528e        	ld	21134,a
 306                     ; 139   TIM3->ARRL = (uint8_t)(TIM3_Period);
 308  006b 7b06          	ld	a,(OFST+6,sp)
 309  006d c7528f        	ld	21135,a
 310                     ; 142   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 312  0070 9e            	ld	a,xh
 313  0071 c7528d        	ld	21133,a
 314                     ; 145   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 316  0074 c65280        	ld	a,21120
 317  0077 a48f          	and	a,#143
 318  0079 c75280        	ld	21120,a
 319                     ; 146   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
 321  007c 9f            	ld	a,xl
 322  007d ca5280        	or	a,21120
 323  0080 c75280        	ld	21120,a
 324                     ; 147 }
 327  0083 85            	popw	x
 328  0084 81            	ret
 526                     ; 174 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 526                     ; 175                   TIM3_OutputState_TypeDef TIM3_OutputState,
 526                     ; 176                   uint16_t TIM3_Pulse,
 526                     ; 177                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 526                     ; 178                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 526                     ; 179 {
 527                     	switch	.text
 528  0085               _TIM3_OC1Init:
 530  0085 89            	pushw	x
 531  0086 88            	push	a
 532       00000001      OFST:	set	1
 535                     ; 180   uint8_t tmpccmr1 = 0;
 537                     ; 183   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 539                     ; 184   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 541                     ; 185   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 543                     ; 186   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 545                     ; 188   tmpccmr1 = TIM3->CCMR1;
 547  0087 c65288        	ld	a,21128
 548  008a 6b01          	ld	(OFST+0,sp),a
 549                     ; 191   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 551  008c 7211528a      	bres	21130,#0
 552                     ; 193   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 554  0090 7b01          	ld	a,(OFST+0,sp)
 555  0092 a48f          	and	a,#143
 556  0094 6b01          	ld	(OFST+0,sp),a
 557                     ; 196   tmpccmr1 |= (uint8_t)TIM3_OCMode;
 559  0096 9e            	ld	a,xh
 560  0097 1a01          	or	a,(OFST+0,sp)
 561  0099 6b01          	ld	(OFST+0,sp),a
 562                     ; 198   TIM3->CCMR1 = tmpccmr1;
 564  009b 7b01          	ld	a,(OFST+0,sp)
 565  009d c75288        	ld	21128,a
 566                     ; 201   if (TIM3_OutputState == TIM3_OutputState_Enable)
 568  00a0 9f            	ld	a,xl
 569  00a1 a101          	cp	a,#1
 570  00a3 2606          	jrne	L722
 571                     ; 203     TIM3->CCER1 |= TIM_CCER1_CC1E;
 573  00a5 7210528a      	bset	21130,#0
 575  00a9 2004          	jra	L132
 576  00ab               L722:
 577                     ; 207     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 579  00ab 7211528a      	bres	21130,#0
 580  00af               L132:
 581                     ; 211   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 583  00af 7b08          	ld	a,(OFST+7,sp)
 584  00b1 a101          	cp	a,#1
 585  00b3 2606          	jrne	L332
 586                     ; 213     TIM3->CCER1 |= TIM_CCER1_CC1P;
 588  00b5 7212528a      	bset	21130,#1
 590  00b9 2004          	jra	L532
 591  00bb               L332:
 592                     ; 217     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 594  00bb 7213528a      	bres	21130,#1
 595  00bf               L532:
 596                     ; 221   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 598  00bf 7b09          	ld	a,(OFST+8,sp)
 599  00c1 a101          	cp	a,#1
 600  00c3 2606          	jrne	L732
 601                     ; 223     TIM3->OISR |= TIM_OISR_OIS1;
 603  00c5 72105295      	bset	21141,#0
 605  00c9 2004          	jra	L142
 606  00cb               L732:
 607                     ; 227     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 609  00cb 72115295      	bres	21141,#0
 610  00cf               L142:
 611                     ; 231   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 613  00cf 7b06          	ld	a,(OFST+5,sp)
 614  00d1 c75290        	ld	21136,a
 615                     ; 232   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 617  00d4 7b07          	ld	a,(OFST+6,sp)
 618  00d6 c75291        	ld	21137,a
 619                     ; 233 }
 622  00d9 5b03          	addw	sp,#3
 623  00db 81            	ret
 706                     ; 260 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 706                     ; 261                   TIM3_OutputState_TypeDef TIM3_OutputState,
 706                     ; 262                   uint16_t TIM3_Pulse,
 706                     ; 263                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 706                     ; 264                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 706                     ; 265 {
 707                     	switch	.text
 708  00dc               _TIM3_OC2Init:
 710  00dc 89            	pushw	x
 711  00dd 88            	push	a
 712       00000001      OFST:	set	1
 715                     ; 266   uint8_t tmpccmr2 = 0;
 717                     ; 269   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 719                     ; 270   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 721                     ; 271   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 723                     ; 272   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 725                     ; 274   tmpccmr2 = TIM3->CCMR2;
 727  00de c65289        	ld	a,21129
 728  00e1 6b01          	ld	(OFST+0,sp),a
 729                     ; 277   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 731  00e3 7219528a      	bres	21130,#4
 732                     ; 280   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 734  00e7 7b01          	ld	a,(OFST+0,sp)
 735  00e9 a48f          	and	a,#143
 736  00eb 6b01          	ld	(OFST+0,sp),a
 737                     ; 283   tmpccmr2 |= (uint8_t)TIM3_OCMode;
 739  00ed 9e            	ld	a,xh
 740  00ee 1a01          	or	a,(OFST+0,sp)
 741  00f0 6b01          	ld	(OFST+0,sp),a
 742                     ; 285   TIM3->CCMR2 = tmpccmr2;
 744  00f2 7b01          	ld	a,(OFST+0,sp)
 745  00f4 c75289        	ld	21129,a
 746                     ; 288   if (TIM3_OutputState == TIM3_OutputState_Enable)
 748  00f7 9f            	ld	a,xl
 749  00f8 a101          	cp	a,#1
 750  00fa 2606          	jrne	L503
 751                     ; 290     TIM3->CCER1 |= TIM_CCER1_CC2E;
 753  00fc 7218528a      	bset	21130,#4
 755  0100 2004          	jra	L703
 756  0102               L503:
 757                     ; 294     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 759  0102 7219528a      	bres	21130,#4
 760  0106               L703:
 761                     ; 298   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 763  0106 7b08          	ld	a,(OFST+7,sp)
 764  0108 a101          	cp	a,#1
 765  010a 2606          	jrne	L113
 766                     ; 300     TIM3->CCER1 |= TIM_CCER1_CC2P;
 768  010c 721a528a      	bset	21130,#5
 770  0110 2004          	jra	L313
 771  0112               L113:
 772                     ; 304     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 774  0112 721b528a      	bres	21130,#5
 775  0116               L313:
 776                     ; 309   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 778  0116 7b09          	ld	a,(OFST+8,sp)
 779  0118 a101          	cp	a,#1
 780  011a 2606          	jrne	L513
 781                     ; 311     TIM3->OISR |= TIM_OISR_OIS2;
 783  011c 72145295      	bset	21141,#2
 785  0120 2004          	jra	L713
 786  0122               L513:
 787                     ; 315     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 789  0122 72155295      	bres	21141,#2
 790  0126               L713:
 791                     ; 319   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 793  0126 7b06          	ld	a,(OFST+5,sp)
 794  0128 c75292        	ld	21138,a
 795                     ; 320   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 797  012b 7b07          	ld	a,(OFST+6,sp)
 798  012d c75293        	ld	21139,a
 799                     ; 321 }
 802  0130 5b03          	addw	sp,#3
 803  0132 81            	ret
1001                     ; 350 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
1001                     ; 351                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
1001                     ; 352                     TIM3_BreakState_TypeDef TIM3_BreakState,
1001                     ; 353                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
1001                     ; 354                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
1001                     ; 355 
1001                     ; 356 {
1002                     	switch	.text
1003  0133               _TIM3_BKRConfig:
1005  0133 89            	pushw	x
1006       00000000      OFST:	set	0
1009                     ; 358   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
1011                     ; 359   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
1013                     ; 360   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
1015                     ; 361   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
1017                     ; 362   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
1019                     ; 369   TIM3->BKR = (uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel | \
1019                     ; 370                         (uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity | \
1019                     ; 371                         (uint8_t)TIM3_AutomaticOutput);
1021  0134 9f            	ld	a,xl
1022  0135 1a01          	or	a,(OFST+1,sp)
1023  0137 1a05          	or	a,(OFST+5,sp)
1024  0139 1a06          	or	a,(OFST+6,sp)
1025  013b 1a07          	or	a,(OFST+7,sp)
1026  013d c75294        	ld	21140,a
1027                     ; 372 }
1030  0140 85            	popw	x
1031  0141 81            	ret
1215                     ; 398 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
1215                     ; 399                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1215                     ; 400                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
1215                     ; 401                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1215                     ; 402                  uint8_t TIM3_ICFilter)
1215                     ; 403 {
1216                     	switch	.text
1217  0142               _TIM3_ICInit:
1219  0142 89            	pushw	x
1220       00000000      OFST:	set	0
1223                     ; 405   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1225                     ; 407   if (TIM3_Channel == TIM3_Channel_1)
1227  0143 9e            	ld	a,xh
1228  0144 4d            	tnz	a
1229  0145 2614          	jrne	L735
1230                     ; 410     TI1_Config(TIM3_ICPolarity,
1230                     ; 411                TIM3_ICSelection,
1230                     ; 412                TIM3_ICFilter);
1232  0147 7b07          	ld	a,(OFST+7,sp)
1233  0149 88            	push	a
1234  014a 7b06          	ld	a,(OFST+6,sp)
1235  014c 97            	ld	xl,a
1236  014d 7b03          	ld	a,(OFST+3,sp)
1237  014f 95            	ld	xh,a
1238  0150 cd05e5        	call	L3_TI1_Config
1240  0153 84            	pop	a
1241                     ; 415     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1243  0154 7b06          	ld	a,(OFST+6,sp)
1244  0156 cd04dc        	call	_TIM3_SetIC1Prescaler
1247  0159 2012          	jra	L145
1248  015b               L735:
1249                     ; 420     TI2_Config(TIM3_ICPolarity,
1249                     ; 421                TIM3_ICSelection,
1249                     ; 422                TIM3_ICFilter);
1251  015b 7b07          	ld	a,(OFST+7,sp)
1252  015d 88            	push	a
1253  015e 7b06          	ld	a,(OFST+6,sp)
1254  0160 97            	ld	xl,a
1255  0161 7b03          	ld	a,(OFST+3,sp)
1256  0163 95            	ld	xh,a
1257  0164 cd0622        	call	L5_TI2_Config
1259  0167 84            	pop	a
1260                     ; 424     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1262  0168 7b06          	ld	a,(OFST+6,sp)
1263  016a cd04f6        	call	_TIM3_SetIC2Prescaler
1265  016d               L145:
1266                     ; 426 }
1269  016d 85            	popw	x
1270  016e 81            	ret
1366                     ; 452 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1366                     ; 453                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1366                     ; 454                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1366                     ; 455                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1366                     ; 456                      uint8_t TIM3_ICFilter)
1366                     ; 457 {
1367                     	switch	.text
1368  016f               _TIM3_PWMIConfig:
1370  016f 89            	pushw	x
1371  0170 89            	pushw	x
1372       00000002      OFST:	set	2
1375                     ; 458   uint8_t icpolarity = (uint8_t)TIM3_ICPolarity_Rising;
1377                     ; 459   uint8_t icselection = (uint8_t)TIM3_ICSelection_DirectTI;
1379                     ; 462   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1381                     ; 465   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
1383  0171 9f            	ld	a,xl
1384  0172 4d            	tnz	a
1385  0173 2606          	jrne	L116
1386                     ; 467     icpolarity = (uint8_t)TIM3_ICPolarity_Falling;
1388  0175 a601          	ld	a,#1
1389  0177 6b01          	ld	(OFST-1,sp),a
1391  0179 2002          	jra	L316
1392  017b               L116:
1393                     ; 471     icpolarity = (uint8_t)TIM3_ICPolarity_Rising;
1395  017b 0f01          	clr	(OFST-1,sp)
1396  017d               L316:
1397                     ; 475   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
1399  017d 7b07          	ld	a,(OFST+5,sp)
1400  017f a101          	cp	a,#1
1401  0181 2606          	jrne	L516
1402                     ; 477     icselection = (uint8_t)TIM3_ICSelection_IndirectTI;
1404  0183 a602          	ld	a,#2
1405  0185 6b02          	ld	(OFST+0,sp),a
1407  0187 2004          	jra	L716
1408  0189               L516:
1409                     ; 481     icselection = (uint8_t)TIM3_ICSelection_DirectTI;
1411  0189 a601          	ld	a,#1
1412  018b 6b02          	ld	(OFST+0,sp),a
1413  018d               L716:
1414                     ; 484   if (TIM3_Channel == TIM3_Channel_1)
1416  018d 0d03          	tnz	(OFST+1,sp)
1417  018f 2626          	jrne	L126
1418                     ; 487     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
1418                     ; 488                TIM3_ICFilter);
1420  0191 7b09          	ld	a,(OFST+7,sp)
1421  0193 88            	push	a
1422  0194 7b08          	ld	a,(OFST+6,sp)
1423  0196 97            	ld	xl,a
1424  0197 7b05          	ld	a,(OFST+3,sp)
1425  0199 95            	ld	xh,a
1426  019a cd05e5        	call	L3_TI1_Config
1428  019d 84            	pop	a
1429                     ; 491     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1431  019e 7b08          	ld	a,(OFST+6,sp)
1432  01a0 cd04dc        	call	_TIM3_SetIC1Prescaler
1434                     ; 494     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1436  01a3 7b09          	ld	a,(OFST+7,sp)
1437  01a5 88            	push	a
1438  01a6 7b03          	ld	a,(OFST+1,sp)
1439  01a8 97            	ld	xl,a
1440  01a9 7b02          	ld	a,(OFST+0,sp)
1441  01ab 95            	ld	xh,a
1442  01ac cd0622        	call	L5_TI2_Config
1444  01af 84            	pop	a
1445                     ; 497     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1447  01b0 7b08          	ld	a,(OFST+6,sp)
1448  01b2 cd04f6        	call	_TIM3_SetIC2Prescaler
1451  01b5 2024          	jra	L326
1452  01b7               L126:
1453                     ; 502     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
1453                     ; 503                TIM3_ICFilter);
1455  01b7 7b09          	ld	a,(OFST+7,sp)
1456  01b9 88            	push	a
1457  01ba 7b08          	ld	a,(OFST+6,sp)
1458  01bc 97            	ld	xl,a
1459  01bd 7b05          	ld	a,(OFST+3,sp)
1460  01bf 95            	ld	xh,a
1461  01c0 cd0622        	call	L5_TI2_Config
1463  01c3 84            	pop	a
1464                     ; 506     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1466  01c4 7b08          	ld	a,(OFST+6,sp)
1467  01c6 cd04f6        	call	_TIM3_SetIC2Prescaler
1469                     ; 509     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1471  01c9 7b09          	ld	a,(OFST+7,sp)
1472  01cb 88            	push	a
1473  01cc 7b03          	ld	a,(OFST+1,sp)
1474  01ce 97            	ld	xl,a
1475  01cf 7b02          	ld	a,(OFST+0,sp)
1476  01d1 95            	ld	xh,a
1477  01d2 cd05e5        	call	L3_TI1_Config
1479  01d5 84            	pop	a
1480                     ; 512     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1482  01d6 7b08          	ld	a,(OFST+6,sp)
1483  01d8 cd04dc        	call	_TIM3_SetIC1Prescaler
1485  01db               L326:
1486                     ; 514 }
1489  01db 5b04          	addw	sp,#4
1490  01dd 81            	ret
1545                     ; 522 void TIM3_Cmd(FunctionalState NewState)
1545                     ; 523 {
1546                     	switch	.text
1547  01de               _TIM3_Cmd:
1551                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1553                     ; 528   if (NewState != DISABLE)
1555  01de 4d            	tnz	a
1556  01df 2706          	jreq	L356
1557                     ; 530     TIM3->CR1 |= TIM_CR1_CEN;
1559  01e1 72105280      	bset	21120,#0
1561  01e5 2004          	jra	L556
1562  01e7               L356:
1563                     ; 534     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1565  01e7 72115280      	bres	21120,#0
1566  01eb               L556:
1567                     ; 536 }
1570  01eb 81            	ret
1606                     ; 544 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
1606                     ; 545 {
1607                     	switch	.text
1608  01ec               _TIM3_CtrlPWMOutputs:
1612                     ; 547   assert_param(IS_FUNCTIONAL_STATE(NewState));
1614                     ; 551   if (NewState != DISABLE)
1616  01ec 4d            	tnz	a
1617  01ed 2706          	jreq	L576
1618                     ; 553     TIM3->BKR |= TIM_BKR_MOE ;
1620  01ef 721e5294      	bset	21140,#7
1622  01f3 2004          	jra	L776
1623  01f5               L576:
1624                     ; 557     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1626  01f5 721f5294      	bres	21140,#7
1627  01f9               L776:
1628                     ; 559 }
1631  01f9 81            	ret
1717                     ; 574 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1717                     ; 575 {
1718                     	switch	.text
1719  01fa               _TIM3_ITConfig:
1721  01fa 89            	pushw	x
1722       00000000      OFST:	set	0
1725                     ; 577   assert_param(IS_TIM3_IT(TIM3_IT));
1727                     ; 578   assert_param(IS_FUNCTIONAL_STATE(NewState));
1729                     ; 580   if (NewState != DISABLE)
1731  01fb 9f            	ld	a,xl
1732  01fc 4d            	tnz	a
1733  01fd 2709          	jreq	L147
1734                     ; 583     TIM3->IER |= (uint8_t)TIM3_IT;
1736  01ff 9e            	ld	a,xh
1737  0200 ca5284        	or	a,21124
1738  0203 c75284        	ld	21124,a
1740  0206 2009          	jra	L347
1741  0208               L147:
1742                     ; 588     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
1744  0208 7b01          	ld	a,(OFST+1,sp)
1745  020a 43            	cpl	a
1746  020b c45284        	and	a,21124
1747  020e c75284        	ld	21124,a
1748  0211               L347:
1749                     ; 590 }
1752  0211 85            	popw	x
1753  0212 81            	ret
1777                     ; 597 void TIM3_InternalClockConfig(void)
1777                     ; 598 {
1778                     	switch	.text
1779  0213               _TIM3_InternalClockConfig:
1783                     ; 600   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1785  0213 c65282        	ld	a,21122
1786  0216 a4f8          	and	a,#248
1787  0218 c75282        	ld	21122,a
1788                     ; 601 }
1791  021b 81            	ret
1908                     ; 619 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
1908                     ; 620                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
1908                     ; 621                               uint8_t TIM3_ExtTRGFilter)
1908                     ; 622 {
1909                     	switch	.text
1910  021c               _TIM3_ETRClockMode1Config:
1912  021c 89            	pushw	x
1913       00000000      OFST:	set	0
1916                     ; 624   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
1918  021d 7b05          	ld	a,(OFST+5,sp)
1919  021f 88            	push	a
1920  0220 9f            	ld	a,xl
1921  0221 97            	ld	xl,a
1922  0222 7b02          	ld	a,(OFST+2,sp)
1923  0224 95            	ld	xh,a
1924  0225 ad35          	call	_TIM3_ETRConfig
1926  0227 84            	pop	a
1927                     ; 627   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1929  0228 c65282        	ld	a,21122
1930  022b a4f8          	and	a,#248
1931  022d c75282        	ld	21122,a
1932                     ; 628   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
1934  0230 c65282        	ld	a,21122
1935  0233 aa07          	or	a,#7
1936  0235 c75282        	ld	21122,a
1937                     ; 631   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1939  0238 c65282        	ld	a,21122
1940  023b a48f          	and	a,#143
1941  023d c75282        	ld	21122,a
1942                     ; 632   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
1944  0240 c65282        	ld	a,21122
1945  0243 aa70          	or	a,#112
1946  0245 c75282        	ld	21122,a
1947                     ; 633 }
1950  0248 85            	popw	x
1951  0249 81            	ret
2009                     ; 651 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2009                     ; 652                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2009                     ; 653                               uint8_t TIM3_ExtTRGFilter)
2009                     ; 654 {
2010                     	switch	.text
2011  024a               _TIM3_ETRClockMode2Config:
2013  024a 89            	pushw	x
2014       00000000      OFST:	set	0
2017                     ; 656   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
2019  024b 7b05          	ld	a,(OFST+5,sp)
2020  024d 88            	push	a
2021  024e 9f            	ld	a,xl
2022  024f 97            	ld	xl,a
2023  0250 7b02          	ld	a,(OFST+2,sp)
2024  0252 95            	ld	xh,a
2025  0253 ad07          	call	_TIM3_ETRConfig
2027  0255 84            	pop	a
2028                     ; 659   TIM3->ETR |= TIM_ETR_ECE ;
2030  0256 721c5283      	bset	21123,#6
2031                     ; 660 }
2034  025a 85            	popw	x
2035  025b 81            	ret
2091                     ; 678 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2091                     ; 679                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2091                     ; 680                     uint8_t TIM3_ExtTRGFilter)
2091                     ; 681 {
2092                     	switch	.text
2093  025c               _TIM3_ETRConfig:
2095  025c 89            	pushw	x
2096       00000000      OFST:	set	0
2099                     ; 683   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
2101                     ; 684   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
2103                     ; 685   assert_param(IS_TIM3_EXT_FILTER(TIM3_ExtTRGFilter));
2105                     ; 687   TIM3->ETR |= (uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity | (uint8_t)TIM3_ExtTRGFilter);
2107  025d 9f            	ld	a,xl
2108  025e 1a01          	or	a,(OFST+1,sp)
2109  0260 1a05          	or	a,(OFST+5,sp)
2110  0262 ca5283        	or	a,21123
2111  0265 c75283        	ld	21123,a
2112                     ; 688 }
2115  0268 85            	popw	x
2116  0269 81            	ret
2205                     ; 705 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
2205                     ; 706                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2205                     ; 707                                  uint8_t TIM3_ICFilter)
2205                     ; 708 {
2206                     	switch	.text
2207  026a               _TIM3_TIxExternalClockConfig:
2209  026a 89            	pushw	x
2210       00000000      OFST:	set	0
2213                     ; 710   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
2215                     ; 711   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
2217                     ; 712   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
2219                     ; 715   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
2221  026b 9e            	ld	a,xh
2222  026c a160          	cp	a,#96
2223  026e 260f          	jrne	L3411
2224                     ; 717     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2226  0270 7b05          	ld	a,(OFST+5,sp)
2227  0272 88            	push	a
2228  0273 ae0001        	ldw	x,#1
2229  0276 7b03          	ld	a,(OFST+3,sp)
2230  0278 95            	ld	xh,a
2231  0279 cd0622        	call	L5_TI2_Config
2233  027c 84            	pop	a
2235  027d 200d          	jra	L5411
2236  027f               L3411:
2237                     ; 721     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2239  027f 7b05          	ld	a,(OFST+5,sp)
2240  0281 88            	push	a
2241  0282 ae0001        	ldw	x,#1
2242  0285 7b03          	ld	a,(OFST+3,sp)
2243  0287 95            	ld	xh,a
2244  0288 cd05e5        	call	L3_TI1_Config
2246  028b 84            	pop	a
2247  028c               L5411:
2248                     ; 725   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
2250  028c 7b01          	ld	a,(OFST+1,sp)
2251  028e ad0a          	call	_TIM3_SelectInputTrigger
2253                     ; 728   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
2255  0290 c65282        	ld	a,21122
2256  0293 aa07          	or	a,#7
2257  0295 c75282        	ld	21122,a
2258                     ; 729 }
2261  0298 85            	popw	x
2262  0299 81            	ret
2362                     ; 745 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
2362                     ; 746 {
2363                     	switch	.text
2364  029a               _TIM3_SelectInputTrigger:
2366  029a 88            	push	a
2367  029b 88            	push	a
2368       00000001      OFST:	set	1
2371                     ; 747   uint8_t tmpsmcr = 0;
2373                     ; 750   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
2375                     ; 752   tmpsmcr = TIM3->SMCR;
2377  029c c65282        	ld	a,21122
2378  029f 6b01          	ld	(OFST+0,sp),a
2379                     ; 755   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2381  02a1 7b01          	ld	a,(OFST+0,sp)
2382  02a3 a48f          	and	a,#143
2383  02a5 6b01          	ld	(OFST+0,sp),a
2384                     ; 756   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
2386  02a7 7b01          	ld	a,(OFST+0,sp)
2387  02a9 1a02          	or	a,(OFST+1,sp)
2388  02ab 6b01          	ld	(OFST+0,sp),a
2389                     ; 758   TIM3->SMCR = (uint8_t)tmpsmcr;
2391  02ad 7b01          	ld	a,(OFST+0,sp)
2392  02af c75282        	ld	21122,a
2393                     ; 759 }
2396  02b2 85            	popw	x
2397  02b3 81            	ret
2433                     ; 767 void TIM3_UpdateDisableConfig(FunctionalState NewState)
2433                     ; 768 {
2434                     	switch	.text
2435  02b4               _TIM3_UpdateDisableConfig:
2439                     ; 770   assert_param(IS_FUNCTIONAL_STATE(NewState));
2441                     ; 773   if (NewState != DISABLE)
2443  02b4 4d            	tnz	a
2444  02b5 2706          	jreq	L7221
2445                     ; 775     TIM3->CR1 |= TIM_CR1_UDIS;
2447  02b7 72125280      	bset	21120,#1
2449  02bb 2004          	jra	L1321
2450  02bd               L7221:
2451                     ; 779     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2453  02bd 72135280      	bres	21120,#1
2454  02c1               L1321:
2455                     ; 781 }
2458  02c1 81            	ret
2516                     ; 791 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
2516                     ; 792 {
2517                     	switch	.text
2518  02c2               _TIM3_UpdateRequestConfig:
2522                     ; 794   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
2524                     ; 797   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
2526  02c2 a101          	cp	a,#1
2527  02c4 2606          	jrne	L1621
2528                     ; 799     TIM3->CR1 |= TIM_CR1_URS ;
2530  02c6 72145280      	bset	21120,#2
2532  02ca 2004          	jra	L3621
2533  02cc               L1621:
2534                     ; 803     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
2536  02cc 72155280      	bres	21120,#2
2537  02d0               L3621:
2538                     ; 805 }
2541  02d0 81            	ret
2577                     ; 813 void TIM3_SelectHallSensor(FunctionalState NewState)
2577                     ; 814 {
2578                     	switch	.text
2579  02d1               _TIM3_SelectHallSensor:
2583                     ; 816   assert_param(IS_FUNCTIONAL_STATE(NewState));
2585                     ; 819   if (NewState != DISABLE)
2587  02d1 4d            	tnz	a
2588  02d2 2706          	jreq	L3031
2589                     ; 821     TIM3->CR2 |= TIM_CR2_TI1S;
2591  02d4 721e5281      	bset	21121,#7
2593  02d8 2004          	jra	L5031
2594  02da               L3031:
2595                     ; 825     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2597  02da 721f5281      	bres	21121,#7
2598  02de               L5031:
2599                     ; 827 }
2602  02de 81            	ret
2659                     ; 837 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
2659                     ; 838 {
2660                     	switch	.text
2661  02df               _TIM3_SelectOnePulseMode:
2665                     ; 840   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
2667                     ; 843   if (TIM3_OPMode == TIM3_OPMode_Single)
2669  02df a101          	cp	a,#1
2670  02e1 2606          	jrne	L5331
2671                     ; 845     TIM3->CR1 |= TIM_CR1_OPM ;
2673  02e3 72165280      	bset	21120,#3
2675  02e7 2004          	jra	L7331
2676  02e9               L5331:
2677                     ; 849     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2679  02e9 72175280      	bres	21120,#3
2680  02ed               L7331:
2681                     ; 851 }
2684  02ed 81            	ret
2783                     ; 865 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
2783                     ; 866 {
2784                     	switch	.text
2785  02ee               _TIM3_SelectOutputTrigger:
2787  02ee 88            	push	a
2788  02ef 88            	push	a
2789       00000001      OFST:	set	1
2792                     ; 867   uint8_t tmpcr2 = 0;
2794                     ; 870   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
2796                     ; 872   tmpcr2 = TIM3->CR2;
2798  02f0 c65281        	ld	a,21121
2799  02f3 6b01          	ld	(OFST+0,sp),a
2800                     ; 875   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2802  02f5 7b01          	ld	a,(OFST+0,sp)
2803  02f7 a48f          	and	a,#143
2804  02f9 6b01          	ld	(OFST+0,sp),a
2805                     ; 878   tmpcr2 |= (uint8_t)TIM3_TRGOSource;
2807  02fb 7b01          	ld	a,(OFST+0,sp)
2808  02fd 1a02          	or	a,(OFST+1,sp)
2809  02ff 6b01          	ld	(OFST+0,sp),a
2810                     ; 880   TIM3->CR2 = tmpcr2;
2812  0301 7b01          	ld	a,(OFST+0,sp)
2813  0303 c75281        	ld	21121,a
2814                     ; 881 }
2817  0306 85            	popw	x
2818  0307 81            	ret
2901                     ; 893 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
2901                     ; 894 {
2902                     	switch	.text
2903  0308               _TIM3_SelectSlaveMode:
2905  0308 88            	push	a
2906  0309 88            	push	a
2907       00000001      OFST:	set	1
2910                     ; 895   uint8_t tmpsmcr = 0;
2912                     ; 898   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
2914                     ; 900   tmpsmcr = TIM3->SMCR;
2916  030a c65282        	ld	a,21122
2917  030d 6b01          	ld	(OFST+0,sp),a
2918                     ; 903   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2920  030f 7b01          	ld	a,(OFST+0,sp)
2921  0311 a4f8          	and	a,#248
2922  0313 6b01          	ld	(OFST+0,sp),a
2923                     ; 906   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
2925  0315 7b01          	ld	a,(OFST+0,sp)
2926  0317 1a02          	or	a,(OFST+1,sp)
2927  0319 6b01          	ld	(OFST+0,sp),a
2928                     ; 908   TIM3->SMCR = tmpsmcr;
2930  031b 7b01          	ld	a,(OFST+0,sp)
2931  031d c75282        	ld	21122,a
2932                     ; 909 }
2935  0320 85            	popw	x
2936  0321 81            	ret
2972                     ; 917 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
2972                     ; 918 {
2973                     	switch	.text
2974  0322               _TIM3_SelectMasterSlaveMode:
2978                     ; 920   assert_param(IS_FUNCTIONAL_STATE(NewState));
2980                     ; 923   if (NewState != DISABLE)
2982  0322 4d            	tnz	a
2983  0323 2706          	jreq	L7541
2984                     ; 925     TIM3->SMCR |= TIM_SMCR_MSM;
2986  0325 721e5282      	bset	21122,#7
2988  0329 2004          	jra	L1641
2989  032b               L7541:
2990                     ; 929     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
2992  032b 721f5282      	bres	21122,#7
2993  032f               L1641:
2994                     ; 931 }
2997  032f 81            	ret
3110                     ; 950 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
3110                     ; 951                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
3110                     ; 952                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
3110                     ; 953 {
3111                     	switch	.text
3112  0330               _TIM3_EncoderInterfaceConfig:
3114  0330 89            	pushw	x
3115  0331 5203          	subw	sp,#3
3116       00000003      OFST:	set	3
3119                     ; 954   uint8_t tmpsmcr = 0;
3121                     ; 955   uint8_t tmpccmr1 = 0;
3123                     ; 956   uint8_t tmpccmr2 = 0;
3125                     ; 959   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
3127                     ; 960   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
3129                     ; 961   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
3131                     ; 963   tmpsmcr = TIM3->SMCR;
3133  0333 c65282        	ld	a,21122
3134  0336 6b01          	ld	(OFST-2,sp),a
3135                     ; 964   tmpccmr1 = TIM3->CCMR1;
3137  0338 c65288        	ld	a,21128
3138  033b 6b02          	ld	(OFST-1,sp),a
3139                     ; 965   tmpccmr2 = TIM3->CCMR2;
3141  033d c65289        	ld	a,21129
3142  0340 6b03          	ld	(OFST+0,sp),a
3143                     ; 968   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3145  0342 7b01          	ld	a,(OFST-2,sp)
3146  0344 a4f0          	and	a,#240
3147  0346 6b01          	ld	(OFST-2,sp),a
3148                     ; 969   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
3150  0348 9e            	ld	a,xh
3151  0349 1a01          	or	a,(OFST-2,sp)
3152  034b 6b01          	ld	(OFST-2,sp),a
3153                     ; 972   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3155  034d 7b02          	ld	a,(OFST-1,sp)
3156  034f a4fc          	and	a,#252
3157  0351 6b02          	ld	(OFST-1,sp),a
3158                     ; 973   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3160  0353 7b03          	ld	a,(OFST+0,sp)
3161  0355 a4fc          	and	a,#252
3162  0357 6b03          	ld	(OFST+0,sp),a
3163                     ; 974   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3165  0359 7b02          	ld	a,(OFST-1,sp)
3166  035b aa01          	or	a,#1
3167  035d 6b02          	ld	(OFST-1,sp),a
3168                     ; 975   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3170  035f 7b03          	ld	a,(OFST+0,sp)
3171  0361 aa01          	or	a,#1
3172  0363 6b03          	ld	(OFST+0,sp),a
3173                     ; 978   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
3175  0365 9f            	ld	a,xl
3176  0366 a101          	cp	a,#1
3177  0368 2606          	jrne	L7351
3178                     ; 980     TIM3->CCER1 |= TIM_CCER1_CC1P ;
3180  036a 7212528a      	bset	21130,#1
3182  036e 2004          	jra	L1451
3183  0370               L7351:
3184                     ; 984     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3186  0370 7213528a      	bres	21130,#1
3187  0374               L1451:
3188                     ; 987   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
3190  0374 7b08          	ld	a,(OFST+5,sp)
3191  0376 a101          	cp	a,#1
3192  0378 2606          	jrne	L3451
3193                     ; 989     TIM3->CCER1 |= TIM_CCER1_CC2P ;
3195  037a 721a528a      	bset	21130,#5
3197  037e 2004          	jra	L5451
3198  0380               L3451:
3199                     ; 993     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3201  0380 721b528a      	bres	21130,#5
3202  0384               L5451:
3203                     ; 996   TIM3->SMCR = tmpsmcr;
3205  0384 7b01          	ld	a,(OFST-2,sp)
3206  0386 c75282        	ld	21122,a
3207                     ; 997   TIM3->CCMR1 = tmpccmr1;
3209  0389 7b02          	ld	a,(OFST-1,sp)
3210  038b c75288        	ld	21128,a
3211                     ; 998   TIM3->CCMR2 = tmpccmr2;
3213  038e 7b03          	ld	a,(OFST+0,sp)
3214  0390 c75289        	ld	21129,a
3215                     ; 999 }
3218  0393 5b05          	addw	sp,#5
3219  0395 81            	ret
3287                     ; 1019 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef TIM3_Prescaler,
3287                     ; 1020                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
3287                     ; 1021 {
3288                     	switch	.text
3289  0396               _TIM3_PrescalerConfig:
3293                     ; 1023   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
3295                     ; 1024   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
3297                     ; 1027   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
3299  0396 9e            	ld	a,xh
3300  0397 c7528d        	ld	21133,a
3301                     ; 1031   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
3303  039a 9f            	ld	a,xl
3304  039b a101          	cp	a,#1
3305  039d 2606          	jrne	L1061
3306                     ; 1033     TIM3->EGR |= TIM_EGR_UG ;
3308  039f 72105287      	bset	21127,#0
3310  03a3 2004          	jra	L3061
3311  03a5               L1061:
3312                     ; 1037     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3314  03a5 72115287      	bres	21127,#0
3315  03a9               L3061:
3316                     ; 1039 }
3319  03a9 81            	ret
3364                     ; 1052 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
3364                     ; 1053 {
3365                     	switch	.text
3366  03aa               _TIM3_CounterModeConfig:
3368  03aa 88            	push	a
3369  03ab 88            	push	a
3370       00000001      OFST:	set	1
3373                     ; 1054   uint8_t tmpcr1 = 0;
3375                     ; 1057   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
3377                     ; 1059   tmpcr1 = TIM3->CR1;
3379  03ac c65280        	ld	a,21120
3380  03af 6b01          	ld	(OFST+0,sp),a
3381                     ; 1062   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3383  03b1 7b01          	ld	a,(OFST+0,sp)
3384  03b3 a48f          	and	a,#143
3385  03b5 6b01          	ld	(OFST+0,sp),a
3386                     ; 1065   tmpcr1 |= (uint8_t)TIM3_CounterMode;
3388  03b7 7b01          	ld	a,(OFST+0,sp)
3389  03b9 1a02          	or	a,(OFST+1,sp)
3390  03bb 6b01          	ld	(OFST+0,sp),a
3391                     ; 1067   TIM3->CR1 = tmpcr1;
3393  03bd 7b01          	ld	a,(OFST+0,sp)
3394  03bf c75280        	ld	21120,a
3395                     ; 1068 }
3398  03c2 85            	popw	x
3399  03c3 81            	ret
3466                     ; 1078 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3466                     ; 1079 {
3467                     	switch	.text
3468  03c4               _TIM3_ForcedOC1Config:
3470  03c4 88            	push	a
3471  03c5 88            	push	a
3472       00000001      OFST:	set	1
3475                     ; 1080   uint8_t tmpccmr1 = 0;
3477                     ; 1083   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3479                     ; 1085   tmpccmr1 = TIM3->CCMR1;
3481  03c6 c65288        	ld	a,21128
3482  03c9 6b01          	ld	(OFST+0,sp),a
3483                     ; 1088   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3485  03cb 7b01          	ld	a,(OFST+0,sp)
3486  03cd a48f          	and	a,#143
3487  03cf 6b01          	ld	(OFST+0,sp),a
3488                     ; 1091   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
3490  03d1 7b01          	ld	a,(OFST+0,sp)
3491  03d3 1a02          	or	a,(OFST+1,sp)
3492  03d5 6b01          	ld	(OFST+0,sp),a
3493                     ; 1093   TIM3->CCMR1 = tmpccmr1;
3495  03d7 7b01          	ld	a,(OFST+0,sp)
3496  03d9 c75288        	ld	21128,a
3497                     ; 1094 }
3500  03dc 85            	popw	x
3501  03dd 81            	ret
3546                     ; 1104 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3546                     ; 1105 {
3547                     	switch	.text
3548  03de               _TIM3_ForcedOC2Config:
3550  03de 88            	push	a
3551  03df 88            	push	a
3552       00000001      OFST:	set	1
3555                     ; 1106   uint8_t tmpccmr2 = 0;
3557                     ; 1109   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3559                     ; 1111   tmpccmr2 = TIM3->CCMR2;
3561  03e0 c65289        	ld	a,21129
3562  03e3 6b01          	ld	(OFST+0,sp),a
3563                     ; 1114   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3565  03e5 7b01          	ld	a,(OFST+0,sp)
3566  03e7 a48f          	and	a,#143
3567  03e9 6b01          	ld	(OFST+0,sp),a
3568                     ; 1117   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
3570  03eb 7b01          	ld	a,(OFST+0,sp)
3571  03ed 1a02          	or	a,(OFST+1,sp)
3572  03ef 6b01          	ld	(OFST+0,sp),a
3573                     ; 1119   TIM3->CCMR2 = tmpccmr2;
3575  03f1 7b01          	ld	a,(OFST+0,sp)
3576  03f3 c75289        	ld	21129,a
3577                     ; 1120 }
3580  03f6 85            	popw	x
3581  03f7 81            	ret
3617                     ; 1128 void TIM3_ARRPreloadConfig(FunctionalState NewState)
3617                     ; 1129 {
3618                     	switch	.text
3619  03f8               _TIM3_ARRPreloadConfig:
3623                     ; 1131   assert_param(IS_FUNCTIONAL_STATE(NewState));
3625                     ; 1134   if (NewState != DISABLE)
3627  03f8 4d            	tnz	a
3628  03f9 2706          	jreq	L1271
3629                     ; 1136     TIM3->CR1 |= TIM_CR1_ARPE;
3631  03fb 721e5280      	bset	21120,#7
3633  03ff 2004          	jra	L3271
3634  0401               L1271:
3635                     ; 1140     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3637  0401 721f5280      	bres	21120,#7
3638  0405               L3271:
3639                     ; 1142 }
3642  0405 81            	ret
3678                     ; 1150 void TIM3_OC1PreloadConfig(FunctionalState NewState)
3678                     ; 1151 {
3679                     	switch	.text
3680  0406               _TIM3_OC1PreloadConfig:
3684                     ; 1153   assert_param(IS_FUNCTIONAL_STATE(NewState));
3686                     ; 1156   if (NewState != DISABLE)
3688  0406 4d            	tnz	a
3689  0407 2706          	jreq	L3471
3690                     ; 1158     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
3692  0409 72165288      	bset	21128,#3
3694  040d 2004          	jra	L5471
3695  040f               L3471:
3696                     ; 1162     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3698  040f 72175288      	bres	21128,#3
3699  0413               L5471:
3700                     ; 1164 }
3703  0413 81            	ret
3739                     ; 1172 void TIM3_OC2PreloadConfig(FunctionalState NewState)
3739                     ; 1173 {
3740                     	switch	.text
3741  0414               _TIM3_OC2PreloadConfig:
3745                     ; 1175   assert_param(IS_FUNCTIONAL_STATE(NewState));
3747                     ; 1178   if (NewState != DISABLE)
3749  0414 4d            	tnz	a
3750  0415 2706          	jreq	L5671
3751                     ; 1180     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
3753  0417 72165289      	bset	21129,#3
3755  041b 2004          	jra	L7671
3756  041d               L5671:
3757                     ; 1184     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3759  041d 72175289      	bres	21129,#3
3760  0421               L7671:
3761                     ; 1186 }
3764  0421 81            	ret
3799                     ; 1194 void TIM3_OC1FastCmd(FunctionalState NewState)
3799                     ; 1195 {
3800                     	switch	.text
3801  0422               _TIM3_OC1FastCmd:
3805                     ; 1197   assert_param(IS_FUNCTIONAL_STATE(NewState));
3807                     ; 1200   if (NewState != DISABLE)
3809  0422 4d            	tnz	a
3810  0423 2706          	jreq	L7002
3811                     ; 1202     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
3813  0425 72145288      	bset	21128,#2
3815  0429 2004          	jra	L1102
3816  042b               L7002:
3817                     ; 1206     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3819  042b 72155288      	bres	21128,#2
3820  042f               L1102:
3821                     ; 1208 }
3824  042f 81            	ret
3859                     ; 1216 void TIM3_OC2FastCmd(FunctionalState NewState)
3859                     ; 1217 {
3860                     	switch	.text
3861  0430               _TIM3_OC2FastCmd:
3865                     ; 1219   assert_param(IS_FUNCTIONAL_STATE(NewState));
3867                     ; 1222   if (NewState != DISABLE)
3869  0430 4d            	tnz	a
3870  0431 2706          	jreq	L1302
3871                     ; 1224     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
3873  0433 72145289      	bset	21129,#2
3875  0437 2004          	jra	L3302
3876  0439               L1302:
3877                     ; 1228     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3879  0439 72155289      	bres	21129,#2
3880  043d               L3302:
3881                     ; 1230 }
3884  043d 81            	ret
3965                     ; 1243 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
3965                     ; 1244 {
3966                     	switch	.text
3967  043e               _TIM3_GenerateEvent:
3971                     ; 1246   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
3973                     ; 1249   TIM3->EGR |= (uint8_t)TIM3_EventSource;
3975  043e ca5287        	or	a,21127
3976  0441 c75287        	ld	21127,a
3977                     ; 1250 }
3980  0444 81            	ret
4016                     ; 1260 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4016                     ; 1261 {
4017                     	switch	.text
4018  0445               _TIM3_OC1PolarityConfig:
4022                     ; 1263   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4024                     ; 1266   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4026  0445 a101          	cp	a,#1
4027  0447 2606          	jrne	L7012
4028                     ; 1268     TIM3->CCER1 |= TIM_CCER1_CC1P ;
4030  0449 7212528a      	bset	21130,#1
4032  044d 2004          	jra	L1112
4033  044f               L7012:
4034                     ; 1272     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
4036  044f 7213528a      	bres	21130,#1
4037  0453               L1112:
4038                     ; 1274 }
4041  0453 81            	ret
4077                     ; 1284 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4077                     ; 1285 {
4078                     	switch	.text
4079  0454               _TIM3_OC2PolarityConfig:
4083                     ; 1287   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4085                     ; 1290   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4087  0454 a101          	cp	a,#1
4088  0456 2606          	jrne	L1312
4089                     ; 1292     TIM3->CCER1 |= TIM_CCER1_CC2P ;
4091  0458 721a528a      	bset	21130,#5
4093  045c 2004          	jra	L3312
4094  045e               L1312:
4095                     ; 1296     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4097  045e 721b528a      	bres	21130,#5
4098  0462               L3312:
4099                     ; 1298 }
4102  0462 81            	ret
4147                     ; 1310 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel,
4147                     ; 1311                  FunctionalState NewState)
4147                     ; 1312 {
4148                     	switch	.text
4149  0463               _TIM3_CCxCmd:
4151  0463 89            	pushw	x
4152       00000000      OFST:	set	0
4155                     ; 1314   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4157                     ; 1315   assert_param(IS_FUNCTIONAL_STATE(NewState));
4159                     ; 1317   if (TIM3_Channel == TIM3_Channel_1)
4161  0464 9e            	ld	a,xh
4162  0465 4d            	tnz	a
4163  0466 2610          	jrne	L7512
4164                     ; 1320     if (NewState != DISABLE)
4166  0468 9f            	ld	a,xl
4167  0469 4d            	tnz	a
4168  046a 2706          	jreq	L1612
4169                     ; 1322       TIM3->CCER1 |= TIM_CCER1_CC1E ;
4171  046c 7210528a      	bset	21130,#0
4173  0470 2014          	jra	L5612
4174  0472               L1612:
4175                     ; 1326       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4177  0472 7211528a      	bres	21130,#0
4178  0476 200e          	jra	L5612
4179  0478               L7512:
4180                     ; 1333     if (NewState != DISABLE)
4182  0478 0d02          	tnz	(OFST+2,sp)
4183  047a 2706          	jreq	L7612
4184                     ; 1335       TIM3->CCER1 |= TIM_CCER1_CC2E;
4186  047c 7218528a      	bset	21130,#4
4188  0480 2004          	jra	L5612
4189  0482               L7612:
4190                     ; 1339       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4192  0482 7219528a      	bres	21130,#4
4193  0486               L5612:
4194                     ; 1343 }
4197  0486 85            	popw	x
4198  0487 81            	ret
4243                     ; 1362 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
4243                     ; 1363                      TIM3_OCMode_TypeDef TIM3_OCMode)
4243                     ; 1364 {
4244                     	switch	.text
4245  0488               _TIM3_SelectOCxM:
4247  0488 89            	pushw	x
4248       00000000      OFST:	set	0
4251                     ; 1366   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4253                     ; 1367   assert_param(IS_TIM3_OCM(TIM3_OCMode));
4255                     ; 1369   if (TIM3_Channel == TIM3_Channel_1)
4257  0489 9e            	ld	a,xh
4258  048a 4d            	tnz	a
4259  048b 2615          	jrne	L5122
4260                     ; 1372     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4262  048d 7211528a      	bres	21130,#0
4263                     ; 1375     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4265  0491 c65288        	ld	a,21128
4266  0494 a48f          	and	a,#143
4267  0496 c75288        	ld	21128,a
4268                     ; 1378     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
4270  0499 9f            	ld	a,xl
4271  049a ca5288        	or	a,21128
4272  049d c75288        	ld	21128,a
4274  04a0 2014          	jra	L7122
4275  04a2               L5122:
4276                     ; 1383     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4278  04a2 7219528a      	bres	21130,#4
4279                     ; 1386     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4281  04a6 c65289        	ld	a,21129
4282  04a9 a48f          	and	a,#143
4283  04ab c75289        	ld	21129,a
4284                     ; 1389     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
4286  04ae c65289        	ld	a,21129
4287  04b1 1a02          	or	a,(OFST+2,sp)
4288  04b3 c75289        	ld	21129,a
4289  04b6               L7122:
4290                     ; 1391 }
4293  04b6 85            	popw	x
4294  04b7 81            	ret
4328                     ; 1399 void TIM3_SetCounter(uint16_t TIM3_Counter)
4328                     ; 1400 {
4329                     	switch	.text
4330  04b8               _TIM3_SetCounter:
4334                     ; 1403   TIM3->CNTRH = (uint8_t)(TIM3_Counter >> 8);
4336  04b8 9e            	ld	a,xh
4337  04b9 c7528b        	ld	21131,a
4338                     ; 1404   TIM3->CNTRL = (uint8_t)(TIM3_Counter);
4340  04bc 9f            	ld	a,xl
4341  04bd c7528c        	ld	21132,a
4342                     ; 1405 }
4345  04c0 81            	ret
4379                     ; 1413 void TIM3_SetAutoreload(uint16_t TIM3_Autoreload)
4379                     ; 1414 {
4380                     	switch	.text
4381  04c1               _TIM3_SetAutoreload:
4385                     ; 1416   TIM3->ARRH = (uint8_t)(TIM3_Autoreload >> 8);
4387  04c1 9e            	ld	a,xh
4388  04c2 c7528e        	ld	21134,a
4389                     ; 1417   TIM3->ARRL = (uint8_t)(TIM3_Autoreload);
4391  04c5 9f            	ld	a,xl
4392  04c6 c7528f        	ld	21135,a
4393                     ; 1418 }
4396  04c9 81            	ret
4430                     ; 1426 void TIM3_SetCompare1(uint16_t TIM3_Compare)
4430                     ; 1427 {
4431                     	switch	.text
4432  04ca               _TIM3_SetCompare1:
4436                     ; 1429   TIM3->CCR1H = (uint8_t)(TIM3_Compare >> 8);
4438  04ca 9e            	ld	a,xh
4439  04cb c75290        	ld	21136,a
4440                     ; 1430   TIM3->CCR1L = (uint8_t)(TIM3_Compare);
4442  04ce 9f            	ld	a,xl
4443  04cf c75291        	ld	21137,a
4444                     ; 1431 }
4447  04d2 81            	ret
4481                     ; 1439 void TIM3_SetCompare2(uint16_t TIM3_Compare)
4481                     ; 1440 {
4482                     	switch	.text
4483  04d3               _TIM3_SetCompare2:
4487                     ; 1442   TIM3->CCR2H = (uint8_t)(TIM3_Compare >> 8);
4489  04d3 9e            	ld	a,xh
4490  04d4 c75292        	ld	21138,a
4491                     ; 1443   TIM3->CCR2L = (uint8_t)(TIM3_Compare);
4493  04d7 9f            	ld	a,xl
4494  04d8 c75293        	ld	21139,a
4495                     ; 1444 }
4498  04db 81            	ret
4543                     ; 1456 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
4543                     ; 1457 {
4544                     	switch	.text
4545  04dc               _TIM3_SetIC1Prescaler:
4547  04dc 88            	push	a
4548  04dd 88            	push	a
4549       00000001      OFST:	set	1
4552                     ; 1458   uint8_t tmpccmr1 = 0;
4554                     ; 1461   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
4556                     ; 1463   tmpccmr1 = TIM3->CCMR1;
4558  04de c65288        	ld	a,21128
4559  04e1 6b01          	ld	(OFST+0,sp),a
4560                     ; 1466   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4562  04e3 7b01          	ld	a,(OFST+0,sp)
4563  04e5 a4f3          	and	a,#243
4564  04e7 6b01          	ld	(OFST+0,sp),a
4565                     ; 1469   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
4567  04e9 7b01          	ld	a,(OFST+0,sp)
4568  04eb 1a02          	or	a,(OFST+1,sp)
4569  04ed 6b01          	ld	(OFST+0,sp),a
4570                     ; 1471   TIM3->CCMR1 = tmpccmr1;
4572  04ef 7b01          	ld	a,(OFST+0,sp)
4573  04f1 c75288        	ld	21128,a
4574                     ; 1472 }
4577  04f4 85            	popw	x
4578  04f5 81            	ret
4623                     ; 1484 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
4623                     ; 1485 {
4624                     	switch	.text
4625  04f6               _TIM3_SetIC2Prescaler:
4627  04f6 88            	push	a
4628  04f7 88            	push	a
4629       00000001      OFST:	set	1
4632                     ; 1486   uint8_t tmpccmr2 = 0;
4634                     ; 1489   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
4636                     ; 1491   tmpccmr2 = TIM3->CCMR2;
4638  04f8 c65289        	ld	a,21129
4639  04fb 6b01          	ld	(OFST+0,sp),a
4640                     ; 1494   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4642  04fd 7b01          	ld	a,(OFST+0,sp)
4643  04ff a4f3          	and	a,#243
4644  0501 6b01          	ld	(OFST+0,sp),a
4645                     ; 1497   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
4647  0503 7b01          	ld	a,(OFST+0,sp)
4648  0505 1a02          	or	a,(OFST+1,sp)
4649  0507 6b01          	ld	(OFST+0,sp),a
4650                     ; 1499   TIM3->CCMR2 = tmpccmr2;
4652  0509 7b01          	ld	a,(OFST+0,sp)
4653  050b c75289        	ld	21129,a
4654                     ; 1500 }
4657  050e 85            	popw	x
4658  050f 81            	ret
4710                     ; 1507 uint16_t TIM3_GetCapture1(void)
4710                     ; 1508 {
4711                     	switch	.text
4712  0510               _TIM3_GetCapture1:
4714  0510 5204          	subw	sp,#4
4715       00000004      OFST:	set	4
4718                     ; 1509   uint16_t tmpccr1 = 0;
4720                     ; 1512   tmpccr1h = TIM3->CCR1H;
4722  0512 c65290        	ld	a,21136
4723  0515 6b02          	ld	(OFST-2,sp),a
4724                     ; 1513   tmpccr1l = TIM3->CCR1L;
4726  0517 c65291        	ld	a,21137
4727  051a 6b01          	ld	(OFST-3,sp),a
4728                     ; 1515   tmpccr1 = (uint16_t)(tmpccr1l);
4730  051c 7b01          	ld	a,(OFST-3,sp)
4731  051e 5f            	clrw	x
4732  051f 97            	ld	xl,a
4733  0520 1f03          	ldw	(OFST-1,sp),x
4734                     ; 1516   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
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
4747                     ; 1518   return ((uint16_t)tmpccr1);
4749  0531 1e03          	ldw	x,(OFST-1,sp)
4752  0533 5b04          	addw	sp,#4
4753  0535 81            	ret
4805                     ; 1526 uint16_t TIM3_GetCapture2(void)
4805                     ; 1527 {
4806                     	switch	.text
4807  0536               _TIM3_GetCapture2:
4809  0536 5204          	subw	sp,#4
4810       00000004      OFST:	set	4
4813                     ; 1528   uint16_t tmpccr2 = 0;
4815                     ; 1531   tmpccr2h = TIM3->CCR2H;
4817  0538 c65292        	ld	a,21138
4818  053b 6b02          	ld	(OFST-2,sp),a
4819                     ; 1532   tmpccr2l = TIM3->CCR2L;
4821  053d c65293        	ld	a,21139
4822  0540 6b01          	ld	(OFST-3,sp),a
4823                     ; 1534   tmpccr2 = (uint16_t)(tmpccr2l);
4825  0542 7b01          	ld	a,(OFST-3,sp)
4826  0544 5f            	clrw	x
4827  0545 97            	ld	xl,a
4828  0546 1f03          	ldw	(OFST-1,sp),x
4829                     ; 1535   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
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
4842                     ; 1537   return ((uint16_t)tmpccr2);
4844  0557 1e03          	ldw	x,(OFST-1,sp)
4847  0559 5b04          	addw	sp,#4
4848  055b 81            	ret
4900                     ; 1545 uint16_t TIM3_GetCounter(void)
4900                     ; 1546 {
4901                     	switch	.text
4902  055c               _TIM3_GetCounter:
4904  055c 5204          	subw	sp,#4
4905       00000004      OFST:	set	4
4908                     ; 1547   uint16_t tmpcnt = 0;
4910                     ; 1550   tmpcntrh = TIM3->CNTRH;
4912  055e c6528b        	ld	a,21131
4913  0561 6b02          	ld	(OFST-2,sp),a
4914                     ; 1551   tmpcntrl = TIM3->CNTRL;
4916  0563 c6528c        	ld	a,21132
4917  0566 6b01          	ld	(OFST-3,sp),a
4918                     ; 1553   tmpcnt = (uint16_t)(tmpcntrl);
4920  0568 7b01          	ld	a,(OFST-3,sp)
4921  056a 5f            	clrw	x
4922  056b 97            	ld	xl,a
4923  056c 1f03          	ldw	(OFST-1,sp),x
4924                     ; 1554   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
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
4937                     ; 1556   return ((uint16_t)tmpcnt);
4939  057d 1e03          	ldw	x,(OFST-1,sp)
4942  057f 5b04          	addw	sp,#4
4943  0581 81            	ret
4967                     ; 1572 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
4967                     ; 1573 {
4968                     	switch	.text
4969  0582               _TIM3_GetPrescaler:
4973                     ; 1575   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
4975  0582 c6528d        	ld	a,21133
4978  0585 81            	ret
5117                     ; 1591 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
5117                     ; 1592 {
5118                     	switch	.text
5119  0586               _TIM3_GetFlagStatus:
5121  0586 89            	pushw	x
5122  0587 89            	pushw	x
5123       00000002      OFST:	set	2
5126                     ; 1593   FlagStatus bitstatus = RESET;
5128                     ; 1597   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
5130                     ; 1599   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
5132  0588 9f            	ld	a,xl
5133  0589 c45285        	and	a,21125
5134  058c 6b01          	ld	(OFST-1,sp),a
5135                     ; 1600   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
5137  058e c65286        	ld	a,21126
5138  0591 1403          	and	a,(OFST+1,sp)
5139  0593 6b02          	ld	(OFST+0,sp),a
5140                     ; 1602   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
5142  0595 7b01          	ld	a,(OFST-1,sp)
5143  0597 1a02          	or	a,(OFST+0,sp)
5144  0599 2706          	jreq	L3552
5145                     ; 1604     bitstatus = SET;
5147  059b a601          	ld	a,#1
5148  059d 6b02          	ld	(OFST+0,sp),a
5150  059f 2002          	jra	L5552
5151  05a1               L3552:
5152                     ; 1608     bitstatus = RESET;
5154  05a1 0f02          	clr	(OFST+0,sp)
5155  05a3               L5552:
5156                     ; 1610   return ((FlagStatus)bitstatus);
5158  05a3 7b02          	ld	a,(OFST+0,sp)
5161  05a5 5b04          	addw	sp,#4
5162  05a7 81            	ret
5197                     ; 1624 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
5197                     ; 1625 {
5198                     	switch	.text
5199  05a8               _TIM3_ClearFlag:
5201  05a8 89            	pushw	x
5202       00000000      OFST:	set	0
5205                     ; 1627   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
5207                     ; 1629   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
5209  05a9 9f            	ld	a,xl
5210  05aa 43            	cpl	a
5211  05ab c75285        	ld	21125,a
5212                     ; 1630   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
5214  05ae 7b01          	ld	a,(OFST+1,sp)
5215  05b0 43            	cpl	a
5216  05b1 c75286        	ld	21126,a
5217                     ; 1631 }
5220  05b4 85            	popw	x
5221  05b5 81            	ret
5285                     ; 1644 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
5285                     ; 1645 {
5286                     	switch	.text
5287  05b6               _TIM3_GetITStatus:
5289  05b6 88            	push	a
5290  05b7 5203          	subw	sp,#3
5291       00000003      OFST:	set	3
5294                     ; 1646   __IO ITStatus bitstatus = RESET;
5296  05b9 0f03          	clr	(OFST+0,sp)
5297                     ; 1648   __IO uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
5299  05bb 0f01          	clr	(OFST-2,sp)
5302  05bd 0f02          	clr	(OFST-1,sp)
5303                     ; 1651   assert_param(IS_TIM3_GET_IT(TIM3_IT));
5305                     ; 1653   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
5307  05bf c45285        	and	a,21125
5308  05c2 6b01          	ld	(OFST-2,sp),a
5309                     ; 1655   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
5311  05c4 c65284        	ld	a,21124
5312  05c7 1404          	and	a,(OFST+1,sp)
5313  05c9 6b02          	ld	(OFST-1,sp),a
5314                     ; 1657   if ((TIM3_itStatus != (uint8_t)RESET) && (TIM3_itEnable != (uint8_t)RESET))
5316  05cb 0d01          	tnz	(OFST-2,sp)
5317  05cd 270a          	jreq	L7262
5319  05cf 0d02          	tnz	(OFST-1,sp)
5320  05d1 2706          	jreq	L7262
5321                     ; 1659     bitstatus = (ITStatus)SET;
5323  05d3 a601          	ld	a,#1
5324  05d5 6b03          	ld	(OFST+0,sp),a
5326  05d7 2002          	jra	L1362
5327  05d9               L7262:
5328                     ; 1663     bitstatus = (ITStatus)RESET;
5330  05d9 0f03          	clr	(OFST+0,sp)
5331  05db               L1362:
5332                     ; 1665   return ((ITStatus)bitstatus);
5334  05db 7b03          	ld	a,(OFST+0,sp)
5337  05dd 5b04          	addw	sp,#4
5338  05df 81            	ret
5374                     ; 1679 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
5374                     ; 1680 {
5375                     	switch	.text
5376  05e0               _TIM3_ClearITPendingBit:
5380                     ; 1682   assert_param(IS_TIM3_IT(TIM3_IT));
5382                     ; 1685   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
5384  05e0 43            	cpl	a
5385  05e1 c75285        	ld	21125,a
5386                     ; 1686 }
5389  05e4 81            	ret
5461                     ; 1703 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5461                     ; 1704                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5461                     ; 1705                        uint8_t TIM3_ICFilter)
5461                     ; 1706 {
5462                     	switch	.text
5463  05e5               L3_TI1_Config:
5465  05e5 89            	pushw	x
5466  05e6 89            	pushw	x
5467       00000002      OFST:	set	2
5470                     ; 1707   uint8_t tmpccmr1 = 0;
5472                     ; 1708   uint8_t tmpicpolarity = (uint8_t)TIM3_ICPolarity;
5474  05e7 9e            	ld	a,xh
5475  05e8 6b01          	ld	(OFST-1,sp),a
5476                     ; 1709   tmpccmr1 = TIM3->CCMR1;
5478  05ea c65288        	ld	a,21128
5479  05ed 6b02          	ld	(OFST+0,sp),a
5480                     ; 1712   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5482                     ; 1713   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5484                     ; 1714   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5486                     ; 1717   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5488  05ef 7211528a      	bres	21130,#0
5489                     ; 1720   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5491  05f3 7b02          	ld	a,(OFST+0,sp)
5492  05f5 a40c          	and	a,#12
5493  05f7 6b02          	ld	(OFST+0,sp),a
5494                     ; 1721   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5496  05f9 7b07          	ld	a,(OFST+5,sp)
5497  05fb 97            	ld	xl,a
5498  05fc a610          	ld	a,#16
5499  05fe 42            	mul	x,a
5500  05ff 9f            	ld	a,xl
5501  0600 1a04          	or	a,(OFST+2,sp)
5502  0602 1a02          	or	a,(OFST+0,sp)
5503  0604 6b02          	ld	(OFST+0,sp),a
5504                     ; 1723   TIM3->CCMR1 = tmpccmr1;
5506  0606 7b02          	ld	a,(OFST+0,sp)
5507  0608 c75288        	ld	21128,a
5508                     ; 1726   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
5510  060b 7b01          	ld	a,(OFST-1,sp)
5511  060d a101          	cp	a,#1
5512  060f 2606          	jrne	L7072
5513                     ; 1728     TIM3->CCER1 |= TIM_CCER1_CC1P;
5515  0611 7212528a      	bset	21130,#1
5517  0615 2004          	jra	L1172
5518  0617               L7072:
5519                     ; 1732     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5521  0617 7213528a      	bres	21130,#1
5522  061b               L1172:
5523                     ; 1736   TIM3->CCER1 |=  TIM_CCER1_CC1E;
5525  061b 7210528a      	bset	21130,#0
5526                     ; 1737 }
5529  061f 5b04          	addw	sp,#4
5530  0621 81            	ret
5602                     ; 1754 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5602                     ; 1755                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5602                     ; 1756                        uint8_t TIM3_ICFilter)
5602                     ; 1757 {
5603                     	switch	.text
5604  0622               L5_TI2_Config:
5606  0622 89            	pushw	x
5607  0623 89            	pushw	x
5608       00000002      OFST:	set	2
5611                     ; 1758   uint8_t tmpccmr2 = 0;
5613                     ; 1759   uint8_t tmpicpolarity = (uint8_t)TIM3_ICPolarity;
5615  0624 9e            	ld	a,xh
5616  0625 6b01          	ld	(OFST-1,sp),a
5617                     ; 1762   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5619                     ; 1763   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5621                     ; 1764   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5623                     ; 1766   tmpccmr2 = TIM3->CCMR2;
5625  0627 c65289        	ld	a,21129
5626  062a 6b02          	ld	(OFST+0,sp),a
5627                     ; 1769   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
5629  062c 7219528a      	bres	21130,#4
5630                     ; 1772   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5632  0630 7b02          	ld	a,(OFST+0,sp)
5633  0632 a40c          	and	a,#12
5634  0634 6b02          	ld	(OFST+0,sp),a
5635                     ; 1773   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5637  0636 7b07          	ld	a,(OFST+5,sp)
5638  0638 97            	ld	xl,a
5639  0639 a610          	ld	a,#16
5640  063b 42            	mul	x,a
5641  063c 9f            	ld	a,xl
5642  063d 1a04          	or	a,(OFST+2,sp)
5643  063f 1a02          	or	a,(OFST+0,sp)
5644  0641 6b02          	ld	(OFST+0,sp),a
5645                     ; 1775   TIM3->CCMR2 = tmpccmr2;
5647  0643 7b02          	ld	a,(OFST+0,sp)
5648  0645 c75289        	ld	21129,a
5649                     ; 1778   if (tmpicpolarity == (uint8_t)TIM3_ICPolarity_Falling)
5651  0648 7b01          	ld	a,(OFST-1,sp)
5652  064a a101          	cp	a,#1
5653  064c 2606          	jrne	L1572
5654                     ; 1780     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5656  064e 721a528a      	bset	21130,#5
5658  0652 2004          	jra	L3572
5659  0654               L1572:
5660                     ; 1784     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5662  0654 721b528a      	bres	21130,#5
5663  0658               L3572:
5664                     ; 1788   TIM3->CCER1 |=  TIM_CCER1_CC2E;
5666  0658 7218528a      	bset	21130,#4
5667                     ; 1789 }
5670  065c 5b04          	addw	sp,#4
5671  065e 81            	ret
5695                     ; 1797 FunctionalState TIM3_GetStatus(void)
5695                     ; 1798 {
5696                     	switch	.text
5697  065f               _TIM3_GetStatus:
5701                     ; 1799   return ((FunctionalState)(TIM3->CR1 & TIM_CR1_CEN));
5703  065f c65280        	ld	a,21120
5704  0662 a401          	and	a,#1
5707  0664 81            	ret
5720                     	xdef	_TIM3_ClearITPendingBit
5721                     	xdef	_TIM3_GetITStatus
5722                     	xdef	_TIM3_ClearFlag
5723                     	xdef	_TIM3_GetFlagStatus
5724                     	xdef	_TIM3_GetPrescaler
5725                     	xdef	_TIM3_GetCounter
5726                     	xdef	_TIM3_GetCapture2
5727                     	xdef	_TIM3_GetCapture1
5728                     	xdef	_TIM3_SetIC2Prescaler
5729                     	xdef	_TIM3_SetIC1Prescaler
5730                     	xdef	_TIM3_SetCompare2
5731                     	xdef	_TIM3_SetCompare1
5732                     	xdef	_TIM3_SetAutoreload
5733                     	xdef	_TIM3_SetCounter
5734                     	xdef	_TIM3_SelectOCxM
5735                     	xdef	_TIM3_CCxCmd
5736                     	xdef	_TIM3_OC2PolarityConfig
5737                     	xdef	_TIM3_OC1PolarityConfig
5738                     	xdef	_TIM3_GenerateEvent
5739                     	xdef	_TIM3_OC2FastCmd
5740                     	xdef	_TIM3_OC1FastCmd
5741                     	xdef	_TIM3_OC2PreloadConfig
5742                     	xdef	_TIM3_OC1PreloadConfig
5743                     	xdef	_TIM3_ARRPreloadConfig
5744                     	xdef	_TIM3_ForcedOC2Config
5745                     	xdef	_TIM3_ForcedOC1Config
5746                     	xdef	_TIM3_CounterModeConfig
5747                     	xdef	_TIM3_PrescalerConfig
5748                     	xdef	_TIM3_EncoderInterfaceConfig
5749                     	xdef	_TIM3_SelectMasterSlaveMode
5750                     	xdef	_TIM3_SelectSlaveMode
5751                     	xdef	_TIM3_SelectOutputTrigger
5752                     	xdef	_TIM3_SelectOnePulseMode
5753                     	xdef	_TIM3_SelectHallSensor
5754                     	xdef	_TIM3_UpdateRequestConfig
5755                     	xdef	_TIM3_UpdateDisableConfig
5756                     	xdef	_TIM3_SelectInputTrigger
5757                     	xdef	_TIM3_TIxExternalClockConfig
5758                     	xdef	_TIM3_ETRConfig
5759                     	xdef	_TIM3_ETRClockMode2Config
5760                     	xdef	_TIM3_ETRClockMode1Config
5761                     	xdef	_TIM3_InternalClockConfig
5762                     	xdef	_TIM3_ITConfig
5763                     	xdef	_TIM3_CtrlPWMOutputs
5764                     	xdef	_TIM3_GetStatus
5765                     	xdef	_TIM3_Cmd
5766                     	xdef	_TIM3_PWMIConfig
5767                     	xdef	_TIM3_ICInit
5768                     	xdef	_TIM3_BKRConfig
5769                     	xdef	_TIM3_OC2Init
5770                     	xdef	_TIM3_OC1Init
5771                     	xdef	_TIM3_TimeBaseInit
5772                     	xdef	_TIM3_DeInit
5791                     	end
