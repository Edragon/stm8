   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  98                     ; 47 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  98                     ; 48 {
 100                     	switch	.text
 101  0000               _GPIO_DeInit:
 105                     ; 49     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 107  0000 7f            	clr	(x)
 108                     ; 50     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 110  0001 6f02          	clr	(2,x)
 111                     ; 51     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 113  0003 6f03          	clr	(3,x)
 114                     ; 52     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 116  0005 6f04          	clr	(4,x)
 117                     ; 53 }
 120  0007 81            	ret
 361                     ; 65 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 361                     ; 66 {
 362                     	switch	.text
 363  0008               _GPIO_Init:
 365  0008 89            	pushw	x
 366       00000000      OFST:	set	0
 369                     ; 71     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 371  0009 0d06          	tnz	(OFST+6,sp)
 372  000b 2742          	jreq	L21
 373  000d 7b06          	ld	a,(OFST+6,sp)
 374  000f a140          	cp	a,#64
 375  0011 273c          	jreq	L21
 376  0013 7b06          	ld	a,(OFST+6,sp)
 377  0015 a120          	cp	a,#32
 378  0017 2736          	jreq	L21
 379  0019 7b06          	ld	a,(OFST+6,sp)
 380  001b a160          	cp	a,#96
 381  001d 2730          	jreq	L21
 382  001f 7b06          	ld	a,(OFST+6,sp)
 383  0021 a1a0          	cp	a,#160
 384  0023 272a          	jreq	L21
 385  0025 7b06          	ld	a,(OFST+6,sp)
 386  0027 a1e0          	cp	a,#224
 387  0029 2724          	jreq	L21
 388  002b 7b06          	ld	a,(OFST+6,sp)
 389  002d a180          	cp	a,#128
 390  002f 271e          	jreq	L21
 391  0031 7b06          	ld	a,(OFST+6,sp)
 392  0033 a1c0          	cp	a,#192
 393  0035 2718          	jreq	L21
 394  0037 7b06          	ld	a,(OFST+6,sp)
 395  0039 a1b0          	cp	a,#176
 396  003b 2712          	jreq	L21
 397  003d 7b06          	ld	a,(OFST+6,sp)
 398  003f a1f0          	cp	a,#240
 399  0041 270c          	jreq	L21
 400  0043 7b06          	ld	a,(OFST+6,sp)
 401  0045 a190          	cp	a,#144
 402  0047 2706          	jreq	L21
 403  0049 7b06          	ld	a,(OFST+6,sp)
 404  004b a1d0          	cp	a,#208
 405  004d 2603          	jrne	L01
 406  004f               L21:
 407  004f 4f            	clr	a
 408  0050 2010          	jra	L41
 409  0052               L01:
 410  0052 ae0047        	ldw	x,#71
 411  0055 89            	pushw	x
 412  0056 ae0000        	ldw	x,#0
 413  0059 89            	pushw	x
 414  005a ae0000        	ldw	x,#L771
 415  005d cd0000        	call	_assert_failed
 417  0060 5b04          	addw	sp,#4
 418  0062               L41:
 419                     ; 72     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 421  0062 0d05          	tnz	(OFST+5,sp)
 422  0064 2703          	jreq	L61
 423  0066 4f            	clr	a
 424  0067 2010          	jra	L02
 425  0069               L61:
 426  0069 ae0048        	ldw	x,#72
 427  006c 89            	pushw	x
 428  006d ae0000        	ldw	x,#0
 429  0070 89            	pushw	x
 430  0071 ae0000        	ldw	x,#L771
 431  0074 cd0000        	call	_assert_failed
 433  0077 5b04          	addw	sp,#4
 434  0079               L02:
 435                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 437  0079 1e01          	ldw	x,(OFST+1,sp)
 438  007b 7b05          	ld	a,(OFST+5,sp)
 439  007d 43            	cpl	a
 440  007e e404          	and	a,(4,x)
 441  0080 e704          	ld	(4,x),a
 442                     ; 81     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 444  0082 7b06          	ld	a,(OFST+6,sp)
 445  0084 a580          	bcp	a,#128
 446  0086 271f          	jreq	L102
 447                     ; 83         if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 449  0088 7b06          	ld	a,(OFST+6,sp)
 450  008a a510          	bcp	a,#16
 451  008c 2708          	jreq	L302
 452                     ; 85             GPIOx->ODR |= (uint8_t)GPIO_Pin;
 454  008e 1e01          	ldw	x,(OFST+1,sp)
 455  0090 f6            	ld	a,(x)
 456  0091 1a05          	or	a,(OFST+5,sp)
 457  0093 f7            	ld	(x),a
 459  0094 2007          	jra	L502
 460  0096               L302:
 461                     ; 89             GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 463  0096 1e01          	ldw	x,(OFST+1,sp)
 464  0098 7b05          	ld	a,(OFST+5,sp)
 465  009a 43            	cpl	a
 466  009b f4            	and	a,(x)
 467  009c f7            	ld	(x),a
 468  009d               L502:
 469                     ; 92         GPIOx->DDR |= (uint8_t)GPIO_Pin;
 471  009d 1e01          	ldw	x,(OFST+1,sp)
 472  009f e602          	ld	a,(2,x)
 473  00a1 1a05          	or	a,(OFST+5,sp)
 474  00a3 e702          	ld	(2,x),a
 476  00a5 2009          	jra	L702
 477  00a7               L102:
 478                     ; 97         GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 480  00a7 1e01          	ldw	x,(OFST+1,sp)
 481  00a9 7b05          	ld	a,(OFST+5,sp)
 482  00ab 43            	cpl	a
 483  00ac e402          	and	a,(2,x)
 484  00ae e702          	ld	(2,x),a
 485  00b0               L702:
 486                     ; 104     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 488  00b0 7b06          	ld	a,(OFST+6,sp)
 489  00b2 a540          	bcp	a,#64
 490  00b4 270a          	jreq	L112
 491                     ; 106         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 493  00b6 1e01          	ldw	x,(OFST+1,sp)
 494  00b8 e603          	ld	a,(3,x)
 495  00ba 1a05          	or	a,(OFST+5,sp)
 496  00bc e703          	ld	(3,x),a
 498  00be 2009          	jra	L312
 499  00c0               L112:
 500                     ; 110         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 502  00c0 1e01          	ldw	x,(OFST+1,sp)
 503  00c2 7b05          	ld	a,(OFST+5,sp)
 504  00c4 43            	cpl	a
 505  00c5 e403          	and	a,(3,x)
 506  00c7 e703          	ld	(3,x),a
 507  00c9               L312:
 508                     ; 117     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 510  00c9 7b06          	ld	a,(OFST+6,sp)
 511  00cb a520          	bcp	a,#32
 512  00cd 270a          	jreq	L512
 513                     ; 119         GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 515  00cf 1e01          	ldw	x,(OFST+1,sp)
 516  00d1 e604          	ld	a,(4,x)
 517  00d3 1a05          	or	a,(OFST+5,sp)
 518  00d5 e704          	ld	(4,x),a
 520  00d7 2009          	jra	L712
 521  00d9               L512:
 522                     ; 123         GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 524  00d9 1e01          	ldw	x,(OFST+1,sp)
 525  00db 7b05          	ld	a,(OFST+5,sp)
 526  00dd 43            	cpl	a
 527  00de e404          	and	a,(4,x)
 528  00e0 e704          	ld	(4,x),a
 529  00e2               L712:
 530                     ; 125 }
 533  00e2 85            	popw	x
 534  00e3 81            	ret
 580                     ; 135 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 580                     ; 136 {
 581                     	switch	.text
 582  00e4               _GPIO_Write:
 584  00e4 89            	pushw	x
 585       00000000      OFST:	set	0
 588                     ; 137     GPIOx->ODR = PortVal;
 590  00e5 7b05          	ld	a,(OFST+5,sp)
 591  00e7 1e01          	ldw	x,(OFST+1,sp)
 592  00e9 f7            	ld	(x),a
 593                     ; 138 }
 596  00ea 85            	popw	x
 597  00eb 81            	ret
 644                     ; 148 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 644                     ; 149 {
 645                     	switch	.text
 646  00ec               _GPIO_WriteHigh:
 648  00ec 89            	pushw	x
 649       00000000      OFST:	set	0
 652                     ; 150     GPIOx->ODR |= (uint8_t)PortPins;
 654  00ed f6            	ld	a,(x)
 655  00ee 1a05          	or	a,(OFST+5,sp)
 656  00f0 f7            	ld	(x),a
 657                     ; 151 }
 660  00f1 85            	popw	x
 661  00f2 81            	ret
 708                     ; 161 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 708                     ; 162 {
 709                     	switch	.text
 710  00f3               _GPIO_WriteLow:
 712  00f3 89            	pushw	x
 713       00000000      OFST:	set	0
 716                     ; 163     GPIOx->ODR &= (uint8_t)(~PortPins);
 718  00f4 7b05          	ld	a,(OFST+5,sp)
 719  00f6 43            	cpl	a
 720  00f7 f4            	and	a,(x)
 721  00f8 f7            	ld	(x),a
 722                     ; 164 }
 725  00f9 85            	popw	x
 726  00fa 81            	ret
 773                     ; 174 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 773                     ; 175 {
 774                     	switch	.text
 775  00fb               _GPIO_WriteReverse:
 777  00fb 89            	pushw	x
 778       00000000      OFST:	set	0
 781                     ; 176     GPIOx->ODR ^= (uint8_t)PortPins;
 783  00fc f6            	ld	a,(x)
 784  00fd 1805          	xor	a,	(OFST+5,sp)
 785  00ff f7            	ld	(x),a
 786                     ; 177 }
 789  0100 85            	popw	x
 790  0101 81            	ret
 828                     ; 185 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 828                     ; 186 {
 829                     	switch	.text
 830  0102               _GPIO_ReadOutputData:
 834                     ; 187     return ((uint8_t)GPIOx->ODR);
 836  0102 f6            	ld	a,(x)
 839  0103 81            	ret
 876                     ; 196 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 876                     ; 197 {
 877                     	switch	.text
 878  0104               _GPIO_ReadInputData:
 882                     ; 198     return ((uint8_t)GPIOx->IDR);
 884  0104 e601          	ld	a,(1,x)
 887  0106 81            	ret
 955                     ; 207 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 955                     ; 208 {
 956                     	switch	.text
 957  0107               _GPIO_ReadInputPin:
 959  0107 89            	pushw	x
 960       00000000      OFST:	set	0
 963                     ; 209     return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 965  0108 e601          	ld	a,(1,x)
 966  010a 1405          	and	a,(OFST+5,sp)
 969  010c 85            	popw	x
 970  010d 81            	ret
1049                     ; 219 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1049                     ; 220 {
1050                     	switch	.text
1051  010e               _GPIO_ExternalPullUpConfig:
1053  010e 89            	pushw	x
1054       00000000      OFST:	set	0
1057                     ; 222     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1059  010f 0d05          	tnz	(OFST+5,sp)
1060  0111 2703          	jreq	L24
1061  0113 4f            	clr	a
1062  0114 2010          	jra	L44
1063  0116               L24:
1064  0116 ae00de        	ldw	x,#222
1065  0119 89            	pushw	x
1066  011a ae0000        	ldw	x,#0
1067  011d 89            	pushw	x
1068  011e ae0000        	ldw	x,#L771
1069  0121 cd0000        	call	_assert_failed
1071  0124 5b04          	addw	sp,#4
1072  0126               L44:
1073                     ; 223     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1075  0126 0d06          	tnz	(OFST+6,sp)
1076  0128 2706          	jreq	L05
1077  012a 7b06          	ld	a,(OFST+6,sp)
1078  012c a101          	cp	a,#1
1079  012e 2603          	jrne	L64
1080  0130               L05:
1081  0130 4f            	clr	a
1082  0131 2010          	jra	L25
1083  0133               L64:
1084  0133 ae00df        	ldw	x,#223
1085  0136 89            	pushw	x
1086  0137 ae0000        	ldw	x,#0
1087  013a 89            	pushw	x
1088  013b ae0000        	ldw	x,#L771
1089  013e cd0000        	call	_assert_failed
1091  0141 5b04          	addw	sp,#4
1092  0143               L25:
1093                     ; 225     if (NewState != DISABLE) /* External Pull-Up Set*/
1095  0143 0d06          	tnz	(OFST+6,sp)
1096  0145 270a          	jreq	L574
1097                     ; 227         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1099  0147 1e01          	ldw	x,(OFST+1,sp)
1100  0149 e603          	ld	a,(3,x)
1101  014b 1a05          	or	a,(OFST+5,sp)
1102  014d e703          	ld	(3,x),a
1104  014f 2009          	jra	L774
1105  0151               L574:
1106                     ; 230         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1108  0151 1e01          	ldw	x,(OFST+1,sp)
1109  0153 7b05          	ld	a,(OFST+5,sp)
1110  0155 43            	cpl	a
1111  0156 e403          	and	a,(3,x)
1112  0158 e703          	ld	(3,x),a
1113  015a               L774:
1114                     ; 232 }
1117  015a 85            	popw	x
1118  015b 81            	ret
1131                     	xdef	_GPIO_ExternalPullUpConfig
1132                     	xdef	_GPIO_ReadInputPin
1133                     	xdef	_GPIO_ReadOutputData
1134                     	xdef	_GPIO_ReadInputData
1135                     	xdef	_GPIO_WriteReverse
1136                     	xdef	_GPIO_WriteLow
1137                     	xdef	_GPIO_WriteHigh
1138                     	xdef	_GPIO_Write
1139                     	xdef	_GPIO_Init
1140                     	xdef	_GPIO_DeInit
1141                     	xref	_assert_failed
1142                     .const:	section	.text
1143  0000               L771:
1144  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
1145  0012 697665725c73  	dc.b	"iver\src\stm8s_gpi"
1146  0024 6f2e6300      	dc.b	"o.c",0
1166                     	end
