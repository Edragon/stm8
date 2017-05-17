   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     .const:	section	.text
   6  0000               _HSIDivFactor:
   7  0000 01            	dc.b	1
   8  0001 02            	dc.b	2
   9  0002 04            	dc.b	4
  10  0003 08            	dc.b	8
  11  0004               _CLKPrescTable:
  12  0004 01            	dc.b	1
  13  0005 02            	dc.b	2
  14  0006 04            	dc.b	4
  15  0007 08            	dc.b	8
  16  0008 0a            	dc.b	10
  17  0009 10            	dc.b	16
  18  000a 14            	dc.b	20
  19  000b 28            	dc.b	40
  48                     ; 66 void CLK_DeInit(void)
  48                     ; 67 {
  50                     .text:	section	.text,new
  51  0000               _CLK_DeInit:
  55                     ; 69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  57  0000 350150c0      	mov	20672,#1
  58                     ; 70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  60  0004 725f50c1      	clr	20673
  61                     ; 71     CLK->SWR  = CLK_SWR_RESET_VALUE;
  63  0008 35e150c4      	mov	20676,#225
  64                     ; 72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  66  000c 725f50c5      	clr	20677
  67                     ; 73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  69  0010 351850c6      	mov	20678,#24
  70                     ; 74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  72  0014 35ff50c7      	mov	20679,#255
  73                     ; 75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  75  0018 35ff50ca      	mov	20682,#255
  76                     ; 76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  78  001c 725f50c8      	clr	20680
  79                     ; 77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  81  0020 725f50c9      	clr	20681
  83  0024               L52:
  84                     ; 78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  86  0024 720050c9fb    	btjt	20681,#0,L52
  87                     ; 80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  89  0029 725f50c9      	clr	20681
  90                     ; 81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  92  002d 725f50cc      	clr	20684
  93                     ; 82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
  95  0031 725f50cd      	clr	20685
  96                     ; 84 }
  99  0035 81            	ret	
 156                     ; 95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 156                     ; 96 {
 157                     .text:	section	.text,new
 158  0000               _CLK_FastHaltWakeUpCmd:
 160  0000 88            	push	a
 161       00000000      OFST:	set	0
 164                     ; 99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 166  0001 4d            	tnz	a
 167  0002 2711          	jreq	L41
 168  0004 4a            	dec	a
 169  0005 270e          	jreq	L41
 170  0007 ae0063        	ldw	x,#99
 171  000a 89            	pushw	x
 172  000b 5f            	clrw	x
 173  000c 89            	pushw	x
 174  000d ae000c        	ldw	x,#L75
 175  0010 cd0000        	call	_assert_failed
 177  0013 5b04          	addw	sp,#4
 178  0015               L41:
 179                     ; 101     if (NewState != DISABLE)
 181  0015 7b01          	ld	a,(OFST+1,sp)
 182  0017 2706          	jreq	L16
 183                     ; 104         CLK->ICKR |= CLK_ICKR_FHWU;
 185  0019 721450c0      	bset	20672,#2
 187  001d 2004          	jra	L36
 188  001f               L16:
 189                     ; 109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 191  001f 721550c0      	bres	20672,#2
 192  0023               L36:
 193                     ; 112 }
 196  0023 84            	pop	a
 197  0024 81            	ret	
 233                     ; 119 void CLK_HSECmd(FunctionalState NewState)
 233                     ; 120 {
 234                     .text:	section	.text,new
 235  0000               _CLK_HSECmd:
 237  0000 88            	push	a
 238       00000000      OFST:	set	0
 241                     ; 123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 243  0001 4d            	tnz	a
 244  0002 2711          	jreq	L62
 245  0004 4a            	dec	a
 246  0005 270e          	jreq	L62
 247  0007 ae007b        	ldw	x,#123
 248  000a 89            	pushw	x
 249  000b 5f            	clrw	x
 250  000c 89            	pushw	x
 251  000d ae000c        	ldw	x,#L75
 252  0010 cd0000        	call	_assert_failed
 254  0013 5b04          	addw	sp,#4
 255  0015               L62:
 256                     ; 125     if (NewState != DISABLE)
 258  0015 7b01          	ld	a,(OFST+1,sp)
 259  0017 2706          	jreq	L301
 260                     ; 128         CLK->ECKR |= CLK_ECKR_HSEEN;
 262  0019 721050c1      	bset	20673,#0
 264  001d 2004          	jra	L501
 265  001f               L301:
 266                     ; 133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 268  001f 721150c1      	bres	20673,#0
 269  0023               L501:
 270                     ; 136 }
 273  0023 84            	pop	a
 274  0024 81            	ret	
 310                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 310                     ; 144 {
 311                     .text:	section	.text,new
 312  0000               _CLK_HSICmd:
 314  0000 88            	push	a
 315       00000000      OFST:	set	0
 318                     ; 147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 320  0001 4d            	tnz	a
 321  0002 2711          	jreq	L04
 322  0004 4a            	dec	a
 323  0005 270e          	jreq	L04
 324  0007 ae0093        	ldw	x,#147
 325  000a 89            	pushw	x
 326  000b 5f            	clrw	x
 327  000c 89            	pushw	x
 328  000d ae000c        	ldw	x,#L75
 329  0010 cd0000        	call	_assert_failed
 331  0013 5b04          	addw	sp,#4
 332  0015               L04:
 333                     ; 149     if (NewState != DISABLE)
 335  0015 7b01          	ld	a,(OFST+1,sp)
 336  0017 2706          	jreq	L521
 337                     ; 152         CLK->ICKR |= CLK_ICKR_HSIEN;
 339  0019 721050c0      	bset	20672,#0
 341  001d 2004          	jra	L721
 342  001f               L521:
 343                     ; 157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 345  001f 721150c0      	bres	20672,#0
 346  0023               L721:
 347                     ; 160 }
 350  0023 84            	pop	a
 351  0024 81            	ret	
 387                     ; 167 void CLK_LSICmd(FunctionalState NewState)
 387                     ; 168 {
 388                     .text:	section	.text,new
 389  0000               _CLK_LSICmd:
 391  0000 88            	push	a
 392       00000000      OFST:	set	0
 395                     ; 171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 397  0001 4d            	tnz	a
 398  0002 2711          	jreq	L25
 399  0004 4a            	dec	a
 400  0005 270e          	jreq	L25
 401  0007 ae00ab        	ldw	x,#171
 402  000a 89            	pushw	x
 403  000b 5f            	clrw	x
 404  000c 89            	pushw	x
 405  000d ae000c        	ldw	x,#L75
 406  0010 cd0000        	call	_assert_failed
 408  0013 5b04          	addw	sp,#4
 409  0015               L25:
 410                     ; 173     if (NewState != DISABLE)
 412  0015 7b01          	ld	a,(OFST+1,sp)
 413  0017 2706          	jreq	L741
 414                     ; 176         CLK->ICKR |= CLK_ICKR_LSIEN;
 416  0019 721650c0      	bset	20672,#3
 418  001d 2004          	jra	L151
 419  001f               L741:
 420                     ; 181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 422  001f 721750c0      	bres	20672,#3
 423  0023               L151:
 424                     ; 184 }
 427  0023 84            	pop	a
 428  0024 81            	ret	
 464                     ; 192 void CLK_CCOCmd(FunctionalState NewState)
 464                     ; 193 {
 465                     .text:	section	.text,new
 466  0000               _CLK_CCOCmd:
 468  0000 88            	push	a
 469       00000000      OFST:	set	0
 472                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 474  0001 4d            	tnz	a
 475  0002 2711          	jreq	L46
 476  0004 4a            	dec	a
 477  0005 270e          	jreq	L46
 478  0007 ae00c4        	ldw	x,#196
 479  000a 89            	pushw	x
 480  000b 5f            	clrw	x
 481  000c 89            	pushw	x
 482  000d ae000c        	ldw	x,#L75
 483  0010 cd0000        	call	_assert_failed
 485  0013 5b04          	addw	sp,#4
 486  0015               L46:
 487                     ; 198     if (NewState != DISABLE)
 489  0015 7b01          	ld	a,(OFST+1,sp)
 490  0017 2706          	jreq	L171
 491                     ; 201         CLK->CCOR |= CLK_CCOR_CCOEN;
 493  0019 721050c9      	bset	20681,#0
 495  001d 2004          	jra	L371
 496  001f               L171:
 497                     ; 206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 499  001f 721150c9      	bres	20681,#0
 500  0023               L371:
 501                     ; 209 }
 504  0023 84            	pop	a
 505  0024 81            	ret	
 541                     ; 218 void CLK_ClockSwitchCmd(FunctionalState NewState)
 541                     ; 219 {
 542                     .text:	section	.text,new
 543  0000               _CLK_ClockSwitchCmd:
 545  0000 88            	push	a
 546       00000000      OFST:	set	0
 549                     ; 222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 551  0001 4d            	tnz	a
 552  0002 2711          	jreq	L67
 553  0004 4a            	dec	a
 554  0005 270e          	jreq	L67
 555  0007 ae00de        	ldw	x,#222
 556  000a 89            	pushw	x
 557  000b 5f            	clrw	x
 558  000c 89            	pushw	x
 559  000d ae000c        	ldw	x,#L75
 560  0010 cd0000        	call	_assert_failed
 562  0013 5b04          	addw	sp,#4
 563  0015               L67:
 564                     ; 224     if (NewState != DISABLE )
 566  0015 7b01          	ld	a,(OFST+1,sp)
 567  0017 2706          	jreq	L312
 568                     ; 227         CLK->SWCR |= CLK_SWCR_SWEN;
 570  0019 721250c5      	bset	20677,#1
 572  001d 2004          	jra	L512
 573  001f               L312:
 574                     ; 232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 576  001f 721350c5      	bres	20677,#1
 577  0023               L512:
 578                     ; 235 }
 581  0023 84            	pop	a
 582  0024 81            	ret	
 619                     ; 245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 619                     ; 246 {
 620                     .text:	section	.text,new
 621  0000               _CLK_SlowActiveHaltWakeUpCmd:
 623  0000 88            	push	a
 624       00000000      OFST:	set	0
 627                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 629  0001 4d            	tnz	a
 630  0002 2711          	jreq	L011
 631  0004 4a            	dec	a
 632  0005 270e          	jreq	L011
 633  0007 ae00f9        	ldw	x,#249
 634  000a 89            	pushw	x
 635  000b 5f            	clrw	x
 636  000c 89            	pushw	x
 637  000d ae000c        	ldw	x,#L75
 638  0010 cd0000        	call	_assert_failed
 640  0013 5b04          	addw	sp,#4
 641  0015               L011:
 642                     ; 251     if (NewState != DISABLE)
 644  0015 7b01          	ld	a,(OFST+1,sp)
 645  0017 2706          	jreq	L532
 646                     ; 254         CLK->ICKR |= CLK_ICKR_SWUAH;
 648  0019 721a50c0      	bset	20672,#5
 650  001d 2004          	jra	L732
 651  001f               L532:
 652                     ; 259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 654  001f 721b50c0      	bres	20672,#5
 655  0023               L732:
 656                     ; 262 }
 659  0023 84            	pop	a
 660  0024 81            	ret	
 820                     ; 272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 820                     ; 273 {
 821                     .text:	section	.text,new
 822  0000               _CLK_PeripheralClockConfig:
 824  0000 89            	pushw	x
 825       00000000      OFST:	set	0
 828                     ; 276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 830  0001 9f            	ld	a,xl
 831  0002 4d            	tnz	a
 832  0003 270a          	jreq	L221
 833  0005 9f            	ld	a,xl
 834  0006 4a            	dec	a
 835  0007 2706          	jreq	L221
 836  0009 ae0114        	ldw	x,#276
 837  000c cd0092        	call	LC004
 838  000f               L221:
 839                     ; 277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 841  000f 7b01          	ld	a,(OFST+1,sp)
 842  0011 272f          	jreq	L231
 843  0013 a101          	cp	a,#1
 844  0015 272b          	jreq	L231
 845  0017 a103          	cp	a,#3
 846  0019 2727          	jreq	L231
 847  001b a104          	cp	a,#4
 848  001d 2723          	jreq	L231
 849  001f a105          	cp	a,#5
 850  0021 271f          	jreq	L231
 851  0023 a104          	cp	a,#4
 852  0025 271b          	jreq	L231
 853  0027 a106          	cp	a,#6
 854  0029 2717          	jreq	L231
 855  002b a107          	cp	a,#7
 856  002d 2713          	jreq	L231
 857  002f a117          	cp	a,#23
 858  0031 270f          	jreq	L231
 859  0033 a113          	cp	a,#19
 860  0035 270b          	jreq	L231
 861  0037 a112          	cp	a,#18
 862  0039 2707          	jreq	L231
 863  003b ae0115        	ldw	x,#277
 864  003e ad52          	call	LC004
 865  0040 7b01          	ld	a,(OFST+1,sp)
 866  0042               L231:
 867                     ; 279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 869  0042 a510          	bcp	a,#16
 870  0044 2622          	jrne	L323
 871                     ; 281         if (NewState != DISABLE)
 873  0046 0d02          	tnz	(OFST+2,sp)
 874  0048 270d          	jreq	L523
 875                     ; 284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 877  004a ad3e          	call	LC003
 878  004c 2704          	jreq	L631
 879  004e               L041:
 880  004e 48            	sll	a
 881  004f 5a            	decw	x
 882  0050 26fc          	jrne	L041
 883  0052               L631:
 884  0052 ca50c7        	or	a,20679
 886  0055 200c          	jp	LC002
 887  0057               L523:
 888                     ; 289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 890  0057 ad31          	call	LC003
 891  0059 2704          	jreq	L241
 892  005b               L441:
 893  005b 48            	sll	a
 894  005c 5a            	decw	x
 895  005d 26fc          	jrne	L441
 896  005f               L241:
 897  005f 43            	cpl	a
 898  0060 c450c7        	and	a,20679
 899  0063               LC002:
 900  0063 c750c7        	ld	20679,a
 901  0066 2020          	jra	L133
 902  0068               L323:
 903                     ; 294         if (NewState != DISABLE)
 905  0068 0d02          	tnz	(OFST+2,sp)
 906  006a 270d          	jreq	L333
 907                     ; 297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 909  006c ad1c          	call	LC003
 910  006e 2704          	jreq	L641
 911  0070               L051:
 912  0070 48            	sll	a
 913  0071 5a            	decw	x
 914  0072 26fc          	jrne	L051
 915  0074               L641:
 916  0074 ca50ca        	or	a,20682
 918  0077 200c          	jp	LC001
 919  0079               L333:
 920                     ; 302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 922  0079 ad0f          	call	LC003
 923  007b 2704          	jreq	L251
 924  007d               L451:
 925  007d 48            	sll	a
 926  007e 5a            	decw	x
 927  007f 26fc          	jrne	L451
 928  0081               L251:
 929  0081 43            	cpl	a
 930  0082 c450ca        	and	a,20682
 931  0085               LC001:
 932  0085 c750ca        	ld	20682,a
 933  0088               L133:
 934                     ; 306 }
 937  0088 85            	popw	x
 938  0089 81            	ret	
 940  008a               LC003:
 941  008a a40f          	and	a,#15
 942  008c 5f            	clrw	x
 943  008d 97            	ld	xl,a
 944  008e a601          	ld	a,#1
 945  0090 5d            	tnzw	x
 946  0091 81            	ret	
 947  0092               LC004:
 948  0092 89            	pushw	x
 949  0093 5f            	clrw	x
 950  0094 89            	pushw	x
 951  0095 ae000c        	ldw	x,#L75
 952  0098 cd0000        	call	_assert_failed
 954  009b 5b04          	addw	sp,#4
 955  009d 81            	ret	
1141                     ; 319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1141                     ; 320 {
1142                     .text:	section	.text,new
1143  0000               _CLK_ClockSwitchConfig:
1145  0000 89            	pushw	x
1146  0001 5204          	subw	sp,#4
1147       00000004      OFST:	set	4
1150                     ; 323     uint16_t DownCounter = CLK_TIMEOUT;
1152  0003 ae0491        	ldw	x,#1169
1153  0006 1f03          	ldw	(OFST-1,sp),x
1154                     ; 324     ErrorStatus Swif = ERROR;
1156  0008 7b02          	ld	a,(OFST-2,sp)
1157  000a 97            	ld	xl,a
1158                     ; 327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1160  000b 7b06          	ld	a,(OFST+2,sp)
1161  000d a1e1          	cp	a,#225
1162  000f 270e          	jreq	L461
1163  0011 a1d2          	cp	a,#210
1164  0013 270a          	jreq	L461
1165  0015 a1b4          	cp	a,#180
1166  0017 2706          	jreq	L461
1167  0019 ae0147        	ldw	x,#327
1168  001c cd00c7        	call	LC006
1169  001f               L461:
1170                     ; 328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1172  001f 7b05          	ld	a,(OFST+1,sp)
1173  0021 2709          	jreq	L471
1174  0023 4a            	dec	a
1175  0024 2706          	jreq	L471
1176  0026 ae0148        	ldw	x,#328
1177  0029 cd00c7        	call	LC006
1178  002c               L471:
1179                     ; 329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1181  002c 7b09          	ld	a,(OFST+5,sp)
1182  002e 2709          	jreq	L402
1183  0030 4a            	dec	a
1184  0031 2706          	jreq	L402
1185  0033 ae0149        	ldw	x,#329
1186  0036 cd00c7        	call	LC006
1187  0039               L402:
1188                     ; 330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1190  0039 7b0a          	ld	a,(OFST+6,sp)
1191  003b 2709          	jreq	L412
1192  003d 4a            	dec	a
1193  003e 2706          	jreq	L412
1194  0040 ae014a        	ldw	x,#330
1195  0043 cd00c7        	call	LC006
1196  0046               L412:
1197                     ; 333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1199  0046 c650c3        	ld	a,20675
1200  0049 6b01          	ld	(OFST-3,sp),a
1201                     ; 336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1203  004b 7b05          	ld	a,(OFST+1,sp)
1204  004d 4a            	dec	a
1205  004e 262d          	jrne	L544
1206                     ; 340         CLK->SWCR |= CLK_SWCR_SWEN;
1208  0050 721250c5      	bset	20677,#1
1209                     ; 343         if (ITState != DISABLE)
1211  0054 7b09          	ld	a,(OFST+5,sp)
1212  0056 2706          	jreq	L744
1213                     ; 345             CLK->SWCR |= CLK_SWCR_SWIEN;
1215  0058 721450c5      	bset	20677,#2
1217  005c 2004          	jra	L154
1218  005e               L744:
1219                     ; 349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1221  005e 721550c5      	bres	20677,#2
1222  0062               L154:
1223                     ; 353         CLK->SWR = (uint8_t)CLK_NewClock;
1225  0062 7b06          	ld	a,(OFST+2,sp)
1226  0064 c750c4        	ld	20676,a
1228  0067 2003          	jra	L754
1229  0069               L354:
1230                     ; 357             DownCounter--;
1232  0069 5a            	decw	x
1233  006a 1f03          	ldw	(OFST-1,sp),x
1234  006c               L754:
1235                     ; 355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1237  006c 720150c504    	btjf	20677,#0,L364
1239  0071 1e03          	ldw	x,(OFST-1,sp)
1240  0073 26f4          	jrne	L354
1241  0075               L364:
1242                     ; 360         if (DownCounter != 0)
1244  0075 1e03          	ldw	x,(OFST-1,sp)
1245                     ; 362             Swif = SUCCESS;
1247  0077 2617          	jrne	LC005
1248                     ; 366             Swif = ERROR;
1250  0079 0f02          	clr	(OFST-2,sp)
1251  007b 2017          	jra	L174
1252  007d               L544:
1253                     ; 374         if (ITState != DISABLE)
1255  007d 7b09          	ld	a,(OFST+5,sp)
1256  007f 2706          	jreq	L374
1257                     ; 376             CLK->SWCR |= CLK_SWCR_SWIEN;
1259  0081 721450c5      	bset	20677,#2
1261  0085 2004          	jra	L574
1262  0087               L374:
1263                     ; 380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1265  0087 721550c5      	bres	20677,#2
1266  008b               L574:
1267                     ; 384         CLK->SWR = (uint8_t)CLK_NewClock;
1269  008b 7b06          	ld	a,(OFST+2,sp)
1270  008d c750c4        	ld	20676,a
1271                     ; 388         Swif = SUCCESS;
1273  0090               LC005:
1275  0090 a601          	ld	a,#1
1276  0092 6b02          	ld	(OFST-2,sp),a
1277  0094               L174:
1278                     ; 393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1280  0094 7b0a          	ld	a,(OFST+6,sp)
1281  0096 260c          	jrne	L774
1283  0098 7b01          	ld	a,(OFST-3,sp)
1284  009a a1e1          	cp	a,#225
1285  009c 2606          	jrne	L774
1286                     ; 395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1288  009e 721150c0      	bres	20672,#0
1290  00a2 201e          	jra	L105
1291  00a4               L774:
1292                     ; 397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1294  00a4 7b0a          	ld	a,(OFST+6,sp)
1295  00a6 260c          	jrne	L305
1297  00a8 7b01          	ld	a,(OFST-3,sp)
1298  00aa a1d2          	cp	a,#210
1299  00ac 2606          	jrne	L305
1300                     ; 399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1302  00ae 721750c0      	bres	20672,#3
1304  00b2 200e          	jra	L105
1305  00b4               L305:
1306                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1308  00b4 7b0a          	ld	a,(OFST+6,sp)
1309  00b6 260a          	jrne	L105
1311  00b8 7b01          	ld	a,(OFST-3,sp)
1312  00ba a1b4          	cp	a,#180
1313  00bc 2604          	jrne	L105
1314                     ; 403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1316  00be 721150c1      	bres	20673,#0
1317  00c2               L105:
1318                     ; 406     return(Swif);
1320  00c2 7b02          	ld	a,(OFST-2,sp)
1323  00c4 5b06          	addw	sp,#6
1324  00c6 81            	ret	
1326  00c7               LC006:
1327  00c7 89            	pushw	x
1328  00c8 5f            	clrw	x
1329  00c9 89            	pushw	x
1330  00ca ae000c        	ldw	x,#L75
1331  00cd cd0000        	call	_assert_failed
1333  00d0 5b04          	addw	sp,#4
1334  00d2 81            	ret	
1472                     ; 416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1472                     ; 417 {
1473                     .text:	section	.text,new
1474  0000               _CLK_HSIPrescalerConfig:
1476  0000 88            	push	a
1477       00000000      OFST:	set	0
1480                     ; 420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1482  0001 4d            	tnz	a
1483  0002 271a          	jreq	L622
1484  0004 a108          	cp	a,#8
1485  0006 2716          	jreq	L622
1486  0008 a110          	cp	a,#16
1487  000a 2712          	jreq	L622
1488  000c a118          	cp	a,#24
1489  000e 270e          	jreq	L622
1490  0010 ae01a4        	ldw	x,#420
1491  0013 89            	pushw	x
1492  0014 5f            	clrw	x
1493  0015 89            	pushw	x
1494  0016 ae000c        	ldw	x,#L75
1495  0019 cd0000        	call	_assert_failed
1497  001c 5b04          	addw	sp,#4
1498  001e               L622:
1499                     ; 423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1501  001e c650c6        	ld	a,20678
1502  0021 a4e7          	and	a,#231
1503  0023 c750c6        	ld	20678,a
1504                     ; 426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1506  0026 c650c6        	ld	a,20678
1507  0029 1a01          	or	a,(OFST+1,sp)
1508  002b c750c6        	ld	20678,a
1509                     ; 428 }
1512  002e 84            	pop	a
1513  002f 81            	ret	
1649                     ; 439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1649                     ; 440 {
1650                     .text:	section	.text,new
1651  0000               _CLK_CCOConfig:
1653  0000 88            	push	a
1654       00000000      OFST:	set	0
1657                     ; 443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1659  0001 4d            	tnz	a
1660  0002 273e          	jreq	L042
1661  0004 a104          	cp	a,#4
1662  0006 273a          	jreq	L042
1663  0008 a102          	cp	a,#2
1664  000a 2736          	jreq	L042
1665  000c a108          	cp	a,#8
1666  000e 2732          	jreq	L042
1667  0010 a10a          	cp	a,#10
1668  0012 272e          	jreq	L042
1669  0014 a10c          	cp	a,#12
1670  0016 272a          	jreq	L042
1671  0018 a10e          	cp	a,#14
1672  001a 2726          	jreq	L042
1673  001c a110          	cp	a,#16
1674  001e 2722          	jreq	L042
1675  0020 a112          	cp	a,#18
1676  0022 271e          	jreq	L042
1677  0024 a114          	cp	a,#20
1678  0026 271a          	jreq	L042
1679  0028 a116          	cp	a,#22
1680  002a 2716          	jreq	L042
1681  002c a118          	cp	a,#24
1682  002e 2712          	jreq	L042
1683  0030 a11a          	cp	a,#26
1684  0032 270e          	jreq	L042
1685  0034 ae01bb        	ldw	x,#443
1686  0037 89            	pushw	x
1687  0038 5f            	clrw	x
1688  0039 89            	pushw	x
1689  003a ae000c        	ldw	x,#L75
1690  003d cd0000        	call	_assert_failed
1692  0040 5b04          	addw	sp,#4
1693  0042               L042:
1694                     ; 446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1696  0042 c650c9        	ld	a,20681
1697  0045 a4e1          	and	a,#225
1698  0047 c750c9        	ld	20681,a
1699                     ; 449     CLK->CCOR |= (uint8_t)CLK_CCO;
1701  004a c650c9        	ld	a,20681
1702  004d 1a01          	or	a,(OFST+1,sp)
1703  004f c750c9        	ld	20681,a
1704                     ; 452     CLK->CCOR |= CLK_CCOR_CCOEN;
1706  0052 721050c9      	bset	20681,#0
1707                     ; 454 }
1710  0056 84            	pop	a
1711  0057 81            	ret	
1777                     ; 464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1777                     ; 465 {
1778                     .text:	section	.text,new
1779  0000               _CLK_ITConfig:
1781  0000 89            	pushw	x
1782       00000000      OFST:	set	0
1785                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1787  0001 9f            	ld	a,xl
1788  0002 4d            	tnz	a
1789  0003 2709          	jreq	L252
1790  0005 9f            	ld	a,xl
1791  0006 4a            	dec	a
1792  0007 2705          	jreq	L252
1793  0009 ae01d4        	ldw	x,#468
1794  000c ad3f          	call	LC007
1795  000e               L252:
1796                     ; 469     assert_param(IS_CLK_IT_OK(CLK_IT));
1798  000e 7b01          	ld	a,(OFST+1,sp)
1799  0010 a10c          	cp	a,#12
1800  0012 2709          	jreq	L262
1801  0014 a11c          	cp	a,#28
1802  0016 2705          	jreq	L262
1803  0018 ae01d5        	ldw	x,#469
1804  001b ad30          	call	LC007
1805  001d               L262:
1806                     ; 471     if (NewState != DISABLE)
1808  001d 7b02          	ld	a,(OFST+2,sp)
1809  001f 2716          	jreq	L507
1810                     ; 473         switch (CLK_IT)
1812  0021 7b01          	ld	a,(OFST+1,sp)
1814                     ; 481         default:
1814                     ; 482             break;
1815  0023 a00c          	sub	a,#12
1816  0025 270a          	jreq	L146
1817  0027 a010          	sub	a,#16
1818  0029 2620          	jrne	L317
1819                     ; 475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1819                     ; 476             CLK->SWCR |= CLK_SWCR_SWIEN;
1821  002b 721450c5      	bset	20677,#2
1822                     ; 477             break;
1824  002f 201a          	jra	L317
1825  0031               L146:
1826                     ; 478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1826                     ; 479             CLK->CSSR |= CLK_CSSR_CSSDIE;
1828  0031 721450c8      	bset	20680,#2
1829                     ; 480             break;
1831  0035 2014          	jra	L317
1832                     ; 481         default:
1832                     ; 482             break;
1835  0037               L507:
1836                     ; 487         switch (CLK_IT)
1838  0037 7b01          	ld	a,(OFST+1,sp)
1840                     ; 495         default:
1840                     ; 496             break;
1841  0039 a00c          	sub	a,#12
1842  003b 270a          	jreq	L746
1843  003d a010          	sub	a,#16
1844  003f 260a          	jrne	L317
1845                     ; 489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1845                     ; 490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1847  0041 721550c5      	bres	20677,#2
1848                     ; 491             break;
1850  0045 2004          	jra	L317
1851  0047               L746:
1852                     ; 492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1852                     ; 493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1854  0047 721550c8      	bres	20680,#2
1855                     ; 494             break;
1856  004b               L317:
1857                     ; 500 }
1860  004b 85            	popw	x
1861  004c 81            	ret	
1862                     ; 495         default:
1862                     ; 496             break;
1865  004d               LC007:
1866  004d 89            	pushw	x
1867  004e 5f            	clrw	x
1868  004f 89            	pushw	x
1869  0050 ae000c        	ldw	x,#L75
1870  0053 cd0000        	call	_assert_failed
1872  0056 5b04          	addw	sp,#4
1873  0058 81            	ret	
1908                     ; 507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1908                     ; 508 {
1909                     .text:	section	.text,new
1910  0000               _CLK_SYSCLKConfig:
1912  0000 88            	push	a
1913       00000000      OFST:	set	0
1916                     ; 511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1918  0001 4d            	tnz	a
1919  0002 273a          	jreq	L472
1920  0004 a108          	cp	a,#8
1921  0006 2736          	jreq	L472
1922  0008 a110          	cp	a,#16
1923  000a 2732          	jreq	L472
1924  000c a118          	cp	a,#24
1925  000e 272e          	jreq	L472
1926  0010 a180          	cp	a,#128
1927  0012 272a          	jreq	L472
1928  0014 a181          	cp	a,#129
1929  0016 2726          	jreq	L472
1930  0018 a182          	cp	a,#130
1931  001a 2722          	jreq	L472
1932  001c a183          	cp	a,#131
1933  001e 271e          	jreq	L472
1934  0020 a184          	cp	a,#132
1935  0022 271a          	jreq	L472
1936  0024 a185          	cp	a,#133
1937  0026 2716          	jreq	L472
1938  0028 a186          	cp	a,#134
1939  002a 2712          	jreq	L472
1940  002c a187          	cp	a,#135
1941  002e 270e          	jreq	L472
1942  0030 ae01ff        	ldw	x,#511
1943  0033 89            	pushw	x
1944  0034 5f            	clrw	x
1945  0035 89            	pushw	x
1946  0036 ae000c        	ldw	x,#L75
1947  0039 cd0000        	call	_assert_failed
1949  003c 5b04          	addw	sp,#4
1950  003e               L472:
1951                     ; 513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1953  003e 7b01          	ld	a,(OFST+1,sp)
1954  0040 2b0e          	jrmi	L737
1955                     ; 515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1957  0042 c650c6        	ld	a,20678
1958  0045 a4e7          	and	a,#231
1959  0047 c750c6        	ld	20678,a
1960                     ; 516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1962  004a 7b01          	ld	a,(OFST+1,sp)
1963  004c a418          	and	a,#24
1965  004e 200c          	jra	L147
1966  0050               L737:
1967                     ; 520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1969  0050 c650c6        	ld	a,20678
1970  0053 a4f8          	and	a,#248
1971  0055 c750c6        	ld	20678,a
1972                     ; 521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1974  0058 7b01          	ld	a,(OFST+1,sp)
1975  005a a407          	and	a,#7
1976  005c               L147:
1977  005c ca50c6        	or	a,20678
1978  005f c750c6        	ld	20678,a
1979                     ; 524 }
1982  0062 84            	pop	a
1983  0063 81            	ret	
2040                     ; 531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2040                     ; 532 {
2041                     .text:	section	.text,new
2042  0000               _CLK_SWIMConfig:
2044  0000 88            	push	a
2045       00000000      OFST:	set	0
2048                     ; 535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2050  0001 4d            	tnz	a
2051  0002 2711          	jreq	L603
2052  0004 4a            	dec	a
2053  0005 270e          	jreq	L603
2054  0007 ae0217        	ldw	x,#535
2055  000a 89            	pushw	x
2056  000b 5f            	clrw	x
2057  000c 89            	pushw	x
2058  000d ae000c        	ldw	x,#L75
2059  0010 cd0000        	call	_assert_failed
2061  0013 5b04          	addw	sp,#4
2062  0015               L603:
2063                     ; 537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2065  0015 7b01          	ld	a,(OFST+1,sp)
2066  0017 2706          	jreq	L177
2067                     ; 540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2069  0019 721050cd      	bset	20685,#0
2071  001d 2004          	jra	L377
2072  001f               L177:
2073                     ; 545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2075  001f 721150cd      	bres	20685,#0
2076  0023               L377:
2077                     ; 548 }
2080  0023 84            	pop	a
2081  0024 81            	ret	
2105                     ; 557 void CLK_ClockSecuritySystemEnable(void)
2105                     ; 558 {
2106                     .text:	section	.text,new
2107  0000               _CLK_ClockSecuritySystemEnable:
2111                     ; 560     CLK->CSSR |= CLK_CSSR_CSSEN;
2113  0000 721050c8      	bset	20680,#0
2114                     ; 561 }
2117  0004 81            	ret	
2142                     ; 569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2142                     ; 570 {
2143                     .text:	section	.text,new
2144  0000               _CLK_GetSYSCLKSource:
2148                     ; 571     return((CLK_Source_TypeDef)CLK->CMSR);
2150  0000 c650c3        	ld	a,20675
2153  0003 81            	ret	
2210                     ; 579 uint32_t CLK_GetClockFreq(void)
2210                     ; 580 {
2211                     .text:	section	.text,new
2212  0000               _CLK_GetClockFreq:
2214  0000 5209          	subw	sp,#9
2215       00000009      OFST:	set	9
2218                     ; 582     uint32_t clockfrequency = 0;
2220  0002 96            	ldw	x,sp
2221  0003 1c0005        	addw	x,#OFST-4
2222  0006 cd0000        	call	c_ltor
2224                     ; 583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2226                     ; 584     uint8_t tmp = 0, presc = 0;
2230                     ; 587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2232  0009 c650c3        	ld	a,20675
2233  000c 6b09          	ld	(OFST+0,sp),a
2234                     ; 589     if (clocksource == CLK_SOURCE_HSI)
2236  000e a1e1          	cp	a,#225
2237  0010 2634          	jrne	L1401
2238                     ; 591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2240  0012 c650c6        	ld	a,20678
2241  0015 a418          	and	a,#24
2242                     ; 592         tmp = (uint8_t)(tmp >> 3);
2244  0017 44            	srl	a
2245  0018 44            	srl	a
2246  0019 44            	srl	a
2247                     ; 593         presc = HSIDivFactor[tmp];
2249  001a 5f            	clrw	x
2250  001b 97            	ld	xl,a
2251  001c d60000        	ld	a,(_HSIDivFactor,x)
2252  001f 6b09          	ld	(OFST+0,sp),a
2253                     ; 594         clockfrequency = HSI_VALUE / presc;
2255  0021 b703          	ld	c_lreg+3,a
2256  0023 3f02          	clr	c_lreg+2
2257  0025 3f01          	clr	c_lreg+1
2258  0027 3f00          	clr	c_lreg
2259  0029 96            	ldw	x,sp
2260  002a 5c            	incw	x
2261  002b cd0000        	call	c_rtol
2263  002e ae2400        	ldw	x,#9216
2264  0031 bf02          	ldw	c_lreg+2,x
2265  0033 ae00f4        	ldw	x,#244
2266  0036 bf00          	ldw	c_lreg,x
2267  0038 96            	ldw	x,sp
2268  0039 5c            	incw	x
2269  003a cd0000        	call	c_ludv
2271  003d 96            	ldw	x,sp
2272  003e 1c0005        	addw	x,#OFST-4
2273  0041 cd0000        	call	c_rtol
2276  0044 2018          	jra	L3401
2277  0046               L1401:
2278                     ; 596     else if ( clocksource == CLK_SOURCE_LSI)
2280  0046 a1d2          	cp	a,#210
2281  0048 260a          	jrne	L5401
2282                     ; 598         clockfrequency = LSI_VALUE;
2284  004a aef400        	ldw	x,#62464
2285  004d 1f07          	ldw	(OFST-2,sp),x
2286  004f ae0001        	ldw	x,#1
2288  0052 2008          	jp	LC008
2289  0054               L5401:
2290                     ; 602         clockfrequency = HSE_VALUE;
2292  0054 ae2400        	ldw	x,#9216
2293  0057 1f07          	ldw	(OFST-2,sp),x
2294  0059 ae00f4        	ldw	x,#244
2295  005c               LC008:
2296  005c 1f05          	ldw	(OFST-4,sp),x
2297  005e               L3401:
2298                     ; 605     return((uint32_t)clockfrequency);
2300  005e 96            	ldw	x,sp
2301  005f 1c0005        	addw	x,#OFST-4
2302  0062 cd0000        	call	c_ltor
2306  0065 5b09          	addw	sp,#9
2307  0067 81            	ret	
2407                     ; 616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2407                     ; 617 {
2408                     .text:	section	.text,new
2409  0000               _CLK_AdjustHSICalibrationValue:
2411  0000 88            	push	a
2412       00000000      OFST:	set	0
2415                     ; 620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2417  0001 4d            	tnz	a
2418  0002 272a          	jreq	L623
2419  0004 a101          	cp	a,#1
2420  0006 2726          	jreq	L623
2421  0008 a102          	cp	a,#2
2422  000a 2722          	jreq	L623
2423  000c a103          	cp	a,#3
2424  000e 271e          	jreq	L623
2425  0010 a104          	cp	a,#4
2426  0012 271a          	jreq	L623
2427  0014 a105          	cp	a,#5
2428  0016 2716          	jreq	L623
2429  0018 a106          	cp	a,#6
2430  001a 2712          	jreq	L623
2431  001c a107          	cp	a,#7
2432  001e 270e          	jreq	L623
2433  0020 ae026c        	ldw	x,#620
2434  0023 89            	pushw	x
2435  0024 5f            	clrw	x
2436  0025 89            	pushw	x
2437  0026 ae000c        	ldw	x,#L75
2438  0029 cd0000        	call	_assert_failed
2440  002c 5b04          	addw	sp,#4
2441  002e               L623:
2442                     ; 623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2444  002e c650cc        	ld	a,20684
2445  0031 a4f8          	and	a,#248
2446  0033 1a01          	or	a,(OFST+1,sp)
2447  0035 c750cc        	ld	20684,a
2448                     ; 625 }
2451  0038 84            	pop	a
2452  0039 81            	ret	
2476                     ; 636 void CLK_SYSCLKEmergencyClear(void)
2476                     ; 637 {
2477                     .text:	section	.text,new
2478  0000               _CLK_SYSCLKEmergencyClear:
2482                     ; 638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2484  0000 721150c5      	bres	20677,#0
2485                     ; 639 }
2488  0004 81            	ret	
2638                     ; 648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2638                     ; 649 {
2639                     .text:	section	.text,new
2640  0000               _CLK_GetFlagStatus:
2642  0000 89            	pushw	x
2643  0001 5203          	subw	sp,#3
2644       00000003      OFST:	set	3
2647                     ; 651     uint16_t statusreg = 0;
2649                     ; 652     uint8_t tmpreg = 0;
2651                     ; 653     FlagStatus bitstatus = RESET;
2653                     ; 656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2655  0003 1e04          	ldw	x,(OFST+1,sp)
2656  0005 a30110        	cpw	x,#272
2657  0008 2736          	jreq	L243
2658  000a a30102        	cpw	x,#258
2659  000d 2731          	jreq	L243
2660  000f a30202        	cpw	x,#514
2661  0012 272c          	jreq	L243
2662  0014 a30308        	cpw	x,#776
2663  0017 2727          	jreq	L243
2664  0019 a30301        	cpw	x,#769
2665  001c 2722          	jreq	L243
2666  001e a30408        	cpw	x,#1032
2667  0021 271d          	jreq	L243
2668  0023 a30402        	cpw	x,#1026
2669  0026 2718          	jreq	L243
2670  0028 a30504        	cpw	x,#1284
2671  002b 2713          	jreq	L243
2672  002d a30502        	cpw	x,#1282
2673  0030 270e          	jreq	L243
2674  0032 ae0290        	ldw	x,#656
2675  0035 89            	pushw	x
2676  0036 5f            	clrw	x
2677  0037 89            	pushw	x
2678  0038 ae000c        	ldw	x,#L75
2679  003b cd0000        	call	_assert_failed
2681  003e 5b04          	addw	sp,#4
2682  0040               L243:
2683                     ; 659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2685  0040 7b04          	ld	a,(OFST+1,sp)
2686  0042 97            	ld	xl,a
2687  0043 4f            	clr	a
2688  0044 02            	rlwa	x,a
2689  0045 1f01          	ldw	(OFST-2,sp),x
2690                     ; 662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2692  0047 a30100        	cpw	x,#256
2693  004a 2605          	jrne	L7021
2694                     ; 664         tmpreg = CLK->ICKR;
2696  004c c650c0        	ld	a,20672
2698  004f 2021          	jra	L1121
2699  0051               L7021:
2700                     ; 666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2702  0051 a30200        	cpw	x,#512
2703  0054 2605          	jrne	L3121
2704                     ; 668         tmpreg = CLK->ECKR;
2706  0056 c650c1        	ld	a,20673
2708  0059 2017          	jra	L1121
2709  005b               L3121:
2710                     ; 670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2712  005b a30300        	cpw	x,#768
2713  005e 2605          	jrne	L7121
2714                     ; 672         tmpreg = CLK->SWCR;
2716  0060 c650c5        	ld	a,20677
2718  0063 200d          	jra	L1121
2719  0065               L7121:
2720                     ; 674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2722  0065 a30400        	cpw	x,#1024
2723  0068 2605          	jrne	L3221
2724                     ; 676         tmpreg = CLK->CSSR;
2726  006a c650c8        	ld	a,20680
2728  006d 2003          	jra	L1121
2729  006f               L3221:
2730                     ; 680         tmpreg = CLK->CCOR;
2732  006f c650c9        	ld	a,20681
2733  0072               L1121:
2734  0072 6b03          	ld	(OFST+0,sp),a
2735                     ; 683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2737  0074 7b05          	ld	a,(OFST+2,sp)
2738  0076 1503          	bcp	a,(OFST+0,sp)
2739  0078 2704          	jreq	L7221
2740                     ; 685         bitstatus = SET;
2742  007a a601          	ld	a,#1
2744  007c 2001          	jra	L1321
2745  007e               L7221:
2746                     ; 689         bitstatus = RESET;
2748  007e 4f            	clr	a
2749  007f               L1321:
2750                     ; 693     return((FlagStatus)bitstatus);
2754  007f 5b05          	addw	sp,#5
2755  0081 81            	ret	
2802                     ; 703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2802                     ; 704 {
2803                     .text:	section	.text,new
2804  0000               _CLK_GetITStatus:
2806  0000 88            	push	a
2807  0001 88            	push	a
2808       00000001      OFST:	set	1
2811                     ; 706     ITStatus bitstatus = RESET;
2813  0002 0f01          	clr	(OFST+0,sp)
2814                     ; 709     assert_param(IS_CLK_IT_OK(CLK_IT));
2816  0004 a10c          	cp	a,#12
2817  0006 2712          	jreq	L453
2818  0008 a11c          	cp	a,#28
2819  000a 270e          	jreq	L453
2820  000c ae02c5        	ldw	x,#709
2821  000f 89            	pushw	x
2822  0010 5f            	clrw	x
2823  0011 89            	pushw	x
2824  0012 ae000c        	ldw	x,#L75
2825  0015 cd0000        	call	_assert_failed
2827  0018 5b04          	addw	sp,#4
2828  001a               L453:
2829                     ; 711     if (CLK_IT == CLK_IT_SWIF)
2831  001a 7b02          	ld	a,(OFST+1,sp)
2832  001c a11c          	cp	a,#28
2833  001e 260b          	jrne	L5521
2834                     ; 714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2836  0020 c650c5        	ld	a,20677
2837  0023 1402          	and	a,(OFST+1,sp)
2838  0025 a10c          	cp	a,#12
2839  0027 260f          	jrne	L5621
2840                     ; 716             bitstatus = SET;
2842  0029 2009          	jp	LC010
2843                     ; 720             bitstatus = RESET;
2844  002b               L5521:
2845                     ; 726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2847  002b c650c8        	ld	a,20680
2848  002e 1402          	and	a,(OFST+1,sp)
2849  0030 a10c          	cp	a,#12
2850  0032 2604          	jrne	L5621
2851                     ; 728             bitstatus = SET;
2853  0034               LC010:
2855  0034 a601          	ld	a,#1
2857  0036 2001          	jra	L3621
2858  0038               L5621:
2859                     ; 732             bitstatus = RESET;
2862  0038 4f            	clr	a
2863  0039               L3621:
2864                     ; 737     return bitstatus;
2868  0039 85            	popw	x
2869  003a 81            	ret	
2906                     ; 747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2906                     ; 748 {
2907                     .text:	section	.text,new
2908  0000               _CLK_ClearITPendingBit:
2910  0000 88            	push	a
2911       00000000      OFST:	set	0
2914                     ; 751     assert_param(IS_CLK_IT_OK(CLK_IT));
2916  0001 a10c          	cp	a,#12
2917  0003 2712          	jreq	L663
2918  0005 a11c          	cp	a,#28
2919  0007 270e          	jreq	L663
2920  0009 ae02ef        	ldw	x,#751
2921  000c 89            	pushw	x
2922  000d 5f            	clrw	x
2923  000e 89            	pushw	x
2924  000f ae000c        	ldw	x,#L75
2925  0012 cd0000        	call	_assert_failed
2927  0015 5b04          	addw	sp,#4
2928  0017               L663:
2929                     ; 753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2931  0017 7b01          	ld	a,(OFST+1,sp)
2932  0019 a10c          	cp	a,#12
2933  001b 2606          	jrne	L7031
2934                     ; 756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2936  001d 721750c8      	bres	20680,#3
2938  0021 2004          	jra	L1131
2939  0023               L7031:
2940                     ; 761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2942  0023 721750c5      	bres	20677,#3
2943  0027               L1131:
2944                     ; 764 }
2947  0027 84            	pop	a
2948  0028 81            	ret	
2983                     	xdef	_CLKPrescTable
2984                     	xdef	_HSIDivFactor
2985                     	xdef	_CLK_ClearITPendingBit
2986                     	xdef	_CLK_GetITStatus
2987                     	xdef	_CLK_GetFlagStatus
2988                     	xdef	_CLK_GetSYSCLKSource
2989                     	xdef	_CLK_GetClockFreq
2990                     	xdef	_CLK_AdjustHSICalibrationValue
2991                     	xdef	_CLK_SYSCLKEmergencyClear
2992                     	xdef	_CLK_ClockSecuritySystemEnable
2993                     	xdef	_CLK_SWIMConfig
2994                     	xdef	_CLK_SYSCLKConfig
2995                     	xdef	_CLK_ITConfig
2996                     	xdef	_CLK_CCOConfig
2997                     	xdef	_CLK_HSIPrescalerConfig
2998                     	xdef	_CLK_ClockSwitchConfig
2999                     	xdef	_CLK_PeripheralClockConfig
3000                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3001                     	xdef	_CLK_FastHaltWakeUpCmd
3002                     	xdef	_CLK_ClockSwitchCmd
3003                     	xdef	_CLK_CCOCmd
3004                     	xdef	_CLK_LSICmd
3005                     	xdef	_CLK_HSICmd
3006                     	xdef	_CLK_HSECmd
3007                     	xdef	_CLK_DeInit
3008                     	xref	_assert_failed
3009                     	switch	.const
3010  000c               L75:
3011  000c 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
3012  001e 6965735c7374  	dc.b	"ies\stm8s_stdperip"
3013  0030 685f64726976  	dc.b	"h_driver\src\stm8s"
3014  0042 5f636c6b2e63  	dc.b	"_clk.c",0
3015                     	xref.b	c_lreg
3035                     	xref	c_ludv
3036                     	xref	c_rtol
3037                     	xref	c_ltor
3038                     	end
