   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 43 void TIM4_DeInit(void)
  32                     ; 44 {
  34                     	switch	.text
  35  0000               _TIM4_DeInit:
  39                     ; 45     TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  41  0000 725f5340      	clr	21312
  42                     ; 46     TIM4->IER = TIM4_IER_RESET_VALUE;
  44  0004 725f5343      	clr	21315
  45                     ; 47     TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  47  0008 725f5346      	clr	21318
  48                     ; 48     TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  50  000c 725f5347      	clr	21319
  51                     ; 49     TIM4->ARR = TIM4_ARR_RESET_VALUE;
  53  0010 35ff5348      	mov	21320,#255
  54                     ; 50     TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  56  0014 725f5344      	clr	21316
  57                     ; 51 }
  60  0018 81            	ret
 167                     ; 59 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 167                     ; 60 {
 168                     	switch	.text
 169  0019               _TIM4_TimeBaseInit:
 171  0019 89            	pushw	x
 172       00000000      OFST:	set	0
 175                     ; 62     assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 177  001a 9e            	ld	a,xh
 178  001b 4d            	tnz	a
 179  001c 2723          	jreq	L21
 180  001e 9e            	ld	a,xh
 181  001f a101          	cp	a,#1
 182  0021 271e          	jreq	L21
 183  0023 9e            	ld	a,xh
 184  0024 a102          	cp	a,#2
 185  0026 2719          	jreq	L21
 186  0028 9e            	ld	a,xh
 187  0029 a103          	cp	a,#3
 188  002b 2714          	jreq	L21
 189  002d 9e            	ld	a,xh
 190  002e a104          	cp	a,#4
 191  0030 270f          	jreq	L21
 192  0032 9e            	ld	a,xh
 193  0033 a105          	cp	a,#5
 194  0035 270a          	jreq	L21
 195  0037 9e            	ld	a,xh
 196  0038 a106          	cp	a,#6
 197  003a 2705          	jreq	L21
 198  003c 9e            	ld	a,xh
 199  003d a107          	cp	a,#7
 200  003f 2603          	jrne	L01
 201  0041               L21:
 202  0041 4f            	clr	a
 203  0042 2010          	jra	L41
 204  0044               L01:
 205  0044 ae003e        	ldw	x,#62
 206  0047 89            	pushw	x
 207  0048 ae0000        	ldw	x,#0
 208  004b 89            	pushw	x
 209  004c ae0000        	ldw	x,#L76
 210  004f cd0000        	call	_assert_failed
 212  0052 5b04          	addw	sp,#4
 213  0054               L41:
 214                     ; 64     TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 216  0054 7b01          	ld	a,(OFST+1,sp)
 217  0056 c75347        	ld	21319,a
 218                     ; 66     TIM4->ARR = (uint8_t)(TIM4_Period);
 220  0059 7b02          	ld	a,(OFST+2,sp)
 221  005b c75348        	ld	21320,a
 222                     ; 67 }
 225  005e 85            	popw	x
 226  005f 81            	ret
 282                     ; 77 void TIM4_Cmd(FunctionalState NewState)
 282                     ; 78 {
 283                     	switch	.text
 284  0060               _TIM4_Cmd:
 286  0060 88            	push	a
 287       00000000      OFST:	set	0
 290                     ; 80     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 292  0061 4d            	tnz	a
 293  0062 2704          	jreq	L22
 294  0064 a101          	cp	a,#1
 295  0066 2603          	jrne	L02
 296  0068               L22:
 297  0068 4f            	clr	a
 298  0069 2010          	jra	L42
 299  006b               L02:
 300  006b ae0050        	ldw	x,#80
 301  006e 89            	pushw	x
 302  006f ae0000        	ldw	x,#0
 303  0072 89            	pushw	x
 304  0073 ae0000        	ldw	x,#L76
 305  0076 cd0000        	call	_assert_failed
 307  0079 5b04          	addw	sp,#4
 308  007b               L42:
 309                     ; 83     if (NewState != DISABLE)
 311  007b 0d01          	tnz	(OFST+1,sp)
 312  007d 2706          	jreq	L711
 313                     ; 85         TIM4->CR1 |= TIM4_CR1_CEN;
 315  007f 72105340      	bset	21312,#0
 317  0083 2004          	jra	L121
 318  0085               L711:
 319                     ; 89         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 321  0085 72115340      	bres	21312,#0
 322  0089               L121:
 323                     ; 91 }
 326  0089 84            	pop	a
 327  008a 81            	ret
 386                     ; 103 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 386                     ; 104 {
 387                     	switch	.text
 388  008b               _TIM4_ITConfig:
 390  008b 89            	pushw	x
 391       00000000      OFST:	set	0
 394                     ; 106     assert_param(IS_TIM4_IT_OK(TIM4_IT));
 396  008c 9e            	ld	a,xh
 397  008d a101          	cp	a,#1
 398  008f 2603          	jrne	L03
 399  0091 4f            	clr	a
 400  0092 2010          	jra	L23
 401  0094               L03:
 402  0094 ae006a        	ldw	x,#106
 403  0097 89            	pushw	x
 404  0098 ae0000        	ldw	x,#0
 405  009b 89            	pushw	x
 406  009c ae0000        	ldw	x,#L76
 407  009f cd0000        	call	_assert_failed
 409  00a2 5b04          	addw	sp,#4
 410  00a4               L23:
 411                     ; 107     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 413  00a4 0d02          	tnz	(OFST+2,sp)
 414  00a6 2706          	jreq	L63
 415  00a8 7b02          	ld	a,(OFST+2,sp)
 416  00aa a101          	cp	a,#1
 417  00ac 2603          	jrne	L43
 418  00ae               L63:
 419  00ae 4f            	clr	a
 420  00af 2010          	jra	L04
 421  00b1               L43:
 422  00b1 ae006b        	ldw	x,#107
 423  00b4 89            	pushw	x
 424  00b5 ae0000        	ldw	x,#0
 425  00b8 89            	pushw	x
 426  00b9 ae0000        	ldw	x,#L76
 427  00bc cd0000        	call	_assert_failed
 429  00bf 5b04          	addw	sp,#4
 430  00c1               L04:
 431                     ; 109     if (NewState != DISABLE)
 433  00c1 0d02          	tnz	(OFST+2,sp)
 434  00c3 270a          	jreq	L351
 435                     ; 112         TIM4->IER |= (uint8_t)TIM4_IT;
 437  00c5 c65343        	ld	a,21315
 438  00c8 1a01          	or	a,(OFST+1,sp)
 439  00ca c75343        	ld	21315,a
 441  00cd 2009          	jra	L551
 442  00cf               L351:
 443                     ; 117         TIM4->IER &= (uint8_t)(~TIM4_IT);
 445  00cf 7b01          	ld	a,(OFST+1,sp)
 446  00d1 43            	cpl	a
 447  00d2 c45343        	and	a,21315
 448  00d5 c75343        	ld	21315,a
 449  00d8               L551:
 450                     ; 119 }
 453  00d8 85            	popw	x
 454  00d9 81            	ret
 491                     ; 127 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 491                     ; 128 {
 492                     	switch	.text
 493  00da               _TIM4_UpdateDisableConfig:
 495  00da 88            	push	a
 496       00000000      OFST:	set	0
 499                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 501  00db 4d            	tnz	a
 502  00dc 2704          	jreq	L64
 503  00de a101          	cp	a,#1
 504  00e0 2603          	jrne	L44
 505  00e2               L64:
 506  00e2 4f            	clr	a
 507  00e3 2010          	jra	L05
 508  00e5               L44:
 509  00e5 ae0082        	ldw	x,#130
 510  00e8 89            	pushw	x
 511  00e9 ae0000        	ldw	x,#0
 512  00ec 89            	pushw	x
 513  00ed ae0000        	ldw	x,#L76
 514  00f0 cd0000        	call	_assert_failed
 516  00f3 5b04          	addw	sp,#4
 517  00f5               L05:
 518                     ; 133     if (NewState != DISABLE)
 520  00f5 0d01          	tnz	(OFST+1,sp)
 521  00f7 2706          	jreq	L571
 522                     ; 135         TIM4->CR1 |= TIM4_CR1_UDIS;
 524  00f9 72125340      	bset	21312,#1
 526  00fd 2004          	jra	L771
 527  00ff               L571:
 528                     ; 139         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 530  00ff 72135340      	bres	21312,#1
 531  0103               L771:
 532                     ; 141 }
 535  0103 84            	pop	a
 536  0104 81            	ret
 595                     ; 151 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 595                     ; 152 {
 596                     	switch	.text
 597  0105               _TIM4_UpdateRequestConfig:
 599  0105 88            	push	a
 600       00000000      OFST:	set	0
 603                     ; 154     assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 605  0106 4d            	tnz	a
 606  0107 2704          	jreq	L65
 607  0109 a101          	cp	a,#1
 608  010b 2603          	jrne	L45
 609  010d               L65:
 610  010d 4f            	clr	a
 611  010e 2010          	jra	L06
 612  0110               L45:
 613  0110 ae009a        	ldw	x,#154
 614  0113 89            	pushw	x
 615  0114 ae0000        	ldw	x,#0
 616  0117 89            	pushw	x
 617  0118 ae0000        	ldw	x,#L76
 618  011b cd0000        	call	_assert_failed
 620  011e 5b04          	addw	sp,#4
 621  0120               L06:
 622                     ; 157     if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 624  0120 0d01          	tnz	(OFST+1,sp)
 625  0122 2706          	jreq	L722
 626                     ; 159         TIM4->CR1 |= TIM4_CR1_URS;
 628  0124 72145340      	bset	21312,#2
 630  0128 2004          	jra	L132
 631  012a               L722:
 632                     ; 163         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 634  012a 72155340      	bres	21312,#2
 635  012e               L132:
 636                     ; 165 }
 639  012e 84            	pop	a
 640  012f 81            	ret
 698                     ; 175 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 698                     ; 176 {
 699                     	switch	.text
 700  0130               _TIM4_SelectOnePulseMode:
 702  0130 88            	push	a
 703       00000000      OFST:	set	0
 706                     ; 178     assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 708  0131 a101          	cp	a,#1
 709  0133 2703          	jreq	L66
 710  0135 4d            	tnz	a
 711  0136 2603          	jrne	L46
 712  0138               L66:
 713  0138 4f            	clr	a
 714  0139 2010          	jra	L07
 715  013b               L46:
 716  013b ae00b2        	ldw	x,#178
 717  013e 89            	pushw	x
 718  013f ae0000        	ldw	x,#0
 719  0142 89            	pushw	x
 720  0143 ae0000        	ldw	x,#L76
 721  0146 cd0000        	call	_assert_failed
 723  0149 5b04          	addw	sp,#4
 724  014b               L07:
 725                     ; 181     if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 727  014b 0d01          	tnz	(OFST+1,sp)
 728  014d 2706          	jreq	L162
 729                     ; 183         TIM4->CR1 |= TIM4_CR1_OPM;
 731  014f 72165340      	bset	21312,#3
 733  0153 2004          	jra	L362
 734  0155               L162:
 735                     ; 187         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 737  0155 72175340      	bres	21312,#3
 738  0159               L362:
 739                     ; 190 }
 742  0159 84            	pop	a
 743  015a 81            	ret
 812                     ; 212 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 812                     ; 213 {
 813                     	switch	.text
 814  015b               _TIM4_PrescalerConfig:
 816  015b 89            	pushw	x
 817       00000000      OFST:	set	0
 820                     ; 215     assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 822  015c 9f            	ld	a,xl
 823  015d 4d            	tnz	a
 824  015e 2705          	jreq	L67
 825  0160 9f            	ld	a,xl
 826  0161 a101          	cp	a,#1
 827  0163 2603          	jrne	L47
 828  0165               L67:
 829  0165 4f            	clr	a
 830  0166 2010          	jra	L001
 831  0168               L47:
 832  0168 ae00d7        	ldw	x,#215
 833  016b 89            	pushw	x
 834  016c ae0000        	ldw	x,#0
 835  016f 89            	pushw	x
 836  0170 ae0000        	ldw	x,#L76
 837  0173 cd0000        	call	_assert_failed
 839  0176 5b04          	addw	sp,#4
 840  0178               L001:
 841                     ; 216     assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 843  0178 0d01          	tnz	(OFST+1,sp)
 844  017a 272a          	jreq	L401
 845  017c 7b01          	ld	a,(OFST+1,sp)
 846  017e a101          	cp	a,#1
 847  0180 2724          	jreq	L401
 848  0182 7b01          	ld	a,(OFST+1,sp)
 849  0184 a102          	cp	a,#2
 850  0186 271e          	jreq	L401
 851  0188 7b01          	ld	a,(OFST+1,sp)
 852  018a a103          	cp	a,#3
 853  018c 2718          	jreq	L401
 854  018e 7b01          	ld	a,(OFST+1,sp)
 855  0190 a104          	cp	a,#4
 856  0192 2712          	jreq	L401
 857  0194 7b01          	ld	a,(OFST+1,sp)
 858  0196 a105          	cp	a,#5
 859  0198 270c          	jreq	L401
 860  019a 7b01          	ld	a,(OFST+1,sp)
 861  019c a106          	cp	a,#6
 862  019e 2706          	jreq	L401
 863  01a0 7b01          	ld	a,(OFST+1,sp)
 864  01a2 a107          	cp	a,#7
 865  01a4 2603          	jrne	L201
 866  01a6               L401:
 867  01a6 4f            	clr	a
 868  01a7 2010          	jra	L601
 869  01a9               L201:
 870  01a9 ae00d8        	ldw	x,#216
 871  01ac 89            	pushw	x
 872  01ad ae0000        	ldw	x,#0
 873  01b0 89            	pushw	x
 874  01b1 ae0000        	ldw	x,#L76
 875  01b4 cd0000        	call	_assert_failed
 877  01b7 5b04          	addw	sp,#4
 878  01b9               L601:
 879                     ; 219     TIM4->PSCR = (uint8_t)Prescaler;
 881  01b9 7b01          	ld	a,(OFST+1,sp)
 882  01bb c75347        	ld	21319,a
 883                     ; 222     TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 885  01be 7b02          	ld	a,(OFST+2,sp)
 886  01c0 c75345        	ld	21317,a
 887                     ; 223 }
 890  01c3 85            	popw	x
 891  01c4 81            	ret
 928                     ; 231 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 928                     ; 232 {
 929                     	switch	.text
 930  01c5               _TIM4_ARRPreloadConfig:
 932  01c5 88            	push	a
 933       00000000      OFST:	set	0
 936                     ; 234     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 938  01c6 4d            	tnz	a
 939  01c7 2704          	jreq	L411
 940  01c9 a101          	cp	a,#1
 941  01cb 2603          	jrne	L211
 942  01cd               L411:
 943  01cd 4f            	clr	a
 944  01ce 2010          	jra	L611
 945  01d0               L211:
 946  01d0 ae00ea        	ldw	x,#234
 947  01d3 89            	pushw	x
 948  01d4 ae0000        	ldw	x,#0
 949  01d7 89            	pushw	x
 950  01d8 ae0000        	ldw	x,#L76
 951  01db cd0000        	call	_assert_failed
 953  01de 5b04          	addw	sp,#4
 954  01e0               L611:
 955                     ; 237     if (NewState != DISABLE)
 957  01e0 0d01          	tnz	(OFST+1,sp)
 958  01e2 2706          	jreq	L533
 959                     ; 239         TIM4->CR1 |= TIM4_CR1_ARPE;
 961  01e4 721e5340      	bset	21312,#7
 963  01e8 2004          	jra	L733
 964  01ea               L533:
 965                     ; 243         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 967  01ea 721f5340      	bres	21312,#7
 968  01ee               L733:
 969                     ; 245 }
 972  01ee 84            	pop	a
 973  01ef 81            	ret
1023                     ; 254 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1023                     ; 255 {
1024                     	switch	.text
1025  01f0               _TIM4_GenerateEvent:
1027  01f0 88            	push	a
1028       00000000      OFST:	set	0
1031                     ; 257     assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
1033  01f1 a101          	cp	a,#1
1034  01f3 2603          	jrne	L221
1035  01f5 4f            	clr	a
1036  01f6 2010          	jra	L421
1037  01f8               L221:
1038  01f8 ae0101        	ldw	x,#257
1039  01fb 89            	pushw	x
1040  01fc ae0000        	ldw	x,#0
1041  01ff 89            	pushw	x
1042  0200 ae0000        	ldw	x,#L76
1043  0203 cd0000        	call	_assert_failed
1045  0206 5b04          	addw	sp,#4
1046  0208               L421:
1047                     ; 260     TIM4->EGR = (uint8_t)(TIM4_EventSource);
1049  0208 7b01          	ld	a,(OFST+1,sp)
1050  020a c75345        	ld	21317,a
1051                     ; 261 }
1054  020d 84            	pop	a
1055  020e 81            	ret
1089                     ; 270 void TIM4_SetCounter(uint8_t Counter)
1089                     ; 271 {
1090                     	switch	.text
1091  020f               _TIM4_SetCounter:
1095                     ; 273     TIM4->CNTR = (uint8_t)(Counter);
1097  020f c75346        	ld	21318,a
1098                     ; 274 }
1101  0212 81            	ret
1135                     ; 283 void TIM4_SetAutoreload(uint8_t Autoreload)
1135                     ; 284 {
1136                     	switch	.text
1137  0213               _TIM4_SetAutoreload:
1141                     ; 286     TIM4->ARR = (uint8_t)(Autoreload);
1143  0213 c75348        	ld	21320,a
1144                     ; 287 }
1147  0216 81            	ret
1170                     ; 294 uint8_t TIM4_GetCounter(void)
1170                     ; 295 {
1171                     	switch	.text
1172  0217               _TIM4_GetCounter:
1176                     ; 297     return (uint8_t)(TIM4->CNTR);
1178  0217 c65346        	ld	a,21318
1181  021a 81            	ret
1205                     ; 305 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1205                     ; 306 {
1206                     	switch	.text
1207  021b               _TIM4_GetPrescaler:
1211                     ; 308     return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
1213  021b c65347        	ld	a,21319
1216  021e 81            	ret
1296                     ; 318 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1296                     ; 319 {
1297                     	switch	.text
1298  021f               _TIM4_GetFlagStatus:
1300  021f 88            	push	a
1301  0220 88            	push	a
1302       00000001      OFST:	set	1
1305                     ; 320     FlagStatus bitstatus = RESET;
1307  0221 0f01          	clr	(OFST+0,sp)
1308                     ; 323     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1310  0223 a101          	cp	a,#1
1311  0225 2603          	jrne	L041
1312  0227 4f            	clr	a
1313  0228 2010          	jra	L241
1314  022a               L041:
1315  022a ae0143        	ldw	x,#323
1316  022d 89            	pushw	x
1317  022e ae0000        	ldw	x,#0
1318  0231 89            	pushw	x
1319  0232 ae0000        	ldw	x,#L76
1320  0235 cd0000        	call	_assert_failed
1322  0238 5b04          	addw	sp,#4
1323  023a               L241:
1324                     ; 325   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1326  023a c65344        	ld	a,21316
1327  023d 1502          	bcp	a,(OFST+1,sp)
1328  023f 2706          	jreq	L105
1329                     ; 327     bitstatus = SET;
1331  0241 a601          	ld	a,#1
1332  0243 6b01          	ld	(OFST+0,sp),a
1334  0245 2002          	jra	L305
1335  0247               L105:
1336                     ; 331     bitstatus = RESET;
1338  0247 0f01          	clr	(OFST+0,sp)
1339  0249               L305:
1340                     ; 333   return ((FlagStatus)bitstatus);
1342  0249 7b01          	ld	a,(OFST+0,sp)
1345  024b 85            	popw	x
1346  024c 81            	ret
1382                     ; 343 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1382                     ; 344 {
1383                     	switch	.text
1384  024d               _TIM4_ClearFlag:
1386  024d 88            	push	a
1387       00000000      OFST:	set	0
1390                     ; 346     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1392  024e a101          	cp	a,#1
1393  0250 2603          	jrne	L641
1394  0252 4f            	clr	a
1395  0253 2010          	jra	L051
1396  0255               L641:
1397  0255 ae015a        	ldw	x,#346
1398  0258 89            	pushw	x
1399  0259 ae0000        	ldw	x,#0
1400  025c 89            	pushw	x
1401  025d ae0000        	ldw	x,#L76
1402  0260 cd0000        	call	_assert_failed
1404  0263 5b04          	addw	sp,#4
1405  0265               L051:
1406                     ; 349     TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1408  0265 7b01          	ld	a,(OFST+1,sp)
1409  0267 43            	cpl	a
1410  0268 c75344        	ld	21316,a
1411                     ; 351 }
1414  026b 84            	pop	a
1415  026c 81            	ret
1480                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1480                     ; 361 {
1481                     	switch	.text
1482  026d               _TIM4_GetITStatus:
1484  026d 88            	push	a
1485  026e 89            	pushw	x
1486       00000002      OFST:	set	2
1489                     ; 362     ITStatus bitstatus = RESET;
1491  026f 7b02          	ld	a,(OFST+0,sp)
1492  0271 97            	ld	xl,a
1493                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1495  0272 7b01          	ld	a,(OFST-1,sp)
1496  0274 97            	ld	xl,a
1499  0275 7b02          	ld	a,(OFST+0,sp)
1500  0277 97            	ld	xl,a
1501                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1503  0278 7b03          	ld	a,(OFST+1,sp)
1504  027a a101          	cp	a,#1
1505  027c 2603          	jrne	L451
1506  027e 4f            	clr	a
1507  027f 2010          	jra	L651
1508  0281               L451:
1509  0281 ae016f        	ldw	x,#367
1510  0284 89            	pushw	x
1511  0285 ae0000        	ldw	x,#0
1512  0288 89            	pushw	x
1513  0289 ae0000        	ldw	x,#L76
1514  028c cd0000        	call	_assert_failed
1516  028f 5b04          	addw	sp,#4
1517  0291               L651:
1518                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1520  0291 c65344        	ld	a,21316
1521  0294 1403          	and	a,(OFST+1,sp)
1522  0296 6b01          	ld	(OFST-1,sp),a
1523                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1525  0298 c65343        	ld	a,21315
1526  029b 1403          	and	a,(OFST+1,sp)
1527  029d 6b02          	ld	(OFST+0,sp),a
1528                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1530  029f 0d01          	tnz	(OFST-1,sp)
1531  02a1 270a          	jreq	L555
1533  02a3 0d02          	tnz	(OFST+0,sp)
1534  02a5 2706          	jreq	L555
1535                     ; 375     bitstatus = (ITStatus)SET;
1537  02a7 a601          	ld	a,#1
1538  02a9 6b02          	ld	(OFST+0,sp),a
1540  02ab 2002          	jra	L755
1541  02ad               L555:
1542                     ; 379     bitstatus = (ITStatus)RESET;
1544  02ad 0f02          	clr	(OFST+0,sp)
1545  02af               L755:
1546                     ; 381   return ((ITStatus)bitstatus);
1548  02af 7b02          	ld	a,(OFST+0,sp)
1551  02b1 5b03          	addw	sp,#3
1552  02b3 81            	ret
1589                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1589                     ; 392 {
1590                     	switch	.text
1591  02b4               _TIM4_ClearITPendingBit:
1593  02b4 88            	push	a
1594       00000000      OFST:	set	0
1597                     ; 394     assert_param(IS_TIM4_IT_OK(TIM4_IT));
1599  02b5 a101          	cp	a,#1
1600  02b7 2603          	jrne	L261
1601  02b9 4f            	clr	a
1602  02ba 2010          	jra	L461
1603  02bc               L261:
1604  02bc ae018a        	ldw	x,#394
1605  02bf 89            	pushw	x
1606  02c0 ae0000        	ldw	x,#0
1607  02c3 89            	pushw	x
1608  02c4 ae0000        	ldw	x,#L76
1609  02c7 cd0000        	call	_assert_failed
1611  02ca 5b04          	addw	sp,#4
1612  02cc               L461:
1613                     ; 397     TIM4->SR1 = (uint8_t)(~TIM4_IT);
1615  02cc 7b01          	ld	a,(OFST+1,sp)
1616  02ce 43            	cpl	a
1617  02cf c75344        	ld	21316,a
1618                     ; 398 }
1621  02d2 84            	pop	a
1622  02d3 81            	ret
1635                     	xdef	_TIM4_ClearITPendingBit
1636                     	xdef	_TIM4_GetITStatus
1637                     	xdef	_TIM4_ClearFlag
1638                     	xdef	_TIM4_GetFlagStatus
1639                     	xdef	_TIM4_GetPrescaler
1640                     	xdef	_TIM4_GetCounter
1641                     	xdef	_TIM4_SetAutoreload
1642                     	xdef	_TIM4_SetCounter
1643                     	xdef	_TIM4_GenerateEvent
1644                     	xdef	_TIM4_ARRPreloadConfig
1645                     	xdef	_TIM4_PrescalerConfig
1646                     	xdef	_TIM4_SelectOnePulseMode
1647                     	xdef	_TIM4_UpdateRequestConfig
1648                     	xdef	_TIM4_UpdateDisableConfig
1649                     	xdef	_TIM4_ITConfig
1650                     	xdef	_TIM4_Cmd
1651                     	xdef	_TIM4_TimeBaseInit
1652                     	xdef	_TIM4_DeInit
1653                     	xref	_assert_failed
1654                     .const:	section	.text
1655  0000               L76:
1656  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
1657  0012 697665725c73  	dc.b	"iver\src\stm8s_tim"
1658  0024 342e6300      	dc.b	"4.c",0
1678                     	end
