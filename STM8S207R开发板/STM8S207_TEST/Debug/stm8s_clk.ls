   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     .const:	section	.text
  16  0000               _HSIDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004               _CLKPrescTable:
  22  0004 01            	dc.b	1
  23  0005 02            	dc.b	2
  24  0006 04            	dc.b	4
  25  0007 08            	dc.b	8
  26  0008 0a            	dc.b	10
  27  0009 10            	dc.b	16
  28  000a 14            	dc.b	20
  29  000b 28            	dc.b	40
  58                     ; 72 void CLK_DeInit(void)
  58                     ; 73 {
  60                     	switch	.text
  61  0000               _CLK_DeInit:
  65                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  67  0000 350150c0      	mov	20672,#1
  68                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  70  0004 725f50c1      	clr	20673
  71                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  73  0008 35e150c4      	mov	20676,#225
  74                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  76  000c 725f50c5      	clr	20677
  77                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  79  0010 351850c6      	mov	20678,#24
  80                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  82  0014 35ff50c7      	mov	20679,#255
  83                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  85  0018 35ff50ca      	mov	20682,#255
  86                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  88  001c 725f50c8      	clr	20680
  89                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  91  0020 725f50c9      	clr	20681
  93  0024               L52:
  94                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  96  0024 c650c9        	ld	a,20681
  97  0027 a501          	bcp	a,#1
  98  0029 26f9          	jrne	L52
  99                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 101  002b 725f50c9      	clr	20681
 102                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 104  002f 725f50cc      	clr	20684
 105                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 107  0033 725f50cd      	clr	20685
 108                     ; 88 }
 111  0037 81            	ret
 167                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 167                     ; 100 {
 168                     	switch	.text
 169  0038               _CLK_FastHaltWakeUpCmd:
 173                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 175                     ; 104   if (NewState != DISABLE)
 177  0038 4d            	tnz	a
 178  0039 2706          	jreq	L75
 179                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 181  003b 721450c0      	bset	20672,#2
 183  003f 2004          	jra	L16
 184  0041               L75:
 185                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 187  0041 721550c0      	bres	20672,#2
 188  0045               L16:
 189                     ; 114 }
 192  0045 81            	ret
 227                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 227                     ; 122 {
 228                     	switch	.text
 229  0046               _CLK_HSECmd:
 233                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 235                     ; 126   if (NewState != DISABLE)
 237  0046 4d            	tnz	a
 238  0047 2706          	jreq	L101
 239                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 241  0049 721050c1      	bset	20673,#0
 243  004d 2004          	jra	L301
 244  004f               L101:
 245                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 247  004f 721150c1      	bres	20673,#0
 248  0053               L301:
 249                     ; 136 }
 252  0053 81            	ret
 287                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 287                     ; 144 {
 288                     	switch	.text
 289  0054               _CLK_HSICmd:
 293                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 295                     ; 148   if (NewState != DISABLE)
 297  0054 4d            	tnz	a
 298  0055 2706          	jreq	L321
 299                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 301  0057 721050c0      	bset	20672,#0
 303  005b 2004          	jra	L521
 304  005d               L321:
 305                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 307  005d 721150c0      	bres	20672,#0
 308  0061               L521:
 309                     ; 158 }
 312  0061 81            	ret
 347                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 347                     ; 167 {
 348                     	switch	.text
 349  0062               _CLK_LSICmd:
 353                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 355                     ; 171   if (NewState != DISABLE)
 357  0062 4d            	tnz	a
 358  0063 2706          	jreq	L541
 359                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 361  0065 721650c0      	bset	20672,#3
 363  0069 2004          	jra	L741
 364  006b               L541:
 365                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 367  006b 721750c0      	bres	20672,#3
 368  006f               L741:
 369                     ; 181 }
 372  006f 81            	ret
 407                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 407                     ; 190 {
 408                     	switch	.text
 409  0070               _CLK_CCOCmd:
 413                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 415                     ; 194   if (NewState != DISABLE)
 417  0070 4d            	tnz	a
 418  0071 2706          	jreq	L761
 419                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 421  0073 721050c9      	bset	20681,#0
 423  0077 2004          	jra	L171
 424  0079               L761:
 425                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 427  0079 721150c9      	bres	20681,#0
 428  007d               L171:
 429                     ; 204 }
 432  007d 81            	ret
 467                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 467                     ; 214 {
 468                     	switch	.text
 469  007e               _CLK_ClockSwitchCmd:
 473                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 475                     ; 218   if (NewState != DISABLE )
 477  007e 4d            	tnz	a
 478  007f 2706          	jreq	L112
 479                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 481  0081 721250c5      	bset	20677,#1
 483  0085 2004          	jra	L312
 484  0087               L112:
 485                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 487  0087 721350c5      	bres	20677,#1
 488  008b               L312:
 489                     ; 228 }
 492  008b 81            	ret
 528                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 528                     ; 239 {
 529                     	switch	.text
 530  008c               _CLK_SlowActiveHaltWakeUpCmd:
 534                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 536                     ; 243   if (NewState != DISABLE)
 538  008c 4d            	tnz	a
 539  008d 2706          	jreq	L332
 540                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 542  008f 721a50c0      	bset	20672,#5
 544  0093 2004          	jra	L532
 545  0095               L332:
 546                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 548  0095 721b50c0      	bres	20672,#5
 549  0099               L532:
 550                     ; 253 }
 553  0099 81            	ret
 712                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 712                     ; 264 {
 713                     	switch	.text
 714  009a               _CLK_PeripheralClockConfig:
 716  009a 89            	pushw	x
 717       00000000      OFST:	set	0
 720                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 722                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 724                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 726  009b 9e            	ld	a,xh
 727  009c a510          	bcp	a,#16
 728  009e 2633          	jrne	L123
 729                     ; 271     if (NewState != DISABLE)
 731  00a0 0d02          	tnz	(OFST+2,sp)
 732  00a2 2717          	jreq	L323
 733                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 735  00a4 7b01          	ld	a,(OFST+1,sp)
 736  00a6 a40f          	and	a,#15
 737  00a8 5f            	clrw	x
 738  00a9 97            	ld	xl,a
 739  00aa a601          	ld	a,#1
 740  00ac 5d            	tnzw	x
 741  00ad 2704          	jreq	L62
 742  00af               L03:
 743  00af 48            	sll	a
 744  00b0 5a            	decw	x
 745  00b1 26fc          	jrne	L03
 746  00b3               L62:
 747  00b3 ca50c7        	or	a,20679
 748  00b6 c750c7        	ld	20679,a
 750  00b9 2049          	jra	L723
 751  00bb               L323:
 752                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 754  00bb 7b01          	ld	a,(OFST+1,sp)
 755  00bd a40f          	and	a,#15
 756  00bf 5f            	clrw	x
 757  00c0 97            	ld	xl,a
 758  00c1 a601          	ld	a,#1
 759  00c3 5d            	tnzw	x
 760  00c4 2704          	jreq	L23
 761  00c6               L43:
 762  00c6 48            	sll	a
 763  00c7 5a            	decw	x
 764  00c8 26fc          	jrne	L43
 765  00ca               L23:
 766  00ca 43            	cpl	a
 767  00cb c450c7        	and	a,20679
 768  00ce c750c7        	ld	20679,a
 769  00d1 2031          	jra	L723
 770  00d3               L123:
 771                     ; 284     if (NewState != DISABLE)
 773  00d3 0d02          	tnz	(OFST+2,sp)
 774  00d5 2717          	jreq	L133
 775                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 777  00d7 7b01          	ld	a,(OFST+1,sp)
 778  00d9 a40f          	and	a,#15
 779  00db 5f            	clrw	x
 780  00dc 97            	ld	xl,a
 781  00dd a601          	ld	a,#1
 782  00df 5d            	tnzw	x
 783  00e0 2704          	jreq	L63
 784  00e2               L04:
 785  00e2 48            	sll	a
 786  00e3 5a            	decw	x
 787  00e4 26fc          	jrne	L04
 788  00e6               L63:
 789  00e6 ca50ca        	or	a,20682
 790  00e9 c750ca        	ld	20682,a
 792  00ec 2016          	jra	L723
 793  00ee               L133:
 794                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 796  00ee 7b01          	ld	a,(OFST+1,sp)
 797  00f0 a40f          	and	a,#15
 798  00f2 5f            	clrw	x
 799  00f3 97            	ld	xl,a
 800  00f4 a601          	ld	a,#1
 801  00f6 5d            	tnzw	x
 802  00f7 2704          	jreq	L24
 803  00f9               L44:
 804  00f9 48            	sll	a
 805  00fa 5a            	decw	x
 806  00fb 26fc          	jrne	L44
 807  00fd               L24:
 808  00fd 43            	cpl	a
 809  00fe c450ca        	and	a,20682
 810  0101 c750ca        	ld	20682,a
 811  0104               L723:
 812                     ; 295 }
 815  0104 85            	popw	x
 816  0105 81            	ret
1004                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1004                     ; 310 {
1005                     	switch	.text
1006  0106               _CLK_ClockSwitchConfig:
1008  0106 89            	pushw	x
1009  0107 5204          	subw	sp,#4
1010       00000004      OFST:	set	4
1013                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1015  0109 aeffff        	ldw	x,#65535
1016  010c 1f03          	ldw	(OFST-1,sp),x
1017                     ; 313   ErrorStatus Swif = ERROR;
1019                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1021                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1023                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1025                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1027                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1029  010e c650c3        	ld	a,20675
1030  0111 6b01          	ld	(OFST-3,sp),a
1031                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1033  0113 7b05          	ld	a,(OFST+1,sp)
1034  0115 a101          	cp	a,#1
1035  0117 264b          	jrne	L544
1036                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1038  0119 721250c5      	bset	20677,#1
1039                     ; 331     if (ITState != DISABLE)
1041  011d 0d09          	tnz	(OFST+5,sp)
1042  011f 2706          	jreq	L744
1043                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1045  0121 721450c5      	bset	20677,#2
1047  0125 2004          	jra	L154
1048  0127               L744:
1049                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1051  0127 721550c5      	bres	20677,#2
1052  012b               L154:
1053                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1055  012b 7b06          	ld	a,(OFST+2,sp)
1056  012d c750c4        	ld	20676,a
1058  0130 2007          	jra	L754
1059  0132               L354:
1060                     ; 346       DownCounter--;
1062  0132 1e03          	ldw	x,(OFST-1,sp)
1063  0134 1d0001        	subw	x,#1
1064  0137 1f03          	ldw	(OFST-1,sp),x
1065  0139               L754:
1066                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1068  0139 c650c5        	ld	a,20677
1069  013c a501          	bcp	a,#1
1070  013e 2704          	jreq	L364
1072  0140 1e03          	ldw	x,(OFST-1,sp)
1073  0142 26ee          	jrne	L354
1074  0144               L364:
1075                     ; 349     if(DownCounter != 0)
1077  0144 1e03          	ldw	x,(OFST-1,sp)
1078  0146 2706          	jreq	L564
1079                     ; 351       Swif = SUCCESS;
1081  0148 a601          	ld	a,#1
1082  014a 6b02          	ld	(OFST-2,sp),a
1084  014c 2002          	jra	L174
1085  014e               L564:
1086                     ; 355       Swif = ERROR;
1088  014e 0f02          	clr	(OFST-2,sp)
1089  0150               L174:
1090                     ; 390   if(Swif != ERROR)
1092  0150 0d02          	tnz	(OFST-2,sp)
1093  0152 2767          	jreq	L515
1094                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1096  0154 0d0a          	tnz	(OFST+6,sp)
1097  0156 2645          	jrne	L715
1099  0158 7b01          	ld	a,(OFST-3,sp)
1100  015a a1e1          	cp	a,#225
1101  015c 263f          	jrne	L715
1102                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1104  015e 721150c0      	bres	20672,#0
1106  0162 2057          	jra	L515
1107  0164               L544:
1108                     ; 361     if (ITState != DISABLE)
1110  0164 0d09          	tnz	(OFST+5,sp)
1111  0166 2706          	jreq	L374
1112                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1114  0168 721450c5      	bset	20677,#2
1116  016c 2004          	jra	L574
1117  016e               L374:
1118                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1120  016e 721550c5      	bres	20677,#2
1121  0172               L574:
1122                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1124  0172 7b06          	ld	a,(OFST+2,sp)
1125  0174 c750c4        	ld	20676,a
1127  0177 2007          	jra	L305
1128  0179               L774:
1129                     ; 376       DownCounter--;
1131  0179 1e03          	ldw	x,(OFST-1,sp)
1132  017b 1d0001        	subw	x,#1
1133  017e 1f03          	ldw	(OFST-1,sp),x
1134  0180               L305:
1135                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1137  0180 c650c5        	ld	a,20677
1138  0183 a508          	bcp	a,#8
1139  0185 2704          	jreq	L705
1141  0187 1e03          	ldw	x,(OFST-1,sp)
1142  0189 26ee          	jrne	L774
1143  018b               L705:
1144                     ; 379     if(DownCounter != 0)
1146  018b 1e03          	ldw	x,(OFST-1,sp)
1147  018d 270a          	jreq	L115
1148                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1150  018f 721250c5      	bset	20677,#1
1151                     ; 383       Swif = SUCCESS;
1153  0193 a601          	ld	a,#1
1154  0195 6b02          	ld	(OFST-2,sp),a
1156  0197 20b7          	jra	L174
1157  0199               L115:
1158                     ; 387       Swif = ERROR;
1160  0199 0f02          	clr	(OFST-2,sp)
1161  019b 20b3          	jra	L174
1162  019d               L715:
1163                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1165  019d 0d0a          	tnz	(OFST+6,sp)
1166  019f 260c          	jrne	L325
1168  01a1 7b01          	ld	a,(OFST-3,sp)
1169  01a3 a1d2          	cp	a,#210
1170  01a5 2606          	jrne	L325
1171                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1173  01a7 721750c0      	bres	20672,#3
1175  01ab 200e          	jra	L515
1176  01ad               L325:
1177                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1179  01ad 0d0a          	tnz	(OFST+6,sp)
1180  01af 260a          	jrne	L515
1182  01b1 7b01          	ld	a,(OFST-3,sp)
1183  01b3 a1b4          	cp	a,#180
1184  01b5 2604          	jrne	L515
1185                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1187  01b7 721150c1      	bres	20673,#0
1188  01bb               L515:
1189                     ; 406   return(Swif);
1191  01bb 7b02          	ld	a,(OFST-2,sp)
1194  01bd 5b06          	addw	sp,#6
1195  01bf 81            	ret
1333                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1333                     ; 416 {
1334                     	switch	.text
1335  01c0               _CLK_HSIPrescalerConfig:
1337  01c0 88            	push	a
1338       00000000      OFST:	set	0
1341                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1343                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1345  01c1 c650c6        	ld	a,20678
1346  01c4 a4e7          	and	a,#231
1347  01c6 c750c6        	ld	20678,a
1348                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1350  01c9 c650c6        	ld	a,20678
1351  01cc 1a01          	or	a,(OFST+1,sp)
1352  01ce c750c6        	ld	20678,a
1353                     ; 425 }
1356  01d1 84            	pop	a
1357  01d2 81            	ret
1492                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1492                     ; 437 {
1493                     	switch	.text
1494  01d3               _CLK_CCOConfig:
1496  01d3 88            	push	a
1497       00000000      OFST:	set	0
1500                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1502                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1504  01d4 c650c9        	ld	a,20681
1505  01d7 a4e1          	and	a,#225
1506  01d9 c750c9        	ld	20681,a
1507                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1509  01dc c650c9        	ld	a,20681
1510  01df 1a01          	or	a,(OFST+1,sp)
1511  01e1 c750c9        	ld	20681,a
1512                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1514  01e4 721050c9      	bset	20681,#0
1515                     ; 449 }
1518  01e8 84            	pop	a
1519  01e9 81            	ret
1584                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1584                     ; 460 {
1585                     	switch	.text
1586  01ea               _CLK_ITConfig:
1588  01ea 89            	pushw	x
1589       00000000      OFST:	set	0
1592                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1594                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1596                     ; 465   if (NewState != DISABLE)
1598  01eb 9f            	ld	a,xl
1599  01ec 4d            	tnz	a
1600  01ed 2719          	jreq	L527
1601                     ; 467     switch (CLK_IT)
1603  01ef 9e            	ld	a,xh
1605                     ; 475     default:
1605                     ; 476       break;
1606  01f0 a00c          	sub	a,#12
1607  01f2 270a          	jreq	L166
1608  01f4 a010          	sub	a,#16
1609  01f6 2624          	jrne	L337
1610                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1610                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1612  01f8 721450c5      	bset	20677,#2
1613                     ; 471       break;
1615  01fc 201e          	jra	L337
1616  01fe               L166:
1617                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1617                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1619  01fe 721450c8      	bset	20680,#2
1620                     ; 474       break;
1622  0202 2018          	jra	L337
1623  0204               L366:
1624                     ; 475     default:
1624                     ; 476       break;
1626  0204 2016          	jra	L337
1627  0206               L137:
1629  0206 2014          	jra	L337
1630  0208               L527:
1631                     ; 481     switch (CLK_IT)
1633  0208 7b01          	ld	a,(OFST+1,sp)
1635                     ; 489     default:
1635                     ; 490       break;
1636  020a a00c          	sub	a,#12
1637  020c 270a          	jreq	L766
1638  020e a010          	sub	a,#16
1639  0210 260a          	jrne	L337
1640                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1640                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1642  0212 721550c5      	bres	20677,#2
1643                     ; 485       break;
1645  0216 2004          	jra	L337
1646  0218               L766:
1647                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1647                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1649  0218 721550c8      	bres	20680,#2
1650                     ; 488       break;
1651  021c               L337:
1652                     ; 493 }
1655  021c 85            	popw	x
1656  021d 81            	ret
1657  021e               L176:
1658                     ; 489     default:
1658                     ; 490       break;
1660  021e 20fc          	jra	L337
1661  0220               L737:
1662  0220 20fa          	jra	L337
1697                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1697                     ; 501 {
1698                     	switch	.text
1699  0222               _CLK_SYSCLKConfig:
1701  0222 88            	push	a
1702       00000000      OFST:	set	0
1705                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1707                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1709  0223 a580          	bcp	a,#128
1710  0225 2614          	jrne	L757
1711                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1713  0227 c650c6        	ld	a,20678
1714  022a a4e7          	and	a,#231
1715  022c c750c6        	ld	20678,a
1716                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1718  022f 7b01          	ld	a,(OFST+1,sp)
1719  0231 a418          	and	a,#24
1720  0233 ca50c6        	or	a,20678
1721  0236 c750c6        	ld	20678,a
1723  0239 2012          	jra	L167
1724  023b               L757:
1725                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1727  023b c650c6        	ld	a,20678
1728  023e a4f8          	and	a,#248
1729  0240 c750c6        	ld	20678,a
1730                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1732  0243 7b01          	ld	a,(OFST+1,sp)
1733  0245 a407          	and	a,#7
1734  0247 ca50c6        	or	a,20678
1735  024a c750c6        	ld	20678,a
1736  024d               L167:
1737                     ; 515 }
1740  024d 84            	pop	a
1741  024e 81            	ret
1797                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1797                     ; 524 {
1798                     	switch	.text
1799  024f               _CLK_SWIMConfig:
1803                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1805                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1807  024f 4d            	tnz	a
1808  0250 2706          	jreq	L1101
1809                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1811  0252 721050cd      	bset	20685,#0
1813  0256 2004          	jra	L3101
1814  0258               L1101:
1815                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1817  0258 721150cd      	bres	20685,#0
1818  025c               L3101:
1819                     ; 538 }
1822  025c 81            	ret
1846                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1846                     ; 548 {
1847                     	switch	.text
1848  025d               _CLK_ClockSecuritySystemEnable:
1852                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1854  025d 721050c8      	bset	20680,#0
1855                     ; 551 }
1858  0261 81            	ret
1883                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1883                     ; 560 {
1884                     	switch	.text
1885  0262               _CLK_GetSYSCLKSource:
1889                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1891  0262 c650c3        	ld	a,20675
1894  0265 81            	ret
1957                     ; 569 uint32_t CLK_GetClockFreq(void)
1957                     ; 570 {
1958                     	switch	.text
1959  0266               _CLK_GetClockFreq:
1961  0266 5209          	subw	sp,#9
1962       00000009      OFST:	set	9
1965                     ; 571   uint32_t clockfrequency = 0;
1967                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1969                     ; 573   uint8_t tmp = 0, presc = 0;
1973                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1975  0268 c650c3        	ld	a,20675
1976  026b 6b09          	ld	(OFST+0,sp),a
1977                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1979  026d 7b09          	ld	a,(OFST+0,sp)
1980  026f a1e1          	cp	a,#225
1981  0271 2641          	jrne	L7601
1982                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1984  0273 c650c6        	ld	a,20678
1985  0276 a418          	and	a,#24
1986  0278 6b09          	ld	(OFST+0,sp),a
1987                     ; 581     tmp = (uint8_t)(tmp >> 3);
1989  027a 0409          	srl	(OFST+0,sp)
1990  027c 0409          	srl	(OFST+0,sp)
1991  027e 0409          	srl	(OFST+0,sp)
1992                     ; 582     presc = HSIDivFactor[tmp];
1994  0280 7b09          	ld	a,(OFST+0,sp)
1995  0282 5f            	clrw	x
1996  0283 97            	ld	xl,a
1997  0284 d60000        	ld	a,(_HSIDivFactor,x)
1998  0287 6b09          	ld	(OFST+0,sp),a
1999                     ; 583     clockfrequency = HSI_VALUE / presc;
2001  0289 7b09          	ld	a,(OFST+0,sp)
2002  028b b703          	ld	c_lreg+3,a
2003  028d 3f02          	clr	c_lreg+2
2004  028f 3f01          	clr	c_lreg+1
2005  0291 3f00          	clr	c_lreg
2006  0293 96            	ldw	x,sp
2007  0294 1c0001        	addw	x,#OFST-8
2008  0297 cd0000        	call	c_rtol
2010  029a ae2400        	ldw	x,#9216
2011  029d bf02          	ldw	c_lreg+2,x
2012  029f ae00f4        	ldw	x,#244
2013  02a2 bf00          	ldw	c_lreg,x
2014  02a4 96            	ldw	x,sp
2015  02a5 1c0001        	addw	x,#OFST-8
2016  02a8 cd0000        	call	c_ludv
2018  02ab 96            	ldw	x,sp
2019  02ac 1c0005        	addw	x,#OFST-4
2020  02af cd0000        	call	c_rtol
2023  02b2 201c          	jra	L1701
2024  02b4               L7601:
2025                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2027  02b4 7b09          	ld	a,(OFST+0,sp)
2028  02b6 a1d2          	cp	a,#210
2029  02b8 260c          	jrne	L3701
2030                     ; 587     clockfrequency = LSI_VALUE;
2032  02ba aef400        	ldw	x,#62464
2033  02bd 1f07          	ldw	(OFST-2,sp),x
2034  02bf ae0001        	ldw	x,#1
2035  02c2 1f05          	ldw	(OFST-4,sp),x
2037  02c4 200a          	jra	L1701
2038  02c6               L3701:
2039                     ; 591     clockfrequency = HSE_VALUE;
2041  02c6 ae3600        	ldw	x,#13824
2042  02c9 1f07          	ldw	(OFST-2,sp),x
2043  02cb ae016e        	ldw	x,#366
2044  02ce 1f05          	ldw	(OFST-4,sp),x
2045  02d0               L1701:
2046                     ; 594   return((uint32_t)clockfrequency);
2048  02d0 96            	ldw	x,sp
2049  02d1 1c0005        	addw	x,#OFST-4
2050  02d4 cd0000        	call	c_ltor
2054  02d7 5b09          	addw	sp,#9
2055  02d9 81            	ret
2154                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2154                     ; 605 {
2155                     	switch	.text
2156  02da               _CLK_AdjustHSICalibrationValue:
2158  02da 88            	push	a
2159       00000000      OFST:	set	0
2162                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2164                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2166  02db c650cc        	ld	a,20684
2167  02de a4f8          	and	a,#248
2168  02e0 1a01          	or	a,(OFST+1,sp)
2169  02e2 c750cc        	ld	20684,a
2170                     ; 611 }
2173  02e5 84            	pop	a
2174  02e6 81            	ret
2198                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2198                     ; 623 {
2199                     	switch	.text
2200  02e7               _CLK_SYSCLKEmergencyClear:
2204                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2206  02e7 721150c5      	bres	20677,#0
2207                     ; 625 }
2210  02eb 81            	ret
2363                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2363                     ; 635 {
2364                     	switch	.text
2365  02ec               _CLK_GetFlagStatus:
2367  02ec 89            	pushw	x
2368  02ed 5203          	subw	sp,#3
2369       00000003      OFST:	set	3
2372                     ; 636   uint16_t statusreg = 0;
2374                     ; 637   uint8_t tmpreg = 0;
2376                     ; 638   FlagStatus bitstatus = RESET;
2378                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2380                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2382  02ef 01            	rrwa	x,a
2383  02f0 9f            	ld	a,xl
2384  02f1 a4ff          	and	a,#255
2385  02f3 97            	ld	xl,a
2386  02f4 4f            	clr	a
2387  02f5 02            	rlwa	x,a
2388  02f6 1f01          	ldw	(OFST-2,sp),x
2389  02f8 01            	rrwa	x,a
2390                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2392  02f9 1e01          	ldw	x,(OFST-2,sp)
2393  02fb a30100        	cpw	x,#256
2394  02fe 2607          	jrne	L1421
2395                     ; 649     tmpreg = CLK->ICKR;
2397  0300 c650c0        	ld	a,20672
2398  0303 6b03          	ld	(OFST+0,sp),a
2400  0305 202f          	jra	L3421
2401  0307               L1421:
2402                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2404  0307 1e01          	ldw	x,(OFST-2,sp)
2405  0309 a30200        	cpw	x,#512
2406  030c 2607          	jrne	L5421
2407                     ; 653     tmpreg = CLK->ECKR;
2409  030e c650c1        	ld	a,20673
2410  0311 6b03          	ld	(OFST+0,sp),a
2412  0313 2021          	jra	L3421
2413  0315               L5421:
2414                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2416  0315 1e01          	ldw	x,(OFST-2,sp)
2417  0317 a30300        	cpw	x,#768
2418  031a 2607          	jrne	L1521
2419                     ; 657     tmpreg = CLK->SWCR;
2421  031c c650c5        	ld	a,20677
2422  031f 6b03          	ld	(OFST+0,sp),a
2424  0321 2013          	jra	L3421
2425  0323               L1521:
2426                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2428  0323 1e01          	ldw	x,(OFST-2,sp)
2429  0325 a30400        	cpw	x,#1024
2430  0328 2607          	jrne	L5521
2431                     ; 661     tmpreg = CLK->CSSR;
2433  032a c650c8        	ld	a,20680
2434  032d 6b03          	ld	(OFST+0,sp),a
2436  032f 2005          	jra	L3421
2437  0331               L5521:
2438                     ; 665     tmpreg = CLK->CCOR;
2440  0331 c650c9        	ld	a,20681
2441  0334 6b03          	ld	(OFST+0,sp),a
2442  0336               L3421:
2443                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2445  0336 7b05          	ld	a,(OFST+2,sp)
2446  0338 1503          	bcp	a,(OFST+0,sp)
2447  033a 2706          	jreq	L1621
2448                     ; 670     bitstatus = SET;
2450  033c a601          	ld	a,#1
2451  033e 6b03          	ld	(OFST+0,sp),a
2453  0340 2002          	jra	L3621
2454  0342               L1621:
2455                     ; 674     bitstatus = RESET;
2457  0342 0f03          	clr	(OFST+0,sp)
2458  0344               L3621:
2459                     ; 678   return((FlagStatus)bitstatus);
2461  0344 7b03          	ld	a,(OFST+0,sp)
2464  0346 5b05          	addw	sp,#5
2465  0348 81            	ret
2511                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2511                     ; 688 {
2512                     	switch	.text
2513  0349               _CLK_GetITStatus:
2515  0349 88            	push	a
2516  034a 88            	push	a
2517       00000001      OFST:	set	1
2520                     ; 689   ITStatus bitstatus = RESET;
2522                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2524                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2526  034b a11c          	cp	a,#28
2527  034d 2611          	jrne	L7031
2528                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2530  034f c450c5        	and	a,20677
2531  0352 a10c          	cp	a,#12
2532  0354 2606          	jrne	L1131
2533                     ; 699       bitstatus = SET;
2535  0356 a601          	ld	a,#1
2536  0358 6b01          	ld	(OFST+0,sp),a
2538  035a 2015          	jra	L5131
2539  035c               L1131:
2540                     ; 703       bitstatus = RESET;
2542  035c 0f01          	clr	(OFST+0,sp)
2543  035e 2011          	jra	L5131
2544  0360               L7031:
2545                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2547  0360 c650c8        	ld	a,20680
2548  0363 1402          	and	a,(OFST+1,sp)
2549  0365 a10c          	cp	a,#12
2550  0367 2606          	jrne	L7131
2551                     ; 711       bitstatus = SET;
2553  0369 a601          	ld	a,#1
2554  036b 6b01          	ld	(OFST+0,sp),a
2556  036d 2002          	jra	L5131
2557  036f               L7131:
2558                     ; 715       bitstatus = RESET;
2560  036f 0f01          	clr	(OFST+0,sp)
2561  0371               L5131:
2562                     ; 720   return bitstatus;
2564  0371 7b01          	ld	a,(OFST+0,sp)
2567  0373 85            	popw	x
2568  0374 81            	ret
2604                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2604                     ; 730 {
2605                     	switch	.text
2606  0375               _CLK_ClearITPendingBit:
2610                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2612                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2614  0375 a10c          	cp	a,#12
2615  0377 2606          	jrne	L1431
2616                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2618  0379 721750c8      	bres	20680,#3
2620  037d 2004          	jra	L3431
2621  037f               L1431:
2622                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2624  037f 721750c5      	bres	20677,#3
2625  0383               L3431:
2626                     ; 745 }
2629  0383 81            	ret
2664                     	xdef	_CLKPrescTable
2665                     	xdef	_HSIDivFactor
2666                     	xdef	_CLK_ClearITPendingBit
2667                     	xdef	_CLK_GetITStatus
2668                     	xdef	_CLK_GetFlagStatus
2669                     	xdef	_CLK_GetSYSCLKSource
2670                     	xdef	_CLK_GetClockFreq
2671                     	xdef	_CLK_AdjustHSICalibrationValue
2672                     	xdef	_CLK_SYSCLKEmergencyClear
2673                     	xdef	_CLK_ClockSecuritySystemEnable
2674                     	xdef	_CLK_SWIMConfig
2675                     	xdef	_CLK_SYSCLKConfig
2676                     	xdef	_CLK_ITConfig
2677                     	xdef	_CLK_CCOConfig
2678                     	xdef	_CLK_HSIPrescalerConfig
2679                     	xdef	_CLK_ClockSwitchConfig
2680                     	xdef	_CLK_PeripheralClockConfig
2681                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2682                     	xdef	_CLK_FastHaltWakeUpCmd
2683                     	xdef	_CLK_ClockSwitchCmd
2684                     	xdef	_CLK_CCOCmd
2685                     	xdef	_CLK_LSICmd
2686                     	xdef	_CLK_HSICmd
2687                     	xdef	_CLK_HSECmd
2688                     	xdef	_CLK_DeInit
2689                     	xref.b	c_lreg
2690                     	xref.b	c_x
2709                     	xref	c_ltor
2710                     	xref	c_ludv
2711                     	xref	c_rtol
2712                     	end
