   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 43 void TIM4_DeInit(void)
  33                     ; 44 {
  35                     .text:	section	.text,new
  36  0000               _TIM4_DeInit:
  40                     ; 45     TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  42  0000 725f5340      	clr	21312
  43                     ; 46     TIM4->IER = TIM4_IER_RESET_VALUE;
  45  0004 725f5341      	clr	21313
  46                     ; 47     TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  48  0008 725f5344      	clr	21316
  49                     ; 48     TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  51  000c 725f5345      	clr	21317
  52                     ; 49     TIM4->ARR = TIM4_ARR_RESET_VALUE;
  54  0010 35ff5346      	mov	21318,#255
  55                     ; 50     TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  57  0014 725f5342      	clr	21314
  58                     ; 51 }
  61  0018 81            	ret	
 166                     ; 59 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 166                     ; 60 {
 167                     .text:	section	.text,new
 168  0000               _TIM4_TimeBaseInit:
 170  0000 89            	pushw	x
 171       00000000      OFST:	set	0
 174                     ; 62     assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 176  0001 9e            	ld	a,xh
 177  0002 4d            	tnz	a
 178  0003 2730          	jreq	L41
 179  0005 9e            	ld	a,xh
 180  0006 4a            	dec	a
 181  0007 272c          	jreq	L41
 182  0009 9e            	ld	a,xh
 183  000a a102          	cp	a,#2
 184  000c 2727          	jreq	L41
 185  000e 9e            	ld	a,xh
 186  000f a103          	cp	a,#3
 187  0011 2722          	jreq	L41
 188  0013 9e            	ld	a,xh
 189  0014 a104          	cp	a,#4
 190  0016 271d          	jreq	L41
 191  0018 9e            	ld	a,xh
 192  0019 a105          	cp	a,#5
 193  001b 2718          	jreq	L41
 194  001d 9e            	ld	a,xh
 195  001e a106          	cp	a,#6
 196  0020 2713          	jreq	L41
 197  0022 9e            	ld	a,xh
 198  0023 a107          	cp	a,#7
 199  0025 270e          	jreq	L41
 200  0027 ae003e        	ldw	x,#62
 201  002a 89            	pushw	x
 202  002b 5f            	clrw	x
 203  002c 89            	pushw	x
 204  002d ae0000        	ldw	x,#L56
 205  0030 cd0000        	call	_assert_failed
 207  0033 5b04          	addw	sp,#4
 208  0035               L41:
 209                     ; 64     TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 211  0035 7b01          	ld	a,(OFST+1,sp)
 212  0037 c75345        	ld	21317,a
 213                     ; 66     TIM4->ARR = (uint8_t)(TIM4_Period);
 215  003a 7b02          	ld	a,(OFST+2,sp)
 216  003c c75346        	ld	21318,a
 217                     ; 67 }
 220  003f 85            	popw	x
 221  0040 81            	ret	
 277                     ; 77 void TIM4_Cmd(FunctionalState NewState)
 277                     ; 78 {
 278                     .text:	section	.text,new
 279  0000               _TIM4_Cmd:
 281  0000 88            	push	a
 282       00000000      OFST:	set	0
 285                     ; 80     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 287  0001 4d            	tnz	a
 288  0002 2711          	jreq	L62
 289  0004 4a            	dec	a
 290  0005 270e          	jreq	L62
 291  0007 ae0050        	ldw	x,#80
 292  000a 89            	pushw	x
 293  000b 5f            	clrw	x
 294  000c 89            	pushw	x
 295  000d ae0000        	ldw	x,#L56
 296  0010 cd0000        	call	_assert_failed
 298  0013 5b04          	addw	sp,#4
 299  0015               L62:
 300                     ; 83     if (NewState != DISABLE)
 302  0015 7b01          	ld	a,(OFST+1,sp)
 303  0017 2706          	jreq	L511
 304                     ; 85         TIM4->CR1 |= TIM4_CR1_CEN;
 306  0019 72105340      	bset	21312,#0
 308  001d 2004          	jra	L711
 309  001f               L511:
 310                     ; 89         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 312  001f 72115340      	bres	21312,#0
 313  0023               L711:
 314                     ; 91 }
 317  0023 84            	pop	a
 318  0024 81            	ret	
 377                     ; 103 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 377                     ; 104 {
 378                     .text:	section	.text,new
 379  0000               _TIM4_ITConfig:
 381  0000 89            	pushw	x
 382       00000000      OFST:	set	0
 385                     ; 106     assert_param(IS_TIM4_IT_OK(TIM4_IT));
 387  0001 9e            	ld	a,xh
 388  0002 4a            	dec	a
 389  0003 2705          	jreq	L63
 390  0005 ae006a        	ldw	x,#106
 391  0008 ad22          	call	LC001
 392  000a               L63:
 393                     ; 107     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 395  000a 7b02          	ld	a,(OFST+2,sp)
 396  000c 2708          	jreq	L64
 397  000e 4a            	dec	a
 398  000f 2705          	jreq	L64
 399  0011 ae006b        	ldw	x,#107
 400  0014 ad16          	call	LC001
 401  0016               L64:
 402                     ; 109     if (NewState != DISABLE)
 404  0016 7b02          	ld	a,(OFST+2,sp)
 405  0018 2707          	jreq	L151
 406                     ; 112         TIM4->IER |= (uint8_t)TIM4_IT;
 408  001a c65341        	ld	a,21313
 409  001d 1a01          	or	a,(OFST+1,sp)
 411  001f 2006          	jra	L351
 412  0021               L151:
 413                     ; 117         TIM4->IER &= (uint8_t)(~TIM4_IT);
 415  0021 7b01          	ld	a,(OFST+1,sp)
 416  0023 43            	cpl	a
 417  0024 c45341        	and	a,21313
 418  0027               L351:
 419  0027 c75341        	ld	21313,a
 420                     ; 119 }
 423  002a 85            	popw	x
 424  002b 81            	ret	
 426  002c               LC001:
 427  002c 89            	pushw	x
 428  002d 5f            	clrw	x
 429  002e 89            	pushw	x
 430  002f ae0000        	ldw	x,#L56
 431  0032 cd0000        	call	_assert_failed
 433  0035 5b04          	addw	sp,#4
 434  0037 81            	ret	
 470                     ; 127 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 470                     ; 128 {
 471                     .text:	section	.text,new
 472  0000               _TIM4_UpdateDisableConfig:
 474  0000 88            	push	a
 475       00000000      OFST:	set	0
 478                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 480  0001 4d            	tnz	a
 481  0002 2711          	jreq	L06
 482  0004 4a            	dec	a
 483  0005 270e          	jreq	L06
 484  0007 ae0082        	ldw	x,#130
 485  000a 89            	pushw	x
 486  000b 5f            	clrw	x
 487  000c 89            	pushw	x
 488  000d ae0000        	ldw	x,#L56
 489  0010 cd0000        	call	_assert_failed
 491  0013 5b04          	addw	sp,#4
 492  0015               L06:
 493                     ; 133     if (NewState != DISABLE)
 495  0015 7b01          	ld	a,(OFST+1,sp)
 496  0017 2706          	jreq	L371
 497                     ; 135         TIM4->CR1 |= TIM4_CR1_UDIS;
 499  0019 72125340      	bset	21312,#1
 501  001d 2004          	jra	L571
 502  001f               L371:
 503                     ; 139         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 505  001f 72135340      	bres	21312,#1
 506  0023               L571:
 507                     ; 141 }
 510  0023 84            	pop	a
 511  0024 81            	ret	
 570                     ; 151 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 570                     ; 152 {
 571                     .text:	section	.text,new
 572  0000               _TIM4_UpdateRequestConfig:
 574  0000 88            	push	a
 575       00000000      OFST:	set	0
 578                     ; 154     assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 580  0001 4d            	tnz	a
 581  0002 2711          	jreq	L27
 582  0004 4a            	dec	a
 583  0005 270e          	jreq	L27
 584  0007 ae009a        	ldw	x,#154
 585  000a 89            	pushw	x
 586  000b 5f            	clrw	x
 587  000c 89            	pushw	x
 588  000d ae0000        	ldw	x,#L56
 589  0010 cd0000        	call	_assert_failed
 591  0013 5b04          	addw	sp,#4
 592  0015               L27:
 593                     ; 157     if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 595  0015 7b01          	ld	a,(OFST+1,sp)
 596  0017 2706          	jreq	L522
 597                     ; 159         TIM4->CR1 |= TIM4_CR1_URS;
 599  0019 72145340      	bset	21312,#2
 601  001d 2004          	jra	L722
 602  001f               L522:
 603                     ; 163         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 605  001f 72155340      	bres	21312,#2
 606  0023               L722:
 607                     ; 165 }
 610  0023 84            	pop	a
 611  0024 81            	ret	
 669                     ; 175 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 669                     ; 176 {
 670                     .text:	section	.text,new
 671  0000               _TIM4_SelectOnePulseMode:
 673  0000 88            	push	a
 674       00000000      OFST:	set	0
 677                     ; 178     assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 679  0001 a101          	cp	a,#1
 680  0003 2711          	jreq	L401
 681  0005 4d            	tnz	a
 682  0006 270e          	jreq	L401
 683  0008 ae00b2        	ldw	x,#178
 684  000b 89            	pushw	x
 685  000c 5f            	clrw	x
 686  000d 89            	pushw	x
 687  000e ae0000        	ldw	x,#L56
 688  0011 cd0000        	call	_assert_failed
 690  0014 5b04          	addw	sp,#4
 691  0016               L401:
 692                     ; 181     if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 694  0016 7b01          	ld	a,(OFST+1,sp)
 695  0018 2706          	jreq	L752
 696                     ; 183         TIM4->CR1 |= TIM4_CR1_OPM;
 698  001a 72165340      	bset	21312,#3
 700  001e 2004          	jra	L162
 701  0020               L752:
 702                     ; 187         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 704  0020 72175340      	bres	21312,#3
 705  0024               L162:
 706                     ; 190 }
 709  0024 84            	pop	a
 710  0025 81            	ret	
 779                     ; 212 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 779                     ; 213 {
 780                     .text:	section	.text,new
 781  0000               _TIM4_PrescalerConfig:
 783  0000 89            	pushw	x
 784       00000000      OFST:	set	0
 787                     ; 215     assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 789  0001 9f            	ld	a,xl
 790  0002 4d            	tnz	a
 791  0003 2709          	jreq	L611
 792  0005 9f            	ld	a,xl
 793  0006 4a            	dec	a
 794  0007 2705          	jreq	L611
 795  0009 ae00d7        	ldw	x,#215
 796  000c ad31          	call	LC002
 797  000e               L611:
 798                     ; 216     assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 800  000e 7b01          	ld	a,(OFST+1,sp)
 801  0010 2723          	jreq	L621
 802  0012 a101          	cp	a,#1
 803  0014 271f          	jreq	L621
 804  0016 a102          	cp	a,#2
 805  0018 271b          	jreq	L621
 806  001a a103          	cp	a,#3
 807  001c 2717          	jreq	L621
 808  001e a104          	cp	a,#4
 809  0020 2713          	jreq	L621
 810  0022 a105          	cp	a,#5
 811  0024 270f          	jreq	L621
 812  0026 a106          	cp	a,#6
 813  0028 270b          	jreq	L621
 814  002a a107          	cp	a,#7
 815  002c 2707          	jreq	L621
 816  002e ae00d8        	ldw	x,#216
 817  0031 ad0c          	call	LC002
 818  0033 7b01          	ld	a,(OFST+1,sp)
 819  0035               L621:
 820                     ; 219     TIM4->PSCR = (uint8_t)Prescaler;
 822  0035 c75345        	ld	21317,a
 823                     ; 222     TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 825  0038 7b02          	ld	a,(OFST+2,sp)
 826  003a c75343        	ld	21315,a
 827                     ; 223 }
 830  003d 85            	popw	x
 831  003e 81            	ret	
 833  003f               LC002:
 834  003f 89            	pushw	x
 835  0040 5f            	clrw	x
 836  0041 89            	pushw	x
 837  0042 ae0000        	ldw	x,#L56
 838  0045 cd0000        	call	_assert_failed
 840  0048 5b04          	addw	sp,#4
 841  004a 81            	ret	
 877                     ; 231 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 877                     ; 232 {
 878                     .text:	section	.text,new
 879  0000               _TIM4_ARRPreloadConfig:
 881  0000 88            	push	a
 882       00000000      OFST:	set	0
 885                     ; 234     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 887  0001 4d            	tnz	a
 888  0002 2711          	jreq	L041
 889  0004 4a            	dec	a
 890  0005 270e          	jreq	L041
 891  0007 ae00ea        	ldw	x,#234
 892  000a 89            	pushw	x
 893  000b 5f            	clrw	x
 894  000c 89            	pushw	x
 895  000d ae0000        	ldw	x,#L56
 896  0010 cd0000        	call	_assert_failed
 898  0013 5b04          	addw	sp,#4
 899  0015               L041:
 900                     ; 237     if (NewState != DISABLE)
 902  0015 7b01          	ld	a,(OFST+1,sp)
 903  0017 2706          	jreq	L333
 904                     ; 239         TIM4->CR1 |= TIM4_CR1_ARPE;
 906  0019 721e5340      	bset	21312,#7
 908  001d 2004          	jra	L533
 909  001f               L333:
 910                     ; 243         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 912  001f 721f5340      	bres	21312,#7
 913  0023               L533:
 914                     ; 245 }
 917  0023 84            	pop	a
 918  0024 81            	ret	
 968                     ; 254 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 968                     ; 255 {
 969                     .text:	section	.text,new
 970  0000               _TIM4_GenerateEvent:
 972  0000 88            	push	a
 973       00000000      OFST:	set	0
 976                     ; 257     assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 978  0001 4a            	dec	a
 979  0002 270e          	jreq	L051
 980  0004 ae0101        	ldw	x,#257
 981  0007 89            	pushw	x
 982  0008 5f            	clrw	x
 983  0009 89            	pushw	x
 984  000a ae0000        	ldw	x,#L56
 985  000d cd0000        	call	_assert_failed
 987  0010 5b04          	addw	sp,#4
 988  0012               L051:
 989                     ; 260     TIM4->EGR = (uint8_t)(TIM4_EventSource);
 991  0012 7b01          	ld	a,(OFST+1,sp)
 992  0014 c75343        	ld	21315,a
 993                     ; 261 }
 996  0017 84            	pop	a
 997  0018 81            	ret	
1029                     ; 270 void TIM4_SetCounter(uint8_t Counter)
1029                     ; 271 {
1030                     .text:	section	.text,new
1031  0000               _TIM4_SetCounter:
1035                     ; 273     TIM4->CNTR = (uint8_t)(Counter);
1037  0000 c75344        	ld	21316,a
1038                     ; 274 }
1041  0003 81            	ret	
1073                     ; 283 void TIM4_SetAutoreload(uint8_t Autoreload)
1073                     ; 284 {
1074                     .text:	section	.text,new
1075  0000               _TIM4_SetAutoreload:
1079                     ; 286     TIM4->ARR = (uint8_t)(Autoreload);
1081  0000 c75346        	ld	21318,a
1082                     ; 287 }
1085  0003 81            	ret	
1108                     ; 294 uint8_t TIM4_GetCounter(void)
1108                     ; 295 {
1109                     .text:	section	.text,new
1110  0000               _TIM4_GetCounter:
1114                     ; 297     return (uint8_t)(TIM4->CNTR);
1116  0000 c65344        	ld	a,21316
1119  0003 81            	ret	
1143                     ; 305 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1143                     ; 306 {
1144                     .text:	section	.text,new
1145  0000               _TIM4_GetPrescaler:
1149                     ; 308     return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
1151  0000 c65345        	ld	a,21317
1154  0003 81            	ret	
1234                     ; 318 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1234                     ; 319 {
1235                     .text:	section	.text,new
1236  0000               _TIM4_GetFlagStatus:
1238  0000 88            	push	a
1239  0001 88            	push	a
1240       00000001      OFST:	set	1
1243                     ; 320     FlagStatus bitstatus = RESET;
1245  0002 0f01          	clr	(OFST+0,sp)
1246                     ; 323     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1248  0004 4a            	dec	a
1249  0005 270e          	jreq	L071
1250  0007 ae0143        	ldw	x,#323
1251  000a 89            	pushw	x
1252  000b 5f            	clrw	x
1253  000c 89            	pushw	x
1254  000d ae0000        	ldw	x,#L56
1255  0010 cd0000        	call	_assert_failed
1257  0013 5b04          	addw	sp,#4
1258  0015               L071:
1259                     ; 325   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1261  0015 c65342        	ld	a,21314
1262  0018 1502          	bcp	a,(OFST+1,sp)
1263  001a 2704          	jreq	L374
1264                     ; 327     bitstatus = SET;
1266  001c a601          	ld	a,#1
1268  001e 2001          	jra	L574
1269  0020               L374:
1270                     ; 331     bitstatus = RESET;
1272  0020 4f            	clr	a
1273  0021               L574:
1274                     ; 333   return ((FlagStatus)bitstatus);
1278  0021 85            	popw	x
1279  0022 81            	ret	
1315                     ; 343 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1315                     ; 344 {
1316                     .text:	section	.text,new
1317  0000               _TIM4_ClearFlag:
1319  0000 88            	push	a
1320       00000000      OFST:	set	0
1323                     ; 346     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1325  0001 4a            	dec	a
1326  0002 270e          	jreq	L002
1327  0004 ae015a        	ldw	x,#346
1328  0007 89            	pushw	x
1329  0008 5f            	clrw	x
1330  0009 89            	pushw	x
1331  000a ae0000        	ldw	x,#L56
1332  000d cd0000        	call	_assert_failed
1334  0010 5b04          	addw	sp,#4
1335  0012               L002:
1336                     ; 349     TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1338  0012 7b01          	ld	a,(OFST+1,sp)
1339  0014 43            	cpl	a
1340  0015 c75342        	ld	21314,a
1341                     ; 351 }
1344  0018 84            	pop	a
1345  0019 81            	ret	
1406                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1406                     ; 361 {
1407                     .text:	section	.text,new
1408  0000               _TIM4_GetITStatus:
1410  0000 88            	push	a
1411  0001 89            	pushw	x
1412       00000002      OFST:	set	2
1415                     ; 362     ITStatus bitstatus = RESET;
1417                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1421  0002 7b02          	ld	a,(OFST+0,sp)
1422  0004 97            	ld	xl,a
1423                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1425  0005 7b03          	ld	a,(OFST+1,sp)
1426  0007 4a            	dec	a
1427  0008 270e          	jreq	L012
1428  000a ae016f        	ldw	x,#367
1429  000d 89            	pushw	x
1430  000e 5f            	clrw	x
1431  000f 89            	pushw	x
1432  0010 ae0000        	ldw	x,#L56
1433  0013 cd0000        	call	_assert_failed
1435  0016 5b04          	addw	sp,#4
1436  0018               L012:
1437                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1439  0018 c65342        	ld	a,21314
1440  001b 1403          	and	a,(OFST+1,sp)
1441  001d 6b01          	ld	(OFST-1,sp),a
1442                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1444  001f c65341        	ld	a,21313
1445  0022 1403          	and	a,(OFST+1,sp)
1446  0024 6b02          	ld	(OFST+0,sp),a
1447                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1449  0026 7b01          	ld	a,(OFST-1,sp)
1450  0028 2708          	jreq	L345
1452  002a 7b02          	ld	a,(OFST+0,sp)
1453  002c 2704          	jreq	L345
1454                     ; 375     bitstatus = (ITStatus)SET;
1456  002e a601          	ld	a,#1
1458  0030 2001          	jra	L545
1459  0032               L345:
1460                     ; 379     bitstatus = (ITStatus)RESET;
1462  0032 4f            	clr	a
1463  0033               L545:
1464                     ; 381   return ((ITStatus)bitstatus);
1468  0033 5b03          	addw	sp,#3
1469  0035 81            	ret	
1506                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1506                     ; 392 {
1507                     .text:	section	.text,new
1508  0000               _TIM4_ClearITPendingBit:
1510  0000 88            	push	a
1511       00000000      OFST:	set	0
1514                     ; 394     assert_param(IS_TIM4_IT_OK(TIM4_IT));
1516  0001 4a            	dec	a
1517  0002 270e          	jreq	L022
1518  0004 ae018a        	ldw	x,#394
1519  0007 89            	pushw	x
1520  0008 5f            	clrw	x
1521  0009 89            	pushw	x
1522  000a ae0000        	ldw	x,#L56
1523  000d cd0000        	call	_assert_failed
1525  0010 5b04          	addw	sp,#4
1526  0012               L022:
1527                     ; 397     TIM4->SR1 = (uint8_t)(~TIM4_IT);
1529  0012 7b01          	ld	a,(OFST+1,sp)
1530  0014 43            	cpl	a
1531  0015 c75342        	ld	21314,a
1532                     ; 398 }
1535  0018 84            	pop	a
1536  0019 81            	ret	
1549                     	xdef	_TIM4_ClearITPendingBit
1550                     	xdef	_TIM4_GetITStatus
1551                     	xdef	_TIM4_ClearFlag
1552                     	xdef	_TIM4_GetFlagStatus
1553                     	xdef	_TIM4_GetPrescaler
1554                     	xdef	_TIM4_GetCounter
1555                     	xdef	_TIM4_SetAutoreload
1556                     	xdef	_TIM4_SetCounter
1557                     	xdef	_TIM4_GenerateEvent
1558                     	xdef	_TIM4_ARRPreloadConfig
1559                     	xdef	_TIM4_PrescalerConfig
1560                     	xdef	_TIM4_SelectOnePulseMode
1561                     	xdef	_TIM4_UpdateRequestConfig
1562                     	xdef	_TIM4_UpdateDisableConfig
1563                     	xdef	_TIM4_ITConfig
1564                     	xdef	_TIM4_Cmd
1565                     	xdef	_TIM4_TimeBaseInit
1566                     	xdef	_TIM4_DeInit
1567                     	xref	_assert_failed
1568                     .const:	section	.text
1569  0000               L56:
1570  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
1571  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
1572  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
1573  0036 5f74696d342e  	dc.b	"_tim4.c",0
1593                     	end
