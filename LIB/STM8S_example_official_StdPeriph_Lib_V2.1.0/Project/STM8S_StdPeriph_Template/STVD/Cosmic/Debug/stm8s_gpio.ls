   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  99                     ; 47 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  99                     ; 48 {
 101                     .text:	section	.text,new
 102  0000               _GPIO_DeInit:
 106                     ; 49     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 108  0000 7f            	clr	(x)
 109                     ; 50     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 111  0001 6f02          	clr	(2,x)
 112                     ; 51     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 114  0003 6f03          	clr	(3,x)
 115                     ; 52     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 117  0005 6f04          	clr	(4,x)
 118                     ; 53 }
 121  0007 81            	ret	
 362                     ; 65 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 362                     ; 66 {
 363                     .text:	section	.text,new
 364  0000               _GPIO_Init:
 366  0000 89            	pushw	x
 367       00000000      OFST:	set	0
 370                     ; 71     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 372  0001 7b06          	ld	a,(OFST+6,sp)
 373  0003 2731          	jreq	L41
 374  0005 a140          	cp	a,#64
 375  0007 272d          	jreq	L41
 376  0009 a120          	cp	a,#32
 377  000b 2729          	jreq	L41
 378  000d a160          	cp	a,#96
 379  000f 2725          	jreq	L41
 380  0011 a1a0          	cp	a,#160
 381  0013 2721          	jreq	L41
 382  0015 a1e0          	cp	a,#224
 383  0017 271d          	jreq	L41
 384  0019 a180          	cp	a,#128
 385  001b 2719          	jreq	L41
 386  001d a1c0          	cp	a,#192
 387  001f 2715          	jreq	L41
 388  0021 a1b0          	cp	a,#176
 389  0023 2711          	jreq	L41
 390  0025 a1f0          	cp	a,#240
 391  0027 270d          	jreq	L41
 392  0029 a190          	cp	a,#144
 393  002b 2709          	jreq	L41
 394  002d a1d0          	cp	a,#208
 395  002f 2705          	jreq	L41
 396  0031 ae0047        	ldw	x,#71
 397  0034 ad5d          	call	LC001
 398  0036               L41:
 399                     ; 72     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 401  0036 7b05          	ld	a,(OFST+5,sp)
 402  0038 2607          	jrne	L22
 403  003a ae0048        	ldw	x,#72
 404  003d ad54          	call	LC001
 405  003f 7b05          	ld	a,(OFST+5,sp)
 406  0041               L22:
 407                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 409  0041 1e01          	ldw	x,(OFST+1,sp)
 410  0043 43            	cpl	a
 411  0044 e404          	and	a,(4,x)
 412  0046 e704          	ld	(4,x),a
 413                     ; 81     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 415  0048 7b06          	ld	a,(OFST+6,sp)
 416  004a 2a14          	jrpl	L102
 417                     ; 83         if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 419  004c a510          	bcp	a,#16
 420  004e 2705          	jreq	L302
 421                     ; 85             GPIOx->ODR |= (uint8_t)GPIO_Pin;
 423  0050 f6            	ld	a,(x)
 424  0051 1a05          	or	a,(OFST+5,sp)
 426  0053 2004          	jra	L502
 427  0055               L302:
 428                     ; 89             GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 430  0055 7b05          	ld	a,(OFST+5,sp)
 431  0057 43            	cpl	a
 432  0058 f4            	and	a,(x)
 433  0059               L502:
 434  0059 f7            	ld	(x),a
 435                     ; 92         GPIOx->DDR |= (uint8_t)GPIO_Pin;
 437  005a e602          	ld	a,(2,x)
 438  005c 1a05          	or	a,(OFST+5,sp)
 440  005e 2005          	jra	L702
 441  0060               L102:
 442                     ; 97         GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 444  0060 7b05          	ld	a,(OFST+5,sp)
 445  0062 43            	cpl	a
 446  0063 e402          	and	a,(2,x)
 447  0065               L702:
 448  0065 e702          	ld	(2,x),a
 449                     ; 104     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 451  0067 7b06          	ld	a,(OFST+6,sp)
 452  0069 a540          	bcp	a,#64
 453  006b 2706          	jreq	L112
 454                     ; 106         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 456  006d e603          	ld	a,(3,x)
 457  006f 1a05          	or	a,(OFST+5,sp)
 459  0071 2005          	jra	L312
 460  0073               L112:
 461                     ; 110         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 463  0073 7b05          	ld	a,(OFST+5,sp)
 464  0075 43            	cpl	a
 465  0076 e403          	and	a,(3,x)
 466  0078               L312:
 467  0078 e703          	ld	(3,x),a
 468                     ; 117     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 470  007a 7b06          	ld	a,(OFST+6,sp)
 471  007c a520          	bcp	a,#32
 472  007e 2708          	jreq	L512
 473                     ; 119         GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 475  0080 1e01          	ldw	x,(OFST+1,sp)
 476  0082 e604          	ld	a,(4,x)
 477  0084 1a05          	or	a,(OFST+5,sp)
 479  0086 2007          	jra	L712
 480  0088               L512:
 481                     ; 123         GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 483  0088 1e01          	ldw	x,(OFST+1,sp)
 484  008a 7b05          	ld	a,(OFST+5,sp)
 485  008c 43            	cpl	a
 486  008d e404          	and	a,(4,x)
 487  008f               L712:
 488  008f e704          	ld	(4,x),a
 489                     ; 125 }
 492  0091 85            	popw	x
 493  0092 81            	ret	
 495  0093               LC001:
 496  0093 89            	pushw	x
 497  0094 5f            	clrw	x
 498  0095 89            	pushw	x
 499  0096 ae0000        	ldw	x,#L771
 500  0099 cd0000        	call	_assert_failed
 502  009c 5b04          	addw	sp,#4
 503  009e 81            	ret	
 546                     ; 135 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 546                     ; 136 {
 547                     .text:	section	.text,new
 548  0000               _GPIO_Write:
 550  0000 89            	pushw	x
 551       00000000      OFST:	set	0
 554                     ; 137     GPIOx->ODR = PortVal;
 556  0001 7b05          	ld	a,(OFST+5,sp)
 557  0003 1e01          	ldw	x,(OFST+1,sp)
 558  0005 f7            	ld	(x),a
 559                     ; 138 }
 562  0006 85            	popw	x
 563  0007 81            	ret	
 610                     ; 148 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 610                     ; 149 {
 611                     .text:	section	.text,new
 612  0000               _GPIO_WriteHigh:
 614  0000 89            	pushw	x
 615       00000000      OFST:	set	0
 618                     ; 150     GPIOx->ODR |= (uint8_t)PortPins;
 620  0001 f6            	ld	a,(x)
 621  0002 1a05          	or	a,(OFST+5,sp)
 622  0004 f7            	ld	(x),a
 623                     ; 151 }
 626  0005 85            	popw	x
 627  0006 81            	ret	
 674                     ; 161 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 674                     ; 162 {
 675                     .text:	section	.text,new
 676  0000               _GPIO_WriteLow:
 678  0000 89            	pushw	x
 679       00000000      OFST:	set	0
 682                     ; 163     GPIOx->ODR &= (uint8_t)(~PortPins);
 684  0001 7b05          	ld	a,(OFST+5,sp)
 685  0003 43            	cpl	a
 686  0004 f4            	and	a,(x)
 687  0005 f7            	ld	(x),a
 688                     ; 164 }
 691  0006 85            	popw	x
 692  0007 81            	ret	
 739                     ; 174 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 739                     ; 175 {
 740                     .text:	section	.text,new
 741  0000               _GPIO_WriteReverse:
 743  0000 89            	pushw	x
 744       00000000      OFST:	set	0
 747                     ; 176     GPIOx->ODR ^= (uint8_t)PortPins;
 749  0001 f6            	ld	a,(x)
 750  0002 1805          	xor	a,(OFST+5,sp)
 751  0004 f7            	ld	(x),a
 752                     ; 177 }
 755  0005 85            	popw	x
 756  0006 81            	ret	
 794                     ; 185 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 794                     ; 186 {
 795                     .text:	section	.text,new
 796  0000               _GPIO_ReadOutputData:
 800                     ; 187     return ((uint8_t)GPIOx->ODR);
 802  0000 f6            	ld	a,(x)
 805  0001 81            	ret	
 842                     ; 196 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 842                     ; 197 {
 843                     .text:	section	.text,new
 844  0000               _GPIO_ReadInputData:
 848                     ; 198     return ((uint8_t)GPIOx->IDR);
 850  0000 e601          	ld	a,(1,x)
 853  0002 81            	ret	
 921                     ; 207 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 921                     ; 208 {
 922                     .text:	section	.text,new
 923  0000               _GPIO_ReadInputPin:
 925  0000 89            	pushw	x
 926       00000000      OFST:	set	0
 929                     ; 209     return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 931  0001 e601          	ld	a,(1,x)
 932  0003 1405          	and	a,(OFST+5,sp)
 935  0005 85            	popw	x
 936  0006 81            	ret	
1015                     ; 219 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1015                     ; 220 {
1016                     .text:	section	.text,new
1017  0000               _GPIO_ExternalPullUpConfig:
1019  0000 89            	pushw	x
1020       00000000      OFST:	set	0
1023                     ; 222     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1025  0001 7b05          	ld	a,(OFST+5,sp)
1026  0003 2605          	jrne	L05
1027  0005 ae00de        	ldw	x,#222
1028  0008 ad23          	call	LC002
1029  000a               L05:
1030                     ; 223     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1032  000a 7b06          	ld	a,(OFST+6,sp)
1033  000c 2708          	jreq	L06
1034  000e 4a            	dec	a
1035  000f 2705          	jreq	L06
1036  0011 ae00df        	ldw	x,#223
1037  0014 ad17          	call	LC002
1038  0016               L06:
1039                     ; 225     if (NewState != DISABLE) /* External Pull-Up Set*/
1041  0016 7b06          	ld	a,(OFST+6,sp)
1042  0018 2708          	jreq	L374
1043                     ; 227         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1045  001a 1e01          	ldw	x,(OFST+1,sp)
1046  001c e603          	ld	a,(3,x)
1047  001e 1a05          	or	a,(OFST+5,sp)
1049  0020 2007          	jra	L574
1050  0022               L374:
1051                     ; 230         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1053  0022 1e01          	ldw	x,(OFST+1,sp)
1054  0024 7b05          	ld	a,(OFST+5,sp)
1055  0026 43            	cpl	a
1056  0027 e403          	and	a,(3,x)
1057  0029               L574:
1058  0029 e703          	ld	(3,x),a
1059                     ; 232 }
1062  002b 85            	popw	x
1063  002c 81            	ret	
1065  002d               LC002:
1066  002d 89            	pushw	x
1067  002e 5f            	clrw	x
1068  002f 89            	pushw	x
1069  0030 ae0000        	ldw	x,#L771
1070  0033 cd0000        	call	_assert_failed
1072  0036 5b04          	addw	sp,#4
1073  0038 81            	ret	
1085                     	xdef	_GPIO_ExternalPullUpConfig
1086                     	xdef	_GPIO_ReadInputPin
1087                     	xdef	_GPIO_ReadOutputData
1088                     	xdef	_GPIO_ReadInputData
1089                     	xdef	_GPIO_WriteReverse
1090                     	xdef	_GPIO_WriteLow
1091                     	xdef	_GPIO_WriteHigh
1092                     	xdef	_GPIO_Write
1093                     	xdef	_GPIO_Init
1094                     	xdef	_GPIO_DeInit
1095                     	xref	_assert_failed
1096                     .const:	section	.text
1097  0000               L771:
1098  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
1099  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
1100  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
1101  0036 5f6770696f2e  	dc.b	"_gpio.c",0
1121                     	end
