   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 61 void I2C_DeInit(void)
  33                     ; 62 {
  35                     .text:	section	.text,new
  36  0000               _I2C_DeInit:
  40                     ; 63   I2C->CR1 = I2C_CR1_RESET_VALUE;
  42  0000 725f5210      	clr	21008
  43                     ; 64   I2C->CR2 = I2C_CR2_RESET_VALUE;
  45  0004 725f5211      	clr	21009
  46                     ; 65   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  48  0008 725f5212      	clr	21010
  49                     ; 66   I2C->OARL = I2C_OARL_RESET_VALUE;
  51  000c 725f5213      	clr	21011
  52                     ; 67   I2C->OARH = I2C_OARH_RESET_VALUE;
  54  0010 725f5214      	clr	21012
  55                     ; 68   I2C->ITR = I2C_ITR_RESET_VALUE;
  57  0014 725f521a      	clr	21018
  58                     ; 69   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  60  0018 725f521b      	clr	21019
  61                     ; 70   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  63  001c 725f521c      	clr	21020
  64                     ; 71   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  66  0020 3502521d      	mov	21021,#2
  67                     ; 72 }
  70  0024 81            	ret	
 238                     .const:	section	.text
 239  0000               L65:
 240  0000 00061a81      	dc.l	400001
 241  0004               L46:
 242  0004 000186a1      	dc.l	100001
 243  0008               L66:
 244  0008 000f4240      	dc.l	1000000
 245                     ; 90 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 245                     ; 91               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 245                     ; 92               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 245                     ; 93 {
 246                     .text:	section	.text,new
 247  0000               _I2C_Init:
 249  0000 5209          	subw	sp,#9
 250       00000009      OFST:	set	9
 253                     ; 94   uint16_t result = 0x0004;
 255                     ; 95   uint16_t tmpval = 0;
 257                     ; 96   uint8_t tmpccrh = 0;
 259  0002 0f07          	clr	(OFST-2,sp)
 260                     ; 99   assert_param(IS_I2C_ACK_OK(Ack));
 262  0004 7b13          	ld	a,(OFST+10,sp)
 263  0006 270e          	jreq	L41
 264  0008 a101          	cp	a,#1
 265  000a 270a          	jreq	L41
 266  000c a102          	cp	a,#2
 267  000e 2706          	jreq	L41
 268  0010 ae0063        	ldw	x,#99
 269  0013 cd015d        	call	LC001
 270  0016               L41:
 271                     ; 100   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 273  0016 7b14          	ld	a,(OFST+11,sp)
 274  0018 270a          	jreq	L42
 275  001a a180          	cp	a,#128
 276  001c 2706          	jreq	L42
 277  001e ae0064        	ldw	x,#100
 278  0021 cd015d        	call	LC001
 279  0024               L42:
 280                     ; 101   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 282  0024 1e10          	ldw	x,(OFST+7,sp)
 283  0026 a30400        	cpw	x,#1024
 284  0029 2506          	jrult	L23
 285  002b ae0065        	ldw	x,#101
 286  002e cd015d        	call	LC001
 287  0031               L23:
 288                     ; 102   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 290  0031 7b12          	ld	a,(OFST+9,sp)
 291  0033 270a          	jreq	L24
 292  0035 a140          	cp	a,#64
 293  0037 2706          	jreq	L24
 294  0039 ae0066        	ldw	x,#102
 295  003c cd015d        	call	LC001
 296  003f               L24:
 297                     ; 103   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 299  003f 7b15          	ld	a,(OFST+12,sp)
 300  0041 2704          	jreq	L64
 301  0043 a111          	cp	a,#17
 302  0045 2506          	jrult	L05
 303  0047               L64:
 304  0047 ae0067        	ldw	x,#103
 305  004a cd015d        	call	LC001
 306  004d               L05:
 307                     ; 104   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 309  004d 96            	ldw	x,sp
 310  004e 1c000c        	addw	x,#OFST+3
 311  0051 cd0000        	call	c_lzmp
 313  0054 270f          	jreq	L45
 314  0056 96            	ldw	x,sp
 315  0057 1c000c        	addw	x,#OFST+3
 316  005a cd0000        	call	c_ltor
 318  005d ae0000        	ldw	x,#L65
 319  0060 cd0000        	call	c_lcmp
 321  0063 2506          	jrult	L06
 322  0065               L45:
 323  0065 ae0068        	ldw	x,#104
 324  0068 cd015d        	call	LC001
 325  006b               L06:
 326                     ; 109   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 328  006b c65212        	ld	a,21010
 329  006e a4c0          	and	a,#192
 330  0070 c75212        	ld	21010,a
 331                     ; 111   I2C->FREQR |= InputClockFrequencyMHz;
 333  0073 c65212        	ld	a,21010
 334  0076 1a15          	or	a,(OFST+12,sp)
 335  0078 c75212        	ld	21010,a
 336                     ; 115   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 338  007b 72115210      	bres	21008,#0
 339                     ; 118   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 341  007f c6521c        	ld	a,21020
 342  0082 a430          	and	a,#48
 343  0084 c7521c        	ld	21020,a
 344                     ; 119   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 346  0087 725f521b      	clr	21019
 347                     ; 122   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 349  008b 96            	ldw	x,sp
 350  008c 1c000c        	addw	x,#OFST+3
 351  008f cd0000        	call	c_ltor
 353  0092 ae0004        	ldw	x,#L46
 354  0095 cd0000        	call	c_lcmp
 356  0098 2560          	jrult	L711
 357                     ; 125     tmpccrh = I2C_CCRH_FS;
 359  009a a680          	ld	a,#128
 360  009c 6b07          	ld	(OFST-2,sp),a
 361                     ; 127     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 363  009e 0d12          	tnz	(OFST+9,sp)
 364  00a0 96            	ldw	x,sp
 365  00a1 261d          	jrne	L121
 366                     ; 130       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 368  00a3 1c000c        	addw	x,#OFST+3
 369  00a6 cd0000        	call	c_ltor
 371  00a9 a603          	ld	a,#3
 372  00ab cd0000        	call	c_smul
 374  00ae 96            	ldw	x,sp
 375  00af 5c            	incw	x
 376  00b0 cd0000        	call	c_rtol
 378  00b3 7b15          	ld	a,(OFST+12,sp)
 379  00b5 cd0169        	call	LC002
 381  00b8 96            	ldw	x,sp
 382  00b9 cd0177        	call	LC003
 383  00bc 1f08          	ldw	(OFST-1,sp),x
 385  00be 2021          	jra	L321
 386  00c0               L121:
 387                     ; 135       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 389  00c0 1c000c        	addw	x,#OFST+3
 390  00c3 cd0000        	call	c_ltor
 392  00c6 a619          	ld	a,#25
 393  00c8 cd0000        	call	c_smul
 395  00cb 96            	ldw	x,sp
 396  00cc 5c            	incw	x
 397  00cd cd0000        	call	c_rtol
 399  00d0 7b15          	ld	a,(OFST+12,sp)
 400  00d2 cd0169        	call	LC002
 402  00d5 96            	ldw	x,sp
 403  00d6 cd0177        	call	LC003
 404  00d9 1f08          	ldw	(OFST-1,sp),x
 405                     ; 137       tmpccrh |= I2C_CCRH_DUTY;
 407  00db 7b07          	ld	a,(OFST-2,sp)
 408  00dd aa40          	or	a,#64
 409  00df 6b07          	ld	(OFST-2,sp),a
 410  00e1               L321:
 411                     ; 141     if (result < (uint16_t)0x01)
 413  00e1 1e08          	ldw	x,(OFST-1,sp)
 414  00e3 2603          	jrne	L521
 415                     ; 144       result = (uint16_t)0x0001;
 417  00e5 5c            	incw	x
 418  00e6 1f08          	ldw	(OFST-1,sp),x
 419  00e8               L521:
 420                     ; 150     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 422  00e8 7b15          	ld	a,(OFST+12,sp)
 423  00ea 97            	ld	xl,a
 424  00eb a603          	ld	a,#3
 425  00ed 42            	mul	x,a
 426  00ee a60a          	ld	a,#10
 427  00f0 cd0000        	call	c_sdivx
 429  00f3 5c            	incw	x
 430  00f4 1f05          	ldw	(OFST-4,sp),x
 431                     ; 151     I2C->TRISER = (uint8_t)tmpval;
 433  00f6 7b06          	ld	a,(OFST-3,sp)
 435  00f8 2028          	jra	L721
 436  00fa               L711:
 437                     ; 158     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 439  00fa 96            	ldw	x,sp
 440  00fb 1c000c        	addw	x,#OFST+3
 441  00fe cd0000        	call	c_ltor
 443  0101 3803          	sll	c_lreg+3
 444  0103 3902          	rlc	c_lreg+2
 445  0105 3901          	rlc	c_lreg+1
 446  0107 3900          	rlc	c_lreg
 447  0109 96            	ldw	x,sp
 448  010a 5c            	incw	x
 449  010b cd0000        	call	c_rtol
 451  010e 7b15          	ld	a,(OFST+12,sp)
 452  0110 ad57          	call	LC002
 454  0112 96            	ldw	x,sp
 455  0113 ad62          	call	LC003
 456                     ; 161     if (result < (uint16_t)0x0004)
 458  0115 a30004        	cpw	x,#4
 459  0118 2403          	jruge	L131
 460                     ; 164       result = (uint16_t)0x0004;
 462  011a ae0004        	ldw	x,#4
 463  011d               L131:
 464  011d 1f08          	ldw	(OFST-1,sp),x
 465                     ; 170     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 467  011f 7b15          	ld	a,(OFST+12,sp)
 468  0121 4c            	inc	a
 469  0122               L721:
 470  0122 c7521d        	ld	21021,a
 471                     ; 175   I2C->CCRL = (uint8_t)result;
 473  0125 7b09          	ld	a,(OFST+0,sp)
 474  0127 c7521b        	ld	21019,a
 475                     ; 176   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 477  012a 7b08          	ld	a,(OFST-1,sp)
 478  012c a40f          	and	a,#15
 479  012e 1a07          	or	a,(OFST-2,sp)
 480  0130 c7521c        	ld	21020,a
 481                     ; 179   I2C->CR1 |= I2C_CR1_PE;
 483  0133 72105210      	bset	21008,#0
 484                     ; 182   I2C_AcknowledgeConfig(Ack);
 486  0137 7b13          	ld	a,(OFST+10,sp)
 487  0139 cd0000        	call	_I2C_AcknowledgeConfig
 489                     ; 185   I2C->OARL = (uint8_t)(OwnAddress);
 491  013c 7b11          	ld	a,(OFST+8,sp)
 492  013e c75213        	ld	21011,a
 493                     ; 186   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 493                     ; 187                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 495  0141 7b10          	ld	a,(OFST+7,sp)
 496  0143 a403          	and	a,#3
 497  0145 97            	ld	xl,a
 498  0146 4f            	clr	a
 499  0147 02            	rlwa	x,a
 500  0148 a607          	ld	a,#7
 501  014a               L27:
 502  014a 54            	srlw	x
 503  014b 4a            	dec	a
 504  014c 26fc          	jrne	L27
 505  014e 9f            	ld	a,xl
 506  014f 6b04          	ld	(OFST-5,sp),a
 507  0151 7b14          	ld	a,(OFST+11,sp)
 508  0153 aa40          	or	a,#64
 509  0155 1a04          	or	a,(OFST-5,sp)
 510  0157 c75214        	ld	21012,a
 511                     ; 188 }
 514  015a 5b09          	addw	sp,#9
 515  015c 81            	ret	
 517  015d               LC001:
 518  015d 89            	pushw	x
 519  015e 5f            	clrw	x
 520  015f 89            	pushw	x
 521  0160 ae000c        	ldw	x,#L511
 522  0163 cd0000        	call	_assert_failed
 524  0166 5b04          	addw	sp,#4
 525  0168 81            	ret	
 526  0169               LC002:
 527  0169 b703          	ld	c_lreg+3,a
 528  016b 3f02          	clr	c_lreg+2
 529  016d 3f01          	clr	c_lreg+1
 530  016f 3f00          	clr	c_lreg
 531  0171 ae0008        	ldw	x,#L66
 532  0174 cc0000        	jp	c_lmul
 533  0177               LC003:
 534  0177 5c            	incw	x
 535  0178 cd0000        	call	c_ludv
 537  017b be02          	ldw	x,c_lreg+2
 538  017d 81            	ret	
 593                     ; 196 void I2C_Cmd(FunctionalState NewState)
 593                     ; 197 {
 594                     .text:	section	.text,new
 595  0000               _I2C_Cmd:
 597  0000 88            	push	a
 598       00000000      OFST:	set	0
 601                     ; 200   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 603  0001 4d            	tnz	a
 604  0002 2711          	jreq	L201
 605  0004 4a            	dec	a
 606  0005 270e          	jreq	L201
 607  0007 ae00c8        	ldw	x,#200
 608  000a 89            	pushw	x
 609  000b 5f            	clrw	x
 610  000c 89            	pushw	x
 611  000d ae000c        	ldw	x,#L511
 612  0010 cd0000        	call	_assert_failed
 614  0013 5b04          	addw	sp,#4
 615  0015               L201:
 616                     ; 202   if (NewState != DISABLE)
 618  0015 7b01          	ld	a,(OFST+1,sp)
 619  0017 2706          	jreq	L161
 620                     ; 205     I2C->CR1 |= I2C_CR1_PE;
 622  0019 72105210      	bset	21008,#0
 624  001d 2004          	jra	L361
 625  001f               L161:
 626                     ; 210     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 628  001f 72115210      	bres	21008,#0
 629  0023               L361:
 630                     ; 212 }
 633  0023 84            	pop	a
 634  0024 81            	ret	
 670                     ; 220 void I2C_GeneralCallCmd(FunctionalState NewState)
 670                     ; 221 {
 671                     .text:	section	.text,new
 672  0000               _I2C_GeneralCallCmd:
 674  0000 88            	push	a
 675       00000000      OFST:	set	0
 678                     ; 224   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 680  0001 4d            	tnz	a
 681  0002 2711          	jreq	L411
 682  0004 4a            	dec	a
 683  0005 270e          	jreq	L411
 684  0007 ae00e0        	ldw	x,#224
 685  000a 89            	pushw	x
 686  000b 5f            	clrw	x
 687  000c 89            	pushw	x
 688  000d ae000c        	ldw	x,#L511
 689  0010 cd0000        	call	_assert_failed
 691  0013 5b04          	addw	sp,#4
 692  0015               L411:
 693                     ; 226   if (NewState != DISABLE)
 695  0015 7b01          	ld	a,(OFST+1,sp)
 696  0017 2706          	jreq	L302
 697                     ; 229     I2C->CR1 |= I2C_CR1_ENGC;
 699  0019 721c5210      	bset	21008,#6
 701  001d 2004          	jra	L502
 702  001f               L302:
 703                     ; 234     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 705  001f 721d5210      	bres	21008,#6
 706  0023               L502:
 707                     ; 236 }
 710  0023 84            	pop	a
 711  0024 81            	ret	
 747                     ; 246 void I2C_GenerateSTART(FunctionalState NewState)
 747                     ; 247 {
 748                     .text:	section	.text,new
 749  0000               _I2C_GenerateSTART:
 751  0000 88            	push	a
 752       00000000      OFST:	set	0
 755                     ; 250   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 757  0001 4d            	tnz	a
 758  0002 2711          	jreq	L621
 759  0004 4a            	dec	a
 760  0005 270e          	jreq	L621
 761  0007 ae00fa        	ldw	x,#250
 762  000a 89            	pushw	x
 763  000b 5f            	clrw	x
 764  000c 89            	pushw	x
 765  000d ae000c        	ldw	x,#L511
 766  0010 cd0000        	call	_assert_failed
 768  0013 5b04          	addw	sp,#4
 769  0015               L621:
 770                     ; 252   if (NewState != DISABLE)
 772  0015 7b01          	ld	a,(OFST+1,sp)
 773  0017 2706          	jreq	L522
 774                     ; 255     I2C->CR2 |= I2C_CR2_START;
 776  0019 72105211      	bset	21009,#0
 778  001d 2004          	jra	L722
 779  001f               L522:
 780                     ; 260     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 782  001f 72115211      	bres	21009,#0
 783  0023               L722:
 784                     ; 262 }
 787  0023 84            	pop	a
 788  0024 81            	ret	
 824                     ; 270 void I2C_GenerateSTOP(FunctionalState NewState)
 824                     ; 271 {
 825                     .text:	section	.text,new
 826  0000               _I2C_GenerateSTOP:
 828  0000 88            	push	a
 829       00000000      OFST:	set	0
 832                     ; 274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 834  0001 4d            	tnz	a
 835  0002 2711          	jreq	L041
 836  0004 4a            	dec	a
 837  0005 270e          	jreq	L041
 838  0007 ae0112        	ldw	x,#274
 839  000a 89            	pushw	x
 840  000b 5f            	clrw	x
 841  000c 89            	pushw	x
 842  000d ae000c        	ldw	x,#L511
 843  0010 cd0000        	call	_assert_failed
 845  0013 5b04          	addw	sp,#4
 846  0015               L041:
 847                     ; 276   if (NewState != DISABLE)
 849  0015 7b01          	ld	a,(OFST+1,sp)
 850  0017 2706          	jreq	L742
 851                     ; 279     I2C->CR2 |= I2C_CR2_STOP;
 853  0019 72125211      	bset	21009,#1
 855  001d 2004          	jra	L152
 856  001f               L742:
 857                     ; 284     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 859  001f 72135211      	bres	21009,#1
 860  0023               L152:
 861                     ; 286 }
 864  0023 84            	pop	a
 865  0024 81            	ret	
 902                     ; 294 void I2C_SoftwareResetCmd(FunctionalState NewState)
 902                     ; 295 {
 903                     .text:	section	.text,new
 904  0000               _I2C_SoftwareResetCmd:
 906  0000 88            	push	a
 907       00000000      OFST:	set	0
 910                     ; 297   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 912  0001 4d            	tnz	a
 913  0002 2711          	jreq	L251
 914  0004 4a            	dec	a
 915  0005 270e          	jreq	L251
 916  0007 ae0129        	ldw	x,#297
 917  000a 89            	pushw	x
 918  000b 5f            	clrw	x
 919  000c 89            	pushw	x
 920  000d ae000c        	ldw	x,#L511
 921  0010 cd0000        	call	_assert_failed
 923  0013 5b04          	addw	sp,#4
 924  0015               L251:
 925                     ; 299   if (NewState != DISABLE)
 927  0015 7b01          	ld	a,(OFST+1,sp)
 928  0017 2706          	jreq	L172
 929                     ; 302     I2C->CR2 |= I2C_CR2_SWRST;
 931  0019 721e5211      	bset	21009,#7
 933  001d 2004          	jra	L372
 934  001f               L172:
 935                     ; 307     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 937  001f 721f5211      	bres	21009,#7
 938  0023               L372:
 939                     ; 309 }
 942  0023 84            	pop	a
 943  0024 81            	ret	
 980                     ; 318 void I2C_StretchClockCmd(FunctionalState NewState)
 980                     ; 319 {
 981                     .text:	section	.text,new
 982  0000               _I2C_StretchClockCmd:
 984  0000 88            	push	a
 985       00000000      OFST:	set	0
 988                     ; 321   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 990  0001 4d            	tnz	a
 991  0002 2711          	jreq	L461
 992  0004 4a            	dec	a
 993  0005 270e          	jreq	L461
 994  0007 ae0141        	ldw	x,#321
 995  000a 89            	pushw	x
 996  000b 5f            	clrw	x
 997  000c 89            	pushw	x
 998  000d ae000c        	ldw	x,#L511
 999  0010 cd0000        	call	_assert_failed
1001  0013 5b04          	addw	sp,#4
1002  0015               L461:
1003                     ; 323   if (NewState != DISABLE)
1005  0015 7b01          	ld	a,(OFST+1,sp)
1006  0017 2706          	jreq	L313
1007                     ; 326     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1009  0019 721f5210      	bres	21008,#7
1011  001d 2004          	jra	L513
1012  001f               L313:
1013                     ; 332     I2C->CR1 |= I2C_CR1_NOSTRETCH;
1015  001f 721e5210      	bset	21008,#7
1016  0023               L513:
1017                     ; 334 }
1020  0023 84            	pop	a
1021  0024 81            	ret	
1058                     ; 343 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
1058                     ; 344 {
1059                     .text:	section	.text,new
1060  0000               _I2C_AcknowledgeConfig:
1062  0000 88            	push	a
1063       00000000      OFST:	set	0
1066                     ; 347   assert_param(IS_I2C_ACK_OK(Ack));
1068  0001 4d            	tnz	a
1069  0002 2716          	jreq	L671
1070  0004 a101          	cp	a,#1
1071  0006 2712          	jreq	L671
1072  0008 a102          	cp	a,#2
1073  000a 270e          	jreq	L671
1074  000c ae015b        	ldw	x,#347
1075  000f 89            	pushw	x
1076  0010 5f            	clrw	x
1077  0011 89            	pushw	x
1078  0012 ae000c        	ldw	x,#L511
1079  0015 cd0000        	call	_assert_failed
1081  0018 5b04          	addw	sp,#4
1082  001a               L671:
1083                     ; 349   if (Ack == I2C_ACK_NONE)
1085  001a 7b01          	ld	a,(OFST+1,sp)
1086  001c 2606          	jrne	L533
1087                     ; 352     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1089  001e 72155211      	bres	21009,#2
1091  0022 2011          	jra	L733
1092  0024               L533:
1093                     ; 357     I2C->CR2 |= I2C_CR2_ACK;
1095  0024 72145211      	bset	21009,#2
1096                     ; 359     if (Ack == I2C_ACK_CURR)
1098  0028 4a            	dec	a
1099  0029 2606          	jrne	L143
1100                     ; 362       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1102  002b 72175211      	bres	21009,#3
1104  002f 2004          	jra	L733
1105  0031               L143:
1106                     ; 367       I2C->CR2 |= I2C_CR2_POS;
1108  0031 72165211      	bset	21009,#3
1109  0035               L733:
1110                     ; 370 }
1113  0035 84            	pop	a
1114  0036 81            	ret	
1187                     ; 380 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1187                     ; 381 {
1188                     .text:	section	.text,new
1189  0000               _I2C_ITConfig:
1191  0000 89            	pushw	x
1192       00000000      OFST:	set	0
1195                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1197  0001 9e            	ld	a,xh
1198  0002 4a            	dec	a
1199  0003 2723          	jreq	L012
1200  0005 9e            	ld	a,xh
1201  0006 a102          	cp	a,#2
1202  0008 271e          	jreq	L012
1203  000a 9e            	ld	a,xh
1204  000b a104          	cp	a,#4
1205  000d 2719          	jreq	L012
1206  000f 9e            	ld	a,xh
1207  0010 a103          	cp	a,#3
1208  0012 2714          	jreq	L012
1209  0014 9e            	ld	a,xh
1210  0015 a105          	cp	a,#5
1211  0017 270f          	jreq	L012
1212  0019 9e            	ld	a,xh
1213  001a a106          	cp	a,#6
1214  001c 270a          	jreq	L012
1215  001e 9e            	ld	a,xh
1216  001f a107          	cp	a,#7
1217  0021 2705          	jreq	L012
1218  0023 ae0180        	ldw	x,#384
1219  0026 ad22          	call	LC004
1220  0028               L012:
1221                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1223  0028 7b02          	ld	a,(OFST+2,sp)
1224  002a 2708          	jreq	L022
1225  002c 4a            	dec	a
1226  002d 2705          	jreq	L022
1227  002f ae0181        	ldw	x,#385
1228  0032 ad16          	call	LC004
1229  0034               L022:
1230                     ; 387   if (NewState != DISABLE)
1232  0034 7b02          	ld	a,(OFST+2,sp)
1233  0036 2707          	jreq	L104
1234                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1236  0038 c6521a        	ld	a,21018
1237  003b 1a01          	or	a,(OFST+1,sp)
1239  003d 2006          	jra	L304
1240  003f               L104:
1241                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1243  003f 7b01          	ld	a,(OFST+1,sp)
1244  0041 43            	cpl	a
1245  0042 c4521a        	and	a,21018
1246  0045               L304:
1247  0045 c7521a        	ld	21018,a
1248                     ; 397 }
1251  0048 85            	popw	x
1252  0049 81            	ret	
1254  004a               LC004:
1255  004a 89            	pushw	x
1256  004b 5f            	clrw	x
1257  004c 89            	pushw	x
1258  004d ae000c        	ldw	x,#L511
1259  0050 cd0000        	call	_assert_failed
1261  0053 5b04          	addw	sp,#4
1262  0055 81            	ret	
1298                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1298                     ; 406 {
1299                     .text:	section	.text,new
1300  0000               _I2C_FastModeDutyCycleConfig:
1302  0000 88            	push	a
1303       00000000      OFST:	set	0
1306                     ; 409   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1308  0001 4d            	tnz	a
1309  0002 2712          	jreq	L232
1310  0004 a140          	cp	a,#64
1311  0006 270e          	jreq	L232
1312  0008 ae0199        	ldw	x,#409
1313  000b 89            	pushw	x
1314  000c 5f            	clrw	x
1315  000d 89            	pushw	x
1316  000e ae000c        	ldw	x,#L511
1317  0011 cd0000        	call	_assert_failed
1319  0014 5b04          	addw	sp,#4
1320  0016               L232:
1321                     ; 411   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1323  0016 7b01          	ld	a,(OFST+1,sp)
1324  0018 a140          	cp	a,#64
1325  001a 2606          	jrne	L324
1326                     ; 414     I2C->CCRH |= I2C_CCRH_DUTY;
1328  001c 721c521c      	bset	21020,#6
1330  0020 2004          	jra	L524
1331  0022               L324:
1332                     ; 419     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1334  0022 721d521c      	bres	21020,#6
1335  0026               L524:
1336                     ; 421 }
1339  0026 84            	pop	a
1340  0027 81            	ret	
1363                     ; 428 uint8_t I2C_ReceiveData(void)
1363                     ; 429 {
1364                     .text:	section	.text,new
1365  0000               _I2C_ReceiveData:
1369                     ; 431   return ((uint8_t)I2C->DR);
1371  0000 c65216        	ld	a,21014
1374  0003 81            	ret	
1438                     ; 441 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1438                     ; 442 {
1439                     .text:	section	.text,new
1440  0000               _I2C_Send7bitAddress:
1442  0000 89            	pushw	x
1443       00000000      OFST:	set	0
1446                     ; 444   assert_param(IS_I2C_ADDRESS_OK(Address));
1448  0001 9e            	ld	a,xh
1449  0002 a501          	bcp	a,#1
1450  0004 2705          	jreq	L442
1451  0006 ae01bc        	ldw	x,#444
1452  0009 ad19          	call	LC005
1453  000b               L442:
1454                     ; 445   assert_param(IS_I2C_DIRECTION_OK(Direction));
1456  000b 7b02          	ld	a,(OFST+2,sp)
1457  000d 2708          	jreq	L452
1458  000f 4a            	dec	a
1459  0010 2705          	jreq	L452
1460  0012 ae01bd        	ldw	x,#445
1461  0015 ad0d          	call	LC005
1462  0017               L452:
1463                     ; 448   Address &= (uint8_t)0xFE;
1465  0017 7b01          	ld	a,(OFST+1,sp)
1466  0019 a4fe          	and	a,#254
1467  001b 6b01          	ld	(OFST+1,sp),a
1468                     ; 451   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1470  001d 1a02          	or	a,(OFST+2,sp)
1471  001f c75216        	ld	21014,a
1472                     ; 452 }
1475  0022 85            	popw	x
1476  0023 81            	ret	
1478  0024               LC005:
1479  0024 89            	pushw	x
1480  0025 5f            	clrw	x
1481  0026 89            	pushw	x
1482  0027 ae000c        	ldw	x,#L511
1483  002a cd0000        	call	_assert_failed
1485  002d 5b04          	addw	sp,#4
1486  002f 81            	ret	
1517                     ; 459 void I2C_SendData(uint8_t Data)
1517                     ; 460 {
1518                     .text:	section	.text,new
1519  0000               _I2C_SendData:
1523                     ; 462   I2C->DR = Data;
1525  0000 c75216        	ld	21014,a
1526                     ; 463 }
1529  0003 81            	ret	
1750                     ; 579 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1750                     ; 580 {
1751                     .text:	section	.text,new
1752  0000               _I2C_CheckEvent:
1754  0000 89            	pushw	x
1755  0001 5206          	subw	sp,#6
1756       00000006      OFST:	set	6
1759                     ; 581   __IO uint16_t lastevent = 0x00;
1761  0003 5f            	clrw	x
1762  0004 1f04          	ldw	(OFST-2,sp),x
1763                     ; 582   uint8_t flag1 = 0x00 ;
1765                     ; 583   uint8_t flag2 = 0x00;
1767                     ; 584   ErrorStatus status = ERROR;
1769                     ; 587   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1771  0006 1e07          	ldw	x,(OFST+1,sp)
1772  0008 a30682        	cpw	x,#1666
1773  000b 275b          	jreq	L072
1774  000d a30202        	cpw	x,#514
1775  0010 2756          	jreq	L072
1776  0012 a31200        	cpw	x,#4608
1777  0015 2751          	jreq	L072
1778  0017 a30240        	cpw	x,#576
1779  001a 274c          	jreq	L072
1780  001c a30350        	cpw	x,#848
1781  001f 2747          	jreq	L072
1782  0021 a30684        	cpw	x,#1668
1783  0024 2742          	jreq	L072
1784  0026 a30794        	cpw	x,#1940
1785  0029 273d          	jreq	L072
1786  002b a30004        	cpw	x,#4
1787  002e 2738          	jreq	L072
1788  0030 a30010        	cpw	x,#16
1789  0033 2733          	jreq	L072
1790  0035 a30301        	cpw	x,#769
1791  0038 272e          	jreq	L072
1792  003a a30782        	cpw	x,#1922
1793  003d 2729          	jreq	L072
1794  003f a30302        	cpw	x,#770
1795  0042 2724          	jreq	L072
1796  0044 a30340        	cpw	x,#832
1797  0047 271f          	jreq	L072
1798  0049 a30784        	cpw	x,#1924
1799  004c 271a          	jreq	L072
1800  004e a30780        	cpw	x,#1920
1801  0051 2715          	jreq	L072
1802  0053 a30308        	cpw	x,#776
1803  0056 2710          	jreq	L072
1804  0058 ae024b        	ldw	x,#587
1805  005b 89            	pushw	x
1806  005c 5f            	clrw	x
1807  005d 89            	pushw	x
1808  005e ae000c        	ldw	x,#L511
1809  0061 cd0000        	call	_assert_failed
1811  0064 5b04          	addw	sp,#4
1812  0066 1e07          	ldw	x,(OFST+1,sp)
1813  0068               L072:
1814                     ; 589   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1816  0068 a30004        	cpw	x,#4
1817  006b 2609          	jrne	L706
1818                     ; 591     lastevent = I2C->SR2 & I2C_SR2_AF;
1820  006d c65218        	ld	a,21016
1821  0070 a404          	and	a,#4
1822  0072 5f            	clrw	x
1823  0073 97            	ld	xl,a
1825  0074 2019          	jra	L116
1826  0076               L706:
1827                     ; 595     flag1 = I2C->SR1;
1829  0076 c65217        	ld	a,21015
1830  0079 6b03          	ld	(OFST-3,sp),a
1831                     ; 596     flag2 = I2C->SR3;
1833  007b c65219        	ld	a,21017
1834  007e 6b06          	ld	(OFST+0,sp),a
1835                     ; 597     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1837  0080 7b03          	ld	a,(OFST-3,sp)
1838  0082 5f            	clrw	x
1839  0083 97            	ld	xl,a
1840  0084 1f01          	ldw	(OFST-5,sp),x
1841  0086 7b06          	ld	a,(OFST+0,sp)
1842  0088 97            	ld	xl,a
1843  0089 7b02          	ld	a,(OFST-4,sp)
1844  008b 01            	rrwa	x,a
1845  008c 1a01          	or	a,(OFST-5,sp)
1846  008e 01            	rrwa	x,a
1847  008f               L116:
1848  008f 1f04          	ldw	(OFST-2,sp),x
1849                     ; 600   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1851  0091 1e04          	ldw	x,(OFST-2,sp)
1852  0093 01            	rrwa	x,a
1853  0094 1408          	and	a,(OFST+2,sp)
1854  0096 01            	rrwa	x,a
1855  0097 1407          	and	a,(OFST+1,sp)
1856  0099 01            	rrwa	x,a
1857  009a 1307          	cpw	x,(OFST+1,sp)
1858  009c 2604          	jrne	L316
1859                     ; 603     status = SUCCESS;
1861  009e a601          	ld	a,#1
1863  00a0 2001          	jra	L516
1864  00a2               L316:
1865                     ; 608     status = ERROR;
1867  00a2 4f            	clr	a
1868  00a3               L516:
1869                     ; 612   return status;
1873  00a3 5b08          	addw	sp,#8
1874  00a5 81            	ret	
1923                     ; 629 I2C_Event_TypeDef I2C_GetLastEvent(void)
1923                     ; 630 {
1924                     .text:	section	.text,new
1925  0000               _I2C_GetLastEvent:
1927  0000 5206          	subw	sp,#6
1928       00000006      OFST:	set	6
1931                     ; 631   __IO uint16_t lastevent = 0;
1933  0002 5f            	clrw	x
1934  0003 1f05          	ldw	(OFST-1,sp),x
1935                     ; 632   uint16_t flag1 = 0;
1937                     ; 633   uint16_t flag2 = 0;
1939                     ; 635   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1941  0005 7205521805    	btjf	21016,#2,L146
1942                     ; 637     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1944  000a ae0004        	ldw	x,#4
1946  000d 2013          	jra	L346
1947  000f               L146:
1948                     ; 642     flag1 = I2C->SR1;
1950  000f c65217        	ld	a,21015
1951  0012 97            	ld	xl,a
1952  0013 1f01          	ldw	(OFST-5,sp),x
1953                     ; 643     flag2 = I2C->SR3;
1955  0015 c65219        	ld	a,21017
1956  0018 5f            	clrw	x
1957  0019 97            	ld	xl,a
1958  001a 1f03          	ldw	(OFST-3,sp),x
1959                     ; 646     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1961  001c 7b02          	ld	a,(OFST-4,sp)
1962  001e 01            	rrwa	x,a
1963  001f 1a01          	or	a,(OFST-5,sp)
1964  0021 01            	rrwa	x,a
1965  0022               L346:
1966  0022 1f05          	ldw	(OFST-1,sp),x
1967                     ; 649   return (I2C_Event_TypeDef)lastevent;
1969  0024 1e05          	ldw	x,(OFST-1,sp)
1972  0026 5b06          	addw	sp,#6
1973  0028 81            	ret	
2185                     ; 680 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
2185                     ; 681 {
2186                     .text:	section	.text,new
2187  0000               _I2C_GetFlagStatus:
2189  0000 89            	pushw	x
2190  0001 89            	pushw	x
2191       00000002      OFST:	set	2
2194                     ; 682   uint8_t tempreg = 0;
2196  0002 4f            	clr	a
2197  0003 6b02          	ld	(OFST+0,sp),a
2198                     ; 683   uint8_t regindex = 0;
2200                     ; 684   FlagStatus bitstatus = RESET;
2202                     ; 687   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
2204  0005 1e03          	ldw	x,(OFST+1,sp)
2205  0007 a30180        	cpw	x,#384
2206  000a 2759          	jreq	L403
2207  000c a30140        	cpw	x,#320
2208  000f 2754          	jreq	L403
2209  0011 a30110        	cpw	x,#272
2210  0014 274f          	jreq	L403
2211  0016 a30108        	cpw	x,#264
2212  0019 274a          	jreq	L403
2213  001b a30104        	cpw	x,#260
2214  001e 2745          	jreq	L403
2215  0020 a30102        	cpw	x,#258
2216  0023 2740          	jreq	L403
2217  0025 a30101        	cpw	x,#257
2218  0028 273b          	jreq	L403
2219  002a a30220        	cpw	x,#544
2220  002d 2736          	jreq	L403
2221  002f a30208        	cpw	x,#520
2222  0032 2731          	jreq	L403
2223  0034 a30204        	cpw	x,#516
2224  0037 272c          	jreq	L403
2225  0039 a30202        	cpw	x,#514
2226  003c 2727          	jreq	L403
2227  003e a30201        	cpw	x,#513
2228  0041 2722          	jreq	L403
2229  0043 a30310        	cpw	x,#784
2230  0046 271d          	jreq	L403
2231  0048 a30304        	cpw	x,#772
2232  004b 2718          	jreq	L403
2233  004d a30302        	cpw	x,#770
2234  0050 2713          	jreq	L403
2235  0052 a30301        	cpw	x,#769
2236  0055 270e          	jreq	L403
2237  0057 ae02af        	ldw	x,#687
2238  005a 89            	pushw	x
2239  005b 5f            	clrw	x
2240  005c 89            	pushw	x
2241  005d ae000c        	ldw	x,#L511
2242  0060 cd0000        	call	_assert_failed
2244  0063 5b04          	addw	sp,#4
2245  0065               L403:
2246                     ; 690   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
2248  0065 7b03          	ld	a,(OFST+1,sp)
2249  0067 6b01          	ld	(OFST-1,sp),a
2250                     ; 692   switch (regindex)
2253                     ; 709     default:
2253                     ; 710       break;
2254  0069 4a            	dec	a
2255  006a 2708          	jreq	L546
2256  006c 4a            	dec	a
2257  006d 270a          	jreq	L746
2258  006f 4a            	dec	a
2259  0070 270c          	jreq	L156
2260  0072 200f          	jra	L167
2261  0074               L546:
2262                     ; 695     case 0x01:
2262                     ; 696       tempreg = (uint8_t)I2C->SR1;
2264  0074 c65217        	ld	a,21015
2265                     ; 697       break;
2267  0077 2008          	jp	LC006
2268  0079               L746:
2269                     ; 700     case 0x02:
2269                     ; 701       tempreg = (uint8_t)I2C->SR2;
2271  0079 c65218        	ld	a,21016
2272                     ; 702       break;
2274  007c 2003          	jp	LC006
2275  007e               L156:
2276                     ; 705     case 0x03:
2276                     ; 706       tempreg = (uint8_t)I2C->SR3;
2278  007e c65219        	ld	a,21017
2279  0081               LC006:
2280  0081 6b02          	ld	(OFST+0,sp),a
2281                     ; 707       break;
2283                     ; 709     default:
2283                     ; 710       break;
2285  0083               L167:
2286                     ; 714   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2288  0083 7b04          	ld	a,(OFST+2,sp)
2289  0085 1502          	bcp	a,(OFST+0,sp)
2290  0087 2704          	jreq	L367
2291                     ; 717     bitstatus = SET;
2293  0089 a601          	ld	a,#1
2295  008b 2001          	jra	L567
2296  008d               L367:
2297                     ; 722     bitstatus = RESET;
2299  008d 4f            	clr	a
2300  008e               L567:
2301                     ; 725   return bitstatus;
2305  008e 5b04          	addw	sp,#4
2306  0090 81            	ret	
2349                     ; 760 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2349                     ; 761 {
2350                     .text:	section	.text,new
2351  0000               _I2C_ClearFlag:
2353  0000 89            	pushw	x
2354  0001 89            	pushw	x
2355       00000002      OFST:	set	2
2358                     ; 762   uint16_t flagpos = 0;
2360  0002 5f            	clrw	x
2361  0003 1f01          	ldw	(OFST-1,sp),x
2362                     ; 764   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2364  0005 7b03          	ld	a,(OFST+1,sp)
2365  0007 a5fd          	bcp	a,#253
2366  0009 2604          	jrne	L213
2367  000b 1e03          	ldw	x,(OFST+1,sp)
2368  000d 260e          	jrne	L413
2369  000f               L213:
2370  000f ae02fc        	ldw	x,#764
2371  0012 89            	pushw	x
2372  0013 5f            	clrw	x
2373  0014 89            	pushw	x
2374  0015 ae000c        	ldw	x,#L511
2375  0018 cd0000        	call	_assert_failed
2377  001b 5b04          	addw	sp,#4
2378  001d               L413:
2379                     ; 767   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2381  001d 7b04          	ld	a,(OFST+2,sp)
2382  001f 5f            	clrw	x
2383  0020 02            	rlwa	x,a
2384  0021 1f01          	ldw	(OFST-1,sp),x
2385                     ; 769   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2387  0023 7b02          	ld	a,(OFST+0,sp)
2388  0025 43            	cpl	a
2389  0026 c75218        	ld	21016,a
2390                     ; 770 }
2393  0029 5b04          	addw	sp,#4
2394  002b 81            	ret	
2559                     ; 792 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2559                     ; 793 {
2560                     .text:	section	.text,new
2561  0000               _I2C_GetITStatus:
2563  0000 89            	pushw	x
2564  0001 5204          	subw	sp,#4
2565       00000004      OFST:	set	4
2568                     ; 794   ITStatus bitstatus = RESET;
2570                     ; 795   __IO uint8_t enablestatus = 0;
2572  0003 0f03          	clr	(OFST-1,sp)
2573                     ; 796   uint16_t tempregister = 0;
2575                     ; 799     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2577  0005 1e05          	ldw	x,(OFST+1,sp)
2578  0007 a31680        	cpw	x,#5760
2579  000a 2745          	jreq	L623
2580  000c a31640        	cpw	x,#5696
2581  000f 2740          	jreq	L623
2582  0011 a31210        	cpw	x,#4624
2583  0014 273b          	jreq	L623
2584  0016 a31208        	cpw	x,#4616
2585  0019 2736          	jreq	L623
2586  001b a31204        	cpw	x,#4612
2587  001e 2731          	jreq	L623
2588  0020 a31202        	cpw	x,#4610
2589  0023 272c          	jreq	L623
2590  0025 a31201        	cpw	x,#4609
2591  0028 2727          	jreq	L623
2592  002a a32220        	cpw	x,#8736
2593  002d 2722          	jreq	L623
2594  002f a32108        	cpw	x,#8456
2595  0032 271d          	jreq	L623
2596  0034 a32104        	cpw	x,#8452
2597  0037 2718          	jreq	L623
2598  0039 a32102        	cpw	x,#8450
2599  003c 2713          	jreq	L623
2600  003e a32101        	cpw	x,#8449
2601  0041 270e          	jreq	L623
2602  0043 ae031f        	ldw	x,#799
2603  0046 89            	pushw	x
2604  0047 5f            	clrw	x
2605  0048 89            	pushw	x
2606  0049 ae000c        	ldw	x,#L511
2607  004c cd0000        	call	_assert_failed
2609  004f 5b04          	addw	sp,#4
2610  0051               L623:
2611                     ; 801   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2613  0051 7b05          	ld	a,(OFST+1,sp)
2614  0053 a407          	and	a,#7
2615  0055 97            	ld	xl,a
2616  0056 4f            	clr	a
2617  0057 02            	rlwa	x,a
2618  0058 4f            	clr	a
2619  0059 01            	rrwa	x,a
2620  005a 9f            	ld	a,xl
2621  005b 5f            	clrw	x
2622  005c 97            	ld	xl,a
2623  005d 1f01          	ldw	(OFST-3,sp),x
2624                     ; 804   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2626  005f c6521a        	ld	a,21018
2627  0062 1402          	and	a,(OFST-2,sp)
2628  0064 6b03          	ld	(OFST-1,sp),a
2629                     ; 806   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2631  0066 7b05          	ld	a,(OFST+1,sp)
2632  0068 a430          	and	a,#48
2633  006a 97            	ld	xl,a
2634  006b 4f            	clr	a
2635  006c 02            	rlwa	x,a
2636  006d a30100        	cpw	x,#256
2637  0070 260d          	jrne	L3701
2638                     ; 809     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2640  0072 c65217        	ld	a,21015
2641  0075 1506          	bcp	a,(OFST+2,sp)
2642  0077 2715          	jreq	L3011
2644  0079 0d03          	tnz	(OFST-1,sp)
2645  007b 2711          	jreq	L3011
2646                     ; 812       bitstatus = SET;
2648  007d 200b          	jp	LC008
2649                     ; 817       bitstatus = RESET;
2650  007f               L3701:
2651                     ; 823     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2653  007f c65218        	ld	a,21016
2654  0082 1506          	bcp	a,(OFST+2,sp)
2655  0084 2708          	jreq	L3011
2657  0086 0d03          	tnz	(OFST-1,sp)
2658  0088 2704          	jreq	L3011
2659                     ; 826       bitstatus = SET;
2661  008a               LC008:
2663  008a a601          	ld	a,#1
2665  008c 2001          	jra	L1011
2666  008e               L3011:
2667                     ; 831       bitstatus = RESET;
2670  008e 4f            	clr	a
2671  008f               L1011:
2672                     ; 835   return  bitstatus;
2676  008f 5b06          	addw	sp,#6
2677  0091 81            	ret	
2721                     ; 873 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2721                     ; 874 {
2722                     .text:	section	.text,new
2723  0000               _I2C_ClearITPendingBit:
2725  0000 89            	pushw	x
2726  0001 89            	pushw	x
2727       00000002      OFST:	set	2
2730                     ; 875   uint16_t flagpos = 0;
2732  0002 5f            	clrw	x
2733  0003 1f01          	ldw	(OFST-1,sp),x
2734                     ; 878   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2736  0005 1e03          	ldw	x,(OFST+1,sp)
2737  0007 a32220        	cpw	x,#8736
2738  000a 2722          	jreq	L043
2739  000c a32108        	cpw	x,#8456
2740  000f 271d          	jreq	L043
2741  0011 a32104        	cpw	x,#8452
2742  0014 2718          	jreq	L043
2743  0016 a32102        	cpw	x,#8450
2744  0019 2713          	jreq	L043
2745  001b a32101        	cpw	x,#8449
2746  001e 270e          	jreq	L043
2747  0020 ae036e        	ldw	x,#878
2748  0023 89            	pushw	x
2749  0024 5f            	clrw	x
2750  0025 89            	pushw	x
2751  0026 ae000c        	ldw	x,#L511
2752  0029 cd0000        	call	_assert_failed
2754  002c 5b04          	addw	sp,#4
2755  002e               L043:
2756                     ; 881   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2758  002e 7b04          	ld	a,(OFST+2,sp)
2759  0030 5f            	clrw	x
2760  0031 02            	rlwa	x,a
2761  0032 1f01          	ldw	(OFST-1,sp),x
2762                     ; 884   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2764  0034 7b02          	ld	a,(OFST+0,sp)
2765  0036 43            	cpl	a
2766  0037 c75218        	ld	21016,a
2767                     ; 885 }
2770  003a 5b04          	addw	sp,#4
2771  003c 81            	ret	
2784                     	xdef	_I2C_ClearITPendingBit
2785                     	xdef	_I2C_GetITStatus
2786                     	xdef	_I2C_ClearFlag
2787                     	xdef	_I2C_GetFlagStatus
2788                     	xdef	_I2C_GetLastEvent
2789                     	xdef	_I2C_CheckEvent
2790                     	xdef	_I2C_SendData
2791                     	xdef	_I2C_Send7bitAddress
2792                     	xdef	_I2C_ReceiveData
2793                     	xdef	_I2C_ITConfig
2794                     	xdef	_I2C_FastModeDutyCycleConfig
2795                     	xdef	_I2C_AcknowledgeConfig
2796                     	xdef	_I2C_StretchClockCmd
2797                     	xdef	_I2C_SoftwareResetCmd
2798                     	xdef	_I2C_GenerateSTOP
2799                     	xdef	_I2C_GenerateSTART
2800                     	xdef	_I2C_GeneralCallCmd
2801                     	xdef	_I2C_Cmd
2802                     	xdef	_I2C_Init
2803                     	xdef	_I2C_DeInit
2804                     	xref	_assert_failed
2805                     	switch	.const
2806  000c               L511:
2807  000c 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
2808  001e 6965735c7374  	dc.b	"ies\stm8s_stdperip"
2809  0030 685f64726976  	dc.b	"h_driver\src\stm8s"
2810  0042 5f6932632e63  	dc.b	"_i2c.c",0
2811                     	xref.b	c_lreg
2831                     	xref	c_sdivx
2832                     	xref	c_ludv
2833                     	xref	c_rtol
2834                     	xref	c_smul
2835                     	xref	c_lmul
2836                     	xref	c_lcmp
2837                     	xref	c_ltor
2838                     	xref	c_lzmp
2839                     	end
