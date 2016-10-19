   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     .const:	section	.text
   5  0000               _HSIDivFactor:
   6  0000 01            	dc.b	1
   7  0001 02            	dc.b	2
   8  0002 04            	dc.b	4
   9  0003 08            	dc.b	8
  10  0004               _CLKPrescTable:
  11  0004 01            	dc.b	1
  12  0005 02            	dc.b	2
  13  0006 04            	dc.b	4
  14  0007 08            	dc.b	8
  15  0008 0a            	dc.b	10
  16  0009 10            	dc.b	16
  17  000a 14            	dc.b	20
  18  000b 28            	dc.b	40
  47                     ; 66 void CLK_DeInit(void)
  47                     ; 67 {
  49                     	switch	.text
  50  0000               _CLK_DeInit:
  54                     ; 69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  56  0000 350150c0      	mov	20672,#1
  57                     ; 70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  59  0004 725f50c1      	clr	20673
  60                     ; 71     CLK->SWR  = CLK_SWR_RESET_VALUE;
  62  0008 35e150c4      	mov	20676,#225
  63                     ; 72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  65  000c 725f50c5      	clr	20677
  66                     ; 73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  68  0010 351850c6      	mov	20678,#24
  69                     ; 74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  71  0014 35ff50c7      	mov	20679,#255
  72                     ; 75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  74  0018 35ff50ca      	mov	20682,#255
  75                     ; 76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  77  001c 725f50c8      	clr	20680
  78                     ; 77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  80  0020 725f50c9      	clr	20681
  82  0024               L52:
  83                     ; 78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  85  0024 c650c9        	ld	a,20681
  86  0027 a501          	bcp	a,#1
  87  0029 26f9          	jrne	L52
  88                     ; 80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  90  002b 725f50c9      	clr	20681
  91                     ; 81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  93  002f 725f50cc      	clr	20684
  94                     ; 82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
  96  0033 725f50cd      	clr	20685
  97                     ; 84 }
 100  0037 81            	ret
 157                     ; 95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 157                     ; 96 {
 158                     	switch	.text
 159  0038               _CLK_FastHaltWakeUpCmd:
 161  0038 88            	push	a
 162       00000000      OFST:	set	0
 165                     ; 99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 167  0039 4d            	tnz	a
 168  003a 2704          	jreq	L21
 169  003c a101          	cp	a,#1
 170  003e 2603          	jrne	L01
 171  0040               L21:
 172  0040 4f            	clr	a
 173  0041 2010          	jra	L41
 174  0043               L01:
 175  0043 ae0063        	ldw	x,#99
 176  0046 89            	pushw	x
 177  0047 ae0000        	ldw	x,#0
 178  004a 89            	pushw	x
 179  004b ae000c        	ldw	x,#L75
 180  004e cd0000        	call	_assert_failed
 182  0051 5b04          	addw	sp,#4
 183  0053               L41:
 184                     ; 101     if (NewState != DISABLE)
 186  0053 0d01          	tnz	(OFST+1,sp)
 187  0055 2706          	jreq	L16
 188                     ; 104         CLK->ICKR |= CLK_ICKR_FHWU;
 190  0057 721450c0      	bset	20672,#2
 192  005b 2004          	jra	L36
 193  005d               L16:
 194                     ; 109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 196  005d 721550c0      	bres	20672,#2
 197  0061               L36:
 198                     ; 112 }
 201  0061 84            	pop	a
 202  0062 81            	ret
 238                     ; 119 void CLK_HSECmd(FunctionalState NewState)
 238                     ; 120 {
 239                     	switch	.text
 240  0063               _CLK_HSECmd:
 242  0063 88            	push	a
 243       00000000      OFST:	set	0
 246                     ; 123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 248  0064 4d            	tnz	a
 249  0065 2704          	jreq	L22
 250  0067 a101          	cp	a,#1
 251  0069 2603          	jrne	L02
 252  006b               L22:
 253  006b 4f            	clr	a
 254  006c 2010          	jra	L42
 255  006e               L02:
 256  006e ae007b        	ldw	x,#123
 257  0071 89            	pushw	x
 258  0072 ae0000        	ldw	x,#0
 259  0075 89            	pushw	x
 260  0076 ae000c        	ldw	x,#L75
 261  0079 cd0000        	call	_assert_failed
 263  007c 5b04          	addw	sp,#4
 264  007e               L42:
 265                     ; 125     if (NewState != DISABLE)
 267  007e 0d01          	tnz	(OFST+1,sp)
 268  0080 2706          	jreq	L301
 269                     ; 128         CLK->ECKR |= CLK_ECKR_HSEEN;
 271  0082 721050c1      	bset	20673,#0
 273  0086 2004          	jra	L501
 274  0088               L301:
 275                     ; 133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 277  0088 721150c1      	bres	20673,#0
 278  008c               L501:
 279                     ; 136 }
 282  008c 84            	pop	a
 283  008d 81            	ret
 319                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 319                     ; 144 {
 320                     	switch	.text
 321  008e               _CLK_HSICmd:
 323  008e 88            	push	a
 324       00000000      OFST:	set	0
 327                     ; 147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 329  008f 4d            	tnz	a
 330  0090 2704          	jreq	L23
 331  0092 a101          	cp	a,#1
 332  0094 2603          	jrne	L03
 333  0096               L23:
 334  0096 4f            	clr	a
 335  0097 2010          	jra	L43
 336  0099               L03:
 337  0099 ae0093        	ldw	x,#147
 338  009c 89            	pushw	x
 339  009d ae0000        	ldw	x,#0
 340  00a0 89            	pushw	x
 341  00a1 ae000c        	ldw	x,#L75
 342  00a4 cd0000        	call	_assert_failed
 344  00a7 5b04          	addw	sp,#4
 345  00a9               L43:
 346                     ; 149     if (NewState != DISABLE)
 348  00a9 0d01          	tnz	(OFST+1,sp)
 349  00ab 2706          	jreq	L521
 350                     ; 152         CLK->ICKR |= CLK_ICKR_HSIEN;
 352  00ad 721050c0      	bset	20672,#0
 354  00b1 2004          	jra	L721
 355  00b3               L521:
 356                     ; 157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 358  00b3 721150c0      	bres	20672,#0
 359  00b7               L721:
 360                     ; 160 }
 363  00b7 84            	pop	a
 364  00b8 81            	ret
 400                     ; 167 void CLK_LSICmd(FunctionalState NewState)
 400                     ; 168 {
 401                     	switch	.text
 402  00b9               _CLK_LSICmd:
 404  00b9 88            	push	a
 405       00000000      OFST:	set	0
 408                     ; 171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 410  00ba 4d            	tnz	a
 411  00bb 2704          	jreq	L24
 412  00bd a101          	cp	a,#1
 413  00bf 2603          	jrne	L04
 414  00c1               L24:
 415  00c1 4f            	clr	a
 416  00c2 2010          	jra	L44
 417  00c4               L04:
 418  00c4 ae00ab        	ldw	x,#171
 419  00c7 89            	pushw	x
 420  00c8 ae0000        	ldw	x,#0
 421  00cb 89            	pushw	x
 422  00cc ae000c        	ldw	x,#L75
 423  00cf cd0000        	call	_assert_failed
 425  00d2 5b04          	addw	sp,#4
 426  00d4               L44:
 427                     ; 173     if (NewState != DISABLE)
 429  00d4 0d01          	tnz	(OFST+1,sp)
 430  00d6 2706          	jreq	L741
 431                     ; 176         CLK->ICKR |= CLK_ICKR_LSIEN;
 433  00d8 721650c0      	bset	20672,#3
 435  00dc 2004          	jra	L151
 436  00de               L741:
 437                     ; 181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 439  00de 721750c0      	bres	20672,#3
 440  00e2               L151:
 441                     ; 184 }
 444  00e2 84            	pop	a
 445  00e3 81            	ret
 481                     ; 192 void CLK_CCOCmd(FunctionalState NewState)
 481                     ; 193 {
 482                     	switch	.text
 483  00e4               _CLK_CCOCmd:
 485  00e4 88            	push	a
 486       00000000      OFST:	set	0
 489                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 491  00e5 4d            	tnz	a
 492  00e6 2704          	jreq	L25
 493  00e8 a101          	cp	a,#1
 494  00ea 2603          	jrne	L05
 495  00ec               L25:
 496  00ec 4f            	clr	a
 497  00ed 2010          	jra	L45
 498  00ef               L05:
 499  00ef ae00c4        	ldw	x,#196
 500  00f2 89            	pushw	x
 501  00f3 ae0000        	ldw	x,#0
 502  00f6 89            	pushw	x
 503  00f7 ae000c        	ldw	x,#L75
 504  00fa cd0000        	call	_assert_failed
 506  00fd 5b04          	addw	sp,#4
 507  00ff               L45:
 508                     ; 198     if (NewState != DISABLE)
 510  00ff 0d01          	tnz	(OFST+1,sp)
 511  0101 2706          	jreq	L171
 512                     ; 201         CLK->CCOR |= CLK_CCOR_CCOEN;
 514  0103 721050c9      	bset	20681,#0
 516  0107 2004          	jra	L371
 517  0109               L171:
 518                     ; 206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 520  0109 721150c9      	bres	20681,#0
 521  010d               L371:
 522                     ; 209 }
 525  010d 84            	pop	a
 526  010e 81            	ret
 562                     ; 218 void CLK_ClockSwitchCmd(FunctionalState NewState)
 562                     ; 219 {
 563                     	switch	.text
 564  010f               _CLK_ClockSwitchCmd:
 566  010f 88            	push	a
 567       00000000      OFST:	set	0
 570                     ; 222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 572  0110 4d            	tnz	a
 573  0111 2704          	jreq	L26
 574  0113 a101          	cp	a,#1
 575  0115 2603          	jrne	L06
 576  0117               L26:
 577  0117 4f            	clr	a
 578  0118 2010          	jra	L46
 579  011a               L06:
 580  011a ae00de        	ldw	x,#222
 581  011d 89            	pushw	x
 582  011e ae0000        	ldw	x,#0
 583  0121 89            	pushw	x
 584  0122 ae000c        	ldw	x,#L75
 585  0125 cd0000        	call	_assert_failed
 587  0128 5b04          	addw	sp,#4
 588  012a               L46:
 589                     ; 224     if (NewState != DISABLE )
 591  012a 0d01          	tnz	(OFST+1,sp)
 592  012c 2706          	jreq	L312
 593                     ; 227         CLK->SWCR |= CLK_SWCR_SWEN;
 595  012e 721250c5      	bset	20677,#1
 597  0132 2004          	jra	L512
 598  0134               L312:
 599                     ; 232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 601  0134 721350c5      	bres	20677,#1
 602  0138               L512:
 603                     ; 235 }
 606  0138 84            	pop	a
 607  0139 81            	ret
 644                     ; 245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 644                     ; 246 {
 645                     	switch	.text
 646  013a               _CLK_SlowActiveHaltWakeUpCmd:
 648  013a 88            	push	a
 649       00000000      OFST:	set	0
 652                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 654  013b 4d            	tnz	a
 655  013c 2704          	jreq	L27
 656  013e a101          	cp	a,#1
 657  0140 2603          	jrne	L07
 658  0142               L27:
 659  0142 4f            	clr	a
 660  0143 2010          	jra	L47
 661  0145               L07:
 662  0145 ae00f9        	ldw	x,#249
 663  0148 89            	pushw	x
 664  0149 ae0000        	ldw	x,#0
 665  014c 89            	pushw	x
 666  014d ae000c        	ldw	x,#L75
 667  0150 cd0000        	call	_assert_failed
 669  0153 5b04          	addw	sp,#4
 670  0155               L47:
 671                     ; 251     if (NewState != DISABLE)
 673  0155 0d01          	tnz	(OFST+1,sp)
 674  0157 2706          	jreq	L532
 675                     ; 254         CLK->ICKR |= CLK_ICKR_SWUAH;
 677  0159 721a50c0      	bset	20672,#5
 679  015d 2004          	jra	L732
 680  015f               L532:
 681                     ; 259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 683  015f 721b50c0      	bres	20672,#5
 684  0163               L732:
 685                     ; 262 }
 688  0163 84            	pop	a
 689  0164 81            	ret
 849                     ; 272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 849                     ; 273 {
 850                     	switch	.text
 851  0165               _CLK_PeripheralClockConfig:
 853  0165 89            	pushw	x
 854       00000000      OFST:	set	0
 857                     ; 276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 859  0166 9f            	ld	a,xl
 860  0167 4d            	tnz	a
 861  0168 2705          	jreq	L201
 862  016a 9f            	ld	a,xl
 863  016b a101          	cp	a,#1
 864  016d 2603          	jrne	L001
 865  016f               L201:
 866  016f 4f            	clr	a
 867  0170 2010          	jra	L401
 868  0172               L001:
 869  0172 ae0114        	ldw	x,#276
 870  0175 89            	pushw	x
 871  0176 ae0000        	ldw	x,#0
 872  0179 89            	pushw	x
 873  017a ae000c        	ldw	x,#L75
 874  017d cd0000        	call	_assert_failed
 876  0180 5b04          	addw	sp,#4
 877  0182               L401:
 878                     ; 277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 880  0182 0d01          	tnz	(OFST+1,sp)
 881  0184 274e          	jreq	L011
 882  0186 7b01          	ld	a,(OFST+1,sp)
 883  0188 a101          	cp	a,#1
 884  018a 2748          	jreq	L011
 885  018c 7b01          	ld	a,(OFST+1,sp)
 886  018e a103          	cp	a,#3
 887  0190 2742          	jreq	L011
 888  0192 7b01          	ld	a,(OFST+1,sp)
 889  0194 a103          	cp	a,#3
 890  0196 273c          	jreq	L011
 891  0198 7b01          	ld	a,(OFST+1,sp)
 892  019a a103          	cp	a,#3
 893  019c 2736          	jreq	L011
 894  019e 7b01          	ld	a,(OFST+1,sp)
 895  01a0 a104          	cp	a,#4
 896  01a2 2730          	jreq	L011
 897  01a4 7b01          	ld	a,(OFST+1,sp)
 898  01a6 a105          	cp	a,#5
 899  01a8 272a          	jreq	L011
 900  01aa 7b01          	ld	a,(OFST+1,sp)
 901  01ac a105          	cp	a,#5
 902  01ae 2724          	jreq	L011
 903  01b0 7b01          	ld	a,(OFST+1,sp)
 904  01b2 a104          	cp	a,#4
 905  01b4 271e          	jreq	L011
 906  01b6 7b01          	ld	a,(OFST+1,sp)
 907  01b8 a106          	cp	a,#6
 908  01ba 2718          	jreq	L011
 909  01bc 7b01          	ld	a,(OFST+1,sp)
 910  01be a107          	cp	a,#7
 911  01c0 2712          	jreq	L011
 912  01c2 7b01          	ld	a,(OFST+1,sp)
 913  01c4 a117          	cp	a,#23
 914  01c6 270c          	jreq	L011
 915  01c8 7b01          	ld	a,(OFST+1,sp)
 916  01ca a113          	cp	a,#19
 917  01cc 2706          	jreq	L011
 918  01ce 7b01          	ld	a,(OFST+1,sp)
 919  01d0 a112          	cp	a,#18
 920  01d2 2603          	jrne	L601
 921  01d4               L011:
 922  01d4 4f            	clr	a
 923  01d5 2010          	jra	L211
 924  01d7               L601:
 925  01d7 ae0115        	ldw	x,#277
 926  01da 89            	pushw	x
 927  01db ae0000        	ldw	x,#0
 928  01de 89            	pushw	x
 929  01df ae000c        	ldw	x,#L75
 930  01e2 cd0000        	call	_assert_failed
 932  01e5 5b04          	addw	sp,#4
 933  01e7               L211:
 934                     ; 279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 936  01e7 7b01          	ld	a,(OFST+1,sp)
 937  01e9 a510          	bcp	a,#16
 938  01eb 2633          	jrne	L323
 939                     ; 281         if (NewState != DISABLE)
 941  01ed 0d02          	tnz	(OFST+2,sp)
 942  01ef 2717          	jreq	L523
 943                     ; 284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 945  01f1 7b01          	ld	a,(OFST+1,sp)
 946  01f3 a40f          	and	a,#15
 947  01f5 5f            	clrw	x
 948  01f6 97            	ld	xl,a
 949  01f7 a601          	ld	a,#1
 950  01f9 5d            	tnzw	x
 951  01fa 2704          	jreq	L411
 952  01fc               L611:
 953  01fc 48            	sll	a
 954  01fd 5a            	decw	x
 955  01fe 26fc          	jrne	L611
 956  0200               L411:
 957  0200 ca50c7        	or	a,20679
 958  0203 c750c7        	ld	20679,a
 960  0206 2049          	jra	L133
 961  0208               L523:
 962                     ; 289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 964  0208 7b01          	ld	a,(OFST+1,sp)
 965  020a a40f          	and	a,#15
 966  020c 5f            	clrw	x
 967  020d 97            	ld	xl,a
 968  020e a601          	ld	a,#1
 969  0210 5d            	tnzw	x
 970  0211 2704          	jreq	L021
 971  0213               L221:
 972  0213 48            	sll	a
 973  0214 5a            	decw	x
 974  0215 26fc          	jrne	L221
 975  0217               L021:
 976  0217 43            	cpl	a
 977  0218 c450c7        	and	a,20679
 978  021b c750c7        	ld	20679,a
 979  021e 2031          	jra	L133
 980  0220               L323:
 981                     ; 294         if (NewState != DISABLE)
 983  0220 0d02          	tnz	(OFST+2,sp)
 984  0222 2717          	jreq	L333
 985                     ; 297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 987  0224 7b01          	ld	a,(OFST+1,sp)
 988  0226 a40f          	and	a,#15
 989  0228 5f            	clrw	x
 990  0229 97            	ld	xl,a
 991  022a a601          	ld	a,#1
 992  022c 5d            	tnzw	x
 993  022d 2704          	jreq	L421
 994  022f               L621:
 995  022f 48            	sll	a
 996  0230 5a            	decw	x
 997  0231 26fc          	jrne	L621
 998  0233               L421:
 999  0233 ca50ca        	or	a,20682
1000  0236 c750ca        	ld	20682,a
1002  0239 2016          	jra	L133
1003  023b               L333:
1004                     ; 302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1006  023b 7b01          	ld	a,(OFST+1,sp)
1007  023d a40f          	and	a,#15
1008  023f 5f            	clrw	x
1009  0240 97            	ld	xl,a
1010  0241 a601          	ld	a,#1
1011  0243 5d            	tnzw	x
1012  0244 2704          	jreq	L031
1013  0246               L231:
1014  0246 48            	sll	a
1015  0247 5a            	decw	x
1016  0248 26fc          	jrne	L231
1017  024a               L031:
1018  024a 43            	cpl	a
1019  024b c450ca        	and	a,20682
1020  024e c750ca        	ld	20682,a
1021  0251               L133:
1022                     ; 306 }
1025  0251 85            	popw	x
1026  0252 81            	ret
1215                     ; 319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1215                     ; 320 {
1216                     	switch	.text
1217  0253               _CLK_ClockSwitchConfig:
1219  0253 89            	pushw	x
1220  0254 5204          	subw	sp,#4
1221       00000004      OFST:	set	4
1224                     ; 323     uint16_t DownCounter = CLK_TIMEOUT;
1226  0256 ae0491        	ldw	x,#1169
1227  0259 1f03          	ldw	(OFST-1,sp),x
1228                     ; 324     ErrorStatus Swif = ERROR;
1230  025b 7b02          	ld	a,(OFST-2,sp)
1231  025d 97            	ld	xl,a
1232                     ; 327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1234  025e 7b06          	ld	a,(OFST+2,sp)
1235  0260 a1e1          	cp	a,#225
1236  0262 270c          	jreq	L041
1237  0264 7b06          	ld	a,(OFST+2,sp)
1238  0266 a1d2          	cp	a,#210
1239  0268 2706          	jreq	L041
1240  026a 7b06          	ld	a,(OFST+2,sp)
1241  026c a1b4          	cp	a,#180
1242  026e 2603          	jrne	L631
1243  0270               L041:
1244  0270 4f            	clr	a
1245  0271 2010          	jra	L241
1246  0273               L631:
1247  0273 ae0147        	ldw	x,#327
1248  0276 89            	pushw	x
1249  0277 ae0000        	ldw	x,#0
1250  027a 89            	pushw	x
1251  027b ae000c        	ldw	x,#L75
1252  027e cd0000        	call	_assert_failed
1254  0281 5b04          	addw	sp,#4
1255  0283               L241:
1256                     ; 328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1258  0283 0d05          	tnz	(OFST+1,sp)
1259  0285 2706          	jreq	L641
1260  0287 7b05          	ld	a,(OFST+1,sp)
1261  0289 a101          	cp	a,#1
1262  028b 2603          	jrne	L441
1263  028d               L641:
1264  028d 4f            	clr	a
1265  028e 2010          	jra	L051
1266  0290               L441:
1267  0290 ae0148        	ldw	x,#328
1268  0293 89            	pushw	x
1269  0294 ae0000        	ldw	x,#0
1270  0297 89            	pushw	x
1271  0298 ae000c        	ldw	x,#L75
1272  029b cd0000        	call	_assert_failed
1274  029e 5b04          	addw	sp,#4
1275  02a0               L051:
1276                     ; 329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1278  02a0 0d09          	tnz	(OFST+5,sp)
1279  02a2 2706          	jreq	L451
1280  02a4 7b09          	ld	a,(OFST+5,sp)
1281  02a6 a101          	cp	a,#1
1282  02a8 2603          	jrne	L251
1283  02aa               L451:
1284  02aa 4f            	clr	a
1285  02ab 2010          	jra	L651
1286  02ad               L251:
1287  02ad ae0149        	ldw	x,#329
1288  02b0 89            	pushw	x
1289  02b1 ae0000        	ldw	x,#0
1290  02b4 89            	pushw	x
1291  02b5 ae000c        	ldw	x,#L75
1292  02b8 cd0000        	call	_assert_failed
1294  02bb 5b04          	addw	sp,#4
1295  02bd               L651:
1296                     ; 330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1298  02bd 0d0a          	tnz	(OFST+6,sp)
1299  02bf 2706          	jreq	L261
1300  02c1 7b0a          	ld	a,(OFST+6,sp)
1301  02c3 a101          	cp	a,#1
1302  02c5 2603          	jrne	L061
1303  02c7               L261:
1304  02c7 4f            	clr	a
1305  02c8 2010          	jra	L461
1306  02ca               L061:
1307  02ca ae014a        	ldw	x,#330
1308  02cd 89            	pushw	x
1309  02ce ae0000        	ldw	x,#0
1310  02d1 89            	pushw	x
1311  02d2 ae000c        	ldw	x,#L75
1312  02d5 cd0000        	call	_assert_failed
1314  02d8 5b04          	addw	sp,#4
1315  02da               L461:
1316                     ; 333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1318  02da c650c3        	ld	a,20675
1319  02dd 6b01          	ld	(OFST-3,sp),a
1320                     ; 336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1322  02df 7b05          	ld	a,(OFST+1,sp)
1323  02e1 a101          	cp	a,#1
1324  02e3 2639          	jrne	L744
1325                     ; 340         CLK->SWCR |= CLK_SWCR_SWEN;
1327  02e5 721250c5      	bset	20677,#1
1328                     ; 343         if (ITState != DISABLE)
1330  02e9 0d09          	tnz	(OFST+5,sp)
1331  02eb 2706          	jreq	L154
1332                     ; 345             CLK->SWCR |= CLK_SWCR_SWIEN;
1334  02ed 721450c5      	bset	20677,#2
1336  02f1 2004          	jra	L354
1337  02f3               L154:
1338                     ; 349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1340  02f3 721550c5      	bres	20677,#2
1341  02f7               L354:
1342                     ; 353         CLK->SWR = (uint8_t)CLK_NewClock;
1344  02f7 7b06          	ld	a,(OFST+2,sp)
1345  02f9 c750c4        	ld	20676,a
1347  02fc 2007          	jra	L164
1348  02fe               L554:
1349                     ; 357             DownCounter--;
1351  02fe 1e03          	ldw	x,(OFST-1,sp)
1352  0300 1d0001        	subw	x,#1
1353  0303 1f03          	ldw	(OFST-1,sp),x
1354  0305               L164:
1355                     ; 355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1357  0305 c650c5        	ld	a,20677
1358  0308 a501          	bcp	a,#1
1359  030a 2704          	jreq	L564
1361  030c 1e03          	ldw	x,(OFST-1,sp)
1362  030e 26ee          	jrne	L554
1363  0310               L564:
1364                     ; 360         if (DownCounter != 0)
1366  0310 1e03          	ldw	x,(OFST-1,sp)
1367  0312 2706          	jreq	L764
1368                     ; 362             Swif = SUCCESS;
1370  0314 a601          	ld	a,#1
1371  0316 6b02          	ld	(OFST-2,sp),a
1373  0318 201b          	jra	L374
1374  031a               L764:
1375                     ; 366             Swif = ERROR;
1377  031a 0f02          	clr	(OFST-2,sp)
1378  031c 2017          	jra	L374
1379  031e               L744:
1380                     ; 374         if (ITState != DISABLE)
1382  031e 0d09          	tnz	(OFST+5,sp)
1383  0320 2706          	jreq	L574
1384                     ; 376             CLK->SWCR |= CLK_SWCR_SWIEN;
1386  0322 721450c5      	bset	20677,#2
1388  0326 2004          	jra	L774
1389  0328               L574:
1390                     ; 380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1392  0328 721550c5      	bres	20677,#2
1393  032c               L774:
1394                     ; 384         CLK->SWR = (uint8_t)CLK_NewClock;
1396  032c 7b06          	ld	a,(OFST+2,sp)
1397  032e c750c4        	ld	20676,a
1398                     ; 388         Swif = SUCCESS;
1400  0331 a601          	ld	a,#1
1401  0333 6b02          	ld	(OFST-2,sp),a
1402  0335               L374:
1403                     ; 393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1405  0335 0d0a          	tnz	(OFST+6,sp)
1406  0337 260c          	jrne	L105
1408  0339 7b01          	ld	a,(OFST-3,sp)
1409  033b a1e1          	cp	a,#225
1410  033d 2606          	jrne	L105
1411                     ; 395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1413  033f 721150c0      	bres	20672,#0
1415  0343 201e          	jra	L305
1416  0345               L105:
1417                     ; 397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1419  0345 0d0a          	tnz	(OFST+6,sp)
1420  0347 260c          	jrne	L505
1422  0349 7b01          	ld	a,(OFST-3,sp)
1423  034b a1d2          	cp	a,#210
1424  034d 2606          	jrne	L505
1425                     ; 399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1427  034f 721750c0      	bres	20672,#3
1429  0353 200e          	jra	L305
1430  0355               L505:
1431                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1433  0355 0d0a          	tnz	(OFST+6,sp)
1434  0357 260a          	jrne	L305
1436  0359 7b01          	ld	a,(OFST-3,sp)
1437  035b a1b4          	cp	a,#180
1438  035d 2604          	jrne	L305
1439                     ; 403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1441  035f 721150c1      	bres	20673,#0
1442  0363               L305:
1443                     ; 406     return(Swif);
1445  0363 7b02          	ld	a,(OFST-2,sp)
1448  0365 5b06          	addw	sp,#6
1449  0367 81            	ret
1588                     ; 416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1588                     ; 417 {
1589                     	switch	.text
1590  0368               _CLK_HSIPrescalerConfig:
1592  0368 88            	push	a
1593       00000000      OFST:	set	0
1596                     ; 420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1598  0369 4d            	tnz	a
1599  036a 270c          	jreq	L271
1600  036c a108          	cp	a,#8
1601  036e 2708          	jreq	L271
1602  0370 a110          	cp	a,#16
1603  0372 2704          	jreq	L271
1604  0374 a118          	cp	a,#24
1605  0376 2603          	jrne	L071
1606  0378               L271:
1607  0378 4f            	clr	a
1608  0379 2010          	jra	L471
1609  037b               L071:
1610  037b ae01a4        	ldw	x,#420
1611  037e 89            	pushw	x
1612  037f ae0000        	ldw	x,#0
1613  0382 89            	pushw	x
1614  0383 ae000c        	ldw	x,#L75
1615  0386 cd0000        	call	_assert_failed
1617  0389 5b04          	addw	sp,#4
1618  038b               L471:
1619                     ; 423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1621  038b c650c6        	ld	a,20678
1622  038e a4e7          	and	a,#231
1623  0390 c750c6        	ld	20678,a
1624                     ; 426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1626  0393 c650c6        	ld	a,20678
1627  0396 1a01          	or	a,(OFST+1,sp)
1628  0398 c750c6        	ld	20678,a
1629                     ; 428 }
1632  039b 84            	pop	a
1633  039c 81            	ret
1769                     ; 439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1769                     ; 440 {
1770                     	switch	.text
1771  039d               _CLK_CCOConfig:
1773  039d 88            	push	a
1774       00000000      OFST:	set	0
1777                     ; 443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1779  039e 4d            	tnz	a
1780  039f 2730          	jreq	L202
1781  03a1 a104          	cp	a,#4
1782  03a3 272c          	jreq	L202
1783  03a5 a102          	cp	a,#2
1784  03a7 2728          	jreq	L202
1785  03a9 a108          	cp	a,#8
1786  03ab 2724          	jreq	L202
1787  03ad a10a          	cp	a,#10
1788  03af 2720          	jreq	L202
1789  03b1 a10c          	cp	a,#12
1790  03b3 271c          	jreq	L202
1791  03b5 a10e          	cp	a,#14
1792  03b7 2718          	jreq	L202
1793  03b9 a110          	cp	a,#16
1794  03bb 2714          	jreq	L202
1795  03bd a112          	cp	a,#18
1796  03bf 2710          	jreq	L202
1797  03c1 a114          	cp	a,#20
1798  03c3 270c          	jreq	L202
1799  03c5 a116          	cp	a,#22
1800  03c7 2708          	jreq	L202
1801  03c9 a118          	cp	a,#24
1802  03cb 2704          	jreq	L202
1803  03cd a11a          	cp	a,#26
1804  03cf 2603          	jrne	L002
1805  03d1               L202:
1806  03d1 4f            	clr	a
1807  03d2 2010          	jra	L402
1808  03d4               L002:
1809  03d4 ae01bb        	ldw	x,#443
1810  03d7 89            	pushw	x
1811  03d8 ae0000        	ldw	x,#0
1812  03db 89            	pushw	x
1813  03dc ae000c        	ldw	x,#L75
1814  03df cd0000        	call	_assert_failed
1816  03e2 5b04          	addw	sp,#4
1817  03e4               L402:
1818                     ; 446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1820  03e4 c650c9        	ld	a,20681
1821  03e7 a4e1          	and	a,#225
1822  03e9 c750c9        	ld	20681,a
1823                     ; 449     CLK->CCOR |= (uint8_t)CLK_CCO;
1825  03ec c650c9        	ld	a,20681
1826  03ef 1a01          	or	a,(OFST+1,sp)
1827  03f1 c750c9        	ld	20681,a
1828                     ; 452     CLK->CCOR |= CLK_CCOR_CCOEN;
1830  03f4 721050c9      	bset	20681,#0
1831                     ; 454 }
1834  03f8 84            	pop	a
1835  03f9 81            	ret
1901                     ; 464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1901                     ; 465 {
1902                     	switch	.text
1903  03fa               _CLK_ITConfig:
1905  03fa 89            	pushw	x
1906       00000000      OFST:	set	0
1909                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1911  03fb 9f            	ld	a,xl
1912  03fc 4d            	tnz	a
1913  03fd 2705          	jreq	L212
1914  03ff 9f            	ld	a,xl
1915  0400 a101          	cp	a,#1
1916  0402 2603          	jrne	L012
1917  0404               L212:
1918  0404 4f            	clr	a
1919  0405 2010          	jra	L412
1920  0407               L012:
1921  0407 ae01d4        	ldw	x,#468
1922  040a 89            	pushw	x
1923  040b ae0000        	ldw	x,#0
1924  040e 89            	pushw	x
1925  040f ae000c        	ldw	x,#L75
1926  0412 cd0000        	call	_assert_failed
1928  0415 5b04          	addw	sp,#4
1929  0417               L412:
1930                     ; 469     assert_param(IS_CLK_IT_OK(CLK_IT));
1932  0417 7b01          	ld	a,(OFST+1,sp)
1933  0419 a10c          	cp	a,#12
1934  041b 2706          	jreq	L022
1935  041d 7b01          	ld	a,(OFST+1,sp)
1936  041f a11c          	cp	a,#28
1937  0421 2603          	jrne	L612
1938  0423               L022:
1939  0423 4f            	clr	a
1940  0424 2010          	jra	L222
1941  0426               L612:
1942  0426 ae01d5        	ldw	x,#469
1943  0429 89            	pushw	x
1944  042a ae0000        	ldw	x,#0
1945  042d 89            	pushw	x
1946  042e ae000c        	ldw	x,#L75
1947  0431 cd0000        	call	_assert_failed
1949  0434 5b04          	addw	sp,#4
1950  0436               L222:
1951                     ; 471     if (NewState != DISABLE)
1953  0436 0d02          	tnz	(OFST+2,sp)
1954  0438 271a          	jreq	L707
1955                     ; 473         switch (CLK_IT)
1957  043a 7b01          	ld	a,(OFST+1,sp)
1959                     ; 481         default:
1959                     ; 482             break;
1960  043c a00c          	sub	a,#12
1961  043e 270a          	jreq	L346
1962  0440 a010          	sub	a,#16
1963  0442 2624          	jrne	L517
1964                     ; 475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1964                     ; 476             CLK->SWCR |= CLK_SWCR_SWIEN;
1966  0444 721450c5      	bset	20677,#2
1967                     ; 477             break;
1969  0448 201e          	jra	L517
1970  044a               L346:
1971                     ; 478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1971                     ; 479             CLK->CSSR |= CLK_CSSR_CSSDIE;
1973  044a 721450c8      	bset	20680,#2
1974                     ; 480             break;
1976  044e 2018          	jra	L517
1977  0450               L546:
1978                     ; 481         default:
1978                     ; 482             break;
1980  0450 2016          	jra	L517
1981  0452               L317:
1983  0452 2014          	jra	L517
1984  0454               L707:
1985                     ; 487         switch (CLK_IT)
1987  0454 7b01          	ld	a,(OFST+1,sp)
1989                     ; 495         default:
1989                     ; 496             break;
1990  0456 a00c          	sub	a,#12
1991  0458 270a          	jreq	L156
1992  045a a010          	sub	a,#16
1993  045c 260a          	jrne	L517
1994                     ; 489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1994                     ; 490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1996  045e 721550c5      	bres	20677,#2
1997                     ; 491             break;
1999  0462 2004          	jra	L517
2000  0464               L156:
2001                     ; 492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
2001                     ; 493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2003  0464 721550c8      	bres	20680,#2
2004                     ; 494             break;
2005  0468               L517:
2006                     ; 500 }
2009  0468 85            	popw	x
2010  0469 81            	ret
2011  046a               L356:
2012                     ; 495         default:
2012                     ; 496             break;
2014  046a 20fc          	jra	L517
2015  046c               L127:
2016  046c 20fa          	jra	L517
2052                     ; 507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
2052                     ; 508 {
2053                     	switch	.text
2054  046e               _CLK_SYSCLKConfig:
2056  046e 88            	push	a
2057       00000000      OFST:	set	0
2060                     ; 511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
2062  046f 4d            	tnz	a
2063  0470 272c          	jreq	L032
2064  0472 a108          	cp	a,#8
2065  0474 2728          	jreq	L032
2066  0476 a110          	cp	a,#16
2067  0478 2724          	jreq	L032
2068  047a a118          	cp	a,#24
2069  047c 2720          	jreq	L032
2070  047e a180          	cp	a,#128
2071  0480 271c          	jreq	L032
2072  0482 a181          	cp	a,#129
2073  0484 2718          	jreq	L032
2074  0486 a182          	cp	a,#130
2075  0488 2714          	jreq	L032
2076  048a a183          	cp	a,#131
2077  048c 2710          	jreq	L032
2078  048e a184          	cp	a,#132
2079  0490 270c          	jreq	L032
2080  0492 a185          	cp	a,#133
2081  0494 2708          	jreq	L032
2082  0496 a186          	cp	a,#134
2083  0498 2704          	jreq	L032
2084  049a a187          	cp	a,#135
2085  049c 2603          	jrne	L622
2086  049e               L032:
2087  049e 4f            	clr	a
2088  049f 2010          	jra	L232
2089  04a1               L622:
2090  04a1 ae01ff        	ldw	x,#511
2091  04a4 89            	pushw	x
2092  04a5 ae0000        	ldw	x,#0
2093  04a8 89            	pushw	x
2094  04a9 ae000c        	ldw	x,#L75
2095  04ac cd0000        	call	_assert_failed
2097  04af 5b04          	addw	sp,#4
2098  04b1               L232:
2099                     ; 513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2101  04b1 7b01          	ld	a,(OFST+1,sp)
2102  04b3 a580          	bcp	a,#128
2103  04b5 2614          	jrne	L147
2104                     ; 515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2106  04b7 c650c6        	ld	a,20678
2107  04ba a4e7          	and	a,#231
2108  04bc c750c6        	ld	20678,a
2109                     ; 516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2111  04bf 7b01          	ld	a,(OFST+1,sp)
2112  04c1 a418          	and	a,#24
2113  04c3 ca50c6        	or	a,20678
2114  04c6 c750c6        	ld	20678,a
2116  04c9 2012          	jra	L347
2117  04cb               L147:
2118                     ; 520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2120  04cb c650c6        	ld	a,20678
2121  04ce a4f8          	and	a,#248
2122  04d0 c750c6        	ld	20678,a
2123                     ; 521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2125  04d3 7b01          	ld	a,(OFST+1,sp)
2126  04d5 a407          	and	a,#7
2127  04d7 ca50c6        	or	a,20678
2128  04da c750c6        	ld	20678,a
2129  04dd               L347:
2130                     ; 524 }
2133  04dd 84            	pop	a
2134  04de 81            	ret
2191                     ; 531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2191                     ; 532 {
2192                     	switch	.text
2193  04df               _CLK_SWIMConfig:
2195  04df 88            	push	a
2196       00000000      OFST:	set	0
2199                     ; 535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2201  04e0 4d            	tnz	a
2202  04e1 2704          	jreq	L042
2203  04e3 a101          	cp	a,#1
2204  04e5 2603          	jrne	L632
2205  04e7               L042:
2206  04e7 4f            	clr	a
2207  04e8 2010          	jra	L242
2208  04ea               L632:
2209  04ea ae0217        	ldw	x,#535
2210  04ed 89            	pushw	x
2211  04ee ae0000        	ldw	x,#0
2212  04f1 89            	pushw	x
2213  04f2 ae000c        	ldw	x,#L75
2214  04f5 cd0000        	call	_assert_failed
2216  04f8 5b04          	addw	sp,#4
2217  04fa               L242:
2218                     ; 537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2220  04fa 0d01          	tnz	(OFST+1,sp)
2221  04fc 2706          	jreq	L377
2222                     ; 540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2224  04fe 721050cd      	bset	20685,#0
2226  0502 2004          	jra	L577
2227  0504               L377:
2228                     ; 545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2230  0504 721150cd      	bres	20685,#0
2231  0508               L577:
2232                     ; 548 }
2235  0508 84            	pop	a
2236  0509 81            	ret
2260                     ; 557 void CLK_ClockSecuritySystemEnable(void)
2260                     ; 558 {
2261                     	switch	.text
2262  050a               _CLK_ClockSecuritySystemEnable:
2266                     ; 560     CLK->CSSR |= CLK_CSSR_CSSEN;
2268  050a 721050c8      	bset	20680,#0
2269                     ; 561 }
2272  050e 81            	ret
2297                     ; 569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2297                     ; 570 {
2298                     	switch	.text
2299  050f               _CLK_GetSYSCLKSource:
2303                     ; 571     return((CLK_Source_TypeDef)CLK->CMSR);
2305  050f c650c3        	ld	a,20675
2308  0512 81            	ret
2371                     ; 579 uint32_t CLK_GetClockFreq(void)
2371                     ; 580 {
2372                     	switch	.text
2373  0513               _CLK_GetClockFreq:
2375  0513 5209          	subw	sp,#9
2376       00000009      OFST:	set	9
2379                     ; 582     uint32_t clockfrequency = 0;
2381  0515 96            	ldw	x,sp
2382  0516 1c0005        	addw	x,#OFST-4
2383  0519 cd0000        	call	c_ltor
2385                     ; 583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2387  051c 7b09          	ld	a,(OFST+0,sp)
2388  051e 97            	ld	xl,a
2389                     ; 584     uint8_t tmp = 0, presc = 0;
2391  051f 7b09          	ld	a,(OFST+0,sp)
2392  0521 97            	ld	xl,a
2395  0522 7b09          	ld	a,(OFST+0,sp)
2396  0524 97            	ld	xl,a
2397                     ; 587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2399  0525 c650c3        	ld	a,20675
2400  0528 6b09          	ld	(OFST+0,sp),a
2401                     ; 589     if (clocksource == CLK_SOURCE_HSI)
2403  052a 7b09          	ld	a,(OFST+0,sp)
2404  052c a1e1          	cp	a,#225
2405  052e 2642          	jrne	L1501
2406                     ; 591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2408  0530 c650c6        	ld	a,20678
2409  0533 a418          	and	a,#24
2410  0535 6b09          	ld	(OFST+0,sp),a
2411                     ; 592         tmp = (uint8_t)(tmp >> 3);
2413  0537 7b09          	ld	a,(OFST+0,sp)
2414  0539 44            	srl	a
2415  053a 44            	srl	a
2416  053b 44            	srl	a
2417  053c 6b09          	ld	(OFST+0,sp),a
2418                     ; 593         presc = HSIDivFactor[tmp];
2420  053e 7b09          	ld	a,(OFST+0,sp)
2421  0540 5f            	clrw	x
2422  0541 97            	ld	xl,a
2423  0542 d60000        	ld	a,(_HSIDivFactor,x)
2424  0545 6b09          	ld	(OFST+0,sp),a
2425                     ; 594         clockfrequency = HSI_VALUE / presc;
2427  0547 7b09          	ld	a,(OFST+0,sp)
2428  0549 b703          	ld	c_lreg+3,a
2429  054b 3f02          	clr	c_lreg+2
2430  054d 3f01          	clr	c_lreg+1
2431  054f 3f00          	clr	c_lreg
2432  0551 96            	ldw	x,sp
2433  0552 1c0001        	addw	x,#OFST-8
2434  0555 cd0000        	call	c_rtol
2436  0558 ae2400        	ldw	x,#9216
2437  055b bf02          	ldw	c_lreg+2,x
2438  055d ae00f4        	ldw	x,#244
2439  0560 bf00          	ldw	c_lreg,x
2440  0562 96            	ldw	x,sp
2441  0563 1c0001        	addw	x,#OFST-8
2442  0566 cd0000        	call	c_ludv
2444  0569 96            	ldw	x,sp
2445  056a 1c0005        	addw	x,#OFST-4
2446  056d cd0000        	call	c_rtol
2449  0570 201c          	jra	L3501
2450  0572               L1501:
2451                     ; 596     else if ( clocksource == CLK_SOURCE_LSI)
2453  0572 7b09          	ld	a,(OFST+0,sp)
2454  0574 a1d2          	cp	a,#210
2455  0576 260c          	jrne	L5501
2456                     ; 598         clockfrequency = LSI_VALUE;
2458  0578 aef400        	ldw	x,#62464
2459  057b 1f07          	ldw	(OFST-2,sp),x
2460  057d ae0001        	ldw	x,#1
2461  0580 1f05          	ldw	(OFST-4,sp),x
2463  0582 200a          	jra	L3501
2464  0584               L5501:
2465                     ; 602         clockfrequency = HSE_VALUE;
2467  0584 ae2400        	ldw	x,#9216
2468  0587 1f07          	ldw	(OFST-2,sp),x
2469  0589 ae00f4        	ldw	x,#244
2470  058c 1f05          	ldw	(OFST-4,sp),x
2471  058e               L3501:
2472                     ; 605     return((uint32_t)clockfrequency);
2474  058e 96            	ldw	x,sp
2475  058f 1c0005        	addw	x,#OFST-4
2476  0592 cd0000        	call	c_ltor
2480  0595 5b09          	addw	sp,#9
2481  0597 81            	ret
2581                     ; 616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2581                     ; 617 {
2582                     	switch	.text
2583  0598               _CLK_AdjustHSICalibrationValue:
2585  0598 88            	push	a
2586       00000000      OFST:	set	0
2589                     ; 620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2591  0599 4d            	tnz	a
2592  059a 271c          	jreq	L652
2593  059c a101          	cp	a,#1
2594  059e 2718          	jreq	L652
2595  05a0 a102          	cp	a,#2
2596  05a2 2714          	jreq	L652
2597  05a4 a103          	cp	a,#3
2598  05a6 2710          	jreq	L652
2599  05a8 a104          	cp	a,#4
2600  05aa 270c          	jreq	L652
2601  05ac a105          	cp	a,#5
2602  05ae 2708          	jreq	L652
2603  05b0 a106          	cp	a,#6
2604  05b2 2704          	jreq	L652
2605  05b4 a107          	cp	a,#7
2606  05b6 2603          	jrne	L452
2607  05b8               L652:
2608  05b8 4f            	clr	a
2609  05b9 2010          	jra	L062
2610  05bb               L452:
2611  05bb ae026c        	ldw	x,#620
2612  05be 89            	pushw	x
2613  05bf ae0000        	ldw	x,#0
2614  05c2 89            	pushw	x
2615  05c3 ae000c        	ldw	x,#L75
2616  05c6 cd0000        	call	_assert_failed
2618  05c9 5b04          	addw	sp,#4
2619  05cb               L062:
2620                     ; 623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2622  05cb c650cc        	ld	a,20684
2623  05ce a4f8          	and	a,#248
2624  05d0 1a01          	or	a,(OFST+1,sp)
2625  05d2 c750cc        	ld	20684,a
2626                     ; 625 }
2629  05d5 84            	pop	a
2630  05d6 81            	ret
2654                     ; 636 void CLK_SYSCLKEmergencyClear(void)
2654                     ; 637 {
2655                     	switch	.text
2656  05d7               _CLK_SYSCLKEmergencyClear:
2660                     ; 638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2662  05d7 721150c5      	bres	20677,#0
2663                     ; 639 }
2666  05db 81            	ret
2820                     ; 648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2820                     ; 649 {
2821                     	switch	.text
2822  05dc               _CLK_GetFlagStatus:
2824  05dc 89            	pushw	x
2825  05dd 5203          	subw	sp,#3
2826       00000003      OFST:	set	3
2829                     ; 651     uint16_t statusreg = 0;
2831  05df 1e01          	ldw	x,(OFST-2,sp)
2832                     ; 652     uint8_t tmpreg = 0;
2834  05e1 7b03          	ld	a,(OFST+0,sp)
2835  05e3 97            	ld	xl,a
2836                     ; 653     FlagStatus bitstatus = RESET;
2838  05e4 7b03          	ld	a,(OFST+0,sp)
2839  05e6 97            	ld	xl,a
2840                     ; 656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2842  05e7 1e04          	ldw	x,(OFST+1,sp)
2843  05e9 a30110        	cpw	x,#272
2844  05ec 2738          	jreq	L072
2845  05ee 1e04          	ldw	x,(OFST+1,sp)
2846  05f0 a30102        	cpw	x,#258
2847  05f3 2731          	jreq	L072
2848  05f5 1e04          	ldw	x,(OFST+1,sp)
2849  05f7 a30202        	cpw	x,#514
2850  05fa 272a          	jreq	L072
2851  05fc 1e04          	ldw	x,(OFST+1,sp)
2852  05fe a30308        	cpw	x,#776
2853  0601 2723          	jreq	L072
2854  0603 1e04          	ldw	x,(OFST+1,sp)
2855  0605 a30301        	cpw	x,#769
2856  0608 271c          	jreq	L072
2857  060a 1e04          	ldw	x,(OFST+1,sp)
2858  060c a30408        	cpw	x,#1032
2859  060f 2715          	jreq	L072
2860  0611 1e04          	ldw	x,(OFST+1,sp)
2861  0613 a30402        	cpw	x,#1026
2862  0616 270e          	jreq	L072
2863  0618 1e04          	ldw	x,(OFST+1,sp)
2864  061a a30504        	cpw	x,#1284
2865  061d 2707          	jreq	L072
2866  061f 1e04          	ldw	x,(OFST+1,sp)
2867  0621 a30502        	cpw	x,#1282
2868  0624 2603          	jrne	L662
2869  0626               L072:
2870  0626 4f            	clr	a
2871  0627 2010          	jra	L272
2872  0629               L662:
2873  0629 ae0290        	ldw	x,#656
2874  062c 89            	pushw	x
2875  062d ae0000        	ldw	x,#0
2876  0630 89            	pushw	x
2877  0631 ae000c        	ldw	x,#L75
2878  0634 cd0000        	call	_assert_failed
2880  0637 5b04          	addw	sp,#4
2881  0639               L272:
2882                     ; 659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2884  0639 7b04          	ld	a,(OFST+1,sp)
2885  063b 97            	ld	xl,a
2886  063c 7b05          	ld	a,(OFST+2,sp)
2887  063e 9f            	ld	a,xl
2888  063f a4ff          	and	a,#255
2889  0641 97            	ld	xl,a
2890  0642 4f            	clr	a
2891  0643 02            	rlwa	x,a
2892  0644 1f01          	ldw	(OFST-2,sp),x
2893  0646 01            	rrwa	x,a
2894                     ; 662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2896  0647 1e01          	ldw	x,(OFST-2,sp)
2897  0649 a30100        	cpw	x,#256
2898  064c 2607          	jrne	L3221
2899                     ; 664         tmpreg = CLK->ICKR;
2901  064e c650c0        	ld	a,20672
2902  0651 6b03          	ld	(OFST+0,sp),a
2904  0653 202f          	jra	L5221
2905  0655               L3221:
2906                     ; 666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2908  0655 1e01          	ldw	x,(OFST-2,sp)
2909  0657 a30200        	cpw	x,#512
2910  065a 2607          	jrne	L7221
2911                     ; 668         tmpreg = CLK->ECKR;
2913  065c c650c1        	ld	a,20673
2914  065f 6b03          	ld	(OFST+0,sp),a
2916  0661 2021          	jra	L5221
2917  0663               L7221:
2918                     ; 670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2920  0663 1e01          	ldw	x,(OFST-2,sp)
2921  0665 a30300        	cpw	x,#768
2922  0668 2607          	jrne	L3321
2923                     ; 672         tmpreg = CLK->SWCR;
2925  066a c650c5        	ld	a,20677
2926  066d 6b03          	ld	(OFST+0,sp),a
2928  066f 2013          	jra	L5221
2929  0671               L3321:
2930                     ; 674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2932  0671 1e01          	ldw	x,(OFST-2,sp)
2933  0673 a30400        	cpw	x,#1024
2934  0676 2607          	jrne	L7321
2935                     ; 676         tmpreg = CLK->CSSR;
2937  0678 c650c8        	ld	a,20680
2938  067b 6b03          	ld	(OFST+0,sp),a
2940  067d 2005          	jra	L5221
2941  067f               L7321:
2942                     ; 680         tmpreg = CLK->CCOR;
2944  067f c650c9        	ld	a,20681
2945  0682 6b03          	ld	(OFST+0,sp),a
2946  0684               L5221:
2947                     ; 683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2949  0684 7b05          	ld	a,(OFST+2,sp)
2950  0686 1503          	bcp	a,(OFST+0,sp)
2951  0688 2706          	jreq	L3421
2952                     ; 685         bitstatus = SET;
2954  068a a601          	ld	a,#1
2955  068c 6b03          	ld	(OFST+0,sp),a
2957  068e 2002          	jra	L5421
2958  0690               L3421:
2959                     ; 689         bitstatus = RESET;
2961  0690 0f03          	clr	(OFST+0,sp)
2962  0692               L5421:
2963                     ; 693     return((FlagStatus)bitstatus);
2965  0692 7b03          	ld	a,(OFST+0,sp)
2968  0694 5b05          	addw	sp,#5
2969  0696 81            	ret
3016                     ; 703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
3016                     ; 704 {
3017                     	switch	.text
3018  0697               _CLK_GetITStatus:
3020  0697 88            	push	a
3021  0698 88            	push	a
3022       00000001      OFST:	set	1
3025                     ; 706     ITStatus bitstatus = RESET;
3027  0699 0f01          	clr	(OFST+0,sp)
3028                     ; 709     assert_param(IS_CLK_IT_OK(CLK_IT));
3030  069b a10c          	cp	a,#12
3031  069d 2704          	jreq	L003
3032  069f a11c          	cp	a,#28
3033  06a1 2603          	jrne	L672
3034  06a3               L003:
3035  06a3 4f            	clr	a
3036  06a4 2010          	jra	L203
3037  06a6               L672:
3038  06a6 ae02c5        	ldw	x,#709
3039  06a9 89            	pushw	x
3040  06aa ae0000        	ldw	x,#0
3041  06ad 89            	pushw	x
3042  06ae ae000c        	ldw	x,#L75
3043  06b1 cd0000        	call	_assert_failed
3045  06b4 5b04          	addw	sp,#4
3046  06b6               L203:
3047                     ; 711     if (CLK_IT == CLK_IT_SWIF)
3049  06b6 7b02          	ld	a,(OFST+1,sp)
3050  06b8 a11c          	cp	a,#28
3051  06ba 2613          	jrne	L1721
3052                     ; 714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3054  06bc c650c5        	ld	a,20677
3055  06bf 1402          	and	a,(OFST+1,sp)
3056  06c1 a10c          	cp	a,#12
3057  06c3 2606          	jrne	L3721
3058                     ; 716             bitstatus = SET;
3060  06c5 a601          	ld	a,#1
3061  06c7 6b01          	ld	(OFST+0,sp),a
3063  06c9 2015          	jra	L7721
3064  06cb               L3721:
3065                     ; 720             bitstatus = RESET;
3067  06cb 0f01          	clr	(OFST+0,sp)
3068  06cd 2011          	jra	L7721
3069  06cf               L1721:
3070                     ; 726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3072  06cf c650c8        	ld	a,20680
3073  06d2 1402          	and	a,(OFST+1,sp)
3074  06d4 a10c          	cp	a,#12
3075  06d6 2606          	jrne	L1031
3076                     ; 728             bitstatus = SET;
3078  06d8 a601          	ld	a,#1
3079  06da 6b01          	ld	(OFST+0,sp),a
3081  06dc 2002          	jra	L7721
3082  06de               L1031:
3083                     ; 732             bitstatus = RESET;
3085  06de 0f01          	clr	(OFST+0,sp)
3086  06e0               L7721:
3087                     ; 737     return bitstatus;
3089  06e0 7b01          	ld	a,(OFST+0,sp)
3092  06e2 85            	popw	x
3093  06e3 81            	ret
3130                     ; 747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
3130                     ; 748 {
3131                     	switch	.text
3132  06e4               _CLK_ClearITPendingBit:
3134  06e4 88            	push	a
3135       00000000      OFST:	set	0
3138                     ; 751     assert_param(IS_CLK_IT_OK(CLK_IT));
3140  06e5 a10c          	cp	a,#12
3141  06e7 2704          	jreq	L013
3142  06e9 a11c          	cp	a,#28
3143  06eb 2603          	jrne	L603
3144  06ed               L013:
3145  06ed 4f            	clr	a
3146  06ee 2010          	jra	L213
3147  06f0               L603:
3148  06f0 ae02ef        	ldw	x,#751
3149  06f3 89            	pushw	x
3150  06f4 ae0000        	ldw	x,#0
3151  06f7 89            	pushw	x
3152  06f8 ae000c        	ldw	x,#L75
3153  06fb cd0000        	call	_assert_failed
3155  06fe 5b04          	addw	sp,#4
3156  0700               L213:
3157                     ; 753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
3159  0700 7b01          	ld	a,(OFST+1,sp)
3160  0702 a10c          	cp	a,#12
3161  0704 2606          	jrne	L3231
3162                     ; 756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3164  0706 721750c8      	bres	20680,#3
3166  070a 2004          	jra	L5231
3167  070c               L3231:
3168                     ; 761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3170  070c 721750c5      	bres	20677,#3
3171  0710               L5231:
3172                     ; 764 }
3175  0710 84            	pop	a
3176  0711 81            	ret
3211                     	xdef	_CLKPrescTable
3212                     	xdef	_HSIDivFactor
3213                     	xdef	_CLK_ClearITPendingBit
3214                     	xdef	_CLK_GetITStatus
3215                     	xdef	_CLK_GetFlagStatus
3216                     	xdef	_CLK_GetSYSCLKSource
3217                     	xdef	_CLK_GetClockFreq
3218                     	xdef	_CLK_AdjustHSICalibrationValue
3219                     	xdef	_CLK_SYSCLKEmergencyClear
3220                     	xdef	_CLK_ClockSecuritySystemEnable
3221                     	xdef	_CLK_SWIMConfig
3222                     	xdef	_CLK_SYSCLKConfig
3223                     	xdef	_CLK_ITConfig
3224                     	xdef	_CLK_CCOConfig
3225                     	xdef	_CLK_HSIPrescalerConfig
3226                     	xdef	_CLK_ClockSwitchConfig
3227                     	xdef	_CLK_PeripheralClockConfig
3228                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3229                     	xdef	_CLK_FastHaltWakeUpCmd
3230                     	xdef	_CLK_ClockSwitchCmd
3231                     	xdef	_CLK_CCOCmd
3232                     	xdef	_CLK_LSICmd
3233                     	xdef	_CLK_HSICmd
3234                     	xdef	_CLK_HSECmd
3235                     	xdef	_CLK_DeInit
3236                     	xref	_assert_failed
3237                     	switch	.const
3238  000c               L75:
3239  000c 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
3240  001e 697665725c73  	dc.b	"iver\src\stm8s_clk"
3241  0030 2e6300        	dc.b	".c",0
3242                     	xref.b	c_lreg
3262                     	xref	c_ludv
3263                     	xref	c_rtol
3264                     	xref	c_ltor
3265                     	end
