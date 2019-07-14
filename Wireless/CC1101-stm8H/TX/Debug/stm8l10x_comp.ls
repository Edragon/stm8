   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 57 void COMP_DeInit(void)
  43                     ; 58 {
  45                     	switch	.text
  46  0000               _COMP_DeInit:
  50                     ; 59   COMP->CR   = COMP_CR_RESET_VALUE;
  52  0000 725f5300      	clr	21248
  53                     ; 60   COMP->CSR  = COMP_CSR_RESET_VALUE;
  55  0004 35505301      	mov	21249,#80
  56                     ; 61   COMP->CCS  = COMP_CCS_RESET_VALUE;
  58  0008 725f5302      	clr	21250
  59                     ; 62 }
  62  000c 81            	ret
 196                     ; 85 void COMP_Init(COMP_Selection_TypeDef COMP_Selection,
 196                     ; 86                COMP_Reference_TypeDef COMP_Reference,
 196                     ; 87                COMP_Polarity_TypeDef COMP_Polarity)
 196                     ; 88 {
 197                     	switch	.text
 198  000d               _COMP_Init:
 200  000d 89            	pushw	x
 201       00000000      OFST:	set	0
 204                     ; 90   assert_param(IS_COMP_POLARITY(COMP_Polarity));
 206                     ; 91   assert_param(IS_COMP_REFERENCE(COMP_Reference));
 208                     ; 92   assert_param(IS_COMP_SELECTION(COMP_Selection));
 210                     ; 94   COMP->CR &= (uint8_t)(~((uint8_t)COMP_Polarity | (uint8_t)COMP_Reference | (uint8_t)COMP_Selection));
 212  000e 9f            	ld	a,xl
 213  000f 1a05          	or	a,(OFST+5,sp)
 214  0011 1a01          	or	a,(OFST+1,sp)
 215  0013 43            	cpl	a
 216  0014 c45300        	and	a,21248
 217  0017 c75300        	ld	21248,a
 218                     ; 96   COMP->CR |= (uint8_t)((uint8_t)COMP_Polarity | (uint8_t)COMP_Reference | (uint8_t)COMP_Selection);
 220  001a 7b05          	ld	a,(OFST+5,sp)
 221  001c 1a02          	or	a,(OFST+2,sp)
 222  001e 1a01          	or	a,(OFST+1,sp)
 223  0020 ca5300        	or	a,21248
 224  0023 c75300        	ld	21248,a
 225                     ; 98 }
 228  0026 85            	popw	x
 229  0027 81            	ret
 284                     ; 106 void COMP_Cmd(FunctionalState NewState)
 284                     ; 107 {
 285                     	switch	.text
 286  0028               _COMP_Cmd:
 290                     ; 109   assert_param(IS_FUNCTIONAL_STATE(NewState));
 292                     ; 111   if (NewState != DISABLE)
 294  0028 4d            	tnz	a
 295  0029 2706          	jreq	L131
 296                     ; 114     COMP->CR |= COMP_CR_BIASEN;
 298  002b 72105300      	bset	21248,#0
 300  002f 2004          	jra	L331
 301  0031               L131:
 302                     ; 118     COMP->CR &= (uint8_t)(~COMP_CR_BIASEN);
 304  0031 72115300      	bres	21248,#0
 305  0035               L331:
 306                     ; 120 }
 309  0035 81            	ret
 355                     ; 134 void COMP_SelectionConfig(COMP_Selection_TypeDef COMP_Selection,
 355                     ; 135                           FunctionalState NewState)
 355                     ; 136 {
 356                     	switch	.text
 357  0036               _COMP_SelectionConfig:
 359  0036 89            	pushw	x
 360       00000000      OFST:	set	0
 363                     ; 138   assert_param(IS_FUNCTIONAL_STATE(NewState));
 365                     ; 139   assert_param(IS_COMP_SELECTION(COMP_Selection));
 367                     ; 141   if (NewState != DISABLE)
 369  0037 9f            	ld	a,xl
 370  0038 4d            	tnz	a
 371  0039 2709          	jreq	L751
 372                     ; 143     COMP->CR |= (uint8_t)COMP_Selection;
 374  003b 9e            	ld	a,xh
 375  003c ca5300        	or	a,21248
 376  003f c75300        	ld	21248,a
 378  0042 2009          	jra	L161
 379  0044               L751:
 380                     ; 147     COMP->CR &= (uint8_t)(~(uint8_t)COMP_Selection);
 382  0044 7b01          	ld	a,(OFST+1,sp)
 383  0046 43            	cpl	a
 384  0047 c45300        	and	a,21248
 385  004a c75300        	ld	21248,a
 386  004d               L161:
 387                     ; 149 }
 390  004d 85            	popw	x
 391  004e 81            	ret
 470                     ; 162 void COMP_ITConfig(COMP_IT_TypeDef COMP_IT,
 470                     ; 163                    FunctionalState NewState)
 470                     ; 164 {
 471                     	switch	.text
 472  004f               _COMP_ITConfig:
 474  004f 89            	pushw	x
 475       00000000      OFST:	set	0
 478                     ; 166   assert_param(IS_COMP_IT(COMP_IT));
 480                     ; 167   assert_param(IS_FUNCTIONAL_STATE(NewState));
 482                     ; 169   if (NewState != DISABLE)
 484  0050 9f            	ld	a,xl
 485  0051 4d            	tnz	a
 486  0052 2709          	jreq	L122
 487                     ; 172     COMP->CSR |= (uint8_t)COMP_IT;
 489  0054 9e            	ld	a,xh
 490  0055 ca5301        	or	a,21249
 491  0058 c75301        	ld	21249,a
 493  005b 2009          	jra	L322
 494  005d               L122:
 495                     ; 177     COMP->CSR &= (uint8_t)(~(uint8_t)COMP_IT);
 497  005d 7b01          	ld	a,(OFST+1,sp)
 498  005f 43            	cpl	a
 499  0060 c45301        	and	a,21249
 500  0063 c75301        	ld	21249,a
 501  0066               L322:
 502                     ; 179 }
 505  0066 85            	popw	x
 506  0067 81            	ret
 562                     ; 189 void COMP_TIM2Config(COMP_TIM2Config_TypeDef COMP_TIM2Config)
 562                     ; 190 {
 563                     	switch	.text
 564  0068               _COMP_TIM2Config:
 568                     ; 192   assert_param(IS_COMP_TIM2CONFIG(COMP_TIM2Config));
 570                     ; 195   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_IC1BK);
 572  0068 721f5300      	bres	21248,#7
 573                     ; 198   COMP->CR |= (uint8_t)COMP_TIM2Config;
 575  006c ca5300        	or	a,21248
 576  006f c75300        	ld	21248,a
 577                     ; 199 }
 580  0072 81            	ret
 695                     ; 216 void COMP_SwitchConfig(COMP_Switch_TypeDef COMP_Switch,
 695                     ; 217                        FunctionalState NewState)
 695                     ; 218 {
 696                     	switch	.text
 697  0073               _COMP_SwitchConfig:
 699  0073 89            	pushw	x
 700       00000000      OFST:	set	0
 703                     ; 220   assert_param(IS_COMP_SWITCH(COMP_Switch));
 705                     ; 221   assert_param(IS_FUNCTIONAL_STATE(NewState));
 707                     ; 223   if (NewState != DISABLE)
 709  0074 9f            	ld	a,xl
 710  0075 4d            	tnz	a
 711  0076 2709          	jreq	L123
 712                     ; 226     COMP->CCS |= (uint8_t)COMP_Switch;
 714  0078 9e            	ld	a,xh
 715  0079 ca5302        	or	a,21250
 716  007c c75302        	ld	21250,a
 718  007f 2009          	jra	L323
 719  0081               L123:
 720                     ; 231     COMP->CCS &= (uint8_t)(~(uint8_t)COMP_Switch);
 722  0081 7b01          	ld	a,(OFST+1,sp)
 723  0083 43            	cpl	a
 724  0084 c45302        	and	a,21250
 725  0087 c75302        	ld	21250,a
 726  008a               L323:
 727                     ; 233 }
 730  008a 85            	popw	x
 731  008b 81            	ret
 807                     ; 245 void COMP_TIMConnect(COMP_TimersConnection_TypeDef COMP_TIMConnection)
 807                     ; 246 {
 808                     	switch	.text
 809  008c               _COMP_TIMConnect:
 811  008c 88            	push	a
 812       00000000      OFST:	set	0
 815                     ; 248   assert_param(IS_COMP_TIMCONNECTION(COMP_TIMConnection));
 817                     ; 251   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_CNFTIM);
 819  008d c65300        	ld	a,21248
 820  0090 a49f          	and	a,#159
 821  0092 c75300        	ld	21248,a
 822                     ; 254   COMP->CR |= (uint8_t)COMP_TIMConnection;
 824  0095 c65300        	ld	a,21248
 825  0098 1a01          	or	a,(OFST+1,sp)
 826  009a c75300        	ld	21248,a
 827                     ; 255 }
 830  009d 84            	pop	a
 831  009e 81            	ret
 867                     ; 265 void COMP_SelectPolarity(COMP_Polarity_TypeDef COMP_Polarity)
 867                     ; 266 {
 868                     	switch	.text
 869  009f               _COMP_SelectPolarity:
 873                     ; 268   assert_param(IS_COMP_POLARITY(COMP_Polarity));
 875                     ; 271   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_POL);
 877  009f 72195300      	bres	21248,#4
 878                     ; 274   COMP->CR |= (uint8_t)COMP_Polarity;
 880  00a3 ca5300        	or	a,21248
 881  00a6 c75300        	ld	21248,a
 882                     ; 275 }
 885  00a9 81            	ret
 920                     ; 285 void COMP_SetReference(COMP_Reference_TypeDef COMP_Reference)
 920                     ; 286 {
 921                     	switch	.text
 922  00aa               _COMP_SetReference:
 926                     ; 288   assert_param(IS_COMP_REFERENCE(COMP_Reference));
 928                     ; 291   COMP->CR &= (uint8_t)(~(uint8_t)COMP_CR_COMPREF);
 930  00aa 72175300      	bres	21248,#3
 931                     ; 294   COMP->CR |= (uint8_t)COMP_Reference;
 933  00ae ca5300        	or	a,21248
 934  00b1 c75300        	ld	21248,a
 935                     ; 295 }
 938  00b4 81            	ret
1025                     ; 305 FlagStatus COMP_GetOutputStatus(COMP_Output_TypeDef COMP_Output)
1025                     ; 306 {
1026                     	switch	.text
1027  00b5               _COMP_GetOutputStatus:
1029  00b5 88            	push	a
1030       00000001      OFST:	set	1
1033                     ; 307   FlagStatus status = RESET;
1035                     ; 310   assert_param(IS_COMP_OUTPUT(COMP_Output));
1037                     ; 312   if ((COMP->CSR & (uint8_t)COMP_Output) != 0)
1039  00b6 c45301        	and	a,21249
1040  00b9 2706          	jreq	L554
1041                     ; 314     status = SET;
1043  00bb a601          	ld	a,#1
1044  00bd 6b01          	ld	(OFST+0,sp),a
1046  00bf 2002          	jra	L754
1047  00c1               L554:
1048                     ; 318     status = RESET;
1050  00c1 0f01          	clr	(OFST+0,sp)
1051  00c3               L754:
1052                     ; 320   return status;
1054  00c3 7b01          	ld	a,(OFST+0,sp)
1057  00c5 5b01          	addw	sp,#1
1058  00c7 81            	ret
1124                     ; 331 FlagStatus COMP_GetFlagStatus(COMP_FLAG_TypeDef COMP_Flag)
1124                     ; 332 {
1125                     	switch	.text
1126  00c8               _COMP_GetFlagStatus:
1128  00c8 88            	push	a
1129       00000001      OFST:	set	1
1132                     ; 333   FlagStatus status = RESET;
1134                     ; 336   assert_param(IS_COMP_FLAG(COMP_Flag));
1136                     ; 338   if ((COMP->CSR & (uint8_t)COMP_Flag) != 0)
1138  00c9 c45301        	and	a,21249
1139  00cc 2706          	jreq	L315
1140                     ; 340     status = SET;
1142  00ce a601          	ld	a,#1
1143  00d0 6b01          	ld	(OFST+0,sp),a
1145  00d2 2002          	jra	L515
1146  00d4               L315:
1147                     ; 344     status = RESET;
1149  00d4 0f01          	clr	(OFST+0,sp)
1150  00d6               L515:
1151                     ; 346   return status;
1153  00d6 7b01          	ld	a,(OFST+0,sp)
1156  00d8 5b01          	addw	sp,#1
1157  00da 81            	ret
1192                     ; 357 void COMP_ClearFlag(COMP_FLAG_TypeDef COMP_Flag)
1192                     ; 358 {
1193                     	switch	.text
1194  00db               _COMP_ClearFlag:
1198                     ; 360   assert_param(IS_COMP_FLAG(COMP_Flag));
1200                     ; 363   COMP->CSR |= (uint8_t)COMP_Flag;
1202  00db ca5301        	or	a,21249
1203  00de c75301        	ld	21249,a
1204                     ; 364 }
1207  00e1 81            	ret
1253                     ; 374 ITStatus COMP_GetITStatus(COMP_IT_TypeDef COMP_ITPendingBit)
1253                     ; 375 {
1254                     	switch	.text
1255  00e2               _COMP_GetITStatus:
1257  00e2 88            	push	a
1258       00000001      OFST:	set	1
1261                     ; 376   ITStatus status = RESET;
1263                     ; 379   assert_param(IS_COMP_ITPENDINGBIT(COMP_ITPendingBit));
1265                     ; 381   if (COMP->CSR & (uint8_t)COMP_ITPendingBit)
1267  00e3 c45301        	and	a,21249
1268  00e6 2706          	jreq	L755
1269                     ; 383     status = SET;
1271  00e8 a601          	ld	a,#1
1272  00ea 6b01          	ld	(OFST+0,sp),a
1274  00ec 2002          	jra	L165
1275  00ee               L755:
1276                     ; 387     status = RESET;
1278  00ee 0f01          	clr	(OFST+0,sp)
1279  00f0               L165:
1280                     ; 389   return status;
1282  00f0 7b01          	ld	a,(OFST+0,sp)
1285  00f2 5b01          	addw	sp,#1
1286  00f4 81            	ret
1322                     ; 400 void COMP_ClearITPendingBit(COMP_IT_TypeDef COMP_ITPendingBit)
1322                     ; 401 {
1323                     	switch	.text
1324  00f5               _COMP_ClearITPendingBit:
1328                     ; 403   assert_param(IS_COMP_ITPENDINGBIT(COMP_ITPendingBit));
1330                     ; 406   COMP->CSR |= (uint8_t)COMP_ITPendingBit;
1332  00f5 ca5301        	or	a,21249
1333  00f8 c75301        	ld	21249,a
1334                     ; 407 }
1337  00fb 81            	ret
1350                     	xdef	_COMP_ClearITPendingBit
1351                     	xdef	_COMP_GetITStatus
1352                     	xdef	_COMP_ClearFlag
1353                     	xdef	_COMP_GetFlagStatus
1354                     	xdef	_COMP_GetOutputStatus
1355                     	xdef	_COMP_SetReference
1356                     	xdef	_COMP_SelectPolarity
1357                     	xdef	_COMP_TIMConnect
1358                     	xdef	_COMP_SwitchConfig
1359                     	xdef	_COMP_TIM2Config
1360                     	xdef	_COMP_ITConfig
1361                     	xdef	_COMP_SelectionConfig
1362                     	xdef	_COMP_Cmd
1363                     	xdef	_COMP_Init
1364                     	xdef	_COMP_DeInit
1383                     	end
