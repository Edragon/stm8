   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 55 void EXTI_DeInit(void)
  43                     ; 56 {
  45                     	switch	.text
  46  0000               _EXTI_DeInit:
  50                     ; 57   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  52  0000 725f50a0      	clr	20640
  53                     ; 58   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  55  0004 725f50a1      	clr	20641
  56                     ; 59   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  58  0008 725f50a2      	clr	20642
  59                     ; 60   EXTI->SR1 = EXTI_SR1_RESET_VALUE;
  61  000c 725f50a3      	clr	20643
  62                     ; 61   EXTI->SR2 = EXTI_SR2_RESET_VALUE;
  64  0010 725f50a4      	clr	20644
  65                     ; 62   EXTI->CONF = EXTI_CONF_RESET_VALUE;
  67  0014 725f50a5      	clr	20645
  68                     ; 63 }
  71  0018 81            	ret
 175                     ; 84 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 175                     ; 85                              EXTI_Trigger_TypeDef EXTI_TriggerValue)
 175                     ; 86 {
 176                     	switch	.text
 177  0019               _EXTI_SetPortSensitivity:
 179  0019 89            	pushw	x
 180       00000000      OFST:	set	0
 183                     ; 89   assert_param(IS_EXTI_PORT(EXTI_Port));
 185                     ; 90   assert_param(IS_EXTI_Trigger_VALUE(EXTI_TriggerValue));
 187                     ; 93   if (EXTI_Port != EXTI_Port_B)
 189  001a 9e            	ld	a,xh
 190  001b 4d            	tnz	a
 191  001c 270a          	jreq	L76
 192                     ; 95     EXTI->CR3 &= (uint8_t)(~EXTI_CR3_PDIS);
 194  001e c650a2        	ld	a,20642
 195  0021 a4f3          	and	a,#243
 196  0023 c750a2        	ld	20642,a
 198  0026 2008          	jra	L17
 199  0028               L76:
 200                     ; 99     EXTI->CR3 &= (uint8_t)(~EXTI_CR3_PBIS);
 202  0028 c650a2        	ld	a,20642
 203  002b a4fc          	and	a,#252
 204  002d c750a2        	ld	20642,a
 205  0030               L17:
 206                     ; 103   EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_Port);
 208  0030 7b01          	ld	a,(OFST+1,sp)
 209  0032 5f            	clrw	x
 210  0033 97            	ld	xl,a
 211  0034 7b02          	ld	a,(OFST+2,sp)
 212  0036 5d            	tnzw	x
 213  0037 2704          	jreq	L01
 214  0039               L21:
 215  0039 48            	sll	a
 216  003a 5a            	decw	x
 217  003b 26fc          	jrne	L21
 218  003d               L01:
 219  003d ca50a2        	or	a,20642
 220  0040 c750a2        	ld	20642,a
 221                     ; 105 }
 224  0043 85            	popw	x
 225  0044 81            	ret
 333                     ; 132 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_PinNum,
 333                     ; 133                             EXTI_Trigger_TypeDef EXTI_TriggerValue)
 333                     ; 134 {
 334                     	switch	.text
 335  0045               _EXTI_SetPinSensitivity:
 337  0045 89            	pushw	x
 338       00000000      OFST:	set	0
 341                     ; 137   assert_param(IS_EXTI_PINNUM(EXTI_PinNum));
 343                     ; 138   assert_param(IS_EXTI_Trigger_VALUE(EXTI_TriggerValue));
 345                     ; 141   switch (EXTI_PinNum)
 347  0046 9e            	ld	a,xh
 349                     ; 175     default:
 349                     ; 176       break;
 350  0047 4d            	tnz	a
 351  0048 272f          	jreq	L37
 352  004a a002          	sub	a,#2
 353  004c 274a          	jreq	L57
 354  004e a002          	sub	a,#2
 355  0050 2765          	jreq	L77
 356  0052 a002          	sub	a,#2
 357  0054 2603cc00d6    	jreq	L101
 358  0059 a00a          	sub	a,#10
 359  005b 2603          	jrne	L65
 360  005d cc00f3        	jp	L301
 361  0060               L65:
 362  0060 a002          	sub	a,#2
 363  0062 2603          	jrne	L06
 364  0064 cc0112        	jp	L501
 365  0067               L06:
 366  0067 a002          	sub	a,#2
 367  0069 2603          	jrne	L26
 368  006b cc0131        	jp	L701
 369  006e               L26:
 370  006e a002          	sub	a,#2
 371  0070 2603          	jrne	L46
 372  0072 cc0150        	jp	L111
 373  0075               L46:
 374  0075 ac6d016d      	jpf	L561
 375  0079               L37:
 376                     ; 143     case EXTI_Pin_0:
 376                     ; 144       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P0IS);
 378  0079 c650a0        	ld	a,20640
 379  007c a4fc          	and	a,#252
 380  007e c750a0        	ld	20640,a
 381                     ; 145       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 383  0081 7b01          	ld	a,(OFST+1,sp)
 384  0083 5f            	clrw	x
 385  0084 97            	ld	xl,a
 386  0085 7b02          	ld	a,(OFST+2,sp)
 387  0087 5d            	tnzw	x
 388  0088 2704          	jreq	L61
 389  008a               L02:
 390  008a 48            	sll	a
 391  008b 5a            	decw	x
 392  008c 26fc          	jrne	L02
 393  008e               L61:
 394  008e ca50a0        	or	a,20640
 395  0091 c750a0        	ld	20640,a
 396                     ; 146       break;
 398  0094 ac6d016d      	jpf	L561
 399  0098               L57:
 400                     ; 147     case EXTI_Pin_1:
 400                     ; 148       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P1IS);
 402  0098 c650a0        	ld	a,20640
 403  009b a4f3          	and	a,#243
 404  009d c750a0        	ld	20640,a
 405                     ; 149       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 407  00a0 7b01          	ld	a,(OFST+1,sp)
 408  00a2 5f            	clrw	x
 409  00a3 97            	ld	xl,a
 410  00a4 7b02          	ld	a,(OFST+2,sp)
 411  00a6 5d            	tnzw	x
 412  00a7 2704          	jreq	L22
 413  00a9               L42:
 414  00a9 48            	sll	a
 415  00aa 5a            	decw	x
 416  00ab 26fc          	jrne	L42
 417  00ad               L22:
 418  00ad ca50a0        	or	a,20640
 419  00b0 c750a0        	ld	20640,a
 420                     ; 150       break;
 422  00b3 ac6d016d      	jpf	L561
 423  00b7               L77:
 424                     ; 151     case EXTI_Pin_2:
 424                     ; 152       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P2IS);
 426  00b7 c650a0        	ld	a,20640
 427  00ba a4cf          	and	a,#207
 428  00bc c750a0        	ld	20640,a
 429                     ; 153       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 431  00bf 7b01          	ld	a,(OFST+1,sp)
 432  00c1 5f            	clrw	x
 433  00c2 97            	ld	xl,a
 434  00c3 7b02          	ld	a,(OFST+2,sp)
 435  00c5 5d            	tnzw	x
 436  00c6 2704          	jreq	L62
 437  00c8               L03:
 438  00c8 48            	sll	a
 439  00c9 5a            	decw	x
 440  00ca 26fc          	jrne	L03
 441  00cc               L62:
 442  00cc ca50a0        	or	a,20640
 443  00cf c750a0        	ld	20640,a
 444                     ; 154       break;
 446  00d2 ac6d016d      	jpf	L561
 447  00d6               L101:
 448                     ; 155     case EXTI_Pin_3:
 448                     ; 156       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P3IS);
 450  00d6 c650a0        	ld	a,20640
 451  00d9 a43f          	and	a,#63
 452  00db c750a0        	ld	20640,a
 453                     ; 157       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 455  00de 7b01          	ld	a,(OFST+1,sp)
 456  00e0 5f            	clrw	x
 457  00e1 97            	ld	xl,a
 458  00e2 7b02          	ld	a,(OFST+2,sp)
 459  00e4 5d            	tnzw	x
 460  00e5 2704          	jreq	L23
 461  00e7               L43:
 462  00e7 48            	sll	a
 463  00e8 5a            	decw	x
 464  00e9 26fc          	jrne	L43
 465  00eb               L23:
 466  00eb ca50a0        	or	a,20640
 467  00ee c750a0        	ld	20640,a
 468                     ; 158       break;
 470  00f1 207a          	jra	L561
 471  00f3               L301:
 472                     ; 159     case EXTI_Pin_4:
 472                     ; 160       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P4IS);
 474  00f3 c650a1        	ld	a,20641
 475  00f6 a4fc          	and	a,#252
 476  00f8 c750a1        	ld	20641,a
 477                     ; 161       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 479  00fb 7b01          	ld	a,(OFST+1,sp)
 480  00fd a4ef          	and	a,#239
 481  00ff 5f            	clrw	x
 482  0100 97            	ld	xl,a
 483  0101 7b02          	ld	a,(OFST+2,sp)
 484  0103 5d            	tnzw	x
 485  0104 2704          	jreq	L63
 486  0106               L04:
 487  0106 48            	sll	a
 488  0107 5a            	decw	x
 489  0108 26fc          	jrne	L04
 490  010a               L63:
 491  010a ca50a1        	or	a,20641
 492  010d c750a1        	ld	20641,a
 493                     ; 162       break;
 495  0110 205b          	jra	L561
 496  0112               L501:
 497                     ; 163     case EXTI_Pin_5:
 497                     ; 164       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P5IS);
 499  0112 c650a1        	ld	a,20641
 500  0115 a4f3          	and	a,#243
 501  0117 c750a1        	ld	20641,a
 502                     ; 165       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 504  011a 7b01          	ld	a,(OFST+1,sp)
 505  011c a4ef          	and	a,#239
 506  011e 5f            	clrw	x
 507  011f 97            	ld	xl,a
 508  0120 7b02          	ld	a,(OFST+2,sp)
 509  0122 5d            	tnzw	x
 510  0123 2704          	jreq	L24
 511  0125               L44:
 512  0125 48            	sll	a
 513  0126 5a            	decw	x
 514  0127 26fc          	jrne	L44
 515  0129               L24:
 516  0129 ca50a1        	or	a,20641
 517  012c c750a1        	ld	20641,a
 518                     ; 166       break;
 520  012f 203c          	jra	L561
 521  0131               L701:
 522                     ; 167     case EXTI_Pin_6:
 522                     ; 168       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P6IS);
 524  0131 c650a1        	ld	a,20641
 525  0134 a4cf          	and	a,#207
 526  0136 c750a1        	ld	20641,a
 527                     ; 169       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 529  0139 7b01          	ld	a,(OFST+1,sp)
 530  013b a4ef          	and	a,#239
 531  013d 5f            	clrw	x
 532  013e 97            	ld	xl,a
 533  013f 7b02          	ld	a,(OFST+2,sp)
 534  0141 5d            	tnzw	x
 535  0142 2704          	jreq	L64
 536  0144               L05:
 537  0144 48            	sll	a
 538  0145 5a            	decw	x
 539  0146 26fc          	jrne	L05
 540  0148               L64:
 541  0148 ca50a1        	or	a,20641
 542  014b c750a1        	ld	20641,a
 543                     ; 170       break;
 545  014e 201d          	jra	L561
 546  0150               L111:
 547                     ; 171     case EXTI_Pin_7:
 547                     ; 172       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P7IS);
 549  0150 c650a1        	ld	a,20641
 550  0153 a43f          	and	a,#63
 551  0155 c750a1        	ld	20641,a
 552                     ; 173       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 554  0158 7b01          	ld	a,(OFST+1,sp)
 555  015a a4ef          	and	a,#239
 556  015c 5f            	clrw	x
 557  015d 97            	ld	xl,a
 558  015e 7b02          	ld	a,(OFST+2,sp)
 559  0160 5d            	tnzw	x
 560  0161 2704          	jreq	L25
 561  0163               L45:
 562  0163 48            	sll	a
 563  0164 5a            	decw	x
 564  0165 26fc          	jrne	L45
 565  0167               L25:
 566  0167 ca50a1        	or	a,20641
 567  016a c750a1        	ld	20641,a
 568                     ; 174       break;
 570  016d               L311:
 571                     ; 175     default:
 571                     ; 176       break;
 573  016d               L561:
 574                     ; 178 }
 577  016d 85            	popw	x
 578  016e 81            	ret
 682                     ; 193 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 682                     ; 194                                FunctionalState NewState)
 682                     ; 195 {
 683                     	switch	.text
 684  016f               _EXTI_SetHalfPortSelection:
 686  016f 89            	pushw	x
 687       00000000      OFST:	set	0
 690                     ; 197   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 692                     ; 198   assert_param(IS_FUNCTIONAL_STATE(NewState));
 694                     ; 200   if (NewState != DISABLE)
 696  0170 9f            	ld	a,xl
 697  0171 4d            	tnz	a
 698  0172 2709          	jreq	L532
 699                     ; 202     EXTI->CONF |= (uint8_t)EXTI_HalfPort; /* Enable port interrupt selector */
 701  0174 9e            	ld	a,xh
 702  0175 ca50a5        	or	a,20645
 703  0178 c750a5        	ld	20645,a
 705  017b 2009          	jra	L732
 706  017d               L532:
 707                     ; 206     EXTI->CONF &= (uint8_t)(~(uint8_t)EXTI_HalfPort); /* Disable port interrupt selector */
 709  017d 7b01          	ld	a,(OFST+1,sp)
 710  017f 43            	cpl	a
 711  0180 c450a5        	and	a,20645
 712  0183 c750a5        	ld	20645,a
 713  0186               L732:
 714                     ; 208 }
 717  0186 85            	popw	x
 718  0187 81            	ret
 764                     ; 218 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
 764                     ; 219 {
 765                     	switch	.text
 766  0188               _EXTI_GetPortSensitivity:
 768  0188 88            	push	a
 769       00000001      OFST:	set	1
 772                     ; 220   uint8_t value = 0;
 774                     ; 223   assert_param(IS_EXTI_PORT(EXTI_Port));
 776                     ; 225   if (EXTI_Port != EXTI_Port_B)
 778  0189 4d            	tnz	a
 779  018a 270b          	jreq	L362
 780                     ; 227     value = (uint8_t)((EXTI->CR3 & EXTI_CR3_PDIS) >> 2);
 782  018c c650a2        	ld	a,20642
 783  018f a40c          	and	a,#12
 784  0191 44            	srl	a
 785  0192 44            	srl	a
 786  0193 6b01          	ld	(OFST+0,sp),a
 788  0195 2007          	jra	L562
 789  0197               L362:
 790                     ; 231     value = (uint8_t)(EXTI->CR3 & EXTI_CR3_PBIS);
 792  0197 c650a2        	ld	a,20642
 793  019a a403          	and	a,#3
 794  019c 6b01          	ld	(OFST+0,sp),a
 795  019e               L562:
 796                     ; 233   return((EXTI_Trigger_TypeDef)value);
 798  019e 7b01          	ld	a,(OFST+0,sp)
 801  01a0 5b01          	addw	sp,#1
 802  01a2 81            	ret
 848                     ; 250 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_PinNum)
 848                     ; 251 {
 849                     	switch	.text
 850  01a3               _EXTI_GetPinSensitivity:
 852  01a3 88            	push	a
 853       00000001      OFST:	set	1
 856                     ; 252   uint8_t value = 0;
 858  01a4 0f01          	clr	(OFST+0,sp)
 859                     ; 255   assert_param(IS_EXTI_PINNUM(EXTI_PinNum));
 861                     ; 257   switch (EXTI_PinNum)
 864                     ; 283     default:
 864                     ; 284       break;
 865  01a6 4d            	tnz	a
 866  01a7 271e          	jreq	L762
 867  01a9 a002          	sub	a,#2
 868  01ab 2723          	jreq	L172
 869  01ad a002          	sub	a,#2
 870  01af 272a          	jreq	L372
 871  01b1 a002          	sub	a,#2
 872  01b3 2732          	jreq	L572
 873  01b5 a00a          	sub	a,#10
 874  01b7 273c          	jreq	L772
 875  01b9 a002          	sub	a,#2
 876  01bb 2741          	jreq	L103
 877  01bd a002          	sub	a,#2
 878  01bf 2748          	jreq	L303
 879  01c1 a002          	sub	a,#2
 880  01c3 2750          	jreq	L503
 881  01c5 205a          	jra	L533
 882  01c7               L762:
 883                     ; 259     case EXTI_Pin_0:
 883                     ; 260       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
 885  01c7 c650a0        	ld	a,20640
 886  01ca a403          	and	a,#3
 887  01cc 6b01          	ld	(OFST+0,sp),a
 888                     ; 261       break;
 890  01ce 2051          	jra	L533
 891  01d0               L172:
 892                     ; 262     case EXTI_Pin_1:
 892                     ; 263       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P1IS) >> (uint8_t)EXTI_Pin_1);
 894  01d0 c650a0        	ld	a,20640
 895  01d3 a40c          	and	a,#12
 896  01d5 44            	srl	a
 897  01d6 44            	srl	a
 898  01d7 6b01          	ld	(OFST+0,sp),a
 899                     ; 264       break;
 901  01d9 2046          	jra	L533
 902  01db               L372:
 903                     ; 265     case EXTI_Pin_2:
 903                     ; 266       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P2IS) >> (uint8_t)EXTI_Pin_2);
 905  01db c650a0        	ld	a,20640
 906  01de a430          	and	a,#48
 907  01e0 4e            	swap	a
 908  01e1 a40f          	and	a,#15
 909  01e3 6b01          	ld	(OFST+0,sp),a
 910                     ; 267       break;
 912  01e5 203a          	jra	L533
 913  01e7               L572:
 914                     ; 268     case EXTI_Pin_3:
 914                     ; 269       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P3IS) >> (uint8_t)EXTI_Pin_3);
 916  01e7 c650a0        	ld	a,20640
 917  01ea a4c0          	and	a,#192
 918  01ec 4e            	swap	a
 919  01ed 44            	srl	a
 920  01ee 44            	srl	a
 921  01ef a403          	and	a,#3
 922  01f1 6b01          	ld	(OFST+0,sp),a
 923                     ; 270       break;
 925  01f3 202c          	jra	L533
 926  01f5               L772:
 927                     ; 271     case EXTI_Pin_4:
 927                     ; 272       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
 929  01f5 c650a1        	ld	a,20641
 930  01f8 a403          	and	a,#3
 931  01fa 6b01          	ld	(OFST+0,sp),a
 932                     ; 273       break;
 934  01fc 2023          	jra	L533
 935  01fe               L103:
 936                     ; 274     case EXTI_Pin_5:
 936                     ; 275       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
 938  01fe c650a1        	ld	a,20641
 939  0201 a40c          	and	a,#12
 940  0203 44            	srl	a
 941  0204 44            	srl	a
 942  0205 6b01          	ld	(OFST+0,sp),a
 943                     ; 276       break;
 945  0207 2018          	jra	L533
 946  0209               L303:
 947                     ; 277     case EXTI_Pin_6:
 947                     ; 278       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
 949  0209 c650a1        	ld	a,20641
 950  020c a430          	and	a,#48
 951  020e 4e            	swap	a
 952  020f a40f          	and	a,#15
 953  0211 6b01          	ld	(OFST+0,sp),a
 954                     ; 279       break;
 956  0213 200c          	jra	L533
 957  0215               L503:
 958                     ; 280     case EXTI_Pin_7:
 958                     ; 281       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
 960  0215 c650a1        	ld	a,20641
 961  0218 a4c0          	and	a,#192
 962  021a 4e            	swap	a
 963  021b 44            	srl	a
 964  021c 44            	srl	a
 965  021d a403          	and	a,#3
 966  021f 6b01          	ld	(OFST+0,sp),a
 967                     ; 282       break;
 969  0221               L703:
 970                     ; 283     default:
 970                     ; 284       break;
 972  0221               L533:
 973                     ; 286   return((EXTI_Trigger_TypeDef)value);
 975  0221 7b01          	ld	a,(OFST+0,sp)
 978  0223 5b01          	addw	sp,#1
 979  0225 81            	ret
1026                     ; 299 FunctionalState EXTI_GetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort)
1026                     ; 300 {
1027                     	switch	.text
1028  0226               _EXTI_GetHalfPortSelection:
1030  0226 88            	push	a
1031       00000001      OFST:	set	1
1034                     ; 301   FunctionalState value = DISABLE;
1036                     ; 303   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
1038                     ; 304   if ((EXTI->CONF & (uint8_t)EXTI_HalfPort) != (uint8_t)DISABLE)
1040  0227 c450a5        	and	a,20645
1041  022a 2706          	jreq	L163
1042                     ; 306     value = ENABLE;
1044  022c a601          	ld	a,#1
1045  022e 6b01          	ld	(OFST+0,sp),a
1047  0230 2002          	jra	L363
1048  0232               L163:
1049                     ; 310     value = DISABLE;
1051  0232 0f01          	clr	(OFST+0,sp)
1052  0234               L363:
1053                     ; 313   return(value);
1055  0234 7b01          	ld	a,(OFST+0,sp)
1058  0236 5b01          	addw	sp,#1
1059  0238 81            	ret
1201                     ; 332 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1201                     ; 333 {
1202                     	switch	.text
1203  0239               _EXTI_GetITStatus:
1205  0239 88            	push	a
1206  023a 88            	push	a
1207       00000001      OFST:	set	1
1210                     ; 334   ITStatus status = RESET;
1212                     ; 336   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1214                     ; 338   if (((uint8_t)EXTI_IT & (uint8_t)0xF0) == 0xF0)
1216  023b a4f0          	and	a,#240
1217  023d a1f0          	cp	a,#240
1218  023f 260b          	jrne	L744
1219                     ; 340     status = (ITStatus)(EXTI->SR2 & ((uint8_t)EXTI_IT & (uint8_t)0x0F));
1221  0241 7b02          	ld	a,(OFST+1,sp)
1222  0243 a40f          	and	a,#15
1223  0245 c450a4        	and	a,20644
1224  0248 6b01          	ld	(OFST+0,sp),a
1226  024a 2007          	jra	L154
1227  024c               L744:
1228                     ; 344     status = (ITStatus)(EXTI->SR1 & (uint8_t)EXTI_IT);
1230  024c c650a3        	ld	a,20643
1231  024f 1402          	and	a,(OFST+1,sp)
1232  0251 6b01          	ld	(OFST+0,sp),a
1233  0253               L154:
1234                     ; 346   return((ITStatus)status);
1236  0253 7b01          	ld	a,(OFST+0,sp)
1239  0255 85            	popw	x
1240  0256 81            	ret
1276                     ; 365 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1276                     ; 366 {
1277                     	switch	.text
1278  0257               _EXTI_ClearITPendingBit:
1280  0257 88            	push	a
1281       00000000      OFST:	set	0
1284                     ; 368   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1286                     ; 370   if (((uint8_t)EXTI_IT & (uint8_t)0xF0) == 0xF0)
1288  0258 a4f0          	and	a,#240
1289  025a a1f0          	cp	a,#240
1290  025c 2609          	jrne	L174
1291                     ; 372     EXTI->SR2 = (uint8_t)((uint8_t)EXTI_IT & (uint8_t)0x0F);
1293  025e 7b01          	ld	a,(OFST+1,sp)
1294  0260 a40f          	and	a,#15
1295  0262 c750a4        	ld	20644,a
1297  0265 2005          	jra	L374
1298  0267               L174:
1299                     ; 376     EXTI->SR1 = (uint8_t)EXTI_IT;
1301  0267 7b01          	ld	a,(OFST+1,sp)
1302  0269 c750a3        	ld	20643,a
1303  026c               L374:
1304                     ; 378 }
1307  026c 84            	pop	a
1308  026d 81            	ret
1321                     	xdef	_EXTI_ClearITPendingBit
1322                     	xdef	_EXTI_GetITStatus
1323                     	xdef	_EXTI_GetHalfPortSelection
1324                     	xdef	_EXTI_GetPinSensitivity
1325                     	xdef	_EXTI_GetPortSensitivity
1326                     	xdef	_EXTI_SetHalfPortSelection
1327                     	xdef	_EXTI_SetPinSensitivity
1328                     	xdef	_EXTI_SetPortSensitivity
1329                     	xdef	_EXTI_DeInit
1348                     	end
