   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 59 void USART_DeInit(void)
  43                     ; 60 {
  45                     	switch	.text
  46  0000               _USART_DeInit:
  50                     ; 63   (void)USART->SR;
  52  0000 c65230        	ld	a,21040
  53                     ; 64   (void)USART->DR;
  55  0003 c65231        	ld	a,21041
  56                     ; 66   USART->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
  58  0006 725f5233      	clr	21043
  59                     ; 67   USART->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
  61  000a 725f5232      	clr	21042
  62                     ; 69   USART->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
  64  000e 725f5234      	clr	21044
  65                     ; 70   USART->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
  67  0012 725f5235      	clr	21045
  68                     ; 71   USART->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
  70  0016 725f5236      	clr	21046
  71                     ; 72   USART->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
  73  001a 725f5237      	clr	21047
  74                     ; 73 }
  77  001e 81            	ret
 250                     ; 100 void USART_Init(uint32_t BaudRate, USART_WordLength_TypeDef USART_WordLength,
 250                     ; 101                 USART_StopBits_TypeDef USART_StopBits, USART_Parity_TypeDef
 250                     ; 102                 USART_Parity, USART_Mode_TypeDef USART_Mode)
 250                     ; 103 {
 251                     	switch	.text
 252  001f               _USART_Init:
 254  001f 5204          	subw	sp,#4
 255       00000004      OFST:	set	4
 258                     ; 104   uint32_t BaudRate_Mantissa = 0;
 260                     ; 107   assert_param(IS_USART_BAUDRATE(BaudRate));
 262                     ; 109   assert_param(IS_USART_WordLength(USART_WordLength));
 264                     ; 111   assert_param(IS_USART_STOPBITS(USART_StopBits));
 266                     ; 113   assert_param(IS_USART_PARITY(USART_Parity));
 268                     ; 115   assert_param(IS_USART_MODE(USART_Mode));
 270                     ; 118   USART->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 272  0021 c65234        	ld	a,21044
 273  0024 a4e9          	and	a,#233
 274  0026 c75234        	ld	21044,a
 275                     ; 121   USART->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 277  0029 7b0b          	ld	a,(OFST+7,sp)
 278  002b 1a0d          	or	a,(OFST+9,sp)
 279  002d ca5234        	or	a,21044
 280  0030 c75234        	ld	21044,a
 281                     ; 124   USART->CR3 &= (uint8_t)(~USART_CR3_STOP);
 283  0033 c65236        	ld	a,21046
 284  0036 a4cf          	and	a,#207
 285  0038 c75236        	ld	21046,a
 286                     ; 126   USART->CR3 |= (uint8_t)USART_StopBits;
 288  003b c65236        	ld	a,21046
 289  003e 1a0c          	or	a,(OFST+8,sp)
 290  0040 c75236        	ld	21046,a
 291                     ; 129   USART->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 293  0043 725f5232      	clr	21042
 294                     ; 131   USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 296  0047 c65233        	ld	a,21043
 297  004a a40f          	and	a,#15
 298  004c c75233        	ld	21043,a
 299                     ; 133   USART->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 301  004f c65233        	ld	a,21043
 302  0052 a4f0          	and	a,#240
 303  0054 c75233        	ld	21043,a
 304                     ; 135   BaudRate_Mantissa  = ((uint32_t)CLK_GetClockFreq() / BaudRate);
 306  0057 cd0000        	call	_CLK_GetClockFreq
 308  005a 96            	ldw	x,sp
 309  005b 1c0007        	addw	x,#OFST+3
 310  005e cd0000        	call	c_ludv
 312  0061 96            	ldw	x,sp
 313  0062 1c0001        	addw	x,#OFST-3
 314  0065 cd0000        	call	c_rtol
 316                     ; 137   USART->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 318  0068 7b03          	ld	a,(OFST-1,sp)
 319  006a a4f0          	and	a,#240
 320  006c c75233        	ld	21043,a
 321                     ; 139   USART->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 323  006f 7b04          	ld	a,(OFST+0,sp)
 324  0071 a40f          	and	a,#15
 325  0073 ca5233        	or	a,21043
 326  0076 c75233        	ld	21043,a
 327                     ; 141   USART->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 329  0079 96            	ldw	x,sp
 330  007a 1c0001        	addw	x,#OFST-3
 331  007d cd0000        	call	c_ltor
 333  0080 a604          	ld	a,#4
 334  0082 cd0000        	call	c_lursh
 336  0085 b603          	ld	a,c_lreg+3
 337  0087 c75232        	ld	21042,a
 338                     ; 144   USART->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 340  008a c65235        	ld	a,21045
 341  008d a4f3          	and	a,#243
 342  008f c75235        	ld	21045,a
 343                     ; 146   USART->CR2 |= (uint8_t)USART_Mode;
 345  0092 c65235        	ld	a,21045
 346  0095 1a0e          	or	a,(OFST+10,sp)
 347  0097 c75235        	ld	21045,a
 348                     ; 147 }
 351  009a 5b04          	addw	sp,#4
 352  009c 81            	ret
 500                     ; 171 void USART_ClockInit(USART_Clock_TypeDef USART_Clock, USART_CPOL_TypeDef USART_CPOL,
 500                     ; 172                      USART_CPHA_TypeDef USART_CPHA, USART_LastBit_TypeDef USART_LastBit)
 500                     ; 173 {
 501                     	switch	.text
 502  009d               _USART_ClockInit:
 504  009d 89            	pushw	x
 505       00000000      OFST:	set	0
 508                     ; 175   assert_param(IS_USART_CLOCK(USART_Clock));
 510                     ; 176   assert_param(IS_USART_CPOL(USART_CPOL));
 512                     ; 177   assert_param(IS_USART_CPHA(USART_CPHA));
 514                     ; 178   assert_param(IS_USART_LASTBIT(USART_LastBit));
 516                     ; 181   USART->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 518  009e c65236        	ld	a,21046
 519  00a1 a4f8          	and	a,#248
 520  00a3 c75236        	ld	21046,a
 521                     ; 183   USART->CR3 |= (uint8_t)((uint8_t)USART_CPOL | (uint8_t)USART_CPHA | (uint8_t)USART_LastBit);
 523  00a6 9f            	ld	a,xl
 524  00a7 1a05          	or	a,(OFST+5,sp)
 525  00a9 1a06          	or	a,(OFST+6,sp)
 526  00ab ca5236        	or	a,21046
 527  00ae c75236        	ld	21046,a
 528                     ; 185   if (USART_Clock != USART_Clock_Disable)
 530  00b1 0d01          	tnz	(OFST+1,sp)
 531  00b3 2706          	jreq	L712
 532                     ; 187     USART->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 534  00b5 72165236      	bset	21046,#3
 536  00b9 2004          	jra	L122
 537  00bb               L712:
 538                     ; 191     USART->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 540  00bb 72175236      	bres	21046,#3
 541  00bf               L122:
 542                     ; 193 }
 545  00bf 85            	popw	x
 546  00c0 81            	ret
 601                     ; 201 void USART_Cmd(FunctionalState NewState)
 601                     ; 202 {
 602                     	switch	.text
 603  00c1               _USART_Cmd:
 607                     ; 203   assert_param(IS_FUNCTIONAL_STATE(NewState));
 609                     ; 205   if (NewState != DISABLE)
 611  00c1 4d            	tnz	a
 612  00c2 2706          	jreq	L152
 613                     ; 207     USART->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 615  00c4 721b5234      	bres	21044,#5
 617  00c8 2004          	jra	L352
 618  00ca               L152:
 619                     ; 211     USART->CR1 |= USART_CR1_USARTD;  /**< USART Disable */
 621  00ca 721a5234      	bset	21044,#5
 622  00ce               L352:
 623                     ; 213 }
 626  00ce 81            	ret
 737                     ; 229 void USART_ITConfig(USART_IT_TypeDef USART_IT, FunctionalState NewState)
 737                     ; 230 {
 738                     	switch	.text
 739  00cf               _USART_ITConfig:
 741  00cf 89            	pushw	x
 742  00d0 89            	pushw	x
 743       00000002      OFST:	set	2
 746                     ; 231   uint8_t uartreg, itpos = 0x00;
 748                     ; 232   assert_param(IS_USART_CONFIG_IT(USART_IT));
 750                     ; 233   assert_param(IS_FUNCTIONAL_STATE(NewState));
 752                     ; 236   uartreg = (uint8_t)((uint16_t)USART_IT >> (uint8_t)0x08);
 754  00d1 9e            	ld	a,xh
 755  00d2 6b01          	ld	(OFST-1,sp),a
 756                     ; 238   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
 758  00d4 9f            	ld	a,xl
 759  00d5 a40f          	and	a,#15
 760  00d7 5f            	clrw	x
 761  00d8 97            	ld	xl,a
 762  00d9 a601          	ld	a,#1
 763  00db 5d            	tnzw	x
 764  00dc 2704          	jreq	L61
 765  00de               L02:
 766  00de 48            	sll	a
 767  00df 5a            	decw	x
 768  00e0 26fc          	jrne	L02
 769  00e2               L61:
 770  00e2 6b02          	ld	(OFST+0,sp),a
 771                     ; 240   if (NewState != DISABLE)
 773  00e4 0d07          	tnz	(OFST+5,sp)
 774  00e6 271a          	jreq	L723
 775                     ; 243     if (uartreg == 0x01)
 777  00e8 7b01          	ld	a,(OFST-1,sp)
 778  00ea a101          	cp	a,#1
 779  00ec 260a          	jrne	L133
 780                     ; 245       USART->CR1 |= itpos;
 782  00ee c65234        	ld	a,21044
 783  00f1 1a02          	or	a,(OFST+0,sp)
 784  00f3 c75234        	ld	21044,a
 786  00f6 2024          	jra	L533
 787  00f8               L133:
 788                     ; 250       USART->CR2 |= itpos;
 790  00f8 c65235        	ld	a,21045
 791  00fb 1a02          	or	a,(OFST+0,sp)
 792  00fd c75235        	ld	21045,a
 793  0100 201a          	jra	L533
 794  0102               L723:
 795                     ; 256     if (uartreg == 0x01)
 797  0102 7b01          	ld	a,(OFST-1,sp)
 798  0104 a101          	cp	a,#1
 799  0106 260b          	jrne	L733
 800                     ; 258       USART->CR1 &= (uint8_t)(~itpos);
 802  0108 7b02          	ld	a,(OFST+0,sp)
 803  010a 43            	cpl	a
 804  010b c45234        	and	a,21044
 805  010e c75234        	ld	21044,a
 807  0111 2009          	jra	L533
 808  0113               L733:
 809                     ; 263       USART->CR2 &= (uint8_t)(~itpos);
 811  0113 7b02          	ld	a,(OFST+0,sp)
 812  0115 43            	cpl	a
 813  0116 c45235        	and	a,21045
 814  0119 c75235        	ld	21045,a
 815  011c               L533:
 816                     ; 267 }
 819  011c 5b04          	addw	sp,#4
 820  011e 81            	ret
 843                     ; 275 uint8_t USART_ReceiveData8(void)
 843                     ; 276 {
 844                     	switch	.text
 845  011f               _USART_ReceiveData8:
 849                     ; 277   return USART->DR;
 851  011f c65231        	ld	a,21041
 854  0122 81            	ret
 888                     ; 287 uint16_t USART_ReceiveData9(void)
 888                     ; 288 {
 889                     	switch	.text
 890  0123               _USART_ReceiveData9:
 892  0123 89            	pushw	x
 893       00000002      OFST:	set	2
 896                     ; 289   uint16_t temp = 0;
 898                     ; 291   temp = ((uint16_t)(((uint16_t)((uint16_t)USART->CR1 & (uint16_t)USART_CR1_R8)) << 1));
 900  0124 c65234        	ld	a,21044
 901  0127 5f            	clrw	x
 902  0128 a480          	and	a,#128
 903  012a 5f            	clrw	x
 904  012b 02            	rlwa	x,a
 905  012c 58            	sllw	x
 906  012d 1f01          	ldw	(OFST-1,sp),x
 907                     ; 292   return (uint16_t)( ((uint16_t)((uint16_t)USART->DR) | temp) & ((uint16_t)0x01FF));
 909  012f c65231        	ld	a,21041
 910  0132 5f            	clrw	x
 911  0133 97            	ld	xl,a
 912  0134 01            	rrwa	x,a
 913  0135 1a02          	or	a,(OFST+0,sp)
 914  0137 01            	rrwa	x,a
 915  0138 1a01          	or	a,(OFST-1,sp)
 916  013a 01            	rrwa	x,a
 917  013b 01            	rrwa	x,a
 918  013c a4ff          	and	a,#255
 919  013e 01            	rrwa	x,a
 920  013f a401          	and	a,#1
 921  0141 01            	rrwa	x,a
 924  0142 5b02          	addw	sp,#2
 925  0144 81            	ret
 961                     ; 301 void USART_ReceiverWakeUpCmd(FunctionalState NewState)
 961                     ; 302 {
 962                     	switch	.text
 963  0145               _USART_ReceiverWakeUpCmd:
 967                     ; 303   assert_param(IS_FUNCTIONAL_STATE(NewState));
 969                     ; 305   if (NewState != DISABLE)
 971  0145 4d            	tnz	a
 972  0146 2706          	jreq	L704
 973                     ; 308     USART->CR2 |= USART_CR2_RWU;
 975  0148 72125235      	bset	21045,#1
 977  014c 2004          	jra	L114
 978  014e               L704:
 979                     ; 313     USART->CR2 &= ((uint8_t)~USART_CR2_RWU);
 981  014e 72135235      	bres	21045,#1
 982  0152               L114:
 983                     ; 315 }
 986  0152 81            	ret
1009                     ; 322 void USART_SendBreak(void)
1009                     ; 323 {
1010                     	switch	.text
1011  0153               _USART_SendBreak:
1015                     ; 324   USART->CR2 |= USART_CR2_SBK;
1017  0153 72105235      	bset	21045,#0
1018                     ; 325 }
1021  0157 81            	ret
1055                     ; 332 void USART_SendData8(uint8_t Data)
1055                     ; 333 {
1056                     	switch	.text
1057  0158               _USART_SendData8:
1061                     ; 335   USART->DR = Data;
1063  0158 c75231        	ld	21041,a
1064                     ; 336 }
1067  015b 81            	ret
1101                     ; 344 void USART_SendData9(uint16_t Data)
1101                     ; 345 {
1102                     	switch	.text
1103  015c               _USART_SendData9:
1105  015c 89            	pushw	x
1106       00000000      OFST:	set	0
1109                     ; 346   assert_param(IS_USART_DATA_9BITS(Data));
1111                     ; 348   USART->CR1 &= ((uint8_t)~USART_CR1_T8);                    /* Clear the transmit data bit 8     */
1113  015d 721d5234      	bres	21044,#6
1114                     ; 349   USART->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8); /* Write the transmit data bit [8]   */
1116  0161 54            	srlw	x
1117  0162 54            	srlw	x
1118  0163 9f            	ld	a,xl
1119  0164 a440          	and	a,#64
1120  0166 ca5234        	or	a,21044
1121  0169 c75234        	ld	21044,a
1122                     ; 350   USART->DR   = (uint8_t)(Data);                             /* Write the transmit data bit [0:7] */
1124  016c 7b02          	ld	a,(OFST+2,sp)
1125  016e c75231        	ld	21041,a
1126                     ; 352 }
1129  0171 85            	popw	x
1130  0172 81            	ret
1164                     ; 360 void USART_SetAddress(uint8_t Address)
1164                     ; 361 {
1165                     	switch	.text
1166  0173               _USART_SetAddress:
1168  0173 88            	push	a
1169       00000000      OFST:	set	0
1172                     ; 363   assert_param(IS_USART_ADDRESS(Address));
1174                     ; 366   USART->CR4 &= ((uint8_t)~USART_CR4_ADD);
1176  0174 c65237        	ld	a,21047
1177  0177 a4f0          	and	a,#240
1178  0179 c75237        	ld	21047,a
1179                     ; 368   USART->CR4 |= Address;
1181  017c c65237        	ld	a,21047
1182  017f 1a01          	or	a,(OFST+1,sp)
1183  0181 c75237        	ld	21047,a
1184                     ; 369 }
1187  0184 84            	pop	a
1188  0185 81            	ret
1245                     ; 379 void USART_WakeUpConfig(USART_WakeUp_TypeDef USART_WakeUp)
1245                     ; 380 {
1246                     	switch	.text
1247  0186               _USART_WakeUpConfig:
1251                     ; 381   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1253                     ; 383   USART->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1255  0186 72175234      	bres	21044,#3
1256                     ; 384   USART->CR1 |= (uint8_t)USART_WakeUp;
1258  018a ca5234        	or	a,21044
1259  018d c75234        	ld	21044,a
1260                     ; 385 }
1263  0190 81            	ret
1399                     ; 400 FlagStatus USART_GetFlagStatus(USART_FLAG_TypeDef USART_FLAG)
1399                     ; 401 {
1400                     	switch	.text
1401  0191               _USART_GetFlagStatus:
1403  0191 89            	pushw	x
1404  0192 88            	push	a
1405       00000001      OFST:	set	1
1408                     ; 402   FlagStatus status = RESET;
1410                     ; 405   assert_param(IS_USART_FLAG(USART_FLAG));
1412                     ; 407   if (USART_FLAG == USART_FLAG_SBK)
1414  0193 a30101        	cpw	x,#257
1415  0196 2610          	jrne	L306
1416                     ; 409     if ((USART->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1418  0198 9f            	ld	a,xl
1419  0199 c45235        	and	a,21045
1420  019c 2706          	jreq	L506
1421                     ; 412       status = SET;
1423  019e a601          	ld	a,#1
1424  01a0 6b01          	ld	(OFST+0,sp),a
1426  01a2 2013          	jra	L116
1427  01a4               L506:
1428                     ; 417       status = RESET;
1430  01a4 0f01          	clr	(OFST+0,sp)
1431  01a6 200f          	jra	L116
1432  01a8               L306:
1433                     ; 422     if ((USART->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
1435  01a8 c65230        	ld	a,21040
1436  01ab 1503          	bcp	a,(OFST+2,sp)
1437  01ad 2706          	jreq	L316
1438                     ; 425       status = SET;
1440  01af a601          	ld	a,#1
1441  01b1 6b01          	ld	(OFST+0,sp),a
1443  01b3 2002          	jra	L116
1444  01b5               L316:
1445                     ; 430       status = RESET;
1447  01b5 0f01          	clr	(OFST+0,sp)
1448  01b7               L116:
1449                     ; 434   return status;
1451  01b7 7b01          	ld	a,(OFST+0,sp)
1454  01b9 5b03          	addw	sp,#3
1455  01bb 81            	ret
1478                     ; 454 void USART_ClearFlag(void)
1478                     ; 455 {
1479                     	switch	.text
1480  01bc               _USART_ClearFlag:
1484                     ; 457   USART->SR = (uint8_t)~(USART_SR_RXNE);
1486  01bc 35df5230      	mov	21040,#223
1487                     ; 458 }
1490  01c0 81            	ret
1572                     ; 472 ITStatus USART_GetITStatus(USART_IT_TypeDef USART_IT)
1572                     ; 473 {
1573                     	switch	.text
1574  01c1               _USART_GetITStatus:
1576  01c1 89            	pushw	x
1577  01c2 89            	pushw	x
1578       00000002      OFST:	set	2
1581                     ; 474   ITStatus pendingbitstatus = RESET;
1583                     ; 475   uint8_t itpos = 0;
1585                     ; 476   uint8_t itmask1 = 0;
1587                     ; 477   uint8_t itmask2 = 0;
1589                     ; 478   uint8_t enablestatus = 0;
1591                     ; 481   assert_param(IS_USART_GET_IT(USART_IT));
1593                     ; 484   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
1595  01c3 9f            	ld	a,xl
1596  01c4 a40f          	and	a,#15
1597  01c6 5f            	clrw	x
1598  01c7 97            	ld	xl,a
1599  01c8 a601          	ld	a,#1
1600  01ca 5d            	tnzw	x
1601  01cb 2704          	jreq	L05
1602  01cd               L25:
1603  01cd 48            	sll	a
1604  01ce 5a            	decw	x
1605  01cf 26fc          	jrne	L25
1606  01d1               L05:
1607  01d1 6b01          	ld	(OFST-1,sp),a
1608                     ; 486   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
1610  01d3 7b04          	ld	a,(OFST+2,sp)
1611  01d5 4e            	swap	a
1612  01d6 a40f          	and	a,#15
1613  01d8 6b02          	ld	(OFST+0,sp),a
1614                     ; 488   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1616  01da 7b02          	ld	a,(OFST+0,sp)
1617  01dc 5f            	clrw	x
1618  01dd 97            	ld	xl,a
1619  01de a601          	ld	a,#1
1620  01e0 5d            	tnzw	x
1621  01e1 2704          	jreq	L45
1622  01e3               L65:
1623  01e3 48            	sll	a
1624  01e4 5a            	decw	x
1625  01e5 26fc          	jrne	L65
1626  01e7               L45:
1627  01e7 6b02          	ld	(OFST+0,sp),a
1628                     ; 492   if (USART_IT == USART_IT_PE)
1630  01e9 1e03          	ldw	x,(OFST+1,sp)
1631  01eb a30100        	cpw	x,#256
1632  01ee 261c          	jrne	L176
1633                     ; 495     enablestatus = (uint8_t)((uint8_t)USART->CR1 & itmask2);
1635  01f0 c65234        	ld	a,21044
1636  01f3 1402          	and	a,(OFST+0,sp)
1637  01f5 6b02          	ld	(OFST+0,sp),a
1638                     ; 498     if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1640  01f7 c65230        	ld	a,21040
1641  01fa 1501          	bcp	a,(OFST-1,sp)
1642  01fc 270a          	jreq	L376
1644  01fe 0d02          	tnz	(OFST+0,sp)
1645  0200 2706          	jreq	L376
1646                     ; 501       pendingbitstatus = SET;
1648  0202 a601          	ld	a,#1
1649  0204 6b02          	ld	(OFST+0,sp),a
1651  0206 201e          	jra	L776
1652  0208               L376:
1653                     ; 506       pendingbitstatus = RESET;
1655  0208 0f02          	clr	(OFST+0,sp)
1656  020a 201a          	jra	L776
1657  020c               L176:
1658                     ; 512     enablestatus = (uint8_t)((uint8_t)USART->CR2 & itmask2);
1660  020c c65235        	ld	a,21045
1661  020f 1402          	and	a,(OFST+0,sp)
1662  0211 6b02          	ld	(OFST+0,sp),a
1663                     ; 514     if (((USART->SR & itpos) != (uint8_t)0x00) && enablestatus)
1665  0213 c65230        	ld	a,21040
1666  0216 1501          	bcp	a,(OFST-1,sp)
1667  0218 270a          	jreq	L107
1669  021a 0d02          	tnz	(OFST+0,sp)
1670  021c 2706          	jreq	L107
1671                     ; 517       pendingbitstatus = SET;
1673  021e a601          	ld	a,#1
1674  0220 6b02          	ld	(OFST+0,sp),a
1676  0222 2002          	jra	L776
1677  0224               L107:
1678                     ; 522       pendingbitstatus = RESET;
1680  0224 0f02          	clr	(OFST+0,sp)
1681  0226               L776:
1682                     ; 527   return  pendingbitstatus;
1684  0226 7b02          	ld	a,(OFST+0,sp)
1687  0228 5b04          	addw	sp,#4
1688  022a 81            	ret
1712                     ; 546 void USART_ClearITPendingBit(void)
1712                     ; 547 {
1713                     	switch	.text
1714  022b               _USART_ClearITPendingBit:
1718                     ; 549   USART->SR = (uint8_t)~(USART_SR_RXNE);
1720  022b 35df5230      	mov	21040,#223
1721                     ; 550 }
1724  022f 81            	ret
1737                     	xdef	_USART_ClearITPendingBit
1738                     	xdef	_USART_GetITStatus
1739                     	xdef	_USART_ClearFlag
1740                     	xdef	_USART_GetFlagStatus
1741                     	xdef	_USART_WakeUpConfig
1742                     	xdef	_USART_SetAddress
1743                     	xdef	_USART_SendData9
1744                     	xdef	_USART_SendData8
1745                     	xdef	_USART_SendBreak
1746                     	xdef	_USART_ReceiverWakeUpCmd
1747                     	xdef	_USART_ReceiveData9
1748                     	xdef	_USART_ReceiveData8
1749                     	xdef	_USART_ITConfig
1750                     	xdef	_USART_Cmd
1751                     	xdef	_USART_ClockInit
1752                     	xdef	_USART_Init
1753                     	xdef	_USART_DeInit
1754                     	xref	_CLK_GetClockFreq
1755                     	xref.b	c_lreg
1756                     	xref.b	c_x
1775                     	xref	c_lursh
1776                     	xref	c_ltor
1777                     	xref	c_rtol
1778                     	xref	c_ludv
1779                     	end
