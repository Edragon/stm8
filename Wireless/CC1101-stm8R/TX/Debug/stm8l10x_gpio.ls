   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 109                     ; 57 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 109                     ; 58 {
 111                     	switch	.text
 112  0000               _GPIO_DeInit:
 116                     ; 59   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 118  0000 7f            	clr	(x)
 119                     ; 60   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 121  0001 6f02          	clr	(2,x)
 122                     ; 61   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 124  0003 6f03          	clr	(3,x)
 125                     ; 62   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 127  0005 6f04          	clr	(4,x)
 128                     ; 63 }
 131  0007 81            	ret
 287                     ; 98 void GPIO_Init(GPIO_TypeDef* GPIOx,
 287                     ; 99                uint8_t GPIO_Pin,
 287                     ; 100                GPIO_Mode_TypeDef GPIO_Mode)
 287                     ; 101 {
 288                     	switch	.text
 289  0008               _GPIO_Init:
 291  0008 89            	pushw	x
 292       00000000      OFST:	set	0
 295                     ; 106   assert_param(IS_GPIO_MODE(GPIO_Mode));
 297                     ; 107   assert_param(IS_GPIO_PIN(GPIO_Pin));
 299                     ; 113   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 301  0009 7b06          	ld	a,(OFST+6,sp)
 302  000b a580          	bcp	a,#128
 303  000d 271d          	jreq	L541
 304                     ; 115     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 306  000f 7b06          	ld	a,(OFST+6,sp)
 307  0011 a510          	bcp	a,#16
 308  0013 2706          	jreq	L741
 309                     ; 117       GPIOx->ODR |= GPIO_Pin;
 311  0015 f6            	ld	a,(x)
 312  0016 1a05          	or	a,(OFST+5,sp)
 313  0018 f7            	ld	(x),a
 315  0019 2007          	jra	L151
 316  001b               L741:
 317                     ; 120       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 319  001b 1e01          	ldw	x,(OFST+1,sp)
 320  001d 7b05          	ld	a,(OFST+5,sp)
 321  001f 43            	cpl	a
 322  0020 f4            	and	a,(x)
 323  0021 f7            	ld	(x),a
 324  0022               L151:
 325                     ; 123     GPIOx->DDR |= GPIO_Pin;
 327  0022 1e01          	ldw	x,(OFST+1,sp)
 328  0024 e602          	ld	a,(2,x)
 329  0026 1a05          	or	a,(OFST+5,sp)
 330  0028 e702          	ld	(2,x),a
 332  002a 2009          	jra	L351
 333  002c               L541:
 334                     ; 127     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 336  002c 1e01          	ldw	x,(OFST+1,sp)
 337  002e 7b05          	ld	a,(OFST+5,sp)
 338  0030 43            	cpl	a
 339  0031 e402          	and	a,(2,x)
 340  0033 e702          	ld	(2,x),a
 341  0035               L351:
 342                     ; 134   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 344  0035 7b06          	ld	a,(OFST+6,sp)
 345  0037 a540          	bcp	a,#64
 346  0039 270a          	jreq	L551
 347                     ; 136     GPIOx->CR1 |= GPIO_Pin;
 349  003b 1e01          	ldw	x,(OFST+1,sp)
 350  003d e603          	ld	a,(3,x)
 351  003f 1a05          	or	a,(OFST+5,sp)
 352  0041 e703          	ld	(3,x),a
 354  0043 2009          	jra	L751
 355  0045               L551:
 356                     ; 139     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 358  0045 1e01          	ldw	x,(OFST+1,sp)
 359  0047 7b05          	ld	a,(OFST+5,sp)
 360  0049 43            	cpl	a
 361  004a e403          	and	a,(3,x)
 362  004c e703          	ld	(3,x),a
 363  004e               L751:
 364                     ; 146   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 366  004e 7b06          	ld	a,(OFST+6,sp)
 367  0050 a520          	bcp	a,#32
 368  0052 270a          	jreq	L161
 369                     ; 148     GPIOx->CR2 |= GPIO_Pin;
 371  0054 1e01          	ldw	x,(OFST+1,sp)
 372  0056 e604          	ld	a,(4,x)
 373  0058 1a05          	or	a,(OFST+5,sp)
 374  005a e704          	ld	(4,x),a
 376  005c 2009          	jra	L361
 377  005e               L161:
 378                     ; 151     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 380  005e 1e01          	ldw	x,(OFST+1,sp)
 381  0060 7b05          	ld	a,(OFST+5,sp)
 382  0062 43            	cpl	a
 383  0063 e404          	and	a,(4,x)
 384  0065 e704          	ld	(4,x),a
 385  0067               L361:
 386                     ; 154 }
 389  0067 85            	popw	x
 390  0068 81            	ret
 436                     ; 163 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 436                     ; 164 {
 437                     	switch	.text
 438  0069               _GPIO_Write:
 440  0069 89            	pushw	x
 441       00000000      OFST:	set	0
 444                     ; 165   GPIOx->ODR = GPIO_PortVal;
 446  006a 7b05          	ld	a,(OFST+5,sp)
 447  006c 1e01          	ldw	x,(OFST+1,sp)
 448  006e f7            	ld	(x),a
 449                     ; 166 }
 452  006f 85            	popw	x
 453  0070 81            	ret
 613                     ; 185 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 613                     ; 186 {
 614                     	switch	.text
 615  0071               _GPIO_WriteBit:
 617  0071 89            	pushw	x
 618       00000000      OFST:	set	0
 621                     ; 188   assert_param(IS_GPIO_PIN(GPIO_Pin));
 623                     ; 189   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 625                     ; 191   if (GPIO_BitVal != RESET)
 627  0072 0d06          	tnz	(OFST+6,sp)
 628  0074 2715          	jreq	L303
 629                     ; 193     SetBit(GPIOx->ODR, GPIO_Pin);
 631  0076 7b05          	ld	a,(OFST+5,sp)
 632  0078 905f          	clrw	y
 633  007a 9097          	ld	yl,a
 634  007c a601          	ld	a,#1
 635  007e 905d          	tnzw	y
 636  0080 2705          	jreq	L41
 637  0082               L61:
 638  0082 48            	sll	a
 639  0083 905a          	decw	y
 640  0085 26fb          	jrne	L61
 641  0087               L41:
 642  0087 fa            	or	a,(x)
 643  0088 f7            	ld	(x),a
 645  0089 2017          	jra	L503
 646  008b               L303:
 647                     ; 198     ClrBit(GPIOx->ODR, GPIO_Pin);
 649  008b 1e01          	ldw	x,(OFST+1,sp)
 650  008d 7b05          	ld	a,(OFST+5,sp)
 651  008f 905f          	clrw	y
 652  0091 9097          	ld	yl,a
 653  0093 a601          	ld	a,#1
 654  0095 905d          	tnzw	y
 655  0097 2705          	jreq	L02
 656  0099               L22:
 657  0099 48            	sll	a
 658  009a 905a          	decw	y
 659  009c 26fb          	jrne	L22
 660  009e               L02:
 661  009e a8ff          	xor	a,#255
 662  00a0 f4            	and	a,(x)
 663  00a1 f7            	ld	(x),a
 664  00a2               L503:
 665                     ; 200 }
 668  00a2 85            	popw	x
 669  00a3 81            	ret
 715                     ; 218 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 715                     ; 219 {
 716                     	switch	.text
 717  00a4               _GPIO_SetBits:
 719  00a4 89            	pushw	x
 720       00000000      OFST:	set	0
 723                     ; 220   GPIOx->ODR |= GPIO_Pin;
 725  00a5 f6            	ld	a,(x)
 726  00a6 1a05          	or	a,(OFST+5,sp)
 727  00a8 f7            	ld	(x),a
 728                     ; 221 }
 731  00a9 85            	popw	x
 732  00aa 81            	ret
 778                     ; 239 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 778                     ; 240 {
 779                     	switch	.text
 780  00ab               _GPIO_ResetBits:
 782  00ab 89            	pushw	x
 783       00000000      OFST:	set	0
 786                     ; 241   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 788  00ac 7b05          	ld	a,(OFST+5,sp)
 789  00ae 43            	cpl	a
 790  00af f4            	and	a,(x)
 791  00b0 f7            	ld	(x),a
 792                     ; 242 }
 795  00b1 85            	popw	x
 796  00b2 81            	ret
 842                     ; 251 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 842                     ; 252 {
 843                     	switch	.text
 844  00b3               _GPIO_ToggleBits:
 846  00b3 89            	pushw	x
 847       00000000      OFST:	set	0
 850                     ; 253   GPIOx->ODR ^= GPIO_Pin;
 852  00b4 f6            	ld	a,(x)
 853  00b5 1805          	xor	a,	(OFST+5,sp)
 854  00b7 f7            	ld	(x),a
 855                     ; 254 }
 858  00b8 85            	popw	x
 859  00b9 81            	ret
 896                     ; 262 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 896                     ; 263 {
 897                     	switch	.text
 898  00ba               _GPIO_ReadInputData:
 902                     ; 264   return ((uint8_t)GPIOx->IDR);
 904  00ba e601          	ld	a,(1,x)
 907  00bc 81            	ret
 945                     ; 273 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 945                     ; 274 {
 946                     	switch	.text
 947  00bd               _GPIO_ReadOutputData:
 951                     ; 275   return ((uint8_t)GPIOx->ODR);
 953  00bd f6            	ld	a,(x)
 956  00be 81            	ret
1005                     ; 294 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1005                     ; 295 {
1006                     	switch	.text
1007  00bf               _GPIO_ReadInputDataBit:
1009  00bf 89            	pushw	x
1010       00000000      OFST:	set	0
1013                     ; 296   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1015  00c0 e601          	ld	a,(1,x)
1016  00c2 1405          	and	a,(OFST+5,sp)
1019  00c4 85            	popw	x
1020  00c5 81            	ret
1069                     ; 315 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1069                     ; 316 {
1070                     	switch	.text
1071  00c6               _GPIO_ReadOutputDataBit:
1073  00c6 89            	pushw	x
1074       00000000      OFST:	set	0
1077                     ; 317   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1079  00c7 f6            	ld	a,(x)
1080  00c8 1405          	and	a,(OFST+5,sp)
1083  00ca 85            	popw	x
1084  00cb 81            	ret
1161                     ; 337 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
1161                     ; 338 {
1162                     	switch	.text
1163  00cc               _GPIO_ExternalPullUpConfig:
1165  00cc 89            	pushw	x
1166       00000000      OFST:	set	0
1169                     ; 340   assert_param(IS_GPIO_PIN(GPIO_Pin));
1171                     ; 341   assert_param(IS_FUNCTIONAL_STATE(NewState));
1173                     ; 343   if (NewState != DISABLE) /* External Pull-Up Set*/
1175  00cd 0d06          	tnz	(OFST+6,sp)
1176  00cf 2708          	jreq	L355
1177                     ; 345     GPIOx->CR1 |= GPIO_Pin;
1179  00d1 e603          	ld	a,(3,x)
1180  00d3 1a05          	or	a,(OFST+5,sp)
1181  00d5 e703          	ld	(3,x),a
1183  00d7 2009          	jra	L555
1184  00d9               L355:
1185                     ; 348     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1187  00d9 1e01          	ldw	x,(OFST+1,sp)
1188  00db 7b05          	ld	a,(OFST+5,sp)
1189  00dd 43            	cpl	a
1190  00de e403          	and	a,(3,x)
1191  00e0 e703          	ld	(3,x),a
1192  00e2               L555:
1193                     ; 350 }
1196  00e2 85            	popw	x
1197  00e3 81            	ret
1210                     	xdef	_GPIO_ExternalPullUpConfig
1211                     	xdef	_GPIO_ReadOutputDataBit
1212                     	xdef	_GPIO_ReadInputDataBit
1213                     	xdef	_GPIO_ReadOutputData
1214                     	xdef	_GPIO_ReadInputData
1215                     	xdef	_GPIO_ToggleBits
1216                     	xdef	_GPIO_ResetBits
1217                     	xdef	_GPIO_SetBits
1218                     	xdef	_GPIO_WriteBit
1219                     	xdef	_GPIO_Write
1220                     	xdef	_GPIO_Init
1221                     	xdef	_GPIO_DeInit
1240                     	end
