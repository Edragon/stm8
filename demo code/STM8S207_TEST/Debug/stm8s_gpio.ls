   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 109                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 109                     ; 54 {
 111                     	switch	.text
 112  0000               _GPIO_DeInit:
 116                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 118  0000 7f            	clr	(x)
 119                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 121  0001 6f02          	clr	(2,x)
 122                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 124  0003 6f03          	clr	(3,x)
 125                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 127  0005 6f04          	clr	(4,x)
 128                     ; 59 }
 131  0007 81            	ret
 371                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 371                     ; 72 {
 372                     	switch	.text
 373  0008               _GPIO_Init:
 375  0008 89            	pushw	x
 376       00000000      OFST:	set	0
 379                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 381                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 383                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 385  0009 7b05          	ld	a,(OFST+5,sp)
 386  000b 43            	cpl	a
 387  000c e404          	and	a,(4,x)
 388  000e e704          	ld	(4,x),a
 389                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 391  0010 7b06          	ld	a,(OFST+6,sp)
 392  0012 a580          	bcp	a,#128
 393  0014 271d          	jreq	L771
 394                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 396  0016 7b06          	ld	a,(OFST+6,sp)
 397  0018 a510          	bcp	a,#16
 398  001a 2706          	jreq	L102
 399                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
 401  001c f6            	ld	a,(x)
 402  001d 1a05          	or	a,(OFST+5,sp)
 403  001f f7            	ld	(x),a
 405  0020 2007          	jra	L302
 406  0022               L102:
 407                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 409  0022 1e01          	ldw	x,(OFST+1,sp)
 410  0024 7b05          	ld	a,(OFST+5,sp)
 411  0026 43            	cpl	a
 412  0027 f4            	and	a,(x)
 413  0028 f7            	ld	(x),a
 414  0029               L302:
 415                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
 417  0029 1e01          	ldw	x,(OFST+1,sp)
 418  002b e602          	ld	a,(2,x)
 419  002d 1a05          	or	a,(OFST+5,sp)
 420  002f e702          	ld	(2,x),a
 422  0031 2009          	jra	L502
 423  0033               L771:
 424                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 426  0033 1e01          	ldw	x,(OFST+1,sp)
 427  0035 7b05          	ld	a,(OFST+5,sp)
 428  0037 43            	cpl	a
 429  0038 e402          	and	a,(2,x)
 430  003a e702          	ld	(2,x),a
 431  003c               L502:
 432                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 434  003c 7b06          	ld	a,(OFST+6,sp)
 435  003e a540          	bcp	a,#64
 436  0040 270a          	jreq	L702
 437                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 439  0042 1e01          	ldw	x,(OFST+1,sp)
 440  0044 e603          	ld	a,(3,x)
 441  0046 1a05          	or	a,(OFST+5,sp)
 442  0048 e703          	ld	(3,x),a
 444  004a 2009          	jra	L112
 445  004c               L702:
 446                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 448  004c 1e01          	ldw	x,(OFST+1,sp)
 449  004e 7b05          	ld	a,(OFST+5,sp)
 450  0050 43            	cpl	a
 451  0051 e403          	and	a,(3,x)
 452  0053 e703          	ld	(3,x),a
 453  0055               L112:
 454                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 456  0055 7b06          	ld	a,(OFST+6,sp)
 457  0057 a520          	bcp	a,#32
 458  0059 270a          	jreq	L312
 459                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 461  005b 1e01          	ldw	x,(OFST+1,sp)
 462  005d e604          	ld	a,(4,x)
 463  005f 1a05          	or	a,(OFST+5,sp)
 464  0061 e704          	ld	(4,x),a
 466  0063 2009          	jra	L512
 467  0065               L312:
 468                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 470  0065 1e01          	ldw	x,(OFST+1,sp)
 471  0067 7b05          	ld	a,(OFST+5,sp)
 472  0069 43            	cpl	a
 473  006a e404          	and	a,(4,x)
 474  006c e704          	ld	(4,x),a
 475  006e               L512:
 476                     ; 131 }
 479  006e 85            	popw	x
 480  006f 81            	ret
 526                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 526                     ; 142 {
 527                     	switch	.text
 528  0070               _GPIO_Write:
 530  0070 89            	pushw	x
 531       00000000      OFST:	set	0
 534                     ; 143   GPIOx->ODR = PortVal;
 536  0071 7b05          	ld	a,(OFST+5,sp)
 537  0073 1e01          	ldw	x,(OFST+1,sp)
 538  0075 f7            	ld	(x),a
 539                     ; 144 }
 542  0076 85            	popw	x
 543  0077 81            	ret
 590                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 590                     ; 155 {
 591                     	switch	.text
 592  0078               _GPIO_WriteHigh:
 594  0078 89            	pushw	x
 595       00000000      OFST:	set	0
 598                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 600  0079 f6            	ld	a,(x)
 601  007a 1a05          	or	a,(OFST+5,sp)
 602  007c f7            	ld	(x),a
 603                     ; 157 }
 606  007d 85            	popw	x
 607  007e 81            	ret
 654                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 654                     ; 168 {
 655                     	switch	.text
 656  007f               _GPIO_WriteLow:
 658  007f 89            	pushw	x
 659       00000000      OFST:	set	0
 662                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 664  0080 7b05          	ld	a,(OFST+5,sp)
 665  0082 43            	cpl	a
 666  0083 f4            	and	a,(x)
 667  0084 f7            	ld	(x),a
 668                     ; 170 }
 671  0085 85            	popw	x
 672  0086 81            	ret
 719                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 719                     ; 181 {
 720                     	switch	.text
 721  0087               _GPIO_WriteReverse:
 723  0087 89            	pushw	x
 724       00000000      OFST:	set	0
 727                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 729  0088 f6            	ld	a,(x)
 730  0089 1805          	xor	a,	(OFST+5,sp)
 731  008b f7            	ld	(x),a
 732                     ; 183 }
 735  008c 85            	popw	x
 736  008d 81            	ret
 774                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 774                     ; 192 {
 775                     	switch	.text
 776  008e               _GPIO_ReadOutputData:
 780                     ; 193   return ((uint8_t)GPIOx->ODR);
 782  008e f6            	ld	a,(x)
 785  008f 81            	ret
 822                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 822                     ; 203 {
 823                     	switch	.text
 824  0090               _GPIO_ReadInputData:
 828                     ; 204   return ((uint8_t)GPIOx->IDR);
 830  0090 e601          	ld	a,(1,x)
 833  0092 81            	ret
 901                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 901                     ; 214 {
 902                     	switch	.text
 903  0093               _GPIO_ReadInputPin:
 905  0093 89            	pushw	x
 906       00000000      OFST:	set	0
 909                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 911  0094 e601          	ld	a,(1,x)
 912  0096 1405          	and	a,(OFST+5,sp)
 915  0098 85            	popw	x
 916  0099 81            	ret
 994                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 994                     ; 226 {
 995                     	switch	.text
 996  009a               _GPIO_ExternalPullUpConfig:
 998  009a 89            	pushw	x
 999       00000000      OFST:	set	0
1002                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1004                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1006                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
1008  009b 0d06          	tnz	(OFST+6,sp)
1009  009d 2708          	jreq	L374
1010                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1012  009f e603          	ld	a,(3,x)
1013  00a1 1a05          	or	a,(OFST+5,sp)
1014  00a3 e703          	ld	(3,x),a
1016  00a5 2009          	jra	L574
1017  00a7               L374:
1018                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1020  00a7 1e01          	ldw	x,(OFST+1,sp)
1021  00a9 7b05          	ld	a,(OFST+5,sp)
1022  00ab 43            	cpl	a
1023  00ac e403          	and	a,(3,x)
1024  00ae e703          	ld	(3,x),a
1025  00b0               L574:
1026                     ; 238 }
1029  00b0 85            	popw	x
1030  00b1 81            	ret
1043                     	xdef	_GPIO_ExternalPullUpConfig
1044                     	xdef	_GPIO_ReadInputPin
1045                     	xdef	_GPIO_ReadOutputData
1046                     	xdef	_GPIO_ReadInputData
1047                     	xdef	_GPIO_WriteReverse
1048                     	xdef	_GPIO_WriteLow
1049                     	xdef	_GPIO_WriteHigh
1050                     	xdef	_GPIO_Write
1051                     	xdef	_GPIO_Init
1052                     	xdef	_GPIO_DeInit
1071                     	end
