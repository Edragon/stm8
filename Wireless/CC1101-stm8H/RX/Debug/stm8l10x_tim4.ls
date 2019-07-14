   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 56 void TIM4_DeInit(void)
  43                     ; 57 {
  45                     	switch	.text
  46  0000               _TIM4_DeInit:
  50                     ; 58   TIM4->CR1  = TIM4_CR1_RESET_VALUE;
  52  0000 725f52e0      	clr	21216
  53                     ; 59   TIM4->CR2  = TIM4_CR2_RESET_VALUE;
  55  0004 725f52e1      	clr	21217
  56                     ; 60   TIM4->SMCR  = TIM4_SMCR_RESET_VALUE;
  58  0008 725f52e2      	clr	21218
  59                     ; 61   TIM4->IER  = TIM4_IER_RESET_VALUE;
  61  000c 725f52e3      	clr	21219
  62                     ; 62   TIM4->CNTR  = TIM4_CNTR_RESET_VALUE;
  64  0010 725f52e6      	clr	21222
  65                     ; 63   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  67  0014 725f52e7      	clr	21223
  68                     ; 64   TIM4->ARR  = TIM4_ARR_RESET_VALUE;
  70  0018 35ff52e8      	mov	21224,#255
  71                     ; 65   TIM4->SR1  = TIM4_SR1_RESET_VALUE;
  73  001c 725f52e4      	clr	21220
  74                     ; 66 }
  77  0020 81            	ret
 245                     ; 91 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 245                     ; 92                        uint8_t TIM4_Period)
 245                     ; 93 {
 246                     	switch	.text
 247  0021               _TIM4_TimeBaseInit:
 251                     ; 95   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
 253                     ; 97   TIM4->ARR = (uint8_t)(TIM4_Period);
 255  0021 9f            	ld	a,xl
 256  0022 c752e8        	ld	21224,a
 257                     ; 99   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 259  0025 9e            	ld	a,xh
 260  0026 c752e7        	ld	21223,a
 261                     ; 100 }
 264  0029 81            	ret
 319                     ; 108 void TIM4_Cmd(FunctionalState NewState)
 319                     ; 109 {
 320                     	switch	.text
 321  002a               _TIM4_Cmd:
 325                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 327                     ; 114   if (NewState != DISABLE)
 329  002a 4d            	tnz	a
 330  002b 2706          	jreq	L531
 331                     ; 116     TIM4->CR1 |= TIM4_CR1_CEN ;
 333  002d 721052e0      	bset	21216,#0
 335  0031 2004          	jra	L731
 336  0033               L531:
 337                     ; 120     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 339  0033 721152e0      	bres	21216,#0
 340  0037               L731:
 341                     ; 122 }
 344  0037 81            	ret
 409                     ; 134 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 409                     ; 135 {
 410                     	switch	.text
 411  0038               _TIM4_ITConfig:
 413  0038 89            	pushw	x
 414       00000000      OFST:	set	0
 417                     ; 137   assert_param(IS_TIM4_IT(TIM4_IT));
 419                     ; 138   assert_param(IS_FUNCTIONAL_STATE(NewState));
 421                     ; 140   if (NewState != DISABLE)
 423  0039 9f            	ld	a,xl
 424  003a 4d            	tnz	a
 425  003b 2709          	jreq	L371
 426                     ; 143     TIM4->IER |= (uint8_t)TIM4_IT;
 428  003d 9e            	ld	a,xh
 429  003e ca52e3        	or	a,21219
 430  0041 c752e3        	ld	21219,a
 432  0044 2009          	jra	L571
 433  0046               L371:
 434                     ; 148     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 436  0046 7b01          	ld	a,(OFST+1,sp)
 437  0048 43            	cpl	a
 438  0049 c452e3        	and	a,21219
 439  004c c752e3        	ld	21219,a
 440  004f               L571:
 441                     ; 150 }
 444  004f 85            	popw	x
 445  0050 81            	ret
 469                     ; 157 void TIM4_InternalClockConfig(void)
 469                     ; 158 {
 470                     	switch	.text
 471  0051               _TIM4_InternalClockConfig:
 475                     ; 160   TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_SMS);
 477  0051 c652e2        	ld	a,21218
 478  0054 a4f8          	and	a,#248
 479  0056 c752e2        	ld	21218,a
 480                     ; 161 }
 483  0059 81            	ret
 551                     ; 171 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
 551                     ; 172 {
 552                     	switch	.text
 553  005a               _TIM4_SelectInputTrigger:
 555  005a 88            	push	a
 556  005b 88            	push	a
 557       00000001      OFST:	set	1
 560                     ; 173   uint8_t tmpsmcr = 0;
 562                     ; 176   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
 564                     ; 178   tmpsmcr = TIM4->SMCR;
 566  005c c652e2        	ld	a,21218
 567  005f 6b01          	ld	(OFST+0,sp),a
 568                     ; 181   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
 570  0061 7b01          	ld	a,(OFST+0,sp)
 571  0063 a48f          	and	a,#143
 572  0065 6b01          	ld	(OFST+0,sp),a
 573                     ; 182   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
 575  0067 7b01          	ld	a,(OFST+0,sp)
 576  0069 1a02          	or	a,(OFST+1,sp)
 577  006b 6b01          	ld	(OFST+0,sp),a
 578                     ; 184   TIM4->SMCR = (uint8_t)tmpsmcr;
 580  006d 7b01          	ld	a,(OFST+0,sp)
 581  006f c752e2        	ld	21218,a
 582                     ; 185 }
 585  0072 85            	popw	x
 586  0073 81            	ret
 622                     ; 193 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 622                     ; 194 {
 623                     	switch	.text
 624  0074               _TIM4_UpdateDisableConfig:
 628                     ; 196   assert_param(IS_FUNCTIONAL_STATE(NewState));
 630                     ; 199   if (NewState != DISABLE)
 632  0074 4d            	tnz	a
 633  0075 2706          	jreq	L752
 634                     ; 201     TIM4->CR1 |= TIM4_CR1_UDIS ;
 636  0077 721252e0      	bset	21216,#1
 638  007b 2004          	jra	L162
 639  007d               L752:
 640                     ; 205     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 642  007d 721352e0      	bres	21216,#1
 643  0081               L162:
 644                     ; 207 }
 647  0081 81            	ret
 705                     ; 217 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 705                     ; 218 {
 706                     	switch	.text
 707  0082               _TIM4_UpdateRequestConfig:
 711                     ; 220   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 713                     ; 223   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 715  0082 a101          	cp	a,#1
 716  0084 2606          	jrne	L113
 717                     ; 225     TIM4->CR1 |= TIM4_CR1_URS ;
 719  0086 721452e0      	bset	21216,#2
 721  008a 2004          	jra	L313
 722  008c               L113:
 723                     ; 229     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 725  008c 721552e0      	bres	21216,#2
 726  0090               L313:
 727                     ; 231 }
 730  0090 81            	ret
 787                     ; 241 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 787                     ; 242 {
 788                     	switch	.text
 789  0091               _TIM4_SelectOnePulseMode:
 793                     ; 244   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 795                     ; 247   if (TIM4_OPMode == TIM4_OPMode_Single)
 797  0091 a101          	cp	a,#1
 798  0093 2606          	jrne	L343
 799                     ; 249     TIM4->CR1 |= TIM4_CR1_OPM ;
 801  0095 721652e0      	bset	21216,#3
 803  0099 2004          	jra	L543
 804  009b               L343:
 805                     ; 253     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 807  009b 721752e0      	bres	21216,#3
 808  009f               L543:
 809                     ; 256 }
 812  009f 81            	ret
 887                     ; 267 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
 887                     ; 268 {
 888                     	switch	.text
 889  00a0               _TIM4_SelectOutputTrigger:
 891  00a0 88            	push	a
 892  00a1 88            	push	a
 893       00000001      OFST:	set	1
 896                     ; 269   uint8_t tmpcr2 = 0;
 898                     ; 272   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
 900                     ; 274   tmpcr2 = TIM4->CR2;
 902  00a2 c652e1        	ld	a,21217
 903  00a5 6b01          	ld	(OFST+0,sp),a
 904                     ; 277   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
 906  00a7 7b01          	ld	a,(OFST+0,sp)
 907  00a9 a48f          	and	a,#143
 908  00ab 6b01          	ld	(OFST+0,sp),a
 909                     ; 280   tmpcr2 |= (uint8_t)TIM4_TRGOSource;
 911  00ad 7b01          	ld	a,(OFST+0,sp)
 912  00af 1a02          	or	a,(OFST+1,sp)
 913  00b1 6b01          	ld	(OFST+0,sp),a
 914                     ; 282   TIM4->CR2 = tmpcr2;
 916  00b3 7b01          	ld	a,(OFST+0,sp)
 917  00b5 c752e1        	ld	21217,a
 918                     ; 283 }
 921  00b8 85            	popw	x
 922  00b9 81            	ret
1013                     ; 297 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1013                     ; 298 {
1014                     	switch	.text
1015  00ba               _TIM4_SelectSlaveMode:
1017  00ba 88            	push	a
1018  00bb 88            	push	a
1019       00000001      OFST:	set	1
1022                     ; 299   uint8_t tmpsmcr = 0;
1024                     ; 302   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1026                     ; 304   tmpsmcr = TIM4->SMCR;
1028  00bc c652e2        	ld	a,21218
1029  00bf 6b01          	ld	(OFST+0,sp),a
1030                     ; 307   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1032  00c1 7b01          	ld	a,(OFST+0,sp)
1033  00c3 a4f8          	and	a,#248
1034  00c5 6b01          	ld	(OFST+0,sp),a
1035                     ; 310   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1037  00c7 7b01          	ld	a,(OFST+0,sp)
1038  00c9 1a02          	or	a,(OFST+1,sp)
1039  00cb 6b01          	ld	(OFST+0,sp),a
1040                     ; 312   TIM4->SMCR = tmpsmcr;
1042  00cd 7b01          	ld	a,(OFST+0,sp)
1043  00cf c752e2        	ld	21218,a
1044                     ; 313 }
1047  00d2 85            	popw	x
1048  00d3 81            	ret
1084                     ; 321 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1084                     ; 322 {
1085                     	switch	.text
1086  00d4               _TIM4_SelectMasterSlaveMode:
1090                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1092                     ; 327   if (NewState != DISABLE)
1094  00d4 4d            	tnz	a
1095  00d5 2706          	jreq	L164
1096                     ; 329     TIM4->SMCR |= TIM4_SMCR_MSM;
1098  00d7 721e52e2      	bset	21218,#7
1100  00db 2004          	jra	L364
1101  00dd               L164:
1102                     ; 333     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1104  00dd 721f52e2      	bres	21218,#7
1105  00e1               L364:
1106                     ; 335 }
1109  00e1 81            	ret
1177                     ; 363 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef TIM4_Prescaler,
1177                     ; 364                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
1177                     ; 365 {
1178                     	switch	.text
1179  00e2               _TIM4_PrescalerConfig:
1183                     ; 367   assert_param(IS_TIM4_PRESCALER_RELOAD(TIM4_PSCReloadMode));
1185                     ; 368   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
1187                     ; 371   TIM4->PSCR = (uint8_t)TIM4_Prescaler;
1189  00e2 9e            	ld	a,xh
1190  00e3 c752e7        	ld	21223,a
1191                     ; 374   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
1193  00e6 9f            	ld	a,xl
1194  00e7 a101          	cp	a,#1
1195  00e9 2606          	jrne	L715
1196                     ; 376     TIM4->EGR |= TIM4_EGR_UG ;
1198  00eb 721052e5      	bset	21221,#0
1200  00ef 2004          	jra	L125
1201  00f1               L715:
1202                     ; 380     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
1204  00f1 721152e5      	bres	21221,#0
1205  00f5               L125:
1206                     ; 382 }
1209  00f5 81            	ret
1245                     ; 390 void TIM4_ARRPreloadConfig(FunctionalState NewState)
1245                     ; 391 {
1246                     	switch	.text
1247  00f6               _TIM4_ARRPreloadConfig:
1251                     ; 393   assert_param(IS_FUNCTIONAL_STATE(NewState));
1253                     ; 396   if (NewState != DISABLE)
1255  00f6 4d            	tnz	a
1256  00f7 2706          	jreq	L145
1257                     ; 398     TIM4->CR1 |= TIM4_CR1_ARPE ;
1259  00f9 721e52e0      	bset	21216,#7
1261  00fd 2004          	jra	L345
1262  00ff               L145:
1263                     ; 402     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
1265  00ff 721f52e0      	bres	21216,#7
1266  0103               L345:
1267                     ; 404 }
1270  0103 81            	ret
1327                     ; 414 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1327                     ; 415 {
1328                     	switch	.text
1329  0104               _TIM4_GenerateEvent:
1333                     ; 417   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1335                     ; 420   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1337  0104 ca52e5        	or	a,21221
1338  0107 c752e5        	ld	21221,a
1339                     ; 421 }
1342  010a 81            	ret
1376                     ; 429 void TIM4_SetCounter(uint8_t TIM4_Counter)
1376                     ; 430 {
1377                     	switch	.text
1378  010b               _TIM4_SetCounter:
1382                     ; 432   TIM4->CNTR = (uint8_t)(TIM4_Counter);
1384  010b c752e6        	ld	21222,a
1385                     ; 433 }
1388  010e 81            	ret
1422                     ; 441 void TIM4_SetAutoreload(uint8_t TIM4_Autoreload)
1422                     ; 442 {
1423                     	switch	.text
1424  010f               _TIM4_SetAutoreload:
1428                     ; 445   TIM4->ARR = (uint8_t)(TIM4_Autoreload);
1430  010f c752e8        	ld	21224,a
1431                     ; 446 }
1434  0112 81            	ret
1468                     ; 453 uint8_t TIM4_GetCounter(void)
1468                     ; 454 {
1469                     	switch	.text
1470  0113               _TIM4_GetCounter:
1472  0113 88            	push	a
1473       00000001      OFST:	set	1
1476                     ; 455   uint8_t tmpcntr = 0;
1478                     ; 456   tmpcntr = TIM4->CNTR;
1480  0114 c652e6        	ld	a,21222
1481  0117 6b01          	ld	(OFST+0,sp),a
1482                     ; 458   return ((uint8_t)tmpcntr);
1484  0119 7b01          	ld	a,(OFST+0,sp)
1487  011b 5b01          	addw	sp,#1
1488  011d 81            	ret
1512                     ; 482 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1512                     ; 483 {
1513                     	switch	.text
1514  011e               _TIM4_GetPrescaler:
1518                     ; 485   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
1520  011e c652e7        	ld	a,21223
1523  0121 81            	ret
1547                     ; 493 FunctionalState TIM4_GetStatus(void)
1547                     ; 494 {
1548                     	switch	.text
1549  0122               _TIM4_GetStatus:
1553                     ; 495   return ((FunctionalState)(TIM4->CR1 & TIM4_CR1_CEN));
1555  0122 c652e0        	ld	a,21216
1556  0125 a401          	and	a,#1
1559  0127 81            	ret
1645                     ; 507 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1645                     ; 508 {
1646                     	switch	.text
1647  0128               _TIM4_GetFlagStatus:
1649  0128 88            	push	a
1650       00000001      OFST:	set	1
1653                     ; 509   __IO FlagStatus bitstatus = RESET;
1655  0129 0f01          	clr	(OFST+0,sp)
1656                     ; 512   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1658                     ; 514   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1660  012b c452e4        	and	a,21220
1661  012e 2706          	jreq	L727
1662                     ; 516     bitstatus = SET;
1664  0130 a601          	ld	a,#1
1665  0132 6b01          	ld	(OFST+0,sp),a
1667  0134 2002          	jra	L137
1668  0136               L727:
1669                     ; 520     bitstatus = RESET;
1671  0136 0f01          	clr	(OFST+0,sp)
1672  0138               L137:
1673                     ; 522   return ((FlagStatus)bitstatus);
1675  0138 7b01          	ld	a,(OFST+0,sp)
1678  013a 5b01          	addw	sp,#1
1679  013c 81            	ret
1714                     ; 533 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1714                     ; 534 {
1715                     	switch	.text
1716  013d               _TIM4_ClearFlag:
1720                     ; 536   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1722                     ; 538   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1724  013d 43            	cpl	a
1725  013e c752e4        	ld	21220,a
1726                     ; 539 }
1729  0141 81            	ret
1793                     ; 550 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1793                     ; 551 {
1794                     	switch	.text
1795  0142               _TIM4_GetITStatus:
1797  0142 88            	push	a
1798  0143 5203          	subw	sp,#3
1799       00000003      OFST:	set	3
1802                     ; 552   __IO ITStatus bitstatus = RESET;
1804  0145 0f03          	clr	(OFST+0,sp)
1805                     ; 554   __IO uint8_t itStatus = 0x0, itEnable = 0x0;
1807  0147 0f01          	clr	(OFST-2,sp)
1810  0149 0f02          	clr	(OFST-1,sp)
1811                     ; 557   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1813                     ; 559   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1815  014b c452e4        	and	a,21220
1816  014e 6b01          	ld	(OFST-2,sp),a
1817                     ; 561   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1819  0150 c652e3        	ld	a,21219
1820  0153 1404          	and	a,(OFST+1,sp)
1821  0155 6b02          	ld	(OFST-1,sp),a
1822                     ; 563   if ((itStatus != (uint8_t)RESET) && (itEnable != (uint8_t)RESET))
1824  0157 0d01          	tnz	(OFST-2,sp)
1825  0159 270a          	jreq	L3001
1827  015b 0d02          	tnz	(OFST-1,sp)
1828  015d 2706          	jreq	L3001
1829                     ; 565     bitstatus = (ITStatus)SET;
1831  015f a601          	ld	a,#1
1832  0161 6b03          	ld	(OFST+0,sp),a
1834  0163 2002          	jra	L5001
1835  0165               L3001:
1836                     ; 569     bitstatus = (ITStatus)RESET;
1838  0165 0f03          	clr	(OFST+0,sp)
1839  0167               L5001:
1840                     ; 571   return ((ITStatus)bitstatus);
1842  0167 7b03          	ld	a,(OFST+0,sp)
1845  0169 5b04          	addw	sp,#4
1846  016b 81            	ret
1882                     ; 582 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1882                     ; 583 {
1883                     	switch	.text
1884  016c               _TIM4_ClearITPendingBit:
1888                     ; 585   assert_param(IS_TIM4_IT(TIM4_IT));
1890                     ; 588   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1892  016c 43            	cpl	a
1893  016d c752e4        	ld	21220,a
1894                     ; 589 }
1897  0170 81            	ret
1910                     	xdef	_TIM4_ClearITPendingBit
1911                     	xdef	_TIM4_GetITStatus
1912                     	xdef	_TIM4_ClearFlag
1913                     	xdef	_TIM4_GetFlagStatus
1914                     	xdef	_TIM4_GetStatus
1915                     	xdef	_TIM4_GetPrescaler
1916                     	xdef	_TIM4_GetCounter
1917                     	xdef	_TIM4_SetAutoreload
1918                     	xdef	_TIM4_SetCounter
1919                     	xdef	_TIM4_GenerateEvent
1920                     	xdef	_TIM4_ARRPreloadConfig
1921                     	xdef	_TIM4_PrescalerConfig
1922                     	xdef	_TIM4_SelectMasterSlaveMode
1923                     	xdef	_TIM4_SelectSlaveMode
1924                     	xdef	_TIM4_SelectOutputTrigger
1925                     	xdef	_TIM4_SelectOnePulseMode
1926                     	xdef	_TIM4_UpdateRequestConfig
1927                     	xdef	_TIM4_UpdateDisableConfig
1928                     	xdef	_TIM4_SelectInputTrigger
1929                     	xdef	_TIM4_InternalClockConfig
1930                     	xdef	_TIM4_ITConfig
1931                     	xdef	_TIM4_Cmd
1932                     	xdef	_TIM4_TimeBaseInit
1933                     	xdef	_TIM4_DeInit
1952                     	end
