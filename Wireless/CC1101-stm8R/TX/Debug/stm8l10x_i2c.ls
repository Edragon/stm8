   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 122 void I2C_DeInit(void)
  43                     ; 123 {
  45                     	switch	.text
  46  0000               _I2C_DeInit:
  50                     ; 124   I2C->CR1 = I2C_CR1_RESET_VALUE;
  52  0000 725f5210      	clr	21008
  53                     ; 125   I2C->CR2 = I2C_CR2_RESET_VALUE;
  55  0004 725f5211      	clr	21009
  56                     ; 126   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  58  0008 725f5212      	clr	21010
  59                     ; 127   I2C->OARL = I2C_OARL_RESET_VALUE;
  61  000c 725f5213      	clr	21011
  62                     ; 128   I2C->OARH = I2C_OARH_RESET_VALUE;
  64  0010 725f5214      	clr	21012
  65                     ; 129   I2C->ITR = I2C_ITR_RESET_VALUE;
  67  0014 725f521a      	clr	21018
  68                     ; 130   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  70  0018 725f521b      	clr	21019
  71                     ; 131   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  73  001c 725f521c      	clr	21020
  74                     ; 132   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  76  0020 3502521d      	mov	21021,#2
  77                     ; 133 }
  80  0024 81            	ret
 254                     .const:	section	.text
 255  0000               L01:
 256  0000 000f4240      	dc.l	1000000
 257  0004               L21:
 258  0004 000186a1      	dc.l	100001
 259  0008               L41:
 260  0008 00000004      	dc.l	4
 261                     ; 157 void I2C_Init(uint32_t OutputClockFrequency, uint16_t OwnAddress,
 261                     ; 158               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef I2C_Ack,
 261                     ; 159               I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 261                     ; 160 {
 262                     	switch	.text
 263  0025               _I2C_Init:
 265  0025 520c          	subw	sp,#12
 266       0000000c      OFST:	set	12
 269                     ; 161   uint32_t result = 0x0004;
 271                     ; 162   uint16_t tmpval = 0;
 273                     ; 163   uint8_t tmpccrh = 0;
 275  0027 0f07          	clr	(OFST-5,sp)
 276                     ; 164   uint8_t input_clock = 0;
 278                     ; 167   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 280                     ; 168   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 282                     ; 169   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 284                     ; 170   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 286                     ; 171   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 288                     ; 174   input_clock = (uint8_t)(CLK_GetClockFreq() / 1000000);
 290  0029 cd0000        	call	_CLK_GetClockFreq
 292  002c ae0000        	ldw	x,#L01
 293  002f cd0000        	call	c_ludv
 295  0032 b603          	ld	a,c_lreg+3
 296  0034 6b08          	ld	(OFST-4,sp),a
 297                     ; 178   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 299  0036 c65212        	ld	a,21010
 300  0039 a4c0          	and	a,#192
 301  003b c75212        	ld	21010,a
 302                     ; 180   I2C->FREQR |= input_clock;
 304  003e c65212        	ld	a,21010
 305  0041 1a08          	or	a,(OFST-4,sp)
 306  0043 c75212        	ld	21010,a
 307                     ; 184   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 309  0046 72115210      	bres	21008,#0
 310                     ; 187   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 312  004a c6521c        	ld	a,21020
 313  004d a430          	and	a,#48
 314  004f c7521c        	ld	21020,a
 315                     ; 188   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 317  0052 725f521b      	clr	21019
 318                     ; 191   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 320  0056 96            	ldw	x,sp
 321  0057 1c000f        	addw	x,#OFST+3
 322  005a cd0000        	call	c_ltor
 324  005d ae0004        	ldw	x,#L21
 325  0060 cd0000        	call	c_lcmp
 327  0063 2403          	jruge	L61
 328  0065 cc0102        	jp	L721
 329  0068               L61:
 330                     ; 194     tmpccrh = I2C_CCRH_FS;
 332  0068 a680          	ld	a,#128
 333  006a 6b07          	ld	(OFST-5,sp),a
 334                     ; 196     if (I2C_DutyCycle == I2C_DutyCycle_2)
 336  006c 0d15          	tnz	(OFST+9,sp)
 337  006e 2633          	jrne	L131
 338                     ; 199       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 340  0070 96            	ldw	x,sp
 341  0071 1c000f        	addw	x,#OFST+3
 342  0074 cd0000        	call	c_ltor
 344  0077 a603          	ld	a,#3
 345  0079 cd0000        	call	c_smul
 347  007c 96            	ldw	x,sp
 348  007d 1c0001        	addw	x,#OFST-11
 349  0080 cd0000        	call	c_rtol
 351  0083 7b08          	ld	a,(OFST-4,sp)
 352  0085 b703          	ld	c_lreg+3,a
 353  0087 3f02          	clr	c_lreg+2
 354  0089 3f01          	clr	c_lreg+1
 355  008b 3f00          	clr	c_lreg
 356  008d ae0000        	ldw	x,#L01
 357  0090 cd0000        	call	c_lmul
 359  0093 96            	ldw	x,sp
 360  0094 1c0001        	addw	x,#OFST-11
 361  0097 cd0000        	call	c_ludv
 363  009a 96            	ldw	x,sp
 364  009b 1c0009        	addw	x,#OFST-3
 365  009e cd0000        	call	c_rtol
 368  00a1 2037          	jra	L331
 369  00a3               L131:
 370                     ; 204       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 372  00a3 96            	ldw	x,sp
 373  00a4 1c000f        	addw	x,#OFST+3
 374  00a7 cd0000        	call	c_ltor
 376  00aa a619          	ld	a,#25
 377  00ac cd0000        	call	c_smul
 379  00af 96            	ldw	x,sp
 380  00b0 1c0001        	addw	x,#OFST-11
 381  00b3 cd0000        	call	c_rtol
 383  00b6 7b08          	ld	a,(OFST-4,sp)
 384  00b8 b703          	ld	c_lreg+3,a
 385  00ba 3f02          	clr	c_lreg+2
 386  00bc 3f01          	clr	c_lreg+1
 387  00be 3f00          	clr	c_lreg
 388  00c0 ae0000        	ldw	x,#L01
 389  00c3 cd0000        	call	c_lmul
 391  00c6 96            	ldw	x,sp
 392  00c7 1c0001        	addw	x,#OFST-11
 393  00ca cd0000        	call	c_ludv
 395  00cd 96            	ldw	x,sp
 396  00ce 1c0009        	addw	x,#OFST-3
 397  00d1 cd0000        	call	c_rtol
 399                     ; 206       tmpccrh |= I2C_CCRH_DUTY;
 401  00d4 7b07          	ld	a,(OFST-5,sp)
 402  00d6 aa40          	or	a,#64
 403  00d8 6b07          	ld	(OFST-5,sp),a
 404  00da               L331:
 405                     ; 210     if (result < (uint16_t)0x0001)
 407  00da 96            	ldw	x,sp
 408  00db 1c0009        	addw	x,#OFST-3
 409  00de cd0000        	call	c_lzmp
 411  00e1 260a          	jrne	L531
 412                     ; 213       result = (uint16_t)0x0001;
 414  00e3 ae0001        	ldw	x,#1
 415  00e6 1f0b          	ldw	(OFST-1,sp),x
 416  00e8 ae0000        	ldw	x,#0
 417  00eb 1f09          	ldw	(OFST-3,sp),x
 418  00ed               L531:
 419                     ; 219     tmpval = ((input_clock * 3) / 10) + 1;
 421  00ed 7b08          	ld	a,(OFST-4,sp)
 422  00ef 97            	ld	xl,a
 423  00f0 a603          	ld	a,#3
 424  00f2 42            	mul	x,a
 425  00f3 a60a          	ld	a,#10
 426  00f5 cd0000        	call	c_sdivx
 428  00f8 5c            	incw	x
 429  00f9 1f05          	ldw	(OFST-7,sp),x
 430                     ; 220     I2C->TRISER = (uint8_t)tmpval;
 432  00fb 7b06          	ld	a,(OFST-6,sp)
 433  00fd c7521d        	ld	21021,a
 435  0100 205b          	jra	L731
 436  0102               L721:
 437                     ; 226     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 439  0102 96            	ldw	x,sp
 440  0103 1c000f        	addw	x,#OFST+3
 441  0106 cd0000        	call	c_ltor
 443  0109 3803          	sll	c_lreg+3
 444  010b 3902          	rlc	c_lreg+2
 445  010d 3901          	rlc	c_lreg+1
 446  010f 3900          	rlc	c_lreg
 447  0111 96            	ldw	x,sp
 448  0112 1c0001        	addw	x,#OFST-11
 449  0115 cd0000        	call	c_rtol
 451  0118 7b08          	ld	a,(OFST-4,sp)
 452  011a b703          	ld	c_lreg+3,a
 453  011c 3f02          	clr	c_lreg+2
 454  011e 3f01          	clr	c_lreg+1
 455  0120 3f00          	clr	c_lreg
 456  0122 ae0000        	ldw	x,#L01
 457  0125 cd0000        	call	c_lmul
 459  0128 96            	ldw	x,sp
 460  0129 1c0001        	addw	x,#OFST-11
 461  012c cd0000        	call	c_ludv
 463  012f b602          	ld	a,c_lreg+2
 464  0131 97            	ld	xl,a
 465  0132 b603          	ld	a,c_lreg+3
 466  0134 cd0000        	call	c_uitol
 468  0137 96            	ldw	x,sp
 469  0138 1c0009        	addw	x,#OFST-3
 470  013b cd0000        	call	c_rtol
 472                     ; 229     if (result < (uint16_t)0x0004)
 474  013e 96            	ldw	x,sp
 475  013f 1c0009        	addw	x,#OFST-3
 476  0142 cd0000        	call	c_ltor
 478  0145 ae0008        	ldw	x,#L41
 479  0148 cd0000        	call	c_lcmp
 481  014b 240a          	jruge	L141
 482                     ; 232       result = (uint16_t)0x0004;
 484  014d ae0004        	ldw	x,#4
 485  0150 1f0b          	ldw	(OFST-1,sp),x
 486  0152 ae0000        	ldw	x,#0
 487  0155 1f09          	ldw	(OFST-3,sp),x
 488  0157               L141:
 489                     ; 238      I2C->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 491  0157 7b08          	ld	a,(OFST-4,sp)
 492  0159 4c            	inc	a
 493  015a c7521d        	ld	21021,a
 494  015d               L731:
 495                     ; 242   I2C->CCRL = (uint8_t)result;
 497  015d 7b0c          	ld	a,(OFST+0,sp)
 498  015f c7521b        	ld	21019,a
 499                     ; 243   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 501  0162 7b07          	ld	a,(OFST-5,sp)
 502  0164 c7521c        	ld	21020,a
 503                     ; 246     I2C->CR1 |= I2C_CR1_PE;
 505  0167 72105210      	bset	21008,#0
 506                     ; 249   I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 508  016b 72155211      	bres	21009,#2
 509                     ; 252   I2C->CR2 |= (uint8_t)I2C_Ack;
 511  016f c65211        	ld	a,21009
 512  0172 1a16          	or	a,(OFST+10,sp)
 513  0174 c75211        	ld	21009,a
 514                     ; 255     I2C->OARL = (uint8_t)(OwnAddress);
 516  0177 7b14          	ld	a,(OFST+8,sp)
 517  0179 c75213        	ld	21011,a
 518                     ; 256     I2C->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF) |
 518                     ; 257                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 520  017c 7b13          	ld	a,(OFST+7,sp)
 521  017e 97            	ld	xl,a
 522  017f 7b14          	ld	a,(OFST+8,sp)
 523  0181 9f            	ld	a,xl
 524  0182 a403          	and	a,#3
 525  0184 97            	ld	xl,a
 526  0185 4f            	clr	a
 527  0186 02            	rlwa	x,a
 528  0187 4f            	clr	a
 529  0188 01            	rrwa	x,a
 530  0189 48            	sll	a
 531  018a 59            	rlcw	x
 532  018b 9f            	ld	a,xl
 533  018c 6b04          	ld	(OFST-8,sp),a
 534  018e 7b17          	ld	a,(OFST+11,sp)
 535  0190 aa40          	or	a,#64
 536  0192 1a04          	or	a,(OFST-8,sp)
 537  0194 c75214        	ld	21012,a
 538                     ; 258 }
 541  0197 5b0c          	addw	sp,#12
 542  0199 81            	ret
 597                     ; 266 void I2C_Cmd(FunctionalState NewState)
 597                     ; 267 {
 598                     	switch	.text
 599  019a               _I2C_Cmd:
 603                     ; 269   assert_param(IS_FUNCTIONAL_STATE(NewState));
 605                     ; 271   if (NewState != DISABLE)
 607  019a 4d            	tnz	a
 608  019b 2706          	jreq	L171
 609                     ; 274     I2C->CR1 |= I2C_CR1_PE;
 611  019d 72105210      	bset	21008,#0
 613  01a1 2004          	jra	L371
 614  01a3               L171:
 615                     ; 279     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 617  01a3 72115210      	bres	21008,#0
 618  01a7               L371:
 619                     ; 281 }
 622  01a7 81            	ret
 657                     ; 289 void I2C_GeneralCallCmd(FunctionalState NewState)
 657                     ; 290 {
 658                     	switch	.text
 659  01a8               _I2C_GeneralCallCmd:
 663                     ; 292   assert_param(IS_FUNCTIONAL_STATE(NewState));
 665                     ; 294   if (NewState != DISABLE)
 667  01a8 4d            	tnz	a
 668  01a9 2706          	jreq	L312
 669                     ; 297     I2C->CR1 |= I2C_CR1_ENGC;
 671  01ab 721c5210      	bset	21008,#6
 673  01af 2004          	jra	L512
 674  01b1               L312:
 675                     ; 302     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 677  01b1 721d5210      	bres	21008,#6
 678  01b5               L512:
 679                     ; 304 }
 682  01b5 81            	ret
 717                     ; 314 void I2C_GenerateSTART(FunctionalState NewState)
 717                     ; 315 {
 718                     	switch	.text
 719  01b6               _I2C_GenerateSTART:
 723                     ; 317   assert_param(IS_FUNCTIONAL_STATE(NewState));
 725                     ; 319   if (NewState != DISABLE)
 727  01b6 4d            	tnz	a
 728  01b7 2706          	jreq	L532
 729                     ; 322     I2C->CR2 |= I2C_CR2_START;
 731  01b9 72105211      	bset	21009,#0
 733  01bd 2004          	jra	L732
 734  01bf               L532:
 735                     ; 327     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 737  01bf 72115211      	bres	21009,#0
 738  01c3               L732:
 739                     ; 329 }
 742  01c3 81            	ret
 777                     ; 337 void I2C_GenerateSTOP(FunctionalState NewState)
 777                     ; 338 {
 778                     	switch	.text
 779  01c4               _I2C_GenerateSTOP:
 783                     ; 340   assert_param(IS_FUNCTIONAL_STATE(NewState));
 785                     ; 342   if (NewState != DISABLE)
 787  01c4 4d            	tnz	a
 788  01c5 2706          	jreq	L752
 789                     ; 345     I2C->CR2 |= I2C_CR2_STOP;
 791  01c7 72125211      	bset	21009,#1
 793  01cb 2004          	jra	L162
 794  01cd               L752:
 795                     ; 350     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 797  01cd 72135211      	bres	21009,#1
 798  01d1               L162:
 799                     ; 352 }
 802  01d1 81            	ret
 838                     ; 362 void I2C_SoftwareResetCmd(FunctionalState NewState)
 838                     ; 363 {
 839                     	switch	.text
 840  01d2               _I2C_SoftwareResetCmd:
 844                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 846                     ; 367   if (NewState != DISABLE)
 848  01d2 4d            	tnz	a
 849  01d3 2706          	jreq	L103
 850                     ; 370     I2C->CR2 |= I2C_CR2_SWRST;
 852  01d5 721e5211      	bset	21009,#7
 854  01d9 2004          	jra	L303
 855  01db               L103:
 856                     ; 375     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 858  01db 721f5211      	bres	21009,#7
 859  01df               L303:
 860                     ; 377 }
 863  01df 81            	ret
 899                     ; 385 void I2C_StretchClockCmd(FunctionalState NewState)
 899                     ; 386 {
 900                     	switch	.text
 901  01e0               _I2C_StretchClockCmd:
 905                     ; 388   assert_param(IS_FUNCTIONAL_STATE(NewState));
 907                     ; 390   if (NewState != DISABLE)
 909  01e0 4d            	tnz	a
 910  01e1 2706          	jreq	L323
 911                     ; 393     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 913  01e3 721f5210      	bres	21008,#7
 915  01e7 2004          	jra	L523
 916  01e9               L323:
 917                     ; 398     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 919  01e9 721e5210      	bset	21008,#7
 920  01ed               L523:
 921                     ; 400 }
 924  01ed 81            	ret
 960                     ; 408 void I2C_AcknowledgeConfig(FunctionalState NewState)
 960                     ; 409 {
 961                     	switch	.text
 962  01ee               _I2C_AcknowledgeConfig:
 966                     ; 411   assert_param(IS_FUNCTIONAL_STATE(NewState));
 968                     ; 413   if (NewState != DISABLE)
 970  01ee 4d            	tnz	a
 971  01ef 2706          	jreq	L543
 972                     ; 416     I2C->CR2 |= I2C_CR2_ACK;
 974  01f1 72145211      	bset	21009,#2
 976  01f5 2004          	jra	L743
 977  01f7               L543:
 978                     ; 421     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 980  01f7 72155211      	bres	21009,#2
 981  01fb               L743:
 982                     ; 423 }
 985  01fb 81            	ret
1043                     ; 434 void I2C_AckPositionConfig(I2C_AckPosition_TypeDef I2C_AckPosition)
1043                     ; 435 {
1044                     	switch	.text
1045  01fc               _I2C_AckPositionConfig:
1049                     ; 437   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1051                     ; 440   I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1053  01fc 72175211      	bres	21009,#3
1054                     ; 443   I2C->CR2 |= (uint8_t)I2C_AckPosition;
1056  0200 ca5211        	or	a,21009
1057  0203 c75211        	ld	21009,a
1058                     ; 444 }
1061  0206 81            	ret
1097                     ; 454 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1097                     ; 455 {
1098                     	switch	.text
1099  0207               _I2C_FastModeDutyCycleConfig:
1103                     ; 457   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1105                     ; 459   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1107  0207 a140          	cp	a,#64
1108  0209 2606          	jrne	L514
1109                     ; 462     I2C->CCRH |= I2C_CCRH_DUTY;
1111  020b 721c521c      	bset	21020,#6
1113  020f 2004          	jra	L714
1114  0211               L514:
1115                     ; 467     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1117  0211 721d521c      	bres	21020,#6
1118  0215               L714:
1119                     ; 469 }
1122  0215 81            	ret
1189                     ; 481 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1189                     ; 482 {
1190                     	switch	.text
1191  0216               _I2C_Send7bitAddress:
1193  0216 89            	pushw	x
1194       00000000      OFST:	set	0
1197                     ; 484   assert_param(IS_I2C_ADDRESS(Address));
1199                     ; 485   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1201                     ; 488   if (I2C_Direction != I2C_Direction_Transmitter)
1203  0217 9f            	ld	a,xl
1204  0218 4d            	tnz	a
1205  0219 2708          	jreq	L354
1206                     ; 491     Address |= OAR1_ADD0_Set;
1208  021b 7b01          	ld	a,(OFST+1,sp)
1209  021d aa01          	or	a,#1
1210  021f 6b01          	ld	(OFST+1,sp),a
1212  0221 2006          	jra	L554
1213  0223               L354:
1214                     ; 496     Address &= OAR1_ADD0_Reset;
1216  0223 7b01          	ld	a,(OFST+1,sp)
1217  0225 a4fe          	and	a,#254
1218  0227 6b01          	ld	(OFST+1,sp),a
1219  0229               L554:
1220                     ; 499   I2C->DR = Address;
1222  0229 7b01          	ld	a,(OFST+1,sp)
1223  022b c75216        	ld	21014,a
1224                     ; 500 }
1227  022e 85            	popw	x
1228  022f 81            	ret
1262                     ; 523 void I2C_SendData(uint8_t Data)
1262                     ; 524 {
1263                     	switch	.text
1264  0230               _I2C_SendData:
1268                     ; 526   I2C->DR = Data;
1270  0230 c75216        	ld	21014,a
1271                     ; 527 }
1274  0233 81            	ret
1297                     ; 534 uint8_t I2C_ReceiveData(void)
1297                     ; 535 {
1298                     	switch	.text
1299  0234               _I2C_ReceiveData:
1303                     ; 537   return ((uint8_t)I2C->DR);
1305  0234 c65216        	ld	a,21014
1308  0237 81            	ret
1464                     ; 648 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1464                     ; 649 {
1465                     	switch	.text
1466  0238               _I2C_ITConfig:
1468  0238 89            	pushw	x
1469       00000000      OFST:	set	0
1472                     ; 651   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
1474                     ; 652   assert_param(IS_FUNCTIONAL_STATE(NewState));
1476                     ; 654   if (NewState != DISABLE)
1478  0239 0d05          	tnz	(OFST+5,sp)
1479  023b 2709          	jreq	L175
1480                     ; 657     I2C->ITR |= (uint8_t)I2C_IT;
1482  023d 9f            	ld	a,xl
1483  023e ca521a        	or	a,21018
1484  0241 c7521a        	ld	21018,a
1486  0244 2009          	jra	L375
1487  0246               L175:
1488                     ; 662     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1490  0246 7b02          	ld	a,(OFST+2,sp)
1491  0248 43            	cpl	a
1492  0249 c4521a        	and	a,21018
1493  024c c7521a        	ld	21018,a
1494  024f               L375:
1495                     ; 664 }
1498  024f 85            	popw	x
1499  0250 81            	ret
1723                     ; 700 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1723                     ; 701 {
1724                     	switch	.text
1725  0251               _I2C_CheckEvent:
1727  0251 89            	pushw	x
1728  0252 5206          	subw	sp,#6
1729       00000006      OFST:	set	6
1732                     ; 702   uint16_t lastevent = 0;
1734                     ; 703   uint8_t flag1= 0;
1736                     ; 704   uint8_t flag2= 0;
1738                     ; 705   ErrorStatus status = ERROR;
1740                     ; 708   assert_param(IS_I2C_EVENT(I2C_Event));
1742                     ; 710   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1744  0254 a30004        	cpw	x,#4
1745  0257 260d          	jrne	L507
1746                     ; 713       lastevent = (uint16_t)(I2C->SR2& I2C_SR2_AF);
1748  0259 c65218        	ld	a,21016
1749  025c 5f            	clrw	x
1750  025d a404          	and	a,#4
1751  025f 5f            	clrw	x
1752  0260 02            	rlwa	x,a
1753  0261 1f04          	ldw	(OFST-2,sp),x
1754  0263 01            	rrwa	x,a
1756  0264 201f          	jra	L707
1757  0266               L507:
1758                     ; 718     flag1 = I2C->SR1;
1760  0266 c65217        	ld	a,21015
1761  0269 6b03          	ld	(OFST-3,sp),a
1762                     ; 719     flag2 = I2C->SR3;
1764  026b c65219        	ld	a,21017
1765  026e 6b06          	ld	(OFST+0,sp),a
1766                     ; 720     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1768  0270 7b03          	ld	a,(OFST-3,sp)
1769  0272 5f            	clrw	x
1770  0273 97            	ld	xl,a
1771  0274 1f01          	ldw	(OFST-5,sp),x
1772  0276 7b06          	ld	a,(OFST+0,sp)
1773  0278 5f            	clrw	x
1774  0279 97            	ld	xl,a
1775  027a 4f            	clr	a
1776  027b 02            	rlwa	x,a
1777  027c 01            	rrwa	x,a
1778  027d 1a02          	or	a,(OFST-4,sp)
1779  027f 01            	rrwa	x,a
1780  0280 1a01          	or	a,(OFST-5,sp)
1781  0282 01            	rrwa	x,a
1782  0283 1f04          	ldw	(OFST-2,sp),x
1783  0285               L707:
1784                     ; 724   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1786  0285 1e04          	ldw	x,(OFST-2,sp)
1787  0287 01            	rrwa	x,a
1788  0288 1408          	and	a,(OFST+2,sp)
1789  028a 01            	rrwa	x,a
1790  028b 1407          	and	a,(OFST+1,sp)
1791  028d 01            	rrwa	x,a
1792  028e 1307          	cpw	x,(OFST+1,sp)
1793  0290 2606          	jrne	L117
1794                     ; 727     status = SUCCESS;
1796  0292 a601          	ld	a,#1
1797  0294 6b06          	ld	(OFST+0,sp),a
1799  0296 2002          	jra	L317
1800  0298               L117:
1801                     ; 732     status = ERROR;
1803  0298 0f06          	clr	(OFST+0,sp)
1804  029a               L317:
1805                     ; 736   return status;
1807  029a 7b06          	ld	a,(OFST+0,sp)
1810  029c 5b08          	addw	sp,#8
1811  029e 81            	ret
1864                     ; 754 I2C_Event_TypeDef I2C_GetLastEvent(void)
1864                     ; 755 {
1865                     	switch	.text
1866  029f               _I2C_GetLastEvent:
1868  029f 5206          	subw	sp,#6
1869       00000006      OFST:	set	6
1872                     ; 756   __IO uint16_t lastevent = 0;
1874  02a1 5f            	clrw	x
1875  02a2 1f05          	ldw	(OFST-1,sp),x
1876                     ; 757   uint16_t flag1 = 0;
1878                     ; 758   uint16_t flag2 = 0;
1880                     ; 760   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1882  02a4 c65218        	ld	a,21016
1883  02a7 a504          	bcp	a,#4
1884  02a9 2707          	jreq	L347
1885                     ; 762     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1887  02ab ae0004        	ldw	x,#4
1888  02ae 1f05          	ldw	(OFST-1,sp),x
1890  02b0 201b          	jra	L547
1891  02b2               L347:
1892                     ; 767     flag1 = I2C->SR1;
1894  02b2 c65217        	ld	a,21015
1895  02b5 5f            	clrw	x
1896  02b6 97            	ld	xl,a
1897  02b7 1f01          	ldw	(OFST-5,sp),x
1898                     ; 768     flag2 = I2C->SR3;
1900  02b9 c65219        	ld	a,21017
1901  02bc 5f            	clrw	x
1902  02bd 97            	ld	xl,a
1903  02be 1f03          	ldw	(OFST-3,sp),x
1904                     ; 771     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1906  02c0 1e03          	ldw	x,(OFST-3,sp)
1907  02c2 4f            	clr	a
1908  02c3 02            	rlwa	x,a
1909  02c4 01            	rrwa	x,a
1910  02c5 1a02          	or	a,(OFST-4,sp)
1911  02c7 01            	rrwa	x,a
1912  02c8 1a01          	or	a,(OFST-5,sp)
1913  02ca 01            	rrwa	x,a
1914  02cb 1f05          	ldw	(OFST-1,sp),x
1915  02cd               L547:
1916                     ; 774   return (I2C_Event_TypeDef)lastevent;
1918  02cd 1e05          	ldw	x,(OFST-1,sp)
1921  02cf 5b06          	addw	sp,#6
1922  02d1 81            	ret
2124                     ; 805 FlagStatus I2C_GetFlagStatus(I2C_FLAG_TypeDef I2C_FLAG)
2124                     ; 806 {
2125                     	switch	.text
2126  02d2               _I2C_GetFlagStatus:
2128  02d2 89            	pushw	x
2129  02d3 89            	pushw	x
2130       00000002      OFST:	set	2
2133                     ; 807   uint8_t tempreg = 0;
2135  02d4 0f02          	clr	(OFST+0,sp)
2136                     ; 808   uint8_t regindex = 0;
2138                     ; 809   FlagStatus bitstatus = RESET;
2140                     ; 812   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
2142                     ; 815   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
2144  02d6 9e            	ld	a,xh
2145  02d7 6b01          	ld	(OFST-1,sp),a
2146                     ; 818   switch (regindex)
2148  02d9 7b01          	ld	a,(OFST-1,sp)
2150                     ; 834     default:
2150                     ; 835       break;
2151  02db 4a            	dec	a
2152  02dc 2708          	jreq	L747
2153  02de 4a            	dec	a
2154  02df 270c          	jreq	L157
2155  02e1 4a            	dec	a
2156  02e2 2710          	jreq	L357
2157  02e4 2013          	jra	L7601
2158  02e6               L747:
2159                     ; 821     case 0x01:
2159                     ; 822       tempreg = (uint8_t)I2C->SR1;
2161  02e6 c65217        	ld	a,21015
2162  02e9 6b02          	ld	(OFST+0,sp),a
2163                     ; 823       break;
2165  02eb 200c          	jra	L7601
2166  02ed               L157:
2167                     ; 826     case 0x02:
2167                     ; 827       tempreg = (uint8_t)I2C->SR2;
2169  02ed c65218        	ld	a,21016
2170  02f0 6b02          	ld	(OFST+0,sp),a
2171                     ; 828       break;
2173  02f2 2005          	jra	L7601
2174  02f4               L357:
2175                     ; 831     case 0x03:
2175                     ; 832       tempreg = (uint8_t)I2C->SR3;
2177  02f4 c65219        	ld	a,21017
2178  02f7 6b02          	ld	(OFST+0,sp),a
2179                     ; 833       break;
2181  02f9               L557:
2182                     ; 834     default:
2182                     ; 835       break;
2184  02f9               L7601:
2185                     ; 839   if ((tempreg & (uint8_t)I2C_FLAG) != 0)
2187  02f9 7b04          	ld	a,(OFST+2,sp)
2188  02fb 1502          	bcp	a,(OFST+0,sp)
2189  02fd 2706          	jreq	L1701
2190                     ; 842     bitstatus = SET;
2192  02ff a601          	ld	a,#1
2193  0301 6b02          	ld	(OFST+0,sp),a
2195  0303 2002          	jra	L3701
2196  0305               L1701:
2197                     ; 847     bitstatus = RESET;
2199  0305 0f02          	clr	(OFST+0,sp)
2200  0307               L3701:
2201                     ; 850   return bitstatus;
2203  0307 7b02          	ld	a,(OFST+0,sp)
2206  0309 5b04          	addw	sp,#4
2207  030b 81            	ret
2251                     ; 879 void I2C_ClearFlag(I2C_FLAG_TypeDef I2C_FLAG)
2251                     ; 880 {
2252                     	switch	.text
2253  030c               _I2C_ClearFlag:
2255  030c 89            	pushw	x
2256       00000002      OFST:	set	2
2259                     ; 881   uint16_t flagpos = 0;
2261                     ; 883   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
2263                     ; 886   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2265  030d 01            	rrwa	x,a
2266  030e a4ff          	and	a,#255
2267  0310 5f            	clrw	x
2268  0311 02            	rlwa	x,a
2269  0312 1f01          	ldw	(OFST-1,sp),x
2270  0314 01            	rrwa	x,a
2271                     ; 888   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2273  0315 7b02          	ld	a,(OFST+0,sp)
2274  0317 43            	cpl	a
2275  0318 c75218        	ld	21016,a
2276                     ; 889 }
2279  031b 85            	popw	x
2280  031c 81            	ret
2344                     ; 910 ITStatus I2C_GetITStatus(I2C_IT_TypeDef I2C_IT)
2344                     ; 911 {
2345                     	switch	.text
2346  031d               _I2C_GetITStatus:
2348  031d 89            	pushw	x
2349  031e 5204          	subw	sp,#4
2350       00000004      OFST:	set	4
2353                     ; 912   ITStatus bitstatus = RESET;
2355                     ; 913   __IO uint8_t enablestatus = 0;
2357  0320 0f03          	clr	(OFST-1,sp)
2358                     ; 914   uint16_t tempregister = 0;
2360                     ; 917   assert_param(IS_I2C_GET_IT(I2C_IT));
2362                     ; 919   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
2364  0322 01            	rrwa	x,a
2365  0323 9f            	ld	a,xl
2366  0324 a407          	and	a,#7
2367  0326 97            	ld	xl,a
2368  0327 4f            	clr	a
2369  0328 02            	rlwa	x,a
2370  0329 4f            	clr	a
2371  032a 01            	rrwa	x,a
2372  032b 9f            	ld	a,xl
2373  032c 5f            	clrw	x
2374  032d 97            	ld	xl,a
2375  032e 1f01          	ldw	(OFST-3,sp),x
2376                     ; 922   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2378  0330 c6521a        	ld	a,21018
2379  0333 1402          	and	a,(OFST-2,sp)
2380  0335 6b03          	ld	(OFST-1,sp),a
2381                     ; 924   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
2383  0337 7b05          	ld	a,(OFST+1,sp)
2384  0339 97            	ld	xl,a
2385  033a 7b06          	ld	a,(OFST+2,sp)
2386  033c 9f            	ld	a,xl
2387  033d a430          	and	a,#48
2388  033f 97            	ld	xl,a
2389  0340 4f            	clr	a
2390  0341 02            	rlwa	x,a
2391  0342 a30100        	cpw	x,#256
2392  0345 2615          	jrne	L1511
2393                     ; 927     if (((I2C->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
2395  0347 c65217        	ld	a,21015
2396  034a 1506          	bcp	a,(OFST+2,sp)
2397  034c 270a          	jreq	L3511
2399  034e 0d03          	tnz	(OFST-1,sp)
2400  0350 2706          	jreq	L3511
2401                     ; 930       bitstatus = SET;
2403  0352 a601          	ld	a,#1
2404  0354 6b04          	ld	(OFST+0,sp),a
2406  0356 2017          	jra	L7511
2407  0358               L3511:
2408                     ; 935       bitstatus = RESET;
2410  0358 0f04          	clr	(OFST+0,sp)
2411  035a 2013          	jra	L7511
2412  035c               L1511:
2413                     ; 941     if (((I2C->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
2415  035c c65218        	ld	a,21016
2416  035f 1506          	bcp	a,(OFST+2,sp)
2417  0361 270a          	jreq	L1611
2419  0363 0d03          	tnz	(OFST-1,sp)
2420  0365 2706          	jreq	L1611
2421                     ; 944       bitstatus = SET;
2423  0367 a601          	ld	a,#1
2424  0369 6b04          	ld	(OFST+0,sp),a
2426  036b 2002          	jra	L7511
2427  036d               L1611:
2428                     ; 949       bitstatus = RESET;
2430  036d 0f04          	clr	(OFST+0,sp)
2431  036f               L7511:
2432                     ; 953   return  bitstatus;
2434  036f 7b04          	ld	a,(OFST+0,sp)
2437  0371 5b06          	addw	sp,#6
2438  0373 81            	ret
2483                     ; 982 void I2C_ClearITPendingBit(I2C_IT_TypeDef I2C_IT)
2483                     ; 983 {
2484                     	switch	.text
2485  0374               _I2C_ClearITPendingBit:
2487  0374 89            	pushw	x
2488       00000002      OFST:	set	2
2491                     ; 984   uint16_t flagpos = 0;
2493                     ; 987   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
2495                     ; 990   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
2497  0375 01            	rrwa	x,a
2498  0376 a4ff          	and	a,#255
2499  0378 5f            	clrw	x
2500  0379 02            	rlwa	x,a
2501  037a 1f01          	ldw	(OFST-1,sp),x
2502  037c 01            	rrwa	x,a
2503                     ; 993   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2505  037d 7b02          	ld	a,(OFST+0,sp)
2506  037f 43            	cpl	a
2507  0380 c75218        	ld	21016,a
2508                     ; 994 }
2511  0383 85            	popw	x
2512  0384 81            	ret
2525                     	xdef	_I2C_ClearITPendingBit
2526                     	xdef	_I2C_GetITStatus
2527                     	xdef	_I2C_ClearFlag
2528                     	xdef	_I2C_GetFlagStatus
2529                     	xdef	_I2C_GetLastEvent
2530                     	xdef	_I2C_CheckEvent
2531                     	xdef	_I2C_ITConfig
2532                     	xdef	_I2C_ReceiveData
2533                     	xdef	_I2C_SendData
2534                     	xdef	_I2C_Send7bitAddress
2535                     	xdef	_I2C_FastModeDutyCycleConfig
2536                     	xdef	_I2C_AckPositionConfig
2537                     	xdef	_I2C_AcknowledgeConfig
2538                     	xdef	_I2C_GenerateSTOP
2539                     	xdef	_I2C_GenerateSTART
2540                     	xdef	_I2C_StretchClockCmd
2541                     	xdef	_I2C_SoftwareResetCmd
2542                     	xdef	_I2C_GeneralCallCmd
2543                     	xdef	_I2C_Cmd
2544                     	xdef	_I2C_Init
2545                     	xdef	_I2C_DeInit
2546                     	xref	_CLK_GetClockFreq
2547                     	xref.b	c_lreg
2548                     	xref.b	c_x
2567                     	xref	c_uitol
2568                     	xref	c_sdivx
2569                     	xref	c_lzmp
2570                     	xref	c_rtol
2571                     	xref	c_smul
2572                     	xref	c_lmul
2573                     	xref	c_lcmp
2574                     	xref	c_ltor
2575                     	xref	c_ludv
2576                     	end
