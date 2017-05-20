   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 48 void ADC1_DeInit(void)
  32                     ; 49 {
  34                     	switch	.text
  35  0000               _ADC1_DeInit:
  39                     ; 50     ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  41  0000 725f5400      	clr	21504
  42                     ; 51     ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  44  0004 725f5401      	clr	21505
  45                     ; 52     ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  47  0008 725f5402      	clr	21506
  48                     ; 53     ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  50  000c 725f5403      	clr	21507
  51                     ; 54     ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  53  0010 725f5406      	clr	21510
  54                     ; 55     ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  56  0014 725f5407      	clr	21511
  57                     ; 56     ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  59  0018 35ff5408      	mov	21512,#255
  60                     ; 57     ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  62  001c 35035409      	mov	21513,#3
  63                     ; 58     ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  65  0020 725f540a      	clr	21514
  66                     ; 59     ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  68  0024 725f540b      	clr	21515
  69                     ; 60     ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  71  0028 725f540e      	clr	21518
  72                     ; 61     ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  74  002c 725f540f      	clr	21519
  75                     ; 62 }
  78  0030 81            	ret
 530                     ; 85 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 530                     ; 86 {
 531                     	switch	.text
 532  0031               _ADC1_Init:
 534  0031 89            	pushw	x
 535       00000000      OFST:	set	0
 538                     ; 89     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 540  0032 9e            	ld	a,xh
 541  0033 4d            	tnz	a
 542  0034 2705          	jreq	L21
 543  0036 9e            	ld	a,xh
 544  0037 a101          	cp	a,#1
 545  0039 2603          	jrne	L01
 546  003b               L21:
 547  003b 4f            	clr	a
 548  003c 2010          	jra	L41
 549  003e               L01:
 550  003e ae0059        	ldw	x,#89
 551  0041 89            	pushw	x
 552  0042 ae0000        	ldw	x,#0
 553  0045 89            	pushw	x
 554  0046 ae0000        	ldw	x,#L542
 555  0049 cd0000        	call	_assert_failed
 557  004c 5b04          	addw	sp,#4
 558  004e               L41:
 559                     ; 90     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 561  004e 0d02          	tnz	(OFST+2,sp)
 562  0050 273c          	jreq	L02
 563  0052 7b02          	ld	a,(OFST+2,sp)
 564  0054 a101          	cp	a,#1
 565  0056 2736          	jreq	L02
 566  0058 7b02          	ld	a,(OFST+2,sp)
 567  005a a102          	cp	a,#2
 568  005c 2730          	jreq	L02
 569  005e 7b02          	ld	a,(OFST+2,sp)
 570  0060 a103          	cp	a,#3
 571  0062 272a          	jreq	L02
 572  0064 7b02          	ld	a,(OFST+2,sp)
 573  0066 a104          	cp	a,#4
 574  0068 2724          	jreq	L02
 575  006a 7b02          	ld	a,(OFST+2,sp)
 576  006c a105          	cp	a,#5
 577  006e 271e          	jreq	L02
 578  0070 7b02          	ld	a,(OFST+2,sp)
 579  0072 a106          	cp	a,#6
 580  0074 2718          	jreq	L02
 581  0076 7b02          	ld	a,(OFST+2,sp)
 582  0078 a107          	cp	a,#7
 583  007a 2712          	jreq	L02
 584  007c 7b02          	ld	a,(OFST+2,sp)
 585  007e a108          	cp	a,#8
 586  0080 270c          	jreq	L02
 587  0082 7b02          	ld	a,(OFST+2,sp)
 588  0084 a10c          	cp	a,#12
 589  0086 2706          	jreq	L02
 590  0088 7b02          	ld	a,(OFST+2,sp)
 591  008a a109          	cp	a,#9
 592  008c 2603          	jrne	L61
 593  008e               L02:
 594  008e 4f            	clr	a
 595  008f 2010          	jra	L22
 596  0091               L61:
 597  0091 ae005a        	ldw	x,#90
 598  0094 89            	pushw	x
 599  0095 ae0000        	ldw	x,#0
 600  0098 89            	pushw	x
 601  0099 ae0000        	ldw	x,#L542
 602  009c cd0000        	call	_assert_failed
 604  009f 5b04          	addw	sp,#4
 605  00a1               L22:
 606                     ; 91     assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 608  00a1 0d05          	tnz	(OFST+5,sp)
 609  00a3 272a          	jreq	L62
 610  00a5 7b05          	ld	a,(OFST+5,sp)
 611  00a7 a110          	cp	a,#16
 612  00a9 2724          	jreq	L62
 613  00ab 7b05          	ld	a,(OFST+5,sp)
 614  00ad a120          	cp	a,#32
 615  00af 271e          	jreq	L62
 616  00b1 7b05          	ld	a,(OFST+5,sp)
 617  00b3 a130          	cp	a,#48
 618  00b5 2718          	jreq	L62
 619  00b7 7b05          	ld	a,(OFST+5,sp)
 620  00b9 a140          	cp	a,#64
 621  00bb 2712          	jreq	L62
 622  00bd 7b05          	ld	a,(OFST+5,sp)
 623  00bf a150          	cp	a,#80
 624  00c1 270c          	jreq	L62
 625  00c3 7b05          	ld	a,(OFST+5,sp)
 626  00c5 a160          	cp	a,#96
 627  00c7 2706          	jreq	L62
 628  00c9 7b05          	ld	a,(OFST+5,sp)
 629  00cb a170          	cp	a,#112
 630  00cd 2603          	jrne	L42
 631  00cf               L62:
 632  00cf 4f            	clr	a
 633  00d0 2010          	jra	L03
 634  00d2               L42:
 635  00d2 ae005b        	ldw	x,#91
 636  00d5 89            	pushw	x
 637  00d6 ae0000        	ldw	x,#0
 638  00d9 89            	pushw	x
 639  00da ae0000        	ldw	x,#L542
 640  00dd cd0000        	call	_assert_failed
 642  00e0 5b04          	addw	sp,#4
 643  00e2               L03:
 644                     ; 92     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 646  00e2 0d06          	tnz	(OFST+6,sp)
 647  00e4 2706          	jreq	L43
 648  00e6 7b06          	ld	a,(OFST+6,sp)
 649  00e8 a110          	cp	a,#16
 650  00ea 2603          	jrne	L23
 651  00ec               L43:
 652  00ec 4f            	clr	a
 653  00ed 2010          	jra	L63
 654  00ef               L23:
 655  00ef ae005c        	ldw	x,#92
 656  00f2 89            	pushw	x
 657  00f3 ae0000        	ldw	x,#0
 658  00f6 89            	pushw	x
 659  00f7 ae0000        	ldw	x,#L542
 660  00fa cd0000        	call	_assert_failed
 662  00fd 5b04          	addw	sp,#4
 663  00ff               L63:
 664                     ; 93     assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 666  00ff 0d07          	tnz	(OFST+7,sp)
 667  0101 2706          	jreq	L24
 668  0103 7b07          	ld	a,(OFST+7,sp)
 669  0105 a101          	cp	a,#1
 670  0107 2603          	jrne	L04
 671  0109               L24:
 672  0109 4f            	clr	a
 673  010a 2010          	jra	L44
 674  010c               L04:
 675  010c ae005d        	ldw	x,#93
 676  010f 89            	pushw	x
 677  0110 ae0000        	ldw	x,#0
 678  0113 89            	pushw	x
 679  0114 ae0000        	ldw	x,#L542
 680  0117 cd0000        	call	_assert_failed
 682  011a 5b04          	addw	sp,#4
 683  011c               L44:
 684                     ; 94     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 686  011c 0d08          	tnz	(OFST+8,sp)
 687  011e 2706          	jreq	L05
 688  0120 7b08          	ld	a,(OFST+8,sp)
 689  0122 a108          	cp	a,#8
 690  0124 2603          	jrne	L64
 691  0126               L05:
 692  0126 4f            	clr	a
 693  0127 2010          	jra	L25
 694  0129               L64:
 695  0129 ae005e        	ldw	x,#94
 696  012c 89            	pushw	x
 697  012d ae0000        	ldw	x,#0
 698  0130 89            	pushw	x
 699  0131 ae0000        	ldw	x,#L542
 700  0134 cd0000        	call	_assert_failed
 702  0137 5b04          	addw	sp,#4
 703  0139               L25:
 704                     ; 95     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 706  0139 0d09          	tnz	(OFST+9,sp)
 707  013b 2742          	jreq	L65
 708  013d 7b09          	ld	a,(OFST+9,sp)
 709  013f a101          	cp	a,#1
 710  0141 273c          	jreq	L65
 711  0143 7b09          	ld	a,(OFST+9,sp)
 712  0145 a102          	cp	a,#2
 713  0147 2736          	jreq	L65
 714  0149 7b09          	ld	a,(OFST+9,sp)
 715  014b a103          	cp	a,#3
 716  014d 2730          	jreq	L65
 717  014f 7b09          	ld	a,(OFST+9,sp)
 718  0151 a104          	cp	a,#4
 719  0153 272a          	jreq	L65
 720  0155 7b09          	ld	a,(OFST+9,sp)
 721  0157 a105          	cp	a,#5
 722  0159 2724          	jreq	L65
 723  015b 7b09          	ld	a,(OFST+9,sp)
 724  015d a106          	cp	a,#6
 725  015f 271e          	jreq	L65
 726  0161 7b09          	ld	a,(OFST+9,sp)
 727  0163 a107          	cp	a,#7
 728  0165 2718          	jreq	L65
 729  0167 7b09          	ld	a,(OFST+9,sp)
 730  0169 a108          	cp	a,#8
 731  016b 2712          	jreq	L65
 732  016d 7b09          	ld	a,(OFST+9,sp)
 733  016f a10c          	cp	a,#12
 734  0171 270c          	jreq	L65
 735  0173 7b09          	ld	a,(OFST+9,sp)
 736  0175 a1ff          	cp	a,#255
 737  0177 2706          	jreq	L65
 738  0179 7b09          	ld	a,(OFST+9,sp)
 739  017b a109          	cp	a,#9
 740  017d 2603          	jrne	L45
 741  017f               L65:
 742  017f 4f            	clr	a
 743  0180 2010          	jra	L06
 744  0182               L45:
 745  0182 ae005f        	ldw	x,#95
 746  0185 89            	pushw	x
 747  0186 ae0000        	ldw	x,#0
 748  0189 89            	pushw	x
 749  018a ae0000        	ldw	x,#L542
 750  018d cd0000        	call	_assert_failed
 752  0190 5b04          	addw	sp,#4
 753  0192               L06:
 754                     ; 96     assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 756  0192 0d0a          	tnz	(OFST+10,sp)
 757  0194 2706          	jreq	L46
 758  0196 7b0a          	ld	a,(OFST+10,sp)
 759  0198 a101          	cp	a,#1
 760  019a 2603          	jrne	L26
 761  019c               L46:
 762  019c 4f            	clr	a
 763  019d 2010          	jra	L66
 764  019f               L26:
 765  019f ae0060        	ldw	x,#96
 766  01a2 89            	pushw	x
 767  01a3 ae0000        	ldw	x,#0
 768  01a6 89            	pushw	x
 769  01a7 ae0000        	ldw	x,#L542
 770  01aa cd0000        	call	_assert_failed
 772  01ad 5b04          	addw	sp,#4
 773  01af               L66:
 774                     ; 101     ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 776  01af 7b08          	ld	a,(OFST+8,sp)
 777  01b1 88            	push	a
 778  01b2 7b03          	ld	a,(OFST+3,sp)
 779  01b4 97            	ld	xl,a
 780  01b5 7b02          	ld	a,(OFST+2,sp)
 781  01b7 95            	ld	xh,a
 782  01b8 cd03ed        	call	_ADC1_ConversionConfig
 784  01bb 84            	pop	a
 785                     ; 103     ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 787  01bc 7b05          	ld	a,(OFST+5,sp)
 788  01be cd02ae        	call	_ADC1_PrescalerConfig
 790                     ; 108     ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 792  01c1 7b07          	ld	a,(OFST+7,sp)
 793  01c3 97            	ld	xl,a
 794  01c4 7b06          	ld	a,(OFST+6,sp)
 795  01c6 95            	ld	xh,a
 796  01c7 cd04a8        	call	_ADC1_ExternalTriggerConfig
 798                     ; 113     ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 800  01ca 7b0a          	ld	a,(OFST+10,sp)
 801  01cc 97            	ld	xl,a
 802  01cd 7b09          	ld	a,(OFST+9,sp)
 803  01cf 95            	ld	xh,a
 804  01d0 cd02f3        	call	_ADC1_SchmittTriggerConfig
 806                     ; 116     ADC1->CR1 |= ADC1_CR1_ADON;
 808  01d3 72105401      	bset	21505,#0
 809                     ; 118 }
 812  01d7 85            	popw	x
 813  01d8 81            	ret
 849                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 849                     ; 127 {
 850                     	switch	.text
 851  01d9               _ADC1_Cmd:
 853  01d9 88            	push	a
 854       00000000      OFST:	set	0
 857                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 859  01da 4d            	tnz	a
 860  01db 2704          	jreq	L47
 861  01dd a101          	cp	a,#1
 862  01df 2603          	jrne	L27
 863  01e1               L47:
 864  01e1 4f            	clr	a
 865  01e2 2010          	jra	L67
 866  01e4               L27:
 867  01e4 ae0082        	ldw	x,#130
 868  01e7 89            	pushw	x
 869  01e8 ae0000        	ldw	x,#0
 870  01eb 89            	pushw	x
 871  01ec ae0000        	ldw	x,#L542
 872  01ef cd0000        	call	_assert_failed
 874  01f2 5b04          	addw	sp,#4
 875  01f4               L67:
 876                     ; 132     if (NewState != DISABLE)
 878  01f4 0d01          	tnz	(OFST+1,sp)
 879  01f6 2706          	jreq	L562
 880                     ; 134         ADC1->CR1 |= ADC1_CR1_ADON;
 882  01f8 72105401      	bset	21505,#0
 884  01fc 2004          	jra	L762
 885  01fe               L562:
 886                     ; 138         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 888  01fe 72115401      	bres	21505,#0
 889  0202               L762:
 890                     ; 141 }
 893  0202 84            	pop	a
 894  0203 81            	ret
 930                     ; 148 void ADC1_ScanModeCmd(FunctionalState NewState)
 930                     ; 149 {
 931                     	switch	.text
 932  0204               _ADC1_ScanModeCmd:
 934  0204 88            	push	a
 935       00000000      OFST:	set	0
 938                     ; 152     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 940  0205 4d            	tnz	a
 941  0206 2704          	jreq	L401
 942  0208 a101          	cp	a,#1
 943  020a 2603          	jrne	L201
 944  020c               L401:
 945  020c 4f            	clr	a
 946  020d 2010          	jra	L601
 947  020f               L201:
 948  020f ae0098        	ldw	x,#152
 949  0212 89            	pushw	x
 950  0213 ae0000        	ldw	x,#0
 951  0216 89            	pushw	x
 952  0217 ae0000        	ldw	x,#L542
 953  021a cd0000        	call	_assert_failed
 955  021d 5b04          	addw	sp,#4
 956  021f               L601:
 957                     ; 154     if (NewState != DISABLE)
 959  021f 0d01          	tnz	(OFST+1,sp)
 960  0221 2706          	jreq	L703
 961                     ; 156         ADC1->CR2 |= ADC1_CR2_SCAN;
 963  0223 72125402      	bset	21506,#1
 965  0227 2004          	jra	L113
 966  0229               L703:
 967                     ; 160         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 969  0229 72135402      	bres	21506,#1
 970  022d               L113:
 971                     ; 163 }
 974  022d 84            	pop	a
 975  022e 81            	ret
1011                     ; 170 void ADC1_DataBufferCmd(FunctionalState NewState)
1011                     ; 171 {
1012                     	switch	.text
1013  022f               _ADC1_DataBufferCmd:
1015  022f 88            	push	a
1016       00000000      OFST:	set	0
1019                     ; 174     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1021  0230 4d            	tnz	a
1022  0231 2704          	jreq	L411
1023  0233 a101          	cp	a,#1
1024  0235 2603          	jrne	L211
1025  0237               L411:
1026  0237 4f            	clr	a
1027  0238 2010          	jra	L611
1028  023a               L211:
1029  023a ae00ae        	ldw	x,#174
1030  023d 89            	pushw	x
1031  023e ae0000        	ldw	x,#0
1032  0241 89            	pushw	x
1033  0242 ae0000        	ldw	x,#L542
1034  0245 cd0000        	call	_assert_failed
1036  0248 5b04          	addw	sp,#4
1037  024a               L611:
1038                     ; 176     if (NewState != DISABLE)
1040  024a 0d01          	tnz	(OFST+1,sp)
1041  024c 2706          	jreq	L133
1042                     ; 178         ADC1->CR3 |= ADC1_CR3_DBUF;
1044  024e 721e5403      	bset	21507,#7
1046  0252 2004          	jra	L333
1047  0254               L133:
1048                     ; 182         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
1050  0254 721f5403      	bres	21507,#7
1051  0258               L333:
1052                     ; 185 }
1055  0258 84            	pop	a
1056  0259 81            	ret
1213                     ; 196 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
1213                     ; 197 {
1214                     	switch	.text
1215  025a               _ADC1_ITConfig:
1217  025a 89            	pushw	x
1218       00000000      OFST:	set	0
1221                     ; 200     assert_param(IS_ADC1_IT_OK(ADC1_IT));
1223  025b a30020        	cpw	x,#32
1224  025e 2705          	jreq	L421
1225  0260 a30010        	cpw	x,#16
1226  0263 2603          	jrne	L221
1227  0265               L421:
1228  0265 4f            	clr	a
1229  0266 2010          	jra	L621
1230  0268               L221:
1231  0268 ae00c8        	ldw	x,#200
1232  026b 89            	pushw	x
1233  026c ae0000        	ldw	x,#0
1234  026f 89            	pushw	x
1235  0270 ae0000        	ldw	x,#L542
1236  0273 cd0000        	call	_assert_failed
1238  0276 5b04          	addw	sp,#4
1239  0278               L621:
1240                     ; 201     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1242  0278 0d05          	tnz	(OFST+5,sp)
1243  027a 2706          	jreq	L231
1244  027c 7b05          	ld	a,(OFST+5,sp)
1245  027e a101          	cp	a,#1
1246  0280 2603          	jrne	L031
1247  0282               L231:
1248  0282 4f            	clr	a
1249  0283 2010          	jra	L431
1250  0285               L031:
1251  0285 ae00c9        	ldw	x,#201
1252  0288 89            	pushw	x
1253  0289 ae0000        	ldw	x,#0
1254  028c 89            	pushw	x
1255  028d ae0000        	ldw	x,#L542
1256  0290 cd0000        	call	_assert_failed
1258  0293 5b04          	addw	sp,#4
1259  0295               L431:
1260                     ; 203     if (NewState != DISABLE)
1262  0295 0d05          	tnz	(OFST+5,sp)
1263  0297 270a          	jreq	L124
1264                     ; 206         ADC1->CSR |= (uint8_t)ADC1_IT;
1266  0299 c65400        	ld	a,21504
1267  029c 1a02          	or	a,(OFST+2,sp)
1268  029e c75400        	ld	21504,a
1270  02a1 2009          	jra	L324
1271  02a3               L124:
1272                     ; 211         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
1274  02a3 7b02          	ld	a,(OFST+2,sp)
1275  02a5 43            	cpl	a
1276  02a6 c45400        	and	a,21504
1277  02a9 c75400        	ld	21504,a
1278  02ac               L324:
1279                     ; 214 }
1282  02ac 85            	popw	x
1283  02ad 81            	ret
1320                     ; 222 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1320                     ; 223 {
1321                     	switch	.text
1322  02ae               _ADC1_PrescalerConfig:
1324  02ae 88            	push	a
1325       00000000      OFST:	set	0
1328                     ; 226     assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1330  02af 4d            	tnz	a
1331  02b0 271c          	jreq	L241
1332  02b2 a110          	cp	a,#16
1333  02b4 2718          	jreq	L241
1334  02b6 a120          	cp	a,#32
1335  02b8 2714          	jreq	L241
1336  02ba a130          	cp	a,#48
1337  02bc 2710          	jreq	L241
1338  02be a140          	cp	a,#64
1339  02c0 270c          	jreq	L241
1340  02c2 a150          	cp	a,#80
1341  02c4 2708          	jreq	L241
1342  02c6 a160          	cp	a,#96
1343  02c8 2704          	jreq	L241
1344  02ca a170          	cp	a,#112
1345  02cc 2603          	jrne	L041
1346  02ce               L241:
1347  02ce 4f            	clr	a
1348  02cf 2010          	jra	L441
1349  02d1               L041:
1350  02d1 ae00e2        	ldw	x,#226
1351  02d4 89            	pushw	x
1352  02d5 ae0000        	ldw	x,#0
1353  02d8 89            	pushw	x
1354  02d9 ae0000        	ldw	x,#L542
1355  02dc cd0000        	call	_assert_failed
1357  02df 5b04          	addw	sp,#4
1358  02e1               L441:
1359                     ; 229     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1361  02e1 c65401        	ld	a,21505
1362  02e4 a48f          	and	a,#143
1363  02e6 c75401        	ld	21505,a
1364                     ; 231     ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1366  02e9 c65401        	ld	a,21505
1367  02ec 1a01          	or	a,(OFST+1,sp)
1368  02ee c75401        	ld	21505,a
1369                     ; 233 }
1372  02f1 84            	pop	a
1373  02f2 81            	ret
1421                     ; 244 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1421                     ; 245 {
1422                     	switch	.text
1423  02f3               _ADC1_SchmittTriggerConfig:
1425  02f3 89            	pushw	x
1426       00000000      OFST:	set	0
1429                     ; 248     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1431  02f4 9e            	ld	a,xh
1432  02f5 4d            	tnz	a
1433  02f6 2737          	jreq	L251
1434  02f8 9e            	ld	a,xh
1435  02f9 a101          	cp	a,#1
1436  02fb 2732          	jreq	L251
1437  02fd 9e            	ld	a,xh
1438  02fe a102          	cp	a,#2
1439  0300 272d          	jreq	L251
1440  0302 9e            	ld	a,xh
1441  0303 a103          	cp	a,#3
1442  0305 2728          	jreq	L251
1443  0307 9e            	ld	a,xh
1444  0308 a104          	cp	a,#4
1445  030a 2723          	jreq	L251
1446  030c 9e            	ld	a,xh
1447  030d a105          	cp	a,#5
1448  030f 271e          	jreq	L251
1449  0311 9e            	ld	a,xh
1450  0312 a106          	cp	a,#6
1451  0314 2719          	jreq	L251
1452  0316 9e            	ld	a,xh
1453  0317 a107          	cp	a,#7
1454  0319 2714          	jreq	L251
1455  031b 9e            	ld	a,xh
1456  031c a108          	cp	a,#8
1457  031e 270f          	jreq	L251
1458  0320 9e            	ld	a,xh
1459  0321 a10c          	cp	a,#12
1460  0323 270a          	jreq	L251
1461  0325 9e            	ld	a,xh
1462  0326 a1ff          	cp	a,#255
1463  0328 2705          	jreq	L251
1464  032a 9e            	ld	a,xh
1465  032b a109          	cp	a,#9
1466  032d 2603          	jrne	L051
1467  032f               L251:
1468  032f 4f            	clr	a
1469  0330 2010          	jra	L451
1470  0332               L051:
1471  0332 ae00f8        	ldw	x,#248
1472  0335 89            	pushw	x
1473  0336 ae0000        	ldw	x,#0
1474  0339 89            	pushw	x
1475  033a ae0000        	ldw	x,#L542
1476  033d cd0000        	call	_assert_failed
1478  0340 5b04          	addw	sp,#4
1479  0342               L451:
1480                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1482  0342 0d02          	tnz	(OFST+2,sp)
1483  0344 2706          	jreq	L061
1484  0346 7b02          	ld	a,(OFST+2,sp)
1485  0348 a101          	cp	a,#1
1486  034a 2603          	jrne	L651
1487  034c               L061:
1488  034c 4f            	clr	a
1489  034d 2010          	jra	L261
1490  034f               L651:
1491  034f ae00f9        	ldw	x,#249
1492  0352 89            	pushw	x
1493  0353 ae0000        	ldw	x,#0
1494  0356 89            	pushw	x
1495  0357 ae0000        	ldw	x,#L542
1496  035a cd0000        	call	_assert_failed
1498  035d 5b04          	addw	sp,#4
1499  035f               L261:
1500                     ; 251     if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1502  035f 7b01          	ld	a,(OFST+1,sp)
1503  0361 a1ff          	cp	a,#255
1504  0363 2620          	jrne	L564
1505                     ; 253         if (NewState != DISABLE)
1507  0365 0d02          	tnz	(OFST+2,sp)
1508  0367 270a          	jreq	L764
1509                     ; 255             ADC1->TDRL &= (uint8_t)0x0;
1511  0369 725f5407      	clr	21511
1512                     ; 256             ADC1->TDRH &= (uint8_t)0x0;
1514  036d 725f5406      	clr	21510
1516  0371 2078          	jra	L374
1517  0373               L764:
1518                     ; 260             ADC1->TDRL |= (uint8_t)0xFF;
1520  0373 c65407        	ld	a,21511
1521  0376 aaff          	or	a,#255
1522  0378 c75407        	ld	21511,a
1523                     ; 261             ADC1->TDRH |= (uint8_t)0xFF;
1525  037b c65406        	ld	a,21510
1526  037e aaff          	or	a,#255
1527  0380 c75406        	ld	21510,a
1528  0383 2066          	jra	L374
1529  0385               L564:
1530                     ; 264     else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1532  0385 7b01          	ld	a,(OFST+1,sp)
1533  0387 a108          	cp	a,#8
1534  0389 242f          	jruge	L574
1535                     ; 266         if (NewState != DISABLE)
1537  038b 0d02          	tnz	(OFST+2,sp)
1538  038d 2716          	jreq	L774
1539                     ; 268             ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1541  038f 7b01          	ld	a,(OFST+1,sp)
1542  0391 5f            	clrw	x
1543  0392 97            	ld	xl,a
1544  0393 a601          	ld	a,#1
1545  0395 5d            	tnzw	x
1546  0396 2704          	jreq	L461
1547  0398               L661:
1548  0398 48            	sll	a
1549  0399 5a            	decw	x
1550  039a 26fc          	jrne	L661
1551  039c               L461:
1552  039c 43            	cpl	a
1553  039d c45407        	and	a,21511
1554  03a0 c75407        	ld	21511,a
1556  03a3 2046          	jra	L374
1557  03a5               L774:
1558                     ; 272             ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1560  03a5 7b01          	ld	a,(OFST+1,sp)
1561  03a7 5f            	clrw	x
1562  03a8 97            	ld	xl,a
1563  03a9 a601          	ld	a,#1
1564  03ab 5d            	tnzw	x
1565  03ac 2704          	jreq	L071
1566  03ae               L271:
1567  03ae 48            	sll	a
1568  03af 5a            	decw	x
1569  03b0 26fc          	jrne	L271
1570  03b2               L071:
1571  03b2 ca5407        	or	a,21511
1572  03b5 c75407        	ld	21511,a
1573  03b8 2031          	jra	L374
1574  03ba               L574:
1575                     ; 277         if (NewState != DISABLE)
1577  03ba 0d02          	tnz	(OFST+2,sp)
1578  03bc 2718          	jreq	L505
1579                     ; 279             ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1581  03be 7b01          	ld	a,(OFST+1,sp)
1582  03c0 a008          	sub	a,#8
1583  03c2 5f            	clrw	x
1584  03c3 97            	ld	xl,a
1585  03c4 a601          	ld	a,#1
1586  03c6 5d            	tnzw	x
1587  03c7 2704          	jreq	L471
1588  03c9               L671:
1589  03c9 48            	sll	a
1590  03ca 5a            	decw	x
1591  03cb 26fc          	jrne	L671
1592  03cd               L471:
1593  03cd 43            	cpl	a
1594  03ce c45406        	and	a,21510
1595  03d1 c75406        	ld	21510,a
1597  03d4 2015          	jra	L374
1598  03d6               L505:
1599                     ; 283             ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1601  03d6 7b01          	ld	a,(OFST+1,sp)
1602  03d8 a008          	sub	a,#8
1603  03da 5f            	clrw	x
1604  03db 97            	ld	xl,a
1605  03dc a601          	ld	a,#1
1606  03de 5d            	tnzw	x
1607  03df 2704          	jreq	L002
1608  03e1               L202:
1609  03e1 48            	sll	a
1610  03e2 5a            	decw	x
1611  03e3 26fc          	jrne	L202
1612  03e5               L002:
1613  03e5 ca5406        	or	a,21510
1614  03e8 c75406        	ld	21510,a
1615  03eb               L374:
1616                     ; 287 }
1619  03eb 85            	popw	x
1620  03ec 81            	ret
1678                     ; 300 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1678                     ; 301 {
1679                     	switch	.text
1680  03ed               _ADC1_ConversionConfig:
1682  03ed 89            	pushw	x
1683       00000000      OFST:	set	0
1686                     ; 304     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1688  03ee 9e            	ld	a,xh
1689  03ef 4d            	tnz	a
1690  03f0 2705          	jreq	L012
1691  03f2 9e            	ld	a,xh
1692  03f3 a101          	cp	a,#1
1693  03f5 2603          	jrne	L602
1694  03f7               L012:
1695  03f7 4f            	clr	a
1696  03f8 2010          	jra	L212
1697  03fa               L602:
1698  03fa ae0130        	ldw	x,#304
1699  03fd 89            	pushw	x
1700  03fe ae0000        	ldw	x,#0
1701  0401 89            	pushw	x
1702  0402 ae0000        	ldw	x,#L542
1703  0405 cd0000        	call	_assert_failed
1705  0408 5b04          	addw	sp,#4
1706  040a               L212:
1707                     ; 305     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1709  040a 0d02          	tnz	(OFST+2,sp)
1710  040c 273c          	jreq	L612
1711  040e 7b02          	ld	a,(OFST+2,sp)
1712  0410 a101          	cp	a,#1
1713  0412 2736          	jreq	L612
1714  0414 7b02          	ld	a,(OFST+2,sp)
1715  0416 a102          	cp	a,#2
1716  0418 2730          	jreq	L612
1717  041a 7b02          	ld	a,(OFST+2,sp)
1718  041c a103          	cp	a,#3
1719  041e 272a          	jreq	L612
1720  0420 7b02          	ld	a,(OFST+2,sp)
1721  0422 a104          	cp	a,#4
1722  0424 2724          	jreq	L612
1723  0426 7b02          	ld	a,(OFST+2,sp)
1724  0428 a105          	cp	a,#5
1725  042a 271e          	jreq	L612
1726  042c 7b02          	ld	a,(OFST+2,sp)
1727  042e a106          	cp	a,#6
1728  0430 2718          	jreq	L612
1729  0432 7b02          	ld	a,(OFST+2,sp)
1730  0434 a107          	cp	a,#7
1731  0436 2712          	jreq	L612
1732  0438 7b02          	ld	a,(OFST+2,sp)
1733  043a a108          	cp	a,#8
1734  043c 270c          	jreq	L612
1735  043e 7b02          	ld	a,(OFST+2,sp)
1736  0440 a10c          	cp	a,#12
1737  0442 2706          	jreq	L612
1738  0444 7b02          	ld	a,(OFST+2,sp)
1739  0446 a109          	cp	a,#9
1740  0448 2603          	jrne	L412
1741  044a               L612:
1742  044a 4f            	clr	a
1743  044b 2010          	jra	L022
1744  044d               L412:
1745  044d ae0131        	ldw	x,#305
1746  0450 89            	pushw	x
1747  0451 ae0000        	ldw	x,#0
1748  0454 89            	pushw	x
1749  0455 ae0000        	ldw	x,#L542
1750  0458 cd0000        	call	_assert_failed
1752  045b 5b04          	addw	sp,#4
1753  045d               L022:
1754                     ; 306     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1756  045d 0d05          	tnz	(OFST+5,sp)
1757  045f 2706          	jreq	L422
1758  0461 7b05          	ld	a,(OFST+5,sp)
1759  0463 a108          	cp	a,#8
1760  0465 2603          	jrne	L222
1761  0467               L422:
1762  0467 4f            	clr	a
1763  0468 2010          	jra	L622
1764  046a               L222:
1765  046a ae0132        	ldw	x,#306
1766  046d 89            	pushw	x
1767  046e ae0000        	ldw	x,#0
1768  0471 89            	pushw	x
1769  0472 ae0000        	ldw	x,#L542
1770  0475 cd0000        	call	_assert_failed
1772  0478 5b04          	addw	sp,#4
1773  047a               L622:
1774                     ; 309     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1776  047a 72175402      	bres	21506,#3
1777                     ; 311     ADC1->CR2 |= (uint8_t)(ADC1_Align);
1779  047e c65402        	ld	a,21506
1780  0481 1a05          	or	a,(OFST+5,sp)
1781  0483 c75402        	ld	21506,a
1782                     ; 313     if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1784  0486 7b01          	ld	a,(OFST+1,sp)
1785  0488 a101          	cp	a,#1
1786  048a 2606          	jrne	L735
1787                     ; 316         ADC1->CR1 |= ADC1_CR1_CONT;
1789  048c 72125401      	bset	21505,#1
1791  0490 2004          	jra	L145
1792  0492               L735:
1793                     ; 321         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1795  0492 72135401      	bres	21505,#1
1796  0496               L145:
1797                     ; 325     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1799  0496 c65400        	ld	a,21504
1800  0499 a4f0          	and	a,#240
1801  049b c75400        	ld	21504,a
1802                     ; 327     ADC1->CSR |= (uint8_t)(ADC1_Channel);
1804  049e c65400        	ld	a,21504
1805  04a1 1a02          	or	a,(OFST+2,sp)
1806  04a3 c75400        	ld	21504,a
1807                     ; 329 }
1810  04a6 85            	popw	x
1811  04a7 81            	ret
1858                     ; 342 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1858                     ; 343 {
1859                     	switch	.text
1860  04a8               _ADC1_ExternalTriggerConfig:
1862  04a8 89            	pushw	x
1863       00000000      OFST:	set	0
1866                     ; 346     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1868  04a9 9e            	ld	a,xh
1869  04aa 4d            	tnz	a
1870  04ab 2705          	jreq	L432
1871  04ad 9e            	ld	a,xh
1872  04ae a110          	cp	a,#16
1873  04b0 2603          	jrne	L232
1874  04b2               L432:
1875  04b2 4f            	clr	a
1876  04b3 2010          	jra	L632
1877  04b5               L232:
1878  04b5 ae015a        	ldw	x,#346
1879  04b8 89            	pushw	x
1880  04b9 ae0000        	ldw	x,#0
1881  04bc 89            	pushw	x
1882  04bd ae0000        	ldw	x,#L542
1883  04c0 cd0000        	call	_assert_failed
1885  04c3 5b04          	addw	sp,#4
1886  04c5               L632:
1887                     ; 347     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1889  04c5 0d02          	tnz	(OFST+2,sp)
1890  04c7 2706          	jreq	L242
1891  04c9 7b02          	ld	a,(OFST+2,sp)
1892  04cb a101          	cp	a,#1
1893  04cd 2603          	jrne	L042
1894  04cf               L242:
1895  04cf 4f            	clr	a
1896  04d0 2010          	jra	L442
1897  04d2               L042:
1898  04d2 ae015b        	ldw	x,#347
1899  04d5 89            	pushw	x
1900  04d6 ae0000        	ldw	x,#0
1901  04d9 89            	pushw	x
1902  04da ae0000        	ldw	x,#L542
1903  04dd cd0000        	call	_assert_failed
1905  04e0 5b04          	addw	sp,#4
1906  04e2               L442:
1907                     ; 350     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1909  04e2 c65402        	ld	a,21506
1910  04e5 a4cf          	and	a,#207
1911  04e7 c75402        	ld	21506,a
1912                     ; 352     if (NewState != DISABLE)
1914  04ea 0d02          	tnz	(OFST+2,sp)
1915  04ec 2706          	jreq	L565
1916                     ; 355         ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1918  04ee 721c5402      	bset	21506,#6
1920  04f2 2004          	jra	L765
1921  04f4               L565:
1922                     ; 360         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1924  04f4 721d5402      	bres	21506,#6
1925  04f8               L765:
1926                     ; 364     ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1928  04f8 c65402        	ld	a,21506
1929  04fb 1a01          	or	a,(OFST+1,sp)
1930  04fd c75402        	ld	21506,a
1931                     ; 366 }
1934  0500 85            	popw	x
1935  0501 81            	ret
1959                     ; 378 void ADC1_StartConversion(void)
1959                     ; 379 {
1960                     	switch	.text
1961  0502               _ADC1_StartConversion:
1965                     ; 380     ADC1->CR1 |= ADC1_CR1_ADON;
1967  0502 72105401      	bset	21505,#0
1968                     ; 381 }
1971  0506 81            	ret
2015                     ; 390 uint16_t ADC1_GetConversionValue(void)
2015                     ; 391 {
2016                     	switch	.text
2017  0507               _ADC1_GetConversionValue:
2019  0507 5205          	subw	sp,#5
2020       00000005      OFST:	set	5
2023                     ; 393     uint16_t temph = 0;
2025  0509 1e04          	ldw	x,(OFST-1,sp)
2026                     ; 394     uint8_t templ = 0;
2028  050b 7b03          	ld	a,(OFST-2,sp)
2029  050d 97            	ld	xl,a
2030                     ; 396     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
2032  050e c65402        	ld	a,21506
2033  0511 a508          	bcp	a,#8
2034  0513 2719          	jreq	L326
2035                     ; 399         templ = ADC1->DRL;
2037  0515 c65405        	ld	a,21509
2038  0518 6b03          	ld	(OFST-2,sp),a
2039                     ; 401         temph = ADC1->DRH;
2041  051a c65404        	ld	a,21508
2042  051d 5f            	clrw	x
2043  051e 97            	ld	xl,a
2044  051f 1f04          	ldw	(OFST-1,sp),x
2045                     ; 403         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
2047  0521 1e04          	ldw	x,(OFST-1,sp)
2048  0523 4f            	clr	a
2049  0524 02            	rlwa	x,a
2050  0525 01            	rrwa	x,a
2051  0526 1a03          	or	a,(OFST-2,sp)
2052  0528 02            	rlwa	x,a
2053  0529 1f04          	ldw	(OFST-1,sp),x
2054  052b 01            	rrwa	x,a
2056  052c 2021          	jra	L526
2057  052e               L326:
2058                     ; 408         temph = ADC1->DRH;
2060  052e c65404        	ld	a,21508
2061  0531 5f            	clrw	x
2062  0532 97            	ld	xl,a
2063  0533 1f04          	ldw	(OFST-1,sp),x
2064                     ; 410         templ = ADC1->DRL;
2066  0535 c65405        	ld	a,21509
2067  0538 6b03          	ld	(OFST-2,sp),a
2068                     ; 412         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
2070  053a 1e04          	ldw	x,(OFST-1,sp)
2071  053c 4f            	clr	a
2072  053d 02            	rlwa	x,a
2073  053e 1f01          	ldw	(OFST-4,sp),x
2074  0540 7b03          	ld	a,(OFST-2,sp)
2075  0542 97            	ld	xl,a
2076  0543 a640          	ld	a,#64
2077  0545 42            	mul	x,a
2078  0546 01            	rrwa	x,a
2079  0547 1a02          	or	a,(OFST-3,sp)
2080  0549 01            	rrwa	x,a
2081  054a 1a01          	or	a,(OFST-4,sp)
2082  054c 01            	rrwa	x,a
2083  054d 1f04          	ldw	(OFST-1,sp),x
2084  054f               L526:
2085                     ; 415     return ((uint16_t)temph);
2087  054f 1e04          	ldw	x,(OFST-1,sp)
2090  0551 5b05          	addw	sp,#5
2091  0553 81            	ret
2138                     ; 427 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
2138                     ; 428 {
2139                     	switch	.text
2140  0554               _ADC1_AWDChannelConfig:
2142  0554 89            	pushw	x
2143       00000000      OFST:	set	0
2146                     ; 430     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2148  0555 9f            	ld	a,xl
2149  0556 4d            	tnz	a
2150  0557 2705          	jreq	L652
2151  0559 9f            	ld	a,xl
2152  055a a101          	cp	a,#1
2153  055c 2603          	jrne	L452
2154  055e               L652:
2155  055e 4f            	clr	a
2156  055f 2010          	jra	L062
2157  0561               L452:
2158  0561 ae01ae        	ldw	x,#430
2159  0564 89            	pushw	x
2160  0565 ae0000        	ldw	x,#0
2161  0568 89            	pushw	x
2162  0569 ae0000        	ldw	x,#L542
2163  056c cd0000        	call	_assert_failed
2165  056f 5b04          	addw	sp,#4
2166  0571               L062:
2167                     ; 431     assert_param(IS_ADC1_CHANNEL_OK(Channel));
2169  0571 0d01          	tnz	(OFST+1,sp)
2170  0573 273c          	jreq	L462
2171  0575 7b01          	ld	a,(OFST+1,sp)
2172  0577 a101          	cp	a,#1
2173  0579 2736          	jreq	L462
2174  057b 7b01          	ld	a,(OFST+1,sp)
2175  057d a102          	cp	a,#2
2176  057f 2730          	jreq	L462
2177  0581 7b01          	ld	a,(OFST+1,sp)
2178  0583 a103          	cp	a,#3
2179  0585 272a          	jreq	L462
2180  0587 7b01          	ld	a,(OFST+1,sp)
2181  0589 a104          	cp	a,#4
2182  058b 2724          	jreq	L462
2183  058d 7b01          	ld	a,(OFST+1,sp)
2184  058f a105          	cp	a,#5
2185  0591 271e          	jreq	L462
2186  0593 7b01          	ld	a,(OFST+1,sp)
2187  0595 a106          	cp	a,#6
2188  0597 2718          	jreq	L462
2189  0599 7b01          	ld	a,(OFST+1,sp)
2190  059b a107          	cp	a,#7
2191  059d 2712          	jreq	L462
2192  059f 7b01          	ld	a,(OFST+1,sp)
2193  05a1 a108          	cp	a,#8
2194  05a3 270c          	jreq	L462
2195  05a5 7b01          	ld	a,(OFST+1,sp)
2196  05a7 a10c          	cp	a,#12
2197  05a9 2706          	jreq	L462
2198  05ab 7b01          	ld	a,(OFST+1,sp)
2199  05ad a109          	cp	a,#9
2200  05af 2603          	jrne	L262
2201  05b1               L462:
2202  05b1 4f            	clr	a
2203  05b2 2010          	jra	L662
2204  05b4               L262:
2205  05b4 ae01af        	ldw	x,#431
2206  05b7 89            	pushw	x
2207  05b8 ae0000        	ldw	x,#0
2208  05bb 89            	pushw	x
2209  05bc ae0000        	ldw	x,#L542
2210  05bf cd0000        	call	_assert_failed
2212  05c2 5b04          	addw	sp,#4
2213  05c4               L662:
2214                     ; 433     if (Channel < (uint8_t)8)
2216  05c4 7b01          	ld	a,(OFST+1,sp)
2217  05c6 a108          	cp	a,#8
2218  05c8 242f          	jruge	L156
2219                     ; 435         if (NewState != DISABLE)
2221  05ca 0d02          	tnz	(OFST+2,sp)
2222  05cc 2715          	jreq	L356
2223                     ; 437             ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
2225  05ce 7b01          	ld	a,(OFST+1,sp)
2226  05d0 5f            	clrw	x
2227  05d1 97            	ld	xl,a
2228  05d2 a601          	ld	a,#1
2229  05d4 5d            	tnzw	x
2230  05d5 2704          	jreq	L072
2231  05d7               L272:
2232  05d7 48            	sll	a
2233  05d8 5a            	decw	x
2234  05d9 26fc          	jrne	L272
2235  05db               L072:
2236  05db ca540f        	or	a,21519
2237  05de c7540f        	ld	21519,a
2239  05e1 2047          	jra	L756
2240  05e3               L356:
2241                     ; 441             ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
2243  05e3 7b01          	ld	a,(OFST+1,sp)
2244  05e5 5f            	clrw	x
2245  05e6 97            	ld	xl,a
2246  05e7 a601          	ld	a,#1
2247  05e9 5d            	tnzw	x
2248  05ea 2704          	jreq	L472
2249  05ec               L672:
2250  05ec 48            	sll	a
2251  05ed 5a            	decw	x
2252  05ee 26fc          	jrne	L672
2253  05f0               L472:
2254  05f0 43            	cpl	a
2255  05f1 c4540f        	and	a,21519
2256  05f4 c7540f        	ld	21519,a
2257  05f7 2031          	jra	L756
2258  05f9               L156:
2259                     ; 446         if (NewState != DISABLE)
2261  05f9 0d02          	tnz	(OFST+2,sp)
2262  05fb 2717          	jreq	L166
2263                     ; 448             ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
2265  05fd 7b01          	ld	a,(OFST+1,sp)
2266  05ff a008          	sub	a,#8
2267  0601 5f            	clrw	x
2268  0602 97            	ld	xl,a
2269  0603 a601          	ld	a,#1
2270  0605 5d            	tnzw	x
2271  0606 2704          	jreq	L003
2272  0608               L203:
2273  0608 48            	sll	a
2274  0609 5a            	decw	x
2275  060a 26fc          	jrne	L203
2276  060c               L003:
2277  060c ca540e        	or	a,21518
2278  060f c7540e        	ld	21518,a
2280  0612 2016          	jra	L756
2281  0614               L166:
2282                     ; 452             ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
2284  0614 7b01          	ld	a,(OFST+1,sp)
2285  0616 a008          	sub	a,#8
2286  0618 5f            	clrw	x
2287  0619 97            	ld	xl,a
2288  061a a601          	ld	a,#1
2289  061c 5d            	tnzw	x
2290  061d 2704          	jreq	L403
2291  061f               L603:
2292  061f 48            	sll	a
2293  0620 5a            	decw	x
2294  0621 26fc          	jrne	L603
2295  0623               L403:
2296  0623 43            	cpl	a
2297  0624 c4540e        	and	a,21518
2298  0627 c7540e        	ld	21518,a
2299  062a               L756:
2300                     ; 455 }
2303  062a 85            	popw	x
2304  062b 81            	ret
2339                     ; 463 void ADC1_SetHighThreshold(uint16_t Threshold)
2339                     ; 464 {
2340                     	switch	.text
2341  062c               _ADC1_SetHighThreshold:
2343  062c 89            	pushw	x
2344       00000000      OFST:	set	0
2347                     ; 465     ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
2349  062d 54            	srlw	x
2350  062e 54            	srlw	x
2351  062f 9f            	ld	a,xl
2352  0630 c75408        	ld	21512,a
2353                     ; 466     ADC1->HTRL = (uint8_t)Threshold;
2355  0633 7b02          	ld	a,(OFST+2,sp)
2356  0635 c75409        	ld	21513,a
2357                     ; 467 }
2360  0638 85            	popw	x
2361  0639 81            	ret
2396                     ; 475 void ADC1_SetLowThreshold(uint16_t Threshold)
2396                     ; 476 {
2397                     	switch	.text
2398  063a               _ADC1_SetLowThreshold:
2402                     ; 477     ADC1->LTRL = (uint8_t)Threshold;
2404  063a 9f            	ld	a,xl
2405  063b c7540b        	ld	21515,a
2406                     ; 478     ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
2408  063e 54            	srlw	x
2409  063f 54            	srlw	x
2410  0640 9f            	ld	a,xl
2411  0641 c7540a        	ld	21514,a
2412                     ; 479 }
2415  0644 81            	ret
2469                     ; 488 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
2469                     ; 489 {
2470                     	switch	.text
2471  0645               _ADC1_GetBufferValue:
2473  0645 88            	push	a
2474  0646 5205          	subw	sp,#5
2475       00000005      OFST:	set	5
2478                     ; 491     uint16_t temph = 0;
2480  0648 1e04          	ldw	x,(OFST-1,sp)
2481                     ; 492     uint8_t templ = 0;
2483  064a 7b03          	ld	a,(OFST-2,sp)
2484  064c 97            	ld	xl,a
2485                     ; 495     assert_param(IS_ADC1_BUFFER_OK(Buffer));
2487  064d 7b06          	ld	a,(OFST+1,sp)
2488  064f a10a          	cp	a,#10
2489  0651 2403          	jruge	L613
2490  0653 4f            	clr	a
2491  0654 2010          	jra	L023
2492  0656               L613:
2493  0656 ae01ef        	ldw	x,#495
2494  0659 89            	pushw	x
2495  065a ae0000        	ldw	x,#0
2496  065d 89            	pushw	x
2497  065e ae0000        	ldw	x,#L542
2498  0661 cd0000        	call	_assert_failed
2500  0664 5b04          	addw	sp,#4
2501  0666               L023:
2502                     ; 497     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
2504  0666 c65402        	ld	a,21506
2505  0669 a508          	bcp	a,#8
2506  066b 2723          	jreq	L747
2507                     ; 500         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2509  066d 7b06          	ld	a,(OFST+1,sp)
2510  066f 48            	sll	a
2511  0670 5f            	clrw	x
2512  0671 97            	ld	xl,a
2513  0672 d653e1        	ld	a,(21473,x)
2514  0675 6b03          	ld	(OFST-2,sp),a
2515                     ; 502         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2517  0677 7b06          	ld	a,(OFST+1,sp)
2518  0679 48            	sll	a
2519  067a 5f            	clrw	x
2520  067b 97            	ld	xl,a
2521  067c d653e0        	ld	a,(21472,x)
2522  067f 5f            	clrw	x
2523  0680 97            	ld	xl,a
2524  0681 1f04          	ldw	(OFST-1,sp),x
2525                     ; 504         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
2527  0683 1e04          	ldw	x,(OFST-1,sp)
2528  0685 4f            	clr	a
2529  0686 02            	rlwa	x,a
2530  0687 01            	rrwa	x,a
2531  0688 1a03          	or	a,(OFST-2,sp)
2532  068a 02            	rlwa	x,a
2533  068b 1f04          	ldw	(OFST-1,sp),x
2534  068d 01            	rrwa	x,a
2536  068e 202b          	jra	L157
2537  0690               L747:
2538                     ; 509         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2540  0690 7b06          	ld	a,(OFST+1,sp)
2541  0692 48            	sll	a
2542  0693 5f            	clrw	x
2543  0694 97            	ld	xl,a
2544  0695 d653e0        	ld	a,(21472,x)
2545  0698 5f            	clrw	x
2546  0699 97            	ld	xl,a
2547  069a 1f04          	ldw	(OFST-1,sp),x
2548                     ; 511         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2550  069c 7b06          	ld	a,(OFST+1,sp)
2551  069e 48            	sll	a
2552  069f 5f            	clrw	x
2553  06a0 97            	ld	xl,a
2554  06a1 d653e1        	ld	a,(21473,x)
2555  06a4 6b03          	ld	(OFST-2,sp),a
2556                     ; 513         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
2558  06a6 1e04          	ldw	x,(OFST-1,sp)
2559  06a8 4f            	clr	a
2560  06a9 02            	rlwa	x,a
2561  06aa 1f01          	ldw	(OFST-4,sp),x
2562  06ac 7b03          	ld	a,(OFST-2,sp)
2563  06ae 97            	ld	xl,a
2564  06af a640          	ld	a,#64
2565  06b1 42            	mul	x,a
2566  06b2 01            	rrwa	x,a
2567  06b3 1a02          	or	a,(OFST-3,sp)
2568  06b5 01            	rrwa	x,a
2569  06b6 1a01          	or	a,(OFST-4,sp)
2570  06b8 01            	rrwa	x,a
2571  06b9 1f04          	ldw	(OFST-1,sp),x
2572  06bb               L157:
2573                     ; 516     return ((uint16_t)temph);
2575  06bb 1e04          	ldw	x,(OFST-1,sp)
2578  06bd 5b06          	addw	sp,#6
2579  06bf 81            	ret
2646                     ; 526 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2646                     ; 527 {
2647                     	switch	.text
2648  06c0               _ADC1_GetAWDChannelStatus:
2650  06c0 88            	push	a
2651  06c1 88            	push	a
2652       00000001      OFST:	set	1
2655                     ; 528     uint8_t status = 0;
2657  06c2 0f01          	clr	(OFST+0,sp)
2658                     ; 531     assert_param(IS_ADC1_CHANNEL_OK(Channel));
2660  06c4 4d            	tnz	a
2661  06c5 2728          	jreq	L623
2662  06c7 a101          	cp	a,#1
2663  06c9 2724          	jreq	L623
2664  06cb a102          	cp	a,#2
2665  06cd 2720          	jreq	L623
2666  06cf a103          	cp	a,#3
2667  06d1 271c          	jreq	L623
2668  06d3 a104          	cp	a,#4
2669  06d5 2718          	jreq	L623
2670  06d7 a105          	cp	a,#5
2671  06d9 2714          	jreq	L623
2672  06db a106          	cp	a,#6
2673  06dd 2710          	jreq	L623
2674  06df a107          	cp	a,#7
2675  06e1 270c          	jreq	L623
2676  06e3 a108          	cp	a,#8
2677  06e5 2708          	jreq	L623
2678  06e7 a10c          	cp	a,#12
2679  06e9 2704          	jreq	L623
2680  06eb a109          	cp	a,#9
2681  06ed 2603          	jrne	L423
2682  06ef               L623:
2683  06ef 4f            	clr	a
2684  06f0 2010          	jra	L033
2685  06f2               L423:
2686  06f2 ae0213        	ldw	x,#531
2687  06f5 89            	pushw	x
2688  06f6 ae0000        	ldw	x,#0
2689  06f9 89            	pushw	x
2690  06fa ae0000        	ldw	x,#L542
2691  06fd cd0000        	call	_assert_failed
2693  0700 5b04          	addw	sp,#4
2694  0702               L033:
2695                     ; 533     if (Channel < (uint8_t)8)
2697  0702 7b02          	ld	a,(OFST+1,sp)
2698  0704 a108          	cp	a,#8
2699  0706 2414          	jruge	L5001
2700                     ; 535         status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2702  0708 7b02          	ld	a,(OFST+1,sp)
2703  070a 5f            	clrw	x
2704  070b 97            	ld	xl,a
2705  070c a601          	ld	a,#1
2706  070e 5d            	tnzw	x
2707  070f 2704          	jreq	L233
2708  0711               L433:
2709  0711 48            	sll	a
2710  0712 5a            	decw	x
2711  0713 26fc          	jrne	L433
2712  0715               L233:
2713  0715 c4540d        	and	a,21517
2714  0718 6b01          	ld	(OFST+0,sp),a
2716  071a 2014          	jra	L7001
2717  071c               L5001:
2718                     ; 539         status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2720  071c 7b02          	ld	a,(OFST+1,sp)
2721  071e a008          	sub	a,#8
2722  0720 5f            	clrw	x
2723  0721 97            	ld	xl,a
2724  0722 a601          	ld	a,#1
2725  0724 5d            	tnzw	x
2726  0725 2704          	jreq	L633
2727  0727               L043:
2728  0727 48            	sll	a
2729  0728 5a            	decw	x
2730  0729 26fc          	jrne	L043
2731  072b               L633:
2732  072b c4540c        	and	a,21516
2733  072e 6b01          	ld	(OFST+0,sp),a
2734  0730               L7001:
2735                     ; 542     return ((FlagStatus)status);
2737  0730 7b01          	ld	a,(OFST+0,sp)
2740  0732 85            	popw	x
2741  0733 81            	ret
2900                     ; 551 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2900                     ; 552 {
2901                     	switch	.text
2902  0734               _ADC1_GetFlagStatus:
2904  0734 88            	push	a
2905  0735 88            	push	a
2906       00000001      OFST:	set	1
2909                     ; 553     uint8_t flagstatus = 0;
2911  0736 7b01          	ld	a,(OFST+0,sp)
2912  0738 97            	ld	xl,a
2913                     ; 554     uint8_t temp = 0;
2915  0739 7b01          	ld	a,(OFST+0,sp)
2916  073b 97            	ld	xl,a
2917                     ; 557     assert_param(IS_ADC1_FLAG_OK(Flag));
2919  073c 7b02          	ld	a,(OFST+1,sp)
2920  073e a180          	cp	a,#128
2921  0740 2748          	jreq	L643
2922  0742 7b02          	ld	a,(OFST+1,sp)
2923  0744 a141          	cp	a,#65
2924  0746 2742          	jreq	L643
2925  0748 7b02          	ld	a,(OFST+1,sp)
2926  074a a140          	cp	a,#64
2927  074c 273c          	jreq	L643
2928  074e 7b02          	ld	a,(OFST+1,sp)
2929  0750 a110          	cp	a,#16
2930  0752 2736          	jreq	L643
2931  0754 7b02          	ld	a,(OFST+1,sp)
2932  0756 a111          	cp	a,#17
2933  0758 2730          	jreq	L643
2934  075a 7b02          	ld	a,(OFST+1,sp)
2935  075c a112          	cp	a,#18
2936  075e 272a          	jreq	L643
2937  0760 7b02          	ld	a,(OFST+1,sp)
2938  0762 a113          	cp	a,#19
2939  0764 2724          	jreq	L643
2940  0766 7b02          	ld	a,(OFST+1,sp)
2941  0768 a114          	cp	a,#20
2942  076a 271e          	jreq	L643
2943  076c 7b02          	ld	a,(OFST+1,sp)
2944  076e a115          	cp	a,#21
2945  0770 2718          	jreq	L643
2946  0772 7b02          	ld	a,(OFST+1,sp)
2947  0774 a116          	cp	a,#22
2948  0776 2712          	jreq	L643
2949  0778 7b02          	ld	a,(OFST+1,sp)
2950  077a a117          	cp	a,#23
2951  077c 270c          	jreq	L643
2952  077e 7b02          	ld	a,(OFST+1,sp)
2953  0780 a118          	cp	a,#24
2954  0782 2706          	jreq	L643
2955  0784 7b02          	ld	a,(OFST+1,sp)
2956  0786 a119          	cp	a,#25
2957  0788 2603          	jrne	L443
2958  078a               L643:
2959  078a 4f            	clr	a
2960  078b 2010          	jra	L053
2961  078d               L443:
2962  078d ae022d        	ldw	x,#557
2963  0790 89            	pushw	x
2964  0791 ae0000        	ldw	x,#0
2965  0794 89            	pushw	x
2966  0795 ae0000        	ldw	x,#L542
2967  0798 cd0000        	call	_assert_failed
2969  079b 5b04          	addw	sp,#4
2970  079d               L053:
2971                     ; 559     if ((Flag & 0x0F) == 0x01)
2973  079d 7b02          	ld	a,(OFST+1,sp)
2974  079f a40f          	and	a,#15
2975  07a1 a101          	cp	a,#1
2976  07a3 2609          	jrne	L7701
2977                     ; 562         flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2979  07a5 c65403        	ld	a,21507
2980  07a8 a440          	and	a,#64
2981  07aa 6b01          	ld	(OFST+0,sp),a
2983  07ac 2045          	jra	L1011
2984  07ae               L7701:
2985                     ; 564     else if ((Flag & 0xF0) == 0x10)
2987  07ae 7b02          	ld	a,(OFST+1,sp)
2988  07b0 a4f0          	and	a,#240
2989  07b2 a110          	cp	a,#16
2990  07b4 2636          	jrne	L3011
2991                     ; 567         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2993  07b6 7b02          	ld	a,(OFST+1,sp)
2994  07b8 a40f          	and	a,#15
2995  07ba 6b01          	ld	(OFST+0,sp),a
2996                     ; 568         if (temp < 8)
2998  07bc 7b01          	ld	a,(OFST+0,sp)
2999  07be a108          	cp	a,#8
3000  07c0 2414          	jruge	L5011
3001                     ; 570             flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
3003  07c2 7b01          	ld	a,(OFST+0,sp)
3004  07c4 5f            	clrw	x
3005  07c5 97            	ld	xl,a
3006  07c6 a601          	ld	a,#1
3007  07c8 5d            	tnzw	x
3008  07c9 2704          	jreq	L253
3009  07cb               L453:
3010  07cb 48            	sll	a
3011  07cc 5a            	decw	x
3012  07cd 26fc          	jrne	L453
3013  07cf               L253:
3014  07cf c4540d        	and	a,21517
3015  07d2 6b01          	ld	(OFST+0,sp),a
3017  07d4 201d          	jra	L1011
3018  07d6               L5011:
3019                     ; 574             flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
3021  07d6 7b01          	ld	a,(OFST+0,sp)
3022  07d8 a008          	sub	a,#8
3023  07da 5f            	clrw	x
3024  07db 97            	ld	xl,a
3025  07dc a601          	ld	a,#1
3026  07de 5d            	tnzw	x
3027  07df 2704          	jreq	L653
3028  07e1               L063:
3029  07e1 48            	sll	a
3030  07e2 5a            	decw	x
3031  07e3 26fc          	jrne	L063
3032  07e5               L653:
3033  07e5 c4540c        	and	a,21516
3034  07e8 6b01          	ld	(OFST+0,sp),a
3035  07ea 2007          	jra	L1011
3036  07ec               L3011:
3037                     ; 579         flagstatus = (uint8_t)(ADC1->CSR & Flag);
3039  07ec c65400        	ld	a,21504
3040  07ef 1402          	and	a,(OFST+1,sp)
3041  07f1 6b01          	ld	(OFST+0,sp),a
3042  07f3               L1011:
3043                     ; 581     return ((FlagStatus)flagstatus);
3045  07f3 7b01          	ld	a,(OFST+0,sp)
3048  07f5 85            	popw	x
3049  07f6 81            	ret
3094                     ; 591 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
3094                     ; 592 {
3095                     	switch	.text
3096  07f7               _ADC1_ClearFlag:
3098  07f7 88            	push	a
3099  07f8 88            	push	a
3100       00000001      OFST:	set	1
3103                     ; 593     uint8_t temp = 0;
3105  07f9 0f01          	clr	(OFST+0,sp)
3106                     ; 596     assert_param(IS_ADC1_FLAG_OK(Flag));
3108  07fb a180          	cp	a,#128
3109  07fd 2730          	jreq	L663
3110  07ff a141          	cp	a,#65
3111  0801 272c          	jreq	L663
3112  0803 a140          	cp	a,#64
3113  0805 2728          	jreq	L663
3114  0807 a110          	cp	a,#16
3115  0809 2724          	jreq	L663
3116  080b a111          	cp	a,#17
3117  080d 2720          	jreq	L663
3118  080f a112          	cp	a,#18
3119  0811 271c          	jreq	L663
3120  0813 a113          	cp	a,#19
3121  0815 2718          	jreq	L663
3122  0817 a114          	cp	a,#20
3123  0819 2714          	jreq	L663
3124  081b a115          	cp	a,#21
3125  081d 2710          	jreq	L663
3126  081f a116          	cp	a,#22
3127  0821 270c          	jreq	L663
3128  0823 a117          	cp	a,#23
3129  0825 2708          	jreq	L663
3130  0827 a118          	cp	a,#24
3131  0829 2704          	jreq	L663
3132  082b a119          	cp	a,#25
3133  082d 2603          	jrne	L463
3134  082f               L663:
3135  082f 4f            	clr	a
3136  0830 2010          	jra	L073
3137  0832               L463:
3138  0832 ae0254        	ldw	x,#596
3139  0835 89            	pushw	x
3140  0836 ae0000        	ldw	x,#0
3141  0839 89            	pushw	x
3142  083a ae0000        	ldw	x,#L542
3143  083d cd0000        	call	_assert_failed
3145  0840 5b04          	addw	sp,#4
3146  0842               L073:
3147                     ; 598     if ((Flag & 0x0F) == 0x01)
3149  0842 7b02          	ld	a,(OFST+1,sp)
3150  0844 a40f          	and	a,#15
3151  0846 a101          	cp	a,#1
3152  0848 2606          	jrne	L5311
3153                     ; 601         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
3155  084a 721d5403      	bres	21507,#6
3157  084e 204b          	jra	L7311
3158  0850               L5311:
3159                     ; 603     else if ((Flag & 0xF0) == 0x10)
3161  0850 7b02          	ld	a,(OFST+1,sp)
3162  0852 a4f0          	and	a,#240
3163  0854 a110          	cp	a,#16
3164  0856 263a          	jrne	L1411
3165                     ; 606         temp = (uint8_t)(Flag & (uint8_t)0x0F);
3167  0858 7b02          	ld	a,(OFST+1,sp)
3168  085a a40f          	and	a,#15
3169  085c 6b01          	ld	(OFST+0,sp),a
3170                     ; 607         if (temp < 8)
3172  085e 7b01          	ld	a,(OFST+0,sp)
3173  0860 a108          	cp	a,#8
3174  0862 2416          	jruge	L3411
3175                     ; 609             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
3177  0864 7b01          	ld	a,(OFST+0,sp)
3178  0866 5f            	clrw	x
3179  0867 97            	ld	xl,a
3180  0868 a601          	ld	a,#1
3181  086a 5d            	tnzw	x
3182  086b 2704          	jreq	L273
3183  086d               L473:
3184  086d 48            	sll	a
3185  086e 5a            	decw	x
3186  086f 26fc          	jrne	L473
3187  0871               L273:
3188  0871 43            	cpl	a
3189  0872 c4540d        	and	a,21517
3190  0875 c7540d        	ld	21517,a
3192  0878 2021          	jra	L7311
3193  087a               L3411:
3194                     ; 613             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
3196  087a 7b01          	ld	a,(OFST+0,sp)
3197  087c a008          	sub	a,#8
3198  087e 5f            	clrw	x
3199  087f 97            	ld	xl,a
3200  0880 a601          	ld	a,#1
3201  0882 5d            	tnzw	x
3202  0883 2704          	jreq	L673
3203  0885               L004:
3204  0885 48            	sll	a
3205  0886 5a            	decw	x
3206  0887 26fc          	jrne	L004
3207  0889               L673:
3208  0889 43            	cpl	a
3209  088a c4540c        	and	a,21516
3210  088d c7540c        	ld	21516,a
3211  0890 2009          	jra	L7311
3212  0892               L1411:
3213                     ; 618         ADC1->CSR &= (uint8_t) (~Flag);
3215  0892 7b02          	ld	a,(OFST+1,sp)
3216  0894 43            	cpl	a
3217  0895 c45400        	and	a,21504
3218  0898 c75400        	ld	21504,a
3219  089b               L7311:
3220                     ; 620 }
3223  089b 85            	popw	x
3224  089c 81            	ret
3280                     ; 640 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
3280                     ; 641 {
3281                     	switch	.text
3282  089d               _ADC1_GetITStatus:
3284  089d 89            	pushw	x
3285  089e 88            	push	a
3286       00000001      OFST:	set	1
3289                     ; 642     ITStatus itstatus = RESET;
3291  089f 7b01          	ld	a,(OFST+0,sp)
3292  08a1 97            	ld	xl,a
3293                     ; 643     uint8_t temp = 0;
3295  08a2 7b01          	ld	a,(OFST+0,sp)
3296  08a4 97            	ld	xl,a
3297                     ; 646     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
3299  08a5 1e02          	ldw	x,(OFST+1,sp)
3300  08a7 a30080        	cpw	x,#128
3301  08aa 2754          	jreq	L604
3302  08ac 1e02          	ldw	x,(OFST+1,sp)
3303  08ae a30140        	cpw	x,#320
3304  08b1 274d          	jreq	L604
3305  08b3 1e02          	ldw	x,(OFST+1,sp)
3306  08b5 a30110        	cpw	x,#272
3307  08b8 2746          	jreq	L604
3308  08ba 1e02          	ldw	x,(OFST+1,sp)
3309  08bc a30111        	cpw	x,#273
3310  08bf 273f          	jreq	L604
3311  08c1 1e02          	ldw	x,(OFST+1,sp)
3312  08c3 a30112        	cpw	x,#274
3313  08c6 2738          	jreq	L604
3314  08c8 1e02          	ldw	x,(OFST+1,sp)
3315  08ca a30113        	cpw	x,#275
3316  08cd 2731          	jreq	L604
3317  08cf 1e02          	ldw	x,(OFST+1,sp)
3318  08d1 a30114        	cpw	x,#276
3319  08d4 272a          	jreq	L604
3320  08d6 1e02          	ldw	x,(OFST+1,sp)
3321  08d8 a30115        	cpw	x,#277
3322  08db 2723          	jreq	L604
3323  08dd 1e02          	ldw	x,(OFST+1,sp)
3324  08df a30116        	cpw	x,#278
3325  08e2 271c          	jreq	L604
3326  08e4 1e02          	ldw	x,(OFST+1,sp)
3327  08e6 a30117        	cpw	x,#279
3328  08e9 2715          	jreq	L604
3329  08eb 1e02          	ldw	x,(OFST+1,sp)
3330  08ed a30118        	cpw	x,#280
3331  08f0 270e          	jreq	L604
3332  08f2 1e02          	ldw	x,(OFST+1,sp)
3333  08f4 a3011c        	cpw	x,#284
3334  08f7 2707          	jreq	L604
3335  08f9 1e02          	ldw	x,(OFST+1,sp)
3336  08fb a30119        	cpw	x,#281
3337  08fe 2603          	jrne	L404
3338  0900               L604:
3339  0900 4f            	clr	a
3340  0901 2010          	jra	L014
3341  0903               L404:
3342  0903 ae0286        	ldw	x,#646
3343  0906 89            	pushw	x
3344  0907 ae0000        	ldw	x,#0
3345  090a 89            	pushw	x
3346  090b ae0000        	ldw	x,#L542
3347  090e cd0000        	call	_assert_failed
3349  0911 5b04          	addw	sp,#4
3350  0913               L014:
3351                     ; 648     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
3353  0913 7b02          	ld	a,(OFST+1,sp)
3354  0915 97            	ld	xl,a
3355  0916 7b03          	ld	a,(OFST+2,sp)
3356  0918 a4f0          	and	a,#240
3357  091a 5f            	clrw	x
3358  091b 02            	rlwa	x,a
3359  091c a30010        	cpw	x,#16
3360  091f 2636          	jrne	L7711
3361                     ; 651         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3363  0921 7b03          	ld	a,(OFST+2,sp)
3364  0923 a40f          	and	a,#15
3365  0925 6b01          	ld	(OFST+0,sp),a
3366                     ; 652         if (temp < 8)
3368  0927 7b01          	ld	a,(OFST+0,sp)
3369  0929 a108          	cp	a,#8
3370  092b 2414          	jruge	L1021
3371                     ; 654             itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
3373  092d 7b01          	ld	a,(OFST+0,sp)
3374  092f 5f            	clrw	x
3375  0930 97            	ld	xl,a
3376  0931 a601          	ld	a,#1
3377  0933 5d            	tnzw	x
3378  0934 2704          	jreq	L214
3379  0936               L414:
3380  0936 48            	sll	a
3381  0937 5a            	decw	x
3382  0938 26fc          	jrne	L414
3383  093a               L214:
3384  093a c4540d        	and	a,21517
3385  093d 6b01          	ld	(OFST+0,sp),a
3387  093f 201d          	jra	L5021
3388  0941               L1021:
3389                     ; 658             itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
3391  0941 7b01          	ld	a,(OFST+0,sp)
3392  0943 a008          	sub	a,#8
3393  0945 5f            	clrw	x
3394  0946 97            	ld	xl,a
3395  0947 a601          	ld	a,#1
3396  0949 5d            	tnzw	x
3397  094a 2704          	jreq	L614
3398  094c               L024:
3399  094c 48            	sll	a
3400  094d 5a            	decw	x
3401  094e 26fc          	jrne	L024
3402  0950               L614:
3403  0950 c4540c        	and	a,21516
3404  0953 6b01          	ld	(OFST+0,sp),a
3405  0955 2007          	jra	L5021
3406  0957               L7711:
3407                     ; 663         itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
3409  0957 c65400        	ld	a,21504
3410  095a 1403          	and	a,(OFST+2,sp)
3411  095c 6b01          	ld	(OFST+0,sp),a
3412  095e               L5021:
3413                     ; 665     return ((ITStatus)itstatus);
3415  095e 7b01          	ld	a,(OFST+0,sp)
3418  0960 5b03          	addw	sp,#3
3419  0962 81            	ret
3465                     ; 687 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
3465                     ; 688 {
3466                     	switch	.text
3467  0963               _ADC1_ClearITPendingBit:
3469  0963 89            	pushw	x
3470  0964 88            	push	a
3471       00000001      OFST:	set	1
3474                     ; 689     uint8_t temp = 0;
3476  0965 0f01          	clr	(OFST+0,sp)
3477                     ; 692     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
3479  0967 a30080        	cpw	x,#128
3480  096a 273c          	jreq	L624
3481  096c a30140        	cpw	x,#320
3482  096f 2737          	jreq	L624
3483  0971 a30110        	cpw	x,#272
3484  0974 2732          	jreq	L624
3485  0976 a30111        	cpw	x,#273
3486  0979 272d          	jreq	L624
3487  097b a30112        	cpw	x,#274
3488  097e 2728          	jreq	L624
3489  0980 a30113        	cpw	x,#275
3490  0983 2723          	jreq	L624
3491  0985 a30114        	cpw	x,#276
3492  0988 271e          	jreq	L624
3493  098a a30115        	cpw	x,#277
3494  098d 2719          	jreq	L624
3495  098f a30116        	cpw	x,#278
3496  0992 2714          	jreq	L624
3497  0994 a30117        	cpw	x,#279
3498  0997 270f          	jreq	L624
3499  0999 a30118        	cpw	x,#280
3500  099c 270a          	jreq	L624
3501  099e a3011c        	cpw	x,#284
3502  09a1 2705          	jreq	L624
3503  09a3 a30119        	cpw	x,#281
3504  09a6 2603          	jrne	L424
3505  09a8               L624:
3506  09a8 4f            	clr	a
3507  09a9 2010          	jra	L034
3508  09ab               L424:
3509  09ab ae02b4        	ldw	x,#692
3510  09ae 89            	pushw	x
3511  09af ae0000        	ldw	x,#0
3512  09b2 89            	pushw	x
3513  09b3 ae0000        	ldw	x,#L542
3514  09b6 cd0000        	call	_assert_failed
3516  09b9 5b04          	addw	sp,#4
3517  09bb               L034:
3518                     ; 694     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
3520  09bb 7b02          	ld	a,(OFST+1,sp)
3521  09bd 97            	ld	xl,a
3522  09be 7b03          	ld	a,(OFST+2,sp)
3523  09c0 a4f0          	and	a,#240
3524  09c2 5f            	clrw	x
3525  09c3 02            	rlwa	x,a
3526  09c4 a30010        	cpw	x,#16
3527  09c7 263a          	jrne	L1321
3528                     ; 697         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3530  09c9 7b03          	ld	a,(OFST+2,sp)
3531  09cb a40f          	and	a,#15
3532  09cd 6b01          	ld	(OFST+0,sp),a
3533                     ; 698         if (temp < 8)
3535  09cf 7b01          	ld	a,(OFST+0,sp)
3536  09d1 a108          	cp	a,#8
3537  09d3 2416          	jruge	L3321
3538                     ; 700             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
3540  09d5 7b01          	ld	a,(OFST+0,sp)
3541  09d7 5f            	clrw	x
3542  09d8 97            	ld	xl,a
3543  09d9 a601          	ld	a,#1
3544  09db 5d            	tnzw	x
3545  09dc 2704          	jreq	L234
3546  09de               L434:
3547  09de 48            	sll	a
3548  09df 5a            	decw	x
3549  09e0 26fc          	jrne	L434
3550  09e2               L234:
3551  09e2 43            	cpl	a
3552  09e3 c4540d        	and	a,21517
3553  09e6 c7540d        	ld	21517,a
3555  09e9 2021          	jra	L7321
3556  09eb               L3321:
3557                     ; 704             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
3559  09eb 7b01          	ld	a,(OFST+0,sp)
3560  09ed a008          	sub	a,#8
3561  09ef 5f            	clrw	x
3562  09f0 97            	ld	xl,a
3563  09f1 a601          	ld	a,#1
3564  09f3 5d            	tnzw	x
3565  09f4 2704          	jreq	L634
3566  09f6               L044:
3567  09f6 48            	sll	a
3568  09f7 5a            	decw	x
3569  09f8 26fc          	jrne	L044
3570  09fa               L634:
3571  09fa 43            	cpl	a
3572  09fb c4540c        	and	a,21516
3573  09fe c7540c        	ld	21516,a
3574  0a01 2009          	jra	L7321
3575  0a03               L1321:
3576                     ; 709         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
3578  0a03 7b03          	ld	a,(OFST+2,sp)
3579  0a05 43            	cpl	a
3580  0a06 c45400        	and	a,21504
3581  0a09 c75400        	ld	21504,a
3582  0a0c               L7321:
3583                     ; 711 }
3586  0a0c 5b03          	addw	sp,#3
3587  0a0e 81            	ret
3600                     	xdef	_ADC1_ClearITPendingBit
3601                     	xdef	_ADC1_GetITStatus
3602                     	xdef	_ADC1_ClearFlag
3603                     	xdef	_ADC1_GetFlagStatus
3604                     	xdef	_ADC1_GetAWDChannelStatus
3605                     	xdef	_ADC1_GetBufferValue
3606                     	xdef	_ADC1_SetLowThreshold
3607                     	xdef	_ADC1_SetHighThreshold
3608                     	xdef	_ADC1_GetConversionValue
3609                     	xdef	_ADC1_StartConversion
3610                     	xdef	_ADC1_AWDChannelConfig
3611                     	xdef	_ADC1_ExternalTriggerConfig
3612                     	xdef	_ADC1_ConversionConfig
3613                     	xdef	_ADC1_SchmittTriggerConfig
3614                     	xdef	_ADC1_PrescalerConfig
3615                     	xdef	_ADC1_ITConfig
3616                     	xdef	_ADC1_DataBufferCmd
3617                     	xdef	_ADC1_ScanModeCmd
3618                     	xdef	_ADC1_Cmd
3619                     	xdef	_ADC1_Init
3620                     	xdef	_ADC1_DeInit
3621                     	xref	_assert_failed
3622                     .const:	section	.text
3623  0000               L542:
3624  0000 73746d38735f  	dc.b	"stm8s_stdperiph_dr"
3625  0012 697665725c73  	dc.b	"iver\src\stm8s_adc"
3626  0024 312e6300      	dc.b	"1.c",0
3646                     	end
