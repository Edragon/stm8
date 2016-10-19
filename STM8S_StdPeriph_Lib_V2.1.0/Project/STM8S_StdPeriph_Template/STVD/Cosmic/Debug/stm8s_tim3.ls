   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 45 void TIM3_DeInit(void)
  33                     ; 46 {
  35                     .text:	section	.text,new
  36  0000               _TIM3_DeInit:
  40                     ; 48     TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  42  0000 725f5320      	clr	21280
  43                     ; 49     TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  45  0004 725f5321      	clr	21281
  46                     ; 50     TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  48  0008 725f5323      	clr	21283
  49                     ; 53     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  51  000c 725f5327      	clr	21287
  52                     ; 56     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  54  0010 725f5327      	clr	21287
  55                     ; 57     TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  57  0014 725f5325      	clr	21285
  58                     ; 58     TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  60  0018 725f5326      	clr	21286
  61                     ; 59     TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  63  001c 725f5328      	clr	21288
  64                     ; 60     TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  66  0020 725f5329      	clr	21289
  67                     ; 61     TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  69  0024 725f532a      	clr	21290
  70                     ; 62     TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  72  0028 35ff532b      	mov	21291,#255
  73                     ; 63     TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  75  002c 35ff532c      	mov	21292,#255
  76                     ; 64     TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  78  0030 725f532d      	clr	21293
  79                     ; 65     TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  81  0034 725f532e      	clr	21294
  82                     ; 66     TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  84  0038 725f532f      	clr	21295
  85                     ; 67     TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  87  003c 725f5330      	clr	21296
  88                     ; 68     TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
  90  0040 725f5322      	clr	21282
  91                     ; 69 }
  94  0044 81            	ret	
 260                     ; 78 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 260                     ; 79                         uint16_t TIM3_Period)
 260                     ; 80 {
 261                     .text:	section	.text,new
 262  0000               _TIM3_TimeBaseInit:
 264  0000 88            	push	a
 265       00000000      OFST:	set	0
 268                     ; 82     TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 270  0001 c7532a        	ld	21290,a
 271                     ; 84     TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 273  0004 7b04          	ld	a,(OFST+4,sp)
 274  0006 c7532b        	ld	21291,a
 275                     ; 85     TIM3->ARRL = (uint8_t)(TIM3_Period);
 277  0009 7b05          	ld	a,(OFST+5,sp)
 278  000b c7532c        	ld	21292,a
 279                     ; 86 }
 282  000e 84            	pop	a
 283  000f 81            	ret	
 439                     ; 96 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 439                     ; 97                   TIM3_OutputState_TypeDef TIM3_OutputState,
 439                     ; 98                   uint16_t TIM3_Pulse,
 439                     ; 99                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 439                     ; 100 {
 440                     .text:	section	.text,new
 441  0000               _TIM3_OC1Init:
 443  0000 89            	pushw	x
 444  0001 88            	push	a
 445       00000001      OFST:	set	1
 448                     ; 102     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 450  0002 9e            	ld	a,xh
 451  0003 4d            	tnz	a
 452  0004 271e          	jreq	L61
 453  0006 9e            	ld	a,xh
 454  0007 a110          	cp	a,#16
 455  0009 2719          	jreq	L61
 456  000b 9e            	ld	a,xh
 457  000c a120          	cp	a,#32
 458  000e 2714          	jreq	L61
 459  0010 9e            	ld	a,xh
 460  0011 a130          	cp	a,#48
 461  0013 270f          	jreq	L61
 462  0015 9e            	ld	a,xh
 463  0016 a160          	cp	a,#96
 464  0018 270a          	jreq	L61
 465  001a 9e            	ld	a,xh
 466  001b a170          	cp	a,#112
 467  001d 2705          	jreq	L61
 468  001f ae0066        	ldw	x,#102
 469  0022 ad4b          	call	LC001
 470  0024               L61:
 471                     ; 103     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 473  0024 7b03          	ld	a,(OFST+2,sp)
 474  0026 2709          	jreq	L62
 475  0028 a111          	cp	a,#17
 476  002a 2705          	jreq	L62
 477  002c ae0067        	ldw	x,#103
 478  002f ad3e          	call	LC001
 479  0031               L62:
 480                     ; 104     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 482  0031 7b08          	ld	a,(OFST+7,sp)
 483  0033 2709          	jreq	L63
 484  0035 a122          	cp	a,#34
 485  0037 2705          	jreq	L63
 486  0039 ae0068        	ldw	x,#104
 487  003c ad31          	call	LC001
 488  003e               L63:
 489                     ; 107     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 491  003e c65327        	ld	a,21287
 492  0041 a4fc          	and	a,#252
 493  0043 c75327        	ld	21287,a
 494                     ; 109     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 496  0046 7b08          	ld	a,(OFST+7,sp)
 497  0048 a402          	and	a,#2
 498  004a 6b01          	ld	(OFST+0,sp),a
 499  004c 7b03          	ld	a,(OFST+2,sp)
 500  004e a401          	and	a,#1
 501  0050 1a01          	or	a,(OFST+0,sp)
 502  0052 ca5327        	or	a,21287
 503  0055 c75327        	ld	21287,a
 504                     ; 112     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 506  0058 c65325        	ld	a,21285
 507  005b a48f          	and	a,#143
 508  005d 1a02          	or	a,(OFST+1,sp)
 509  005f c75325        	ld	21285,a
 510                     ; 115     TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 512  0062 7b06          	ld	a,(OFST+5,sp)
 513  0064 c7532d        	ld	21293,a
 514                     ; 116     TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 516  0067 7b07          	ld	a,(OFST+6,sp)
 517  0069 c7532e        	ld	21294,a
 518                     ; 117 }
 521  006c 5b03          	addw	sp,#3
 522  006e 81            	ret	
 524  006f               LC001:
 525  006f 89            	pushw	x
 526  0070 5f            	clrw	x
 527  0071 89            	pushw	x
 528  0072 ae0000        	ldw	x,#L102
 529  0075 cd0000        	call	_assert_failed
 531  0078 5b04          	addw	sp,#4
 532  007a 81            	ret	
 594                     ; 128 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 594                     ; 129                   TIM3_OutputState_TypeDef TIM3_OutputState,
 594                     ; 130                   uint16_t TIM3_Pulse,
 594                     ; 131                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 594                     ; 132 {
 595                     .text:	section	.text,new
 596  0000               _TIM3_OC2Init:
 598  0000 89            	pushw	x
 599  0001 88            	push	a
 600       00000001      OFST:	set	1
 603                     ; 134     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 605  0002 9e            	ld	a,xh
 606  0003 4d            	tnz	a
 607  0004 271e          	jreq	L05
 608  0006 9e            	ld	a,xh
 609  0007 a110          	cp	a,#16
 610  0009 2719          	jreq	L05
 611  000b 9e            	ld	a,xh
 612  000c a120          	cp	a,#32
 613  000e 2714          	jreq	L05
 614  0010 9e            	ld	a,xh
 615  0011 a130          	cp	a,#48
 616  0013 270f          	jreq	L05
 617  0015 9e            	ld	a,xh
 618  0016 a160          	cp	a,#96
 619  0018 270a          	jreq	L05
 620  001a 9e            	ld	a,xh
 621  001b a170          	cp	a,#112
 622  001d 2705          	jreq	L05
 623  001f ae0086        	ldw	x,#134
 624  0022 ad4b          	call	LC002
 625  0024               L05:
 626                     ; 135     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 628  0024 7b03          	ld	a,(OFST+2,sp)
 629  0026 2709          	jreq	L06
 630  0028 a111          	cp	a,#17
 631  002a 2705          	jreq	L06
 632  002c ae0087        	ldw	x,#135
 633  002f ad3e          	call	LC002
 634  0031               L06:
 635                     ; 136     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 637  0031 7b08          	ld	a,(OFST+7,sp)
 638  0033 2709          	jreq	L07
 639  0035 a122          	cp	a,#34
 640  0037 2705          	jreq	L07
 641  0039 ae0088        	ldw	x,#136
 642  003c ad31          	call	LC002
 643  003e               L07:
 644                     ; 140     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 646  003e c65327        	ld	a,21287
 647  0041 a4cf          	and	a,#207
 648  0043 c75327        	ld	21287,a
 649                     ; 142     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 651  0046 7b08          	ld	a,(OFST+7,sp)
 652  0048 a420          	and	a,#32
 653  004a 6b01          	ld	(OFST+0,sp),a
 654  004c 7b03          	ld	a,(OFST+2,sp)
 655  004e a410          	and	a,#16
 656  0050 1a01          	or	a,(OFST+0,sp)
 657  0052 ca5327        	or	a,21287
 658  0055 c75327        	ld	21287,a
 659                     ; 146     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 661  0058 c65326        	ld	a,21286
 662  005b a48f          	and	a,#143
 663  005d 1a02          	or	a,(OFST+1,sp)
 664  005f c75326        	ld	21286,a
 665                     ; 150     TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 667  0062 7b06          	ld	a,(OFST+5,sp)
 668  0064 c7532f        	ld	21295,a
 669                     ; 151     TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 671  0067 7b07          	ld	a,(OFST+6,sp)
 672  0069 c75330        	ld	21296,a
 673                     ; 152 }
 676  006c 5b03          	addw	sp,#3
 677  006e 81            	ret	
 679  006f               LC002:
 680  006f 89            	pushw	x
 681  0070 5f            	clrw	x
 682  0071 89            	pushw	x
 683  0072 ae0000        	ldw	x,#L102
 684  0075 cd0000        	call	_assert_failed
 686  0078 5b04          	addw	sp,#4
 687  007a 81            	ret	
 869                     ; 163 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 869                     ; 164                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 869                     ; 165                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 869                     ; 166                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 869                     ; 167                  uint8_t TIM3_ICFilter)
 869                     ; 168 {
 870                     .text:	section	.text,new
 871  0000               _TIM3_ICInit:
 873  0000 89            	pushw	x
 874       00000000      OFST:	set	0
 877                     ; 170     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 879  0001 9e            	ld	a,xh
 880  0002 4d            	tnz	a
 881  0003 2709          	jreq	L201
 882  0005 9e            	ld	a,xh
 883  0006 4a            	dec	a
 884  0007 2705          	jreq	L201
 885  0009 ae00aa        	ldw	x,#170
 886  000c ad6d          	call	LC003
 887  000e               L201:
 888                     ; 171     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 890  000e 7b02          	ld	a,(OFST+2,sp)
 891  0010 2709          	jreq	L211
 892  0012 a144          	cp	a,#68
 893  0014 2705          	jreq	L211
 894  0016 ae00ab        	ldw	x,#171
 895  0019 ad60          	call	LC003
 896  001b               L211:
 897                     ; 172     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 899  001b 7b05          	ld	a,(OFST+5,sp)
 900  001d a101          	cp	a,#1
 901  001f 270d          	jreq	L221
 902  0021 a102          	cp	a,#2
 903  0023 2709          	jreq	L221
 904  0025 a103          	cp	a,#3
 905  0027 2705          	jreq	L221
 906  0029 ae00ac        	ldw	x,#172
 907  002c ad4d          	call	LC003
 908  002e               L221:
 909                     ; 173     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 911  002e 7b06          	ld	a,(OFST+6,sp)
 912  0030 2711          	jreq	L231
 913  0032 a104          	cp	a,#4
 914  0034 270d          	jreq	L231
 915  0036 a108          	cp	a,#8
 916  0038 2709          	jreq	L231
 917  003a a10c          	cp	a,#12
 918  003c 2705          	jreq	L231
 919  003e ae00ad        	ldw	x,#173
 920  0041 ad38          	call	LC003
 921  0043               L231:
 922                     ; 174     assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 924  0043 7b07          	ld	a,(OFST+7,sp)
 925  0045 a110          	cp	a,#16
 926  0047 2505          	jrult	L041
 927  0049 ae00ae        	ldw	x,#174
 928  004c ad2d          	call	LC003
 929  004e               L041:
 930                     ; 176     if (TIM3_Channel != TIM3_CHANNEL_2)
 932  004e 7b01          	ld	a,(OFST+1,sp)
 933  0050 4a            	dec	a
 934  0051 2714          	jreq	L533
 935                     ; 179         TI1_Config((uint8_t)TIM3_ICPolarity,
 935                     ; 180                    (uint8_t)TIM3_ICSelection,
 935                     ; 181                    (uint8_t)TIM3_ICFilter);
 937  0053 7b07          	ld	a,(OFST+7,sp)
 938  0055 88            	push	a
 939  0056 7b06          	ld	a,(OFST+6,sp)
 940  0058 97            	ld	xl,a
 941  0059 7b03          	ld	a,(OFST+3,sp)
 942  005b 95            	ld	xh,a
 943  005c cd0000        	call	L3_TI1_Config
 945  005f 84            	pop	a
 946                     ; 184         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 948  0060 7b06          	ld	a,(OFST+6,sp)
 949  0062 cd0000        	call	_TIM3_SetIC1Prescaler
 952  0065 2012          	jra	L733
 953  0067               L533:
 954                     ; 189         TI2_Config((uint8_t)TIM3_ICPolarity,
 954                     ; 190                    (uint8_t)TIM3_ICSelection,
 954                     ; 191                    (uint8_t)TIM3_ICFilter);
 956  0067 7b07          	ld	a,(OFST+7,sp)
 957  0069 88            	push	a
 958  006a 7b06          	ld	a,(OFST+6,sp)
 959  006c 97            	ld	xl,a
 960  006d 7b03          	ld	a,(OFST+3,sp)
 961  006f 95            	ld	xh,a
 962  0070 cd0000        	call	L5_TI2_Config
 964  0073 84            	pop	a
 965                     ; 194         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 967  0074 7b06          	ld	a,(OFST+6,sp)
 968  0076 cd0000        	call	_TIM3_SetIC2Prescaler
 970  0079               L733:
 971                     ; 196 }
 974  0079 85            	popw	x
 975  007a 81            	ret	
 977  007b               LC003:
 978  007b 89            	pushw	x
 979  007c 5f            	clrw	x
 980  007d 89            	pushw	x
 981  007e ae0000        	ldw	x,#L102
 982  0081 cd0000        	call	_assert_failed
 984  0084 5b04          	addw	sp,#4
 985  0086 81            	ret	
1075                     ; 206 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1075                     ; 207                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1075                     ; 208                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1075                     ; 209                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1075                     ; 210                      uint8_t TIM3_ICFilter)
1075                     ; 211 {
1076                     .text:	section	.text,new
1077  0000               _TIM3_PWMIConfig:
1079  0000 89            	pushw	x
1080  0001 89            	pushw	x
1081       00000002      OFST:	set	2
1084                     ; 212     uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1086                     ; 213     uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1088                     ; 216     assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
1090  0002 7b03          	ld	a,(OFST+1,sp)
1091  0004 2709          	jreq	L261
1092  0006 4a            	dec	a
1093  0007 2706          	jreq	L261
1094  0009 ae00d8        	ldw	x,#216
1095  000c cd00b3        	call	LC004
1096  000f               L261:
1097                     ; 217     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
1099  000f 7b04          	ld	a,(OFST+2,sp)
1100  0011 270a          	jreq	L271
1101  0013 a144          	cp	a,#68
1102  0015 2706          	jreq	L271
1103  0017 ae00d9        	ldw	x,#217
1104  001a cd00b3        	call	LC004
1105  001d               L271:
1106                     ; 218     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
1108  001d 7b07          	ld	a,(OFST+5,sp)
1109  001f a101          	cp	a,#1
1110  0021 270e          	jreq	L202
1111  0023 a102          	cp	a,#2
1112  0025 270a          	jreq	L202
1113  0027 a103          	cp	a,#3
1114  0029 2706          	jreq	L202
1115  002b ae00da        	ldw	x,#218
1116  002e cd00b3        	call	LC004
1117  0031               L202:
1118                     ; 219     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
1120  0031 7b08          	ld	a,(OFST+6,sp)
1121  0033 2711          	jreq	L212
1122  0035 a104          	cp	a,#4
1123  0037 270d          	jreq	L212
1124  0039 a108          	cp	a,#8
1125  003b 2709          	jreq	L212
1126  003d a10c          	cp	a,#12
1127  003f 2705          	jreq	L212
1128  0041 ae00db        	ldw	x,#219
1129  0044 ad6d          	call	LC004
1130  0046               L212:
1131                     ; 222     if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
1133  0046 7b04          	ld	a,(OFST+2,sp)
1134  0048 a144          	cp	a,#68
1135  004a 2706          	jreq	L104
1136                     ; 224         icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
1138  004c a644          	ld	a,#68
1139  004e 6b01          	ld	(OFST-1,sp),a
1141  0050 2002          	jra	L304
1142  0052               L104:
1143                     ; 228         icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1145  0052 0f01          	clr	(OFST-1,sp)
1146  0054               L304:
1147                     ; 232     if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
1149  0054 7b07          	ld	a,(OFST+5,sp)
1150  0056 4a            	dec	a
1151  0057 2604          	jrne	L504
1152                     ; 234         icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
1154  0059 a602          	ld	a,#2
1156  005b 2002          	jra	L704
1157  005d               L504:
1158                     ; 238         icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1160  005d a601          	ld	a,#1
1161  005f               L704:
1162  005f 6b02          	ld	(OFST+0,sp),a
1163                     ; 241     if (TIM3_Channel != TIM3_CHANNEL_2)
1165  0061 7b03          	ld	a,(OFST+1,sp)
1166  0063 4a            	dec	a
1167  0064 2726          	jreq	L114
1168                     ; 244         TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1168                     ; 245                    (uint8_t)TIM3_ICFilter);
1170  0066 7b09          	ld	a,(OFST+7,sp)
1171  0068 88            	push	a
1172  0069 7b08          	ld	a,(OFST+6,sp)
1173  006b 97            	ld	xl,a
1174  006c 7b05          	ld	a,(OFST+3,sp)
1175  006e 95            	ld	xh,a
1176  006f cd0000        	call	L3_TI1_Config
1178  0072 84            	pop	a
1179                     ; 248         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1181  0073 7b08          	ld	a,(OFST+6,sp)
1182  0075 cd0000        	call	_TIM3_SetIC1Prescaler
1184                     ; 251         TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1186  0078 7b09          	ld	a,(OFST+7,sp)
1187  007a 88            	push	a
1188  007b 7b03          	ld	a,(OFST+1,sp)
1189  007d 97            	ld	xl,a
1190  007e 7b02          	ld	a,(OFST+0,sp)
1191  0080 95            	ld	xh,a
1192  0081 cd0000        	call	L5_TI2_Config
1194  0084 84            	pop	a
1195                     ; 254         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1197  0085 7b08          	ld	a,(OFST+6,sp)
1198  0087 cd0000        	call	_TIM3_SetIC2Prescaler
1201  008a 2024          	jra	L314
1202  008c               L114:
1203                     ; 259         TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1203                     ; 260                    (uint8_t)TIM3_ICFilter);
1205  008c 7b09          	ld	a,(OFST+7,sp)
1206  008e 88            	push	a
1207  008f 7b08          	ld	a,(OFST+6,sp)
1208  0091 97            	ld	xl,a
1209  0092 7b05          	ld	a,(OFST+3,sp)
1210  0094 95            	ld	xh,a
1211  0095 cd0000        	call	L5_TI2_Config
1213  0098 84            	pop	a
1214                     ; 263         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1216  0099 7b08          	ld	a,(OFST+6,sp)
1217  009b cd0000        	call	_TIM3_SetIC2Prescaler
1219                     ; 266         TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1221  009e 7b09          	ld	a,(OFST+7,sp)
1222  00a0 88            	push	a
1223  00a1 7b03          	ld	a,(OFST+1,sp)
1224  00a3 97            	ld	xl,a
1225  00a4 7b02          	ld	a,(OFST+0,sp)
1226  00a6 95            	ld	xh,a
1227  00a7 cd0000        	call	L3_TI1_Config
1229  00aa 84            	pop	a
1230                     ; 269         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1232  00ab 7b08          	ld	a,(OFST+6,sp)
1233  00ad cd0000        	call	_TIM3_SetIC1Prescaler
1235  00b0               L314:
1236                     ; 271 }
1239  00b0 5b04          	addw	sp,#4
1240  00b2 81            	ret	
1242  00b3               LC004:
1243  00b3 89            	pushw	x
1244  00b4 5f            	clrw	x
1245  00b5 89            	pushw	x
1246  00b6 ae0000        	ldw	x,#L102
1247  00b9 cd0000        	call	_assert_failed
1249  00bc 5b04          	addw	sp,#4
1250  00be 81            	ret	
1305                     ; 280 void TIM3_Cmd(FunctionalState NewState)
1305                     ; 281 {
1306                     .text:	section	.text,new
1307  0000               _TIM3_Cmd:
1309  0000 88            	push	a
1310       00000000      OFST:	set	0
1313                     ; 283     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1315  0001 4d            	tnz	a
1316  0002 2711          	jreq	L442
1317  0004 4a            	dec	a
1318  0005 270e          	jreq	L442
1319  0007 ae011b        	ldw	x,#283
1320  000a 89            	pushw	x
1321  000b 5f            	clrw	x
1322  000c 89            	pushw	x
1323  000d ae0000        	ldw	x,#L102
1324  0010 cd0000        	call	_assert_failed
1326  0013 5b04          	addw	sp,#4
1327  0015               L442:
1328                     ; 286     if (NewState != DISABLE)
1330  0015 7b01          	ld	a,(OFST+1,sp)
1331  0017 2706          	jreq	L344
1332                     ; 288         TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1334  0019 72105320      	bset	21280,#0
1336  001d 2004          	jra	L544
1337  001f               L344:
1338                     ; 292         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1340  001f 72115320      	bres	21280,#0
1341  0023               L544:
1342                     ; 294 }
1345  0023 84            	pop	a
1346  0024 81            	ret	
1419                     ; 309 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1419                     ; 310 {
1420                     .text:	section	.text,new
1421  0000               _TIM3_ITConfig:
1423  0000 89            	pushw	x
1424       00000000      OFST:	set	0
1427                     ; 312     assert_param(IS_TIM3_IT_OK(TIM3_IT));
1429  0001 9e            	ld	a,xh
1430  0002 4d            	tnz	a
1431  0003 2705          	jreq	L252
1432  0005 9e            	ld	a,xh
1433  0006 a108          	cp	a,#8
1434  0008 2505          	jrult	L452
1435  000a               L252:
1436  000a ae0138        	ldw	x,#312
1437  000d ad22          	call	LC005
1438  000f               L452:
1439                     ; 313     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1441  000f 7b02          	ld	a,(OFST+2,sp)
1442  0011 2708          	jreq	L462
1443  0013 4a            	dec	a
1444  0014 2705          	jreq	L462
1445  0016 ae0139        	ldw	x,#313
1446  0019 ad16          	call	LC005
1447  001b               L462:
1448                     ; 315     if (NewState != DISABLE)
1450  001b 7b02          	ld	a,(OFST+2,sp)
1451  001d 2707          	jreq	L305
1452                     ; 318         TIM3->IER |= (uint8_t)TIM3_IT;
1454  001f c65321        	ld	a,21281
1455  0022 1a01          	or	a,(OFST+1,sp)
1457  0024 2006          	jra	L505
1458  0026               L305:
1459                     ; 323         TIM3->IER &= (uint8_t)(~TIM3_IT);
1461  0026 7b01          	ld	a,(OFST+1,sp)
1462  0028 43            	cpl	a
1463  0029 c45321        	and	a,21281
1464  002c               L505:
1465  002c c75321        	ld	21281,a
1466                     ; 325 }
1469  002f 85            	popw	x
1470  0030 81            	ret	
1472  0031               LC005:
1473  0031 89            	pushw	x
1474  0032 5f            	clrw	x
1475  0033 89            	pushw	x
1476  0034 ae0000        	ldw	x,#L102
1477  0037 cd0000        	call	_assert_failed
1479  003a 5b04          	addw	sp,#4
1480  003c 81            	ret	
1516                     ; 334 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1516                     ; 335 {
1517                     .text:	section	.text,new
1518  0000               _TIM3_UpdateDisableConfig:
1520  0000 88            	push	a
1521       00000000      OFST:	set	0
1524                     ; 337     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1526  0001 4d            	tnz	a
1527  0002 2711          	jreq	L672
1528  0004 4a            	dec	a
1529  0005 270e          	jreq	L672
1530  0007 ae0151        	ldw	x,#337
1531  000a 89            	pushw	x
1532  000b 5f            	clrw	x
1533  000c 89            	pushw	x
1534  000d ae0000        	ldw	x,#L102
1535  0010 cd0000        	call	_assert_failed
1537  0013 5b04          	addw	sp,#4
1538  0015               L672:
1539                     ; 340     if (NewState != DISABLE)
1541  0015 7b01          	ld	a,(OFST+1,sp)
1542  0017 2706          	jreq	L525
1543                     ; 342         TIM3->CR1 |= TIM3_CR1_UDIS;
1545  0019 72125320      	bset	21280,#1
1547  001d 2004          	jra	L725
1548  001f               L525:
1549                     ; 346         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1551  001f 72135320      	bres	21280,#1
1552  0023               L725:
1553                     ; 348 }
1556  0023 84            	pop	a
1557  0024 81            	ret	
1616                     ; 358 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1616                     ; 359 {
1617                     .text:	section	.text,new
1618  0000               _TIM3_UpdateRequestConfig:
1620  0000 88            	push	a
1621       00000000      OFST:	set	0
1624                     ; 361     assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1626  0001 4d            	tnz	a
1627  0002 2711          	jreq	L013
1628  0004 4a            	dec	a
1629  0005 270e          	jreq	L013
1630  0007 ae0169        	ldw	x,#361
1631  000a 89            	pushw	x
1632  000b 5f            	clrw	x
1633  000c 89            	pushw	x
1634  000d ae0000        	ldw	x,#L102
1635  0010 cd0000        	call	_assert_failed
1637  0013 5b04          	addw	sp,#4
1638  0015               L013:
1639                     ; 364     if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1641  0015 7b01          	ld	a,(OFST+1,sp)
1642  0017 2706          	jreq	L755
1643                     ; 366         TIM3->CR1 |= TIM3_CR1_URS;
1645  0019 72145320      	bset	21280,#2
1647  001d 2004          	jra	L165
1648  001f               L755:
1649                     ; 370         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1651  001f 72155320      	bres	21280,#2
1652  0023               L165:
1653                     ; 372 }
1656  0023 84            	pop	a
1657  0024 81            	ret	
1715                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1715                     ; 384 {
1716                     .text:	section	.text,new
1717  0000               _TIM3_SelectOnePulseMode:
1719  0000 88            	push	a
1720       00000000      OFST:	set	0
1723                     ; 386     assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1725  0001 a101          	cp	a,#1
1726  0003 2711          	jreq	L223
1727  0005 4d            	tnz	a
1728  0006 270e          	jreq	L223
1729  0008 ae0182        	ldw	x,#386
1730  000b 89            	pushw	x
1731  000c 5f            	clrw	x
1732  000d 89            	pushw	x
1733  000e ae0000        	ldw	x,#L102
1734  0011 cd0000        	call	_assert_failed
1736  0014 5b04          	addw	sp,#4
1737  0016               L223:
1738                     ; 389     if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1740  0016 7b01          	ld	a,(OFST+1,sp)
1741  0018 2706          	jreq	L116
1742                     ; 391         TIM3->CR1 |= TIM3_CR1_OPM;
1744  001a 72165320      	bset	21280,#3
1746  001e 2004          	jra	L316
1747  0020               L116:
1748                     ; 395         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1750  0020 72175320      	bres	21280,#3
1751  0024               L316:
1752                     ; 398 }
1755  0024 84            	pop	a
1756  0025 81            	ret	
1825                     ; 429 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1825                     ; 430                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1825                     ; 431 {
1826                     .text:	section	.text,new
1827  0000               _TIM3_PrescalerConfig:
1829  0000 89            	pushw	x
1830       00000000      OFST:	set	0
1833                     ; 433     assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1835  0001 9f            	ld	a,xl
1836  0002 4d            	tnz	a
1837  0003 2709          	jreq	L433
1838  0005 9f            	ld	a,xl
1839  0006 4a            	dec	a
1840  0007 2705          	jreq	L433
1841  0009 ae01b1        	ldw	x,#433
1842  000c ad51          	call	LC006
1843  000e               L433:
1844                     ; 434     assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1846  000e 7b01          	ld	a,(OFST+1,sp)
1847  0010 2743          	jreq	L443
1848  0012 a101          	cp	a,#1
1849  0014 273f          	jreq	L443
1850  0016 a102          	cp	a,#2
1851  0018 273b          	jreq	L443
1852  001a a103          	cp	a,#3
1853  001c 2737          	jreq	L443
1854  001e a104          	cp	a,#4
1855  0020 2733          	jreq	L443
1856  0022 a105          	cp	a,#5
1857  0024 272f          	jreq	L443
1858  0026 a106          	cp	a,#6
1859  0028 272b          	jreq	L443
1860  002a a107          	cp	a,#7
1861  002c 2727          	jreq	L443
1862  002e a108          	cp	a,#8
1863  0030 2723          	jreq	L443
1864  0032 a109          	cp	a,#9
1865  0034 271f          	jreq	L443
1866  0036 a10a          	cp	a,#10
1867  0038 271b          	jreq	L443
1868  003a a10b          	cp	a,#11
1869  003c 2717          	jreq	L443
1870  003e a10c          	cp	a,#12
1871  0040 2713          	jreq	L443
1872  0042 a10d          	cp	a,#13
1873  0044 270f          	jreq	L443
1874  0046 a10e          	cp	a,#14
1875  0048 270b          	jreq	L443
1876  004a a10f          	cp	a,#15
1877  004c 2707          	jreq	L443
1878  004e ae01b2        	ldw	x,#434
1879  0051 ad0c          	call	LC006
1880  0053 7b01          	ld	a,(OFST+1,sp)
1881  0055               L443:
1882                     ; 437     TIM3->PSCR = (uint8_t)Prescaler;
1884  0055 c7532a        	ld	21290,a
1885                     ; 440     TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
1887  0058 7b02          	ld	a,(OFST+2,sp)
1888  005a c75324        	ld	21284,a
1889                     ; 441 }
1892  005d 85            	popw	x
1893  005e 81            	ret	
1895  005f               LC006:
1896  005f 89            	pushw	x
1897  0060 5f            	clrw	x
1898  0061 89            	pushw	x
1899  0062 ae0000        	ldw	x,#L102
1900  0065 cd0000        	call	_assert_failed
1902  0068 5b04          	addw	sp,#4
1903  006a 81            	ret	
1961                     ; 452 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1961                     ; 453 {
1962                     .text:	section	.text,new
1963  0000               _TIM3_ForcedOC1Config:
1965  0000 88            	push	a
1966       00000000      OFST:	set	0
1969                     ; 455     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1971  0001 a150          	cp	a,#80
1972  0003 2712          	jreq	L653
1973  0005 a140          	cp	a,#64
1974  0007 270e          	jreq	L653
1975  0009 ae01c7        	ldw	x,#455
1976  000c 89            	pushw	x
1977  000d 5f            	clrw	x
1978  000e 89            	pushw	x
1979  000f ae0000        	ldw	x,#L102
1980  0012 cd0000        	call	_assert_failed
1982  0015 5b04          	addw	sp,#4
1983  0017               L653:
1984                     ; 458     TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
1986  0017 c65325        	ld	a,21285
1987  001a a48f          	and	a,#143
1988  001c 1a01          	or	a,(OFST+1,sp)
1989  001e c75325        	ld	21285,a
1990                     ; 459 }
1993  0021 84            	pop	a
1994  0022 81            	ret	
2031                     ; 470 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2031                     ; 471 {
2032                     .text:	section	.text,new
2033  0000               _TIM3_ForcedOC2Config:
2035  0000 88            	push	a
2036       00000000      OFST:	set	0
2039                     ; 473     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2041  0001 a150          	cp	a,#80
2042  0003 2712          	jreq	L073
2043  0005 a140          	cp	a,#64
2044  0007 270e          	jreq	L073
2045  0009 ae01d9        	ldw	x,#473
2046  000c 89            	pushw	x
2047  000d 5f            	clrw	x
2048  000e 89            	pushw	x
2049  000f ae0000        	ldw	x,#L102
2050  0012 cd0000        	call	_assert_failed
2052  0015 5b04          	addw	sp,#4
2053  0017               L073:
2054                     ; 476     TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
2056  0017 c65326        	ld	a,21286
2057  001a a48f          	and	a,#143
2058  001c 1a01          	or	a,(OFST+1,sp)
2059  001e c75326        	ld	21286,a
2060                     ; 477 }
2063  0021 84            	pop	a
2064  0022 81            	ret	
2101                     ; 486 void TIM3_ARRPreloadConfig(FunctionalState NewState)
2101                     ; 487 {
2102                     .text:	section	.text,new
2103  0000               _TIM3_ARRPreloadConfig:
2105  0000 88            	push	a
2106       00000000      OFST:	set	0
2109                     ; 489     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2111  0001 4d            	tnz	a
2112  0002 2711          	jreq	L204
2113  0004 4a            	dec	a
2114  0005 270e          	jreq	L204
2115  0007 ae01e9        	ldw	x,#489
2116  000a 89            	pushw	x
2117  000b 5f            	clrw	x
2118  000c 89            	pushw	x
2119  000d ae0000        	ldw	x,#L102
2120  0010 cd0000        	call	_assert_failed
2122  0013 5b04          	addw	sp,#4
2123  0015               L204:
2124                     ; 492     if (NewState != DISABLE)
2126  0015 7b01          	ld	a,(OFST+1,sp)
2127  0017 2706          	jreq	L137
2128                     ; 494         TIM3->CR1 |= TIM3_CR1_ARPE;
2130  0019 721e5320      	bset	21280,#7
2132  001d 2004          	jra	L337
2133  001f               L137:
2134                     ; 498         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
2136  001f 721f5320      	bres	21280,#7
2137  0023               L337:
2138                     ; 500 }
2141  0023 84            	pop	a
2142  0024 81            	ret	
2179                     ; 509 void TIM3_OC1PreloadConfig(FunctionalState NewState)
2179                     ; 510 {
2180                     .text:	section	.text,new
2181  0000               _TIM3_OC1PreloadConfig:
2183  0000 88            	push	a
2184       00000000      OFST:	set	0
2187                     ; 512     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2189  0001 4d            	tnz	a
2190  0002 2711          	jreq	L414
2191  0004 4a            	dec	a
2192  0005 270e          	jreq	L414
2193  0007 ae0200        	ldw	x,#512
2194  000a 89            	pushw	x
2195  000b 5f            	clrw	x
2196  000c 89            	pushw	x
2197  000d ae0000        	ldw	x,#L102
2198  0010 cd0000        	call	_assert_failed
2200  0013 5b04          	addw	sp,#4
2201  0015               L414:
2202                     ; 515     if (NewState != DISABLE)
2204  0015 7b01          	ld	a,(OFST+1,sp)
2205  0017 2706          	jreq	L357
2206                     ; 517         TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
2208  0019 72165325      	bset	21285,#3
2210  001d 2004          	jra	L557
2211  001f               L357:
2212                     ; 521         TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2214  001f 72175325      	bres	21285,#3
2215  0023               L557:
2216                     ; 523 }
2219  0023 84            	pop	a
2220  0024 81            	ret	
2257                     ; 532 void TIM3_OC2PreloadConfig(FunctionalState NewState)
2257                     ; 533 {
2258                     .text:	section	.text,new
2259  0000               _TIM3_OC2PreloadConfig:
2261  0000 88            	push	a
2262       00000000      OFST:	set	0
2265                     ; 535     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2267  0001 4d            	tnz	a
2268  0002 2711          	jreq	L624
2269  0004 4a            	dec	a
2270  0005 270e          	jreq	L624
2271  0007 ae0217        	ldw	x,#535
2272  000a 89            	pushw	x
2273  000b 5f            	clrw	x
2274  000c 89            	pushw	x
2275  000d ae0000        	ldw	x,#L102
2276  0010 cd0000        	call	_assert_failed
2278  0013 5b04          	addw	sp,#4
2279  0015               L624:
2280                     ; 538     if (NewState != DISABLE)
2282  0015 7b01          	ld	a,(OFST+1,sp)
2283  0017 2706          	jreq	L577
2284                     ; 540         TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
2286  0019 72165326      	bset	21286,#3
2288  001d 2004          	jra	L777
2289  001f               L577:
2290                     ; 544         TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2292  001f 72175326      	bres	21286,#3
2293  0023               L777:
2294                     ; 546 }
2297  0023 84            	pop	a
2298  0024 81            	ret	
2364                     ; 557 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
2364                     ; 558 {
2365                     .text:	section	.text,new
2366  0000               _TIM3_GenerateEvent:
2368  0000 88            	push	a
2369       00000000      OFST:	set	0
2372                     ; 560     assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
2374  0001 4d            	tnz	a
2375  0002 260e          	jrne	L634
2376  0004 ae0230        	ldw	x,#560
2377  0007 89            	pushw	x
2378  0008 5f            	clrw	x
2379  0009 89            	pushw	x
2380  000a ae0000        	ldw	x,#L102
2381  000d cd0000        	call	_assert_failed
2383  0010 5b04          	addw	sp,#4
2384  0012               L634:
2385                     ; 563     TIM3->EGR = (uint8_t)TIM3_EventSource;
2387  0012 7b01          	ld	a,(OFST+1,sp)
2388  0014 c75324        	ld	21284,a
2389                     ; 564 }
2392  0017 84            	pop	a
2393  0018 81            	ret	
2430                     ; 575 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2430                     ; 576 {
2431                     .text:	section	.text,new
2432  0000               _TIM3_OC1PolarityConfig:
2434  0000 88            	push	a
2435       00000000      OFST:	set	0
2438                     ; 578     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2440  0001 4d            	tnz	a
2441  0002 2712          	jreq	L054
2442  0004 a122          	cp	a,#34
2443  0006 270e          	jreq	L054
2444  0008 ae0242        	ldw	x,#578
2445  000b 89            	pushw	x
2446  000c 5f            	clrw	x
2447  000d 89            	pushw	x
2448  000e ae0000        	ldw	x,#L102
2449  0011 cd0000        	call	_assert_failed
2451  0014 5b04          	addw	sp,#4
2452  0016               L054:
2453                     ; 581     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2455  0016 7b01          	ld	a,(OFST+1,sp)
2456  0018 2706          	jreq	L7401
2457                     ; 583         TIM3->CCER1 |= TIM3_CCER1_CC1P;
2459  001a 72125327      	bset	21287,#1
2461  001e 2004          	jra	L1501
2462  0020               L7401:
2463                     ; 587         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2465  0020 72135327      	bres	21287,#1
2466  0024               L1501:
2467                     ; 589 }
2470  0024 84            	pop	a
2471  0025 81            	ret	
2508                     ; 600 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2508                     ; 601 {
2509                     .text:	section	.text,new
2510  0000               _TIM3_OC2PolarityConfig:
2512  0000 88            	push	a
2513       00000000      OFST:	set	0
2516                     ; 603     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2518  0001 4d            	tnz	a
2519  0002 2712          	jreq	L264
2520  0004 a122          	cp	a,#34
2521  0006 270e          	jreq	L264
2522  0008 ae025b        	ldw	x,#603
2523  000b 89            	pushw	x
2524  000c 5f            	clrw	x
2525  000d 89            	pushw	x
2526  000e ae0000        	ldw	x,#L102
2527  0011 cd0000        	call	_assert_failed
2529  0014 5b04          	addw	sp,#4
2530  0016               L264:
2531                     ; 606     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2533  0016 7b01          	ld	a,(OFST+1,sp)
2534  0018 2706          	jreq	L1701
2535                     ; 608         TIM3->CCER1 |= TIM3_CCER1_CC2P;
2537  001a 721a5327      	bset	21287,#5
2539  001e 2004          	jra	L3701
2540  0020               L1701:
2541                     ; 612         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2543  0020 721b5327      	bres	21287,#5
2544  0024               L3701:
2545                     ; 614 }
2548  0024 84            	pop	a
2549  0025 81            	ret	
2595                     ; 627 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2595                     ; 628 {
2596                     .text:	section	.text,new
2597  0000               _TIM3_CCxCmd:
2599  0000 89            	pushw	x
2600       00000000      OFST:	set	0
2603                     ; 630     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2605  0001 9e            	ld	a,xh
2606  0002 4d            	tnz	a
2607  0003 2709          	jreq	L474
2608  0005 9e            	ld	a,xh
2609  0006 4a            	dec	a
2610  0007 2705          	jreq	L474
2611  0009 ae0276        	ldw	x,#630
2612  000c ad30          	call	LC007
2613  000e               L474:
2614                     ; 631     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2616  000e 7b02          	ld	a,(OFST+2,sp)
2617  0010 2708          	jreq	L405
2618  0012 4a            	dec	a
2619  0013 2705          	jreq	L405
2620  0015 ae0277        	ldw	x,#631
2621  0018 ad24          	call	LC007
2622  001a               L405:
2623                     ; 633     if (TIM3_Channel == TIM3_CHANNEL_1)
2625  001a 7b01          	ld	a,(OFST+1,sp)
2626  001c 2610          	jrne	L7111
2627                     ; 636         if (NewState != DISABLE)
2629  001e 7b02          	ld	a,(OFST+2,sp)
2630  0020 2706          	jreq	L1211
2631                     ; 638             TIM3->CCER1 |= TIM3_CCER1_CC1E;
2633  0022 72105327      	bset	21287,#0
2635  0026 2014          	jra	L5211
2636  0028               L1211:
2637                     ; 642             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2639  0028 72115327      	bres	21287,#0
2640  002c 200e          	jra	L5211
2641  002e               L7111:
2642                     ; 649         if (NewState != DISABLE)
2644  002e 7b02          	ld	a,(OFST+2,sp)
2645  0030 2706          	jreq	L7211
2646                     ; 651             TIM3->CCER1 |= TIM3_CCER1_CC2E;
2648  0032 72185327      	bset	21287,#4
2650  0036 2004          	jra	L5211
2651  0038               L7211:
2652                     ; 655             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2654  0038 72195327      	bres	21287,#4
2655  003c               L5211:
2656                     ; 659 }
2659  003c 85            	popw	x
2660  003d 81            	ret	
2662  003e               LC007:
2663  003e 89            	pushw	x
2664  003f 5f            	clrw	x
2665  0040 89            	pushw	x
2666  0041 ae0000        	ldw	x,#L102
2667  0044 cd0000        	call	_assert_failed
2669  0047 5b04          	addw	sp,#4
2670  0049 81            	ret	
2715                     ; 680 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2715                     ; 681 {
2716                     .text:	section	.text,new
2717  0000               _TIM3_SelectOCxM:
2719  0000 89            	pushw	x
2720       00000000      OFST:	set	0
2723                     ; 683     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2725  0001 9e            	ld	a,xh
2726  0002 4d            	tnz	a
2727  0003 2709          	jreq	L615
2728  0005 9e            	ld	a,xh
2729  0006 4a            	dec	a
2730  0007 2705          	jreq	L615
2731  0009 ae02ab        	ldw	x,#683
2732  000c ad49          	call	LC008
2733  000e               L615:
2734                     ; 684     assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2736  000e 7b02          	ld	a,(OFST+2,sp)
2737  0010 2721          	jreq	L625
2738  0012 a110          	cp	a,#16
2739  0014 271d          	jreq	L625
2740  0016 a120          	cp	a,#32
2741  0018 2719          	jreq	L625
2742  001a a130          	cp	a,#48
2743  001c 2715          	jreq	L625
2744  001e a160          	cp	a,#96
2745  0020 2711          	jreq	L625
2746  0022 a170          	cp	a,#112
2747  0024 270d          	jreq	L625
2748  0026 a150          	cp	a,#80
2749  0028 2709          	jreq	L625
2750  002a a140          	cp	a,#64
2751  002c 2705          	jreq	L625
2752  002e ae02ac        	ldw	x,#684
2753  0031 ad24          	call	LC008
2754  0033               L625:
2755                     ; 686     if (TIM3_Channel == TIM3_CHANNEL_1)
2757  0033 7b01          	ld	a,(OFST+1,sp)
2758  0035 2610          	jrne	L5511
2759                     ; 689         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2761  0037 72115327      	bres	21287,#0
2762                     ; 692         TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2764  003b c65325        	ld	a,21285
2765  003e a48f          	and	a,#143
2766  0040 1a02          	or	a,(OFST+2,sp)
2767  0042 c75325        	ld	21285,a
2769  0045 200e          	jra	L7511
2770  0047               L5511:
2771                     ; 697         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2773  0047 72195327      	bres	21287,#4
2774                     ; 700         TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
2776  004b c65326        	ld	a,21286
2777  004e a48f          	and	a,#143
2778  0050 1a02          	or	a,(OFST+2,sp)
2779  0052 c75326        	ld	21286,a
2780  0055               L7511:
2781                     ; 702 }
2784  0055 85            	popw	x
2785  0056 81            	ret	
2787  0057               LC008:
2788  0057 89            	pushw	x
2789  0058 5f            	clrw	x
2790  0059 89            	pushw	x
2791  005a ae0000        	ldw	x,#L102
2792  005d cd0000        	call	_assert_failed
2794  0060 5b04          	addw	sp,#4
2795  0062 81            	ret	
2826                     ; 711 void TIM3_SetCounter(uint16_t Counter)
2826                     ; 712 {
2827                     .text:	section	.text,new
2828  0000               _TIM3_SetCounter:
2832                     ; 714     TIM3->CNTRH = (uint8_t)(Counter >> 8);
2834  0000 9e            	ld	a,xh
2835  0001 c75328        	ld	21288,a
2836                     ; 715     TIM3->CNTRL = (uint8_t)(Counter);
2838  0004 9f            	ld	a,xl
2839  0005 c75329        	ld	21289,a
2840                     ; 717 }
2843  0008 81            	ret	
2875                     ; 726 void TIM3_SetAutoreload(uint16_t Autoreload)
2875                     ; 727 {
2876                     .text:	section	.text,new
2877  0000               _TIM3_SetAutoreload:
2881                     ; 729     TIM3->ARRH = (uint8_t)(Autoreload >> 8);
2883  0000 9e            	ld	a,xh
2884  0001 c7532b        	ld	21291,a
2885                     ; 730     TIM3->ARRL = (uint8_t)(Autoreload);
2887  0004 9f            	ld	a,xl
2888  0005 c7532c        	ld	21292,a
2889                     ; 731 }
2892  0008 81            	ret	
2924                     ; 740 void TIM3_SetCompare1(uint16_t Compare1)
2924                     ; 741 {
2925                     .text:	section	.text,new
2926  0000               _TIM3_SetCompare1:
2930                     ; 743     TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
2932  0000 9e            	ld	a,xh
2933  0001 c7532d        	ld	21293,a
2934                     ; 744     TIM3->CCR1L = (uint8_t)(Compare1);
2936  0004 9f            	ld	a,xl
2937  0005 c7532e        	ld	21294,a
2938                     ; 745 }
2941  0008 81            	ret	
2973                     ; 754 void TIM3_SetCompare2(uint16_t Compare2)
2973                     ; 755 {
2974                     .text:	section	.text,new
2975  0000               _TIM3_SetCompare2:
2979                     ; 757     TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
2981  0000 9e            	ld	a,xh
2982  0001 c7532f        	ld	21295,a
2983                     ; 758     TIM3->CCR2L = (uint8_t)(Compare2);
2985  0004 9f            	ld	a,xl
2986  0005 c75330        	ld	21296,a
2987                     ; 759 }
2990  0008 81            	ret	
3027                     ; 772 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
3027                     ; 773 {
3028                     .text:	section	.text,new
3029  0000               _TIM3_SetIC1Prescaler:
3031  0000 88            	push	a
3032       00000000      OFST:	set	0
3035                     ; 775     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
3037  0001 4d            	tnz	a
3038  0002 271a          	jreq	L055
3039  0004 a104          	cp	a,#4
3040  0006 2716          	jreq	L055
3041  0008 a108          	cp	a,#8
3042  000a 2712          	jreq	L055
3043  000c a10c          	cp	a,#12
3044  000e 270e          	jreq	L055
3045  0010 ae0307        	ldw	x,#775
3046  0013 89            	pushw	x
3047  0014 5f            	clrw	x
3048  0015 89            	pushw	x
3049  0016 ae0000        	ldw	x,#L102
3050  0019 cd0000        	call	_assert_failed
3052  001c 5b04          	addw	sp,#4
3053  001e               L055:
3054                     ; 778     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
3056  001e c65325        	ld	a,21285
3057  0021 a4f3          	and	a,#243
3058  0023 1a01          	or	a,(OFST+1,sp)
3059  0025 c75325        	ld	21285,a
3060                     ; 779 }
3063  0028 84            	pop	a
3064  0029 81            	ret	
3101                     ; 791 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
3101                     ; 792 {
3102                     .text:	section	.text,new
3103  0000               _TIM3_SetIC2Prescaler:
3105  0000 88            	push	a
3106       00000000      OFST:	set	0
3109                     ; 794     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
3111  0001 4d            	tnz	a
3112  0002 271a          	jreq	L265
3113  0004 a104          	cp	a,#4
3114  0006 2716          	jreq	L265
3115  0008 a108          	cp	a,#8
3116  000a 2712          	jreq	L265
3117  000c a10c          	cp	a,#12
3118  000e 270e          	jreq	L265
3119  0010 ae031a        	ldw	x,#794
3120  0013 89            	pushw	x
3121  0014 5f            	clrw	x
3122  0015 89            	pushw	x
3123  0016 ae0000        	ldw	x,#L102
3124  0019 cd0000        	call	_assert_failed
3126  001c 5b04          	addw	sp,#4
3127  001e               L265:
3128                     ; 797     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
3130  001e c65326        	ld	a,21286
3131  0021 a4f3          	and	a,#243
3132  0023 1a01          	or	a,(OFST+1,sp)
3133  0025 c75326        	ld	21286,a
3134                     ; 798 }
3137  0028 84            	pop	a
3138  0029 81            	ret	
3184                     ; 804 uint16_t TIM3_GetCapture1(void)
3184                     ; 805 {
3185                     .text:	section	.text,new
3186  0000               _TIM3_GetCapture1:
3188  0000 5204          	subw	sp,#4
3189       00000004      OFST:	set	4
3192                     ; 807     uint16_t tmpccr1 = 0;
3194                     ; 808     uint8_t tmpccr1l=0, tmpccr1h=0;
3198                     ; 810     tmpccr1h = TIM3->CCR1H;
3200  0002 c6532d        	ld	a,21293
3201  0005 6b02          	ld	(OFST-2,sp),a
3202                     ; 811     tmpccr1l = TIM3->CCR1L;
3204  0007 c6532e        	ld	a,21294
3205  000a 6b01          	ld	(OFST-3,sp),a
3206                     ; 813     tmpccr1 = (uint16_t)(tmpccr1l);
3208  000c 5f            	clrw	x
3209  000d 97            	ld	xl,a
3210  000e 1f03          	ldw	(OFST-1,sp),x
3211                     ; 814     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3213  0010 7b02          	ld	a,(OFST-2,sp)
3214  0012 97            	ld	xl,a
3215  0013 7b04          	ld	a,(OFST+0,sp)
3216  0015 01            	rrwa	x,a
3217  0016 1a03          	or	a,(OFST-1,sp)
3218  0018 01            	rrwa	x,a
3219                     ; 816     return (uint16_t)tmpccr1;
3223  0019 5b04          	addw	sp,#4
3224  001b 81            	ret	
3270                     ; 824 uint16_t TIM3_GetCapture2(void)
3270                     ; 825 {
3271                     .text:	section	.text,new
3272  0000               _TIM3_GetCapture2:
3274  0000 5204          	subw	sp,#4
3275       00000004      OFST:	set	4
3278                     ; 827     uint16_t tmpccr2 = 0;
3280                     ; 828     uint8_t tmpccr2l=0, tmpccr2h=0;
3284                     ; 830     tmpccr2h = TIM3->CCR2H;
3286  0002 c6532f        	ld	a,21295
3287  0005 6b02          	ld	(OFST-2,sp),a
3288                     ; 831     tmpccr2l = TIM3->CCR2L;
3290  0007 c65330        	ld	a,21296
3291  000a 6b01          	ld	(OFST-3,sp),a
3292                     ; 833     tmpccr2 = (uint16_t)(tmpccr2l);
3294  000c 5f            	clrw	x
3295  000d 97            	ld	xl,a
3296  000e 1f03          	ldw	(OFST-1,sp),x
3297                     ; 834     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3299  0010 7b02          	ld	a,(OFST-2,sp)
3300  0012 97            	ld	xl,a
3301  0013 7b04          	ld	a,(OFST+0,sp)
3302  0015 01            	rrwa	x,a
3303  0016 1a03          	or	a,(OFST-1,sp)
3304  0018 01            	rrwa	x,a
3305                     ; 836     return (uint16_t)tmpccr2;
3309  0019 5b04          	addw	sp,#4
3310  001b 81            	ret	
3342                     ; 844 uint16_t TIM3_GetCounter(void)
3342                     ; 845 {
3343                     .text:	section	.text,new
3344  0000               _TIM3_GetCounter:
3346  0000 89            	pushw	x
3347       00000002      OFST:	set	2
3350                     ; 846    uint16_t tmpcntr = 0;
3352                     ; 848    tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
3354  0001 c65328        	ld	a,21288
3355  0004 97            	ld	xl,a
3356  0005 4f            	clr	a
3357  0006 02            	rlwa	x,a
3358  0007 1f01          	ldw	(OFST-1,sp),x
3359                     ; 850     return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
3361  0009 c65329        	ld	a,21289
3362  000c 5f            	clrw	x
3363  000d 97            	ld	xl,a
3364  000e 01            	rrwa	x,a
3365  000f 1a02          	or	a,(OFST+0,sp)
3366  0011 01            	rrwa	x,a
3367  0012 1a01          	or	a,(OFST-1,sp)
3368  0014 01            	rrwa	x,a
3371  0015 5b02          	addw	sp,#2
3372  0017 81            	ret	
3396                     ; 859 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
3396                     ; 860 {
3397                     .text:	section	.text,new
3398  0000               _TIM3_GetPrescaler:
3402                     ; 862     return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
3404  0000 c6532a        	ld	a,21290
3407  0003 81            	ret	
3529                     ; 877 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3529                     ; 878 {
3530                     .text:	section	.text,new
3531  0000               _TIM3_GetFlagStatus:
3533  0000 89            	pushw	x
3534  0001 89            	pushw	x
3535       00000002      OFST:	set	2
3538                     ; 879    FlagStatus bitstatus = RESET;
3540                     ; 880    uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3544                     ; 883     assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3546  0002 1e03          	ldw	x,(OFST+1,sp)
3547  0004 a30001        	cpw	x,#1
3548  0007 2722          	jreq	L406
3549  0009 a30002        	cpw	x,#2
3550  000c 271d          	jreq	L406
3551  000e a30004        	cpw	x,#4
3552  0011 2718          	jreq	L406
3553  0013 a30200        	cpw	x,#512
3554  0016 2713          	jreq	L406
3555  0018 a30400        	cpw	x,#1024
3556  001b 270e          	jreq	L406
3557  001d ae0373        	ldw	x,#883
3558  0020 89            	pushw	x
3559  0021 5f            	clrw	x
3560  0022 89            	pushw	x
3561  0023 ae0000        	ldw	x,#L102
3562  0026 cd0000        	call	_assert_failed
3564  0029 5b04          	addw	sp,#4
3565  002b               L406:
3566                     ; 885     tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3568  002b c65322        	ld	a,21282
3569  002e 1404          	and	a,(OFST+2,sp)
3570  0030 6b01          	ld	(OFST-1,sp),a
3571                     ; 886     tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3573  0032 7b03          	ld	a,(OFST+1,sp)
3574  0034 6b02          	ld	(OFST+0,sp),a
3575                     ; 888     if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3577  0036 c45323        	and	a,21283
3578  0039 1a01          	or	a,(OFST-1,sp)
3579  003b 2702          	jreq	L5341
3580                     ; 890         bitstatus = SET;
3582  003d a601          	ld	a,#1
3584  003f               L5341:
3585                     ; 894         bitstatus = RESET;
3587                     ; 896     return (FlagStatus)bitstatus;
3591  003f 5b04          	addw	sp,#4
3592  0041 81            	ret	
3628                     ; 911 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3628                     ; 912 {
3629                     .text:	section	.text,new
3630  0000               _TIM3_ClearFlag:
3632  0000 89            	pushw	x
3633       00000000      OFST:	set	0
3636                     ; 914     assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3638  0001 01            	rrwa	x,a
3639  0002 a4f8          	and	a,#248
3640  0004 01            	rrwa	x,a
3641  0005 a4f9          	and	a,#249
3642  0007 01            	rrwa	x,a
3643  0008 5d            	tnzw	x
3644  0009 2604          	jrne	L216
3645  000b 1e01          	ldw	x,(OFST+1,sp)
3646  000d 260e          	jrne	L416
3647  000f               L216:
3648  000f ae0392        	ldw	x,#914
3649  0012 89            	pushw	x
3650  0013 5f            	clrw	x
3651  0014 89            	pushw	x
3652  0015 ae0000        	ldw	x,#L102
3653  0018 cd0000        	call	_assert_failed
3655  001b 5b04          	addw	sp,#4
3656  001d               L416:
3657                     ; 917     TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3659  001d 7b02          	ld	a,(OFST+2,sp)
3660  001f 43            	cpl	a
3661  0020 c75322        	ld	21282,a
3662                     ; 918     TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3664  0023 7b01          	ld	a,(OFST+1,sp)
3665  0025 43            	cpl	a
3666  0026 c75323        	ld	21283,a
3667                     ; 919 }
3670  0029 85            	popw	x
3671  002a 81            	ret	
3732                     ; 932 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3732                     ; 933 {
3733                     .text:	section	.text,new
3734  0000               _TIM3_GetITStatus:
3736  0000 88            	push	a
3737  0001 89            	pushw	x
3738       00000002      OFST:	set	2
3741                     ; 934     ITStatus bitstatus = RESET;
3743                     ; 935     uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
3747  0002 7b02          	ld	a,(OFST+0,sp)
3748  0004 97            	ld	xl,a
3749                     ; 938     assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3751  0005 7b03          	ld	a,(OFST+1,sp)
3752  0007 a101          	cp	a,#1
3753  0009 2716          	jreq	L626
3754  000b a102          	cp	a,#2
3755  000d 2712          	jreq	L626
3756  000f a104          	cp	a,#4
3757  0011 270e          	jreq	L626
3758  0013 ae03aa        	ldw	x,#938
3759  0016 89            	pushw	x
3760  0017 5f            	clrw	x
3761  0018 89            	pushw	x
3762  0019 ae0000        	ldw	x,#L102
3763  001c cd0000        	call	_assert_failed
3765  001f 5b04          	addw	sp,#4
3766  0021               L626:
3767                     ; 940     TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
3769  0021 c65322        	ld	a,21282
3770  0024 1403          	and	a,(OFST+1,sp)
3771  0026 6b01          	ld	(OFST-1,sp),a
3772                     ; 942     TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
3774  0028 c65321        	ld	a,21281
3775  002b 1403          	and	a,(OFST+1,sp)
3776  002d 6b02          	ld	(OFST+0,sp),a
3777                     ; 944     if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
3779  002f 7b01          	ld	a,(OFST-1,sp)
3780  0031 2708          	jreq	L5051
3782  0033 7b02          	ld	a,(OFST+0,sp)
3783  0035 2704          	jreq	L5051
3784                     ; 946         bitstatus = SET;
3786  0037 a601          	ld	a,#1
3788  0039 2001          	jra	L7051
3789  003b               L5051:
3790                     ; 950         bitstatus = RESET;
3792  003b 4f            	clr	a
3793  003c               L7051:
3794                     ; 952     return (ITStatus)(bitstatus);
3798  003c 5b03          	addw	sp,#3
3799  003e 81            	ret	
3836                     ; 965 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3836                     ; 966 {
3837                     .text:	section	.text,new
3838  0000               _TIM3_ClearITPendingBit:
3840  0000 88            	push	a
3841       00000000      OFST:	set	0
3844                     ; 968     assert_param(IS_TIM3_IT_OK(TIM3_IT));
3846  0001 4d            	tnz	a
3847  0002 2704          	jreq	L436
3848  0004 a108          	cp	a,#8
3849  0006 250e          	jrult	L636
3850  0008               L436:
3851  0008 ae03c8        	ldw	x,#968
3852  000b 89            	pushw	x
3853  000c 5f            	clrw	x
3854  000d 89            	pushw	x
3855  000e ae0000        	ldw	x,#L102
3856  0011 cd0000        	call	_assert_failed
3858  0014 5b04          	addw	sp,#4
3859  0016               L636:
3860                     ; 971     TIM3->SR1 = (uint8_t)(~TIM3_IT);
3862  0016 7b01          	ld	a,(OFST+1,sp)
3863  0018 43            	cpl	a
3864  0019 c75322        	ld	21282,a
3865                     ; 972 }
3868  001c 84            	pop	a
3869  001d 81            	ret	
3915                     ; 991 static void TI1_Config(uint8_t TIM3_ICPolarity,
3915                     ; 992                        uint8_t TIM3_ICSelection,
3915                     ; 993                        uint8_t TIM3_ICFilter)
3915                     ; 994 {
3916                     .text:	section	.text,new
3917  0000               L3_TI1_Config:
3919  0000 89            	pushw	x
3920  0001 88            	push	a
3921       00000001      OFST:	set	1
3924                     ; 996     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3926  0002 72115327      	bres	21287,#0
3927                     ; 999     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
3929  0006 7b06          	ld	a,(OFST+5,sp)
3930  0008 97            	ld	xl,a
3931  0009 a610          	ld	a,#16
3932  000b 42            	mul	x,a
3933  000c 9f            	ld	a,xl
3934  000d 1a03          	or	a,(OFST+2,sp)
3935  000f 6b01          	ld	(OFST+0,sp),a
3936  0011 c65325        	ld	a,21285
3937  0014 a40c          	and	a,#12
3938  0016 1a01          	or	a,(OFST+0,sp)
3939  0018 c75325        	ld	21285,a
3940                     ; 1002     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3942  001b 7b02          	ld	a,(OFST+1,sp)
3943  001d 2706          	jreq	L7451
3944                     ; 1004         TIM3->CCER1 |= TIM3_CCER1_CC1P;
3946  001f 72125327      	bset	21287,#1
3948  0023 2004          	jra	L1551
3949  0025               L7451:
3950                     ; 1008         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
3952  0025 72135327      	bres	21287,#1
3953  0029               L1551:
3954                     ; 1011     TIM3->CCER1 |= TIM3_CCER1_CC1E;
3956  0029 72105327      	bset	21287,#0
3957                     ; 1012 }
3960  002d 5b03          	addw	sp,#3
3961  002f 81            	ret	
4007                     ; 1031 static void TI2_Config(uint8_t TIM3_ICPolarity,
4007                     ; 1032                        uint8_t TIM3_ICSelection,
4007                     ; 1033                        uint8_t TIM3_ICFilter)
4007                     ; 1034 {
4008                     .text:	section	.text,new
4009  0000               L5_TI2_Config:
4011  0000 89            	pushw	x
4012  0001 88            	push	a
4013       00000001      OFST:	set	1
4016                     ; 1036     TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
4018  0002 72195327      	bres	21287,#4
4019                     ; 1039     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
4019                     ; 1040                   TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
4019                     ; 1041                   ((uint8_t)( TIM3_ICFilter << 4))));
4021  0006 7b06          	ld	a,(OFST+5,sp)
4022  0008 97            	ld	xl,a
4023  0009 a610          	ld	a,#16
4024  000b 42            	mul	x,a
4025  000c 9f            	ld	a,xl
4026  000d 1a03          	or	a,(OFST+2,sp)
4027  000f 6b01          	ld	(OFST+0,sp),a
4028  0011 c65326        	ld	a,21286
4029  0014 a40c          	and	a,#12
4030  0016 1a01          	or	a,(OFST+0,sp)
4031  0018 c75326        	ld	21286,a
4032                     ; 1044     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4034  001b 7b02          	ld	a,(OFST+1,sp)
4035  001d 2706          	jreq	L3751
4036                     ; 1046         TIM3->CCER1 |= TIM3_CCER1_CC2P;
4038  001f 721a5327      	bset	21287,#5
4040  0023 2004          	jra	L5751
4041  0025               L3751:
4042                     ; 1050         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
4044  0025 721b5327      	bres	21287,#5
4045  0029               L5751:
4046                     ; 1054     TIM3->CCER1 |= TIM3_CCER1_CC2E;
4048  0029 72185327      	bset	21287,#4
4049                     ; 1056 }
4052  002d 5b03          	addw	sp,#3
4053  002f 81            	ret	
4066                     	xdef	_TIM3_ClearITPendingBit
4067                     	xdef	_TIM3_GetITStatus
4068                     	xdef	_TIM3_ClearFlag
4069                     	xdef	_TIM3_GetFlagStatus
4070                     	xdef	_TIM3_GetPrescaler
4071                     	xdef	_TIM3_GetCounter
4072                     	xdef	_TIM3_GetCapture2
4073                     	xdef	_TIM3_GetCapture1
4074                     	xdef	_TIM3_SetIC2Prescaler
4075                     	xdef	_TIM3_SetIC1Prescaler
4076                     	xdef	_TIM3_SetCompare2
4077                     	xdef	_TIM3_SetCompare1
4078                     	xdef	_TIM3_SetAutoreload
4079                     	xdef	_TIM3_SetCounter
4080                     	xdef	_TIM3_SelectOCxM
4081                     	xdef	_TIM3_CCxCmd
4082                     	xdef	_TIM3_OC2PolarityConfig
4083                     	xdef	_TIM3_OC1PolarityConfig
4084                     	xdef	_TIM3_GenerateEvent
4085                     	xdef	_TIM3_OC2PreloadConfig
4086                     	xdef	_TIM3_OC1PreloadConfig
4087                     	xdef	_TIM3_ARRPreloadConfig
4088                     	xdef	_TIM3_ForcedOC2Config
4089                     	xdef	_TIM3_ForcedOC1Config
4090                     	xdef	_TIM3_PrescalerConfig
4091                     	xdef	_TIM3_SelectOnePulseMode
4092                     	xdef	_TIM3_UpdateRequestConfig
4093                     	xdef	_TIM3_UpdateDisableConfig
4094                     	xdef	_TIM3_ITConfig
4095                     	xdef	_TIM3_Cmd
4096                     	xdef	_TIM3_PWMIConfig
4097                     	xdef	_TIM3_ICInit
4098                     	xdef	_TIM3_OC2Init
4099                     	xdef	_TIM3_OC1Init
4100                     	xdef	_TIM3_TimeBaseInit
4101                     	xdef	_TIM3_DeInit
4102                     	xref	_assert_failed
4103                     .const:	section	.text
4104  0000               L102:
4105  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
4106  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
4107  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
4108  0036 5f74696d332e  	dc.b	"_tim3.c",0
4128                     	end
