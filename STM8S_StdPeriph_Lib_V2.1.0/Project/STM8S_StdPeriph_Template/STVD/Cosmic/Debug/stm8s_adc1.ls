   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 48 void ADC1_DeInit(void)
  33                     ; 49 {
  35                     .text:	section	.text,new
  36  0000               _ADC1_DeInit:
  40                     ; 50     ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  42  0000 725f5400      	clr	21504
  43                     ; 51     ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  45  0004 725f5401      	clr	21505
  46                     ; 52     ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  48  0008 725f5402      	clr	21506
  49                     ; 53     ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  51  000c 725f5403      	clr	21507
  52                     ; 54     ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  54  0010 725f5406      	clr	21510
  55                     ; 55     ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  57  0014 725f5407      	clr	21511
  58                     ; 56     ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  60  0018 35ff5408      	mov	21512,#255
  61                     ; 57     ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  63  001c 35035409      	mov	21513,#3
  64                     ; 58     ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  66  0020 725f540a      	clr	21514
  67                     ; 59     ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  69  0024 725f540b      	clr	21515
  70                     ; 60     ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  72  0028 725f540e      	clr	21518
  73                     ; 61     ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  75  002c 725f540f      	clr	21519
  76                     ; 62 }
  79  0030 81            	ret	
 531                     ; 85 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 531                     ; 86 {
 532                     .text:	section	.text,new
 533  0000               _ADC1_Init:
 535  0000 89            	pushw	x
 536       00000000      OFST:	set	0
 539                     ; 89     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 541  0001 9e            	ld	a,xh
 542  0002 4d            	tnz	a
 543  0003 270a          	jreq	L41
 544  0005 9e            	ld	a,xh
 545  0006 4a            	dec	a
 546  0007 2706          	jreq	L41
 547  0009 ae0059        	ldw	x,#89
 548  000c cd00f9        	call	LC001
 549  000f               L41:
 550                     ; 90     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 552  000f 7b02          	ld	a,(OFST+2,sp)
 553  0011 272e          	jreq	L42
 554  0013 a101          	cp	a,#1
 555  0015 272a          	jreq	L42
 556  0017 a102          	cp	a,#2
 557  0019 2726          	jreq	L42
 558  001b a103          	cp	a,#3
 559  001d 2722          	jreq	L42
 560  001f a104          	cp	a,#4
 561  0021 271e          	jreq	L42
 562  0023 a105          	cp	a,#5
 563  0025 271a          	jreq	L42
 564  0027 a106          	cp	a,#6
 565  0029 2716          	jreq	L42
 566  002b a107          	cp	a,#7
 567  002d 2712          	jreq	L42
 568  002f a108          	cp	a,#8
 569  0031 270e          	jreq	L42
 570  0033 a10c          	cp	a,#12
 571  0035 270a          	jreq	L42
 572  0037 a109          	cp	a,#9
 573  0039 2706          	jreq	L42
 574  003b ae005a        	ldw	x,#90
 575  003e cd00f9        	call	LC001
 576  0041               L42:
 577                     ; 91     assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 579  0041 7b05          	ld	a,(OFST+5,sp)
 580  0043 2722          	jreq	L43
 581  0045 a110          	cp	a,#16
 582  0047 271e          	jreq	L43
 583  0049 a120          	cp	a,#32
 584  004b 271a          	jreq	L43
 585  004d a130          	cp	a,#48
 586  004f 2716          	jreq	L43
 587  0051 a140          	cp	a,#64
 588  0053 2712          	jreq	L43
 589  0055 a150          	cp	a,#80
 590  0057 270e          	jreq	L43
 591  0059 a160          	cp	a,#96
 592  005b 270a          	jreq	L43
 593  005d a170          	cp	a,#112
 594  005f 2706          	jreq	L43
 595  0061 ae005b        	ldw	x,#91
 596  0064 cd00f9        	call	LC001
 597  0067               L43:
 598                     ; 92     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 600  0067 7b06          	ld	a,(OFST+6,sp)
 601  0069 270a          	jreq	L44
 602  006b a110          	cp	a,#16
 603  006d 2706          	jreq	L44
 604  006f ae005c        	ldw	x,#92
 605  0072 cd00f9        	call	LC001
 606  0075               L44:
 607                     ; 93     assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 609  0075 7b07          	ld	a,(OFST+7,sp)
 610  0077 2708          	jreq	L45
 611  0079 4a            	dec	a
 612  007a 2705          	jreq	L45
 613  007c ae005d        	ldw	x,#93
 614  007f ad78          	call	LC001
 615  0081               L45:
 616                     ; 94     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 618  0081 7b08          	ld	a,(OFST+8,sp)
 619  0083 2709          	jreq	L46
 620  0085 a108          	cp	a,#8
 621  0087 2705          	jreq	L46
 622  0089 ae005e        	ldw	x,#94
 623  008c ad6b          	call	LC001
 624  008e               L46:
 625                     ; 95     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 627  008e 7b09          	ld	a,(OFST+9,sp)
 628  0090 2731          	jreq	L47
 629  0092 a101          	cp	a,#1
 630  0094 272d          	jreq	L47
 631  0096 a102          	cp	a,#2
 632  0098 2729          	jreq	L47
 633  009a a103          	cp	a,#3
 634  009c 2725          	jreq	L47
 635  009e a104          	cp	a,#4
 636  00a0 2721          	jreq	L47
 637  00a2 a105          	cp	a,#5
 638  00a4 271d          	jreq	L47
 639  00a6 a106          	cp	a,#6
 640  00a8 2719          	jreq	L47
 641  00aa a107          	cp	a,#7
 642  00ac 2715          	jreq	L47
 643  00ae a108          	cp	a,#8
 644  00b0 2711          	jreq	L47
 645  00b2 a10c          	cp	a,#12
 646  00b4 270d          	jreq	L47
 647  00b6 a1ff          	cp	a,#255
 648  00b8 2709          	jreq	L47
 649  00ba a109          	cp	a,#9
 650  00bc 2705          	jreq	L47
 651  00be ae005f        	ldw	x,#95
 652  00c1 ad36          	call	LC001
 653  00c3               L47:
 654                     ; 96     assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 656  00c3 7b0a          	ld	a,(OFST+10,sp)
 657  00c5 2708          	jreq	L401
 658  00c7 4a            	dec	a
 659  00c8 2705          	jreq	L401
 660  00ca ae0060        	ldw	x,#96
 661  00cd ad2a          	call	LC001
 662  00cf               L401:
 663                     ; 101     ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 665  00cf 7b08          	ld	a,(OFST+8,sp)
 666  00d1 88            	push	a
 667  00d2 7b03          	ld	a,(OFST+3,sp)
 668  00d4 97            	ld	xl,a
 669  00d5 7b02          	ld	a,(OFST+2,sp)
 670  00d7 95            	ld	xh,a
 671  00d8 cd0000        	call	_ADC1_ConversionConfig
 673  00db 84            	pop	a
 674                     ; 103     ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 676  00dc 7b05          	ld	a,(OFST+5,sp)
 677  00de cd0000        	call	_ADC1_PrescalerConfig
 679                     ; 108     ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 681  00e1 7b07          	ld	a,(OFST+7,sp)
 682  00e3 97            	ld	xl,a
 683  00e4 7b06          	ld	a,(OFST+6,sp)
 684  00e6 95            	ld	xh,a
 685  00e7 cd0000        	call	_ADC1_ExternalTriggerConfig
 687                     ; 113     ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 689  00ea 7b0a          	ld	a,(OFST+10,sp)
 690  00ec 97            	ld	xl,a
 691  00ed 7b09          	ld	a,(OFST+9,sp)
 692  00ef 95            	ld	xh,a
 693  00f0 cd0000        	call	_ADC1_SchmittTriggerConfig
 695                     ; 116     ADC1->CR1 |= ADC1_CR1_ADON;
 697  00f3 72105401      	bset	21505,#0
 698                     ; 118 }
 701  00f7 85            	popw	x
 702  00f8 81            	ret	
 704  00f9               LC001:
 705  00f9 89            	pushw	x
 706  00fa 5f            	clrw	x
 707  00fb 89            	pushw	x
 708  00fc ae0000        	ldw	x,#L542
 709  00ff cd0000        	call	_assert_failed
 711  0102 5b04          	addw	sp,#4
 712  0104 81            	ret	
 747                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 747                     ; 127 {
 748                     .text:	section	.text,new
 749  0000               _ADC1_Cmd:
 751  0000 88            	push	a
 752       00000000      OFST:	set	0
 755                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 757  0001 4d            	tnz	a
 758  0002 2711          	jreq	L621
 759  0004 4a            	dec	a
 760  0005 270e          	jreq	L621
 761  0007 ae0082        	ldw	x,#130
 762  000a 89            	pushw	x
 763  000b 5f            	clrw	x
 764  000c 89            	pushw	x
 765  000d ae0000        	ldw	x,#L542
 766  0010 cd0000        	call	_assert_failed
 768  0013 5b04          	addw	sp,#4
 769  0015               L621:
 770                     ; 132     if (NewState != DISABLE)
 772  0015 7b01          	ld	a,(OFST+1,sp)
 773  0017 2706          	jreq	L562
 774                     ; 134         ADC1->CR1 |= ADC1_CR1_ADON;
 776  0019 72105401      	bset	21505,#0
 778  001d 2004          	jra	L762
 779  001f               L562:
 780                     ; 138         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 782  001f 72115401      	bres	21505,#0
 783  0023               L762:
 784                     ; 141 }
 787  0023 84            	pop	a
 788  0024 81            	ret	
 824                     ; 148 void ADC1_ScanModeCmd(FunctionalState NewState)
 824                     ; 149 {
 825                     .text:	section	.text,new
 826  0000               _ADC1_ScanModeCmd:
 828  0000 88            	push	a
 829       00000000      OFST:	set	0
 832                     ; 152     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 834  0001 4d            	tnz	a
 835  0002 2711          	jreq	L041
 836  0004 4a            	dec	a
 837  0005 270e          	jreq	L041
 838  0007 ae0098        	ldw	x,#152
 839  000a 89            	pushw	x
 840  000b 5f            	clrw	x
 841  000c 89            	pushw	x
 842  000d ae0000        	ldw	x,#L542
 843  0010 cd0000        	call	_assert_failed
 845  0013 5b04          	addw	sp,#4
 846  0015               L041:
 847                     ; 154     if (NewState != DISABLE)
 849  0015 7b01          	ld	a,(OFST+1,sp)
 850  0017 2706          	jreq	L703
 851                     ; 156         ADC1->CR2 |= ADC1_CR2_SCAN;
 853  0019 72125402      	bset	21506,#1
 855  001d 2004          	jra	L113
 856  001f               L703:
 857                     ; 160         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 859  001f 72135402      	bres	21506,#1
 860  0023               L113:
 861                     ; 163 }
 864  0023 84            	pop	a
 865  0024 81            	ret	
 901                     ; 170 void ADC1_DataBufferCmd(FunctionalState NewState)
 901                     ; 171 {
 902                     .text:	section	.text,new
 903  0000               _ADC1_DataBufferCmd:
 905  0000 88            	push	a
 906       00000000      OFST:	set	0
 909                     ; 174     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 911  0001 4d            	tnz	a
 912  0002 2711          	jreq	L251
 913  0004 4a            	dec	a
 914  0005 270e          	jreq	L251
 915  0007 ae00ae        	ldw	x,#174
 916  000a 89            	pushw	x
 917  000b 5f            	clrw	x
 918  000c 89            	pushw	x
 919  000d ae0000        	ldw	x,#L542
 920  0010 cd0000        	call	_assert_failed
 922  0013 5b04          	addw	sp,#4
 923  0015               L251:
 924                     ; 176     if (NewState != DISABLE)
 926  0015 7b01          	ld	a,(OFST+1,sp)
 927  0017 2706          	jreq	L133
 928                     ; 178         ADC1->CR3 |= ADC1_CR3_DBUF;
 930  0019 721e5403      	bset	21507,#7
 932  001d 2004          	jra	L333
 933  001f               L133:
 934                     ; 182         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 936  001f 721f5403      	bres	21507,#7
 937  0023               L333:
 938                     ; 185 }
 941  0023 84            	pop	a
 942  0024 81            	ret	
1099                     ; 196 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
1099                     ; 197 {
1100                     .text:	section	.text,new
1101  0000               _ADC1_ITConfig:
1103  0000 89            	pushw	x
1104       00000000      OFST:	set	0
1107                     ; 200     assert_param(IS_ADC1_IT_OK(ADC1_IT));
1109  0001 a30020        	cpw	x,#32
1110  0004 270a          	jreq	L461
1111  0006 a30010        	cpw	x,#16
1112  0009 2705          	jreq	L461
1113  000b ae00c8        	ldw	x,#200
1114  000e ad22          	call	LC002
1115  0010               L461:
1116                     ; 201     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1118  0010 7b05          	ld	a,(OFST+5,sp)
1119  0012 2708          	jreq	L471
1120  0014 4a            	dec	a
1121  0015 2705          	jreq	L471
1122  0017 ae00c9        	ldw	x,#201
1123  001a ad16          	call	LC002
1124  001c               L471:
1125                     ; 203     if (NewState != DISABLE)
1127  001c 7b05          	ld	a,(OFST+5,sp)
1128  001e 2707          	jreq	L124
1129                     ; 206         ADC1->CSR |= (uint8_t)ADC1_IT;
1131  0020 c65400        	ld	a,21504
1132  0023 1a02          	or	a,(OFST+2,sp)
1134  0025 2006          	jra	L324
1135  0027               L124:
1136                     ; 211         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
1138  0027 7b02          	ld	a,(OFST+2,sp)
1139  0029 43            	cpl	a
1140  002a c45400        	and	a,21504
1141  002d               L324:
1142  002d c75400        	ld	21504,a
1143                     ; 214 }
1146  0030 85            	popw	x
1147  0031 81            	ret	
1149  0032               LC002:
1150  0032 89            	pushw	x
1151  0033 5f            	clrw	x
1152  0034 89            	pushw	x
1153  0035 ae0000        	ldw	x,#L542
1154  0038 cd0000        	call	_assert_failed
1156  003b 5b04          	addw	sp,#4
1157  003d 81            	ret	
1193                     ; 222 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1193                     ; 223 {
1194                     .text:	section	.text,new
1195  0000               _ADC1_PrescalerConfig:
1197  0000 88            	push	a
1198       00000000      OFST:	set	0
1201                     ; 226     assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1203  0001 4d            	tnz	a
1204  0002 272a          	jreq	L602
1205  0004 a110          	cp	a,#16
1206  0006 2726          	jreq	L602
1207  0008 a120          	cp	a,#32
1208  000a 2722          	jreq	L602
1209  000c a130          	cp	a,#48
1210  000e 271e          	jreq	L602
1211  0010 a140          	cp	a,#64
1212  0012 271a          	jreq	L602
1213  0014 a150          	cp	a,#80
1214  0016 2716          	jreq	L602
1215  0018 a160          	cp	a,#96
1216  001a 2712          	jreq	L602
1217  001c a170          	cp	a,#112
1218  001e 270e          	jreq	L602
1219  0020 ae00e2        	ldw	x,#226
1220  0023 89            	pushw	x
1221  0024 5f            	clrw	x
1222  0025 89            	pushw	x
1223  0026 ae0000        	ldw	x,#L542
1224  0029 cd0000        	call	_assert_failed
1226  002c 5b04          	addw	sp,#4
1227  002e               L602:
1228                     ; 229     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1230  002e c65401        	ld	a,21505
1231  0031 a48f          	and	a,#143
1232  0033 c75401        	ld	21505,a
1233                     ; 231     ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1235  0036 c65401        	ld	a,21505
1236  0039 1a01          	or	a,(OFST+1,sp)
1237  003b c75401        	ld	21505,a
1238                     ; 233 }
1241  003e 84            	pop	a
1242  003f 81            	ret	
1290                     ; 244 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1290                     ; 245 {
1291                     .text:	section	.text,new
1292  0000               _ADC1_SchmittTriggerConfig:
1294  0000 89            	pushw	x
1295       00000000      OFST:	set	0
1298                     ; 248     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1300  0001 9e            	ld	a,xh
1301  0002 4d            	tnz	a
1302  0003 273b          	jreq	L022
1303  0005 9e            	ld	a,xh
1304  0006 4a            	dec	a
1305  0007 2737          	jreq	L022
1306  0009 9e            	ld	a,xh
1307  000a a102          	cp	a,#2
1308  000c 2732          	jreq	L022
1309  000e 9e            	ld	a,xh
1310  000f a103          	cp	a,#3
1311  0011 272d          	jreq	L022
1312  0013 9e            	ld	a,xh
1313  0014 a104          	cp	a,#4
1314  0016 2728          	jreq	L022
1315  0018 9e            	ld	a,xh
1316  0019 a105          	cp	a,#5
1317  001b 2723          	jreq	L022
1318  001d 9e            	ld	a,xh
1319  001e a106          	cp	a,#6
1320  0020 271e          	jreq	L022
1321  0022 9e            	ld	a,xh
1322  0023 a107          	cp	a,#7
1323  0025 2719          	jreq	L022
1324  0027 9e            	ld	a,xh
1325  0028 a108          	cp	a,#8
1326  002a 2714          	jreq	L022
1327  002c 9e            	ld	a,xh
1328  002d a10c          	cp	a,#12
1329  002f 270f          	jreq	L022
1330  0031 9e            	ld	a,xh
1331  0032 4c            	inc	a
1332  0033 270b          	jreq	L022
1333  0035 9e            	ld	a,xh
1334  0036 a109          	cp	a,#9
1335  0038 2706          	jreq	L022
1336  003a ae00f8        	ldw	x,#248
1337  003d cd00bf        	call	LC006
1338  0040               L022:
1339                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1341  0040 7b02          	ld	a,(OFST+2,sp)
1342  0042 2708          	jreq	L032
1343  0044 4a            	dec	a
1344  0045 2705          	jreq	L032
1345  0047 ae00f9        	ldw	x,#249
1346  004a ad73          	call	LC006
1347  004c               L032:
1348                     ; 251     if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1350  004c 7b01          	ld	a,(OFST+1,sp)
1351  004e a1ff          	cp	a,#255
1352  0050 261d          	jrne	L564
1353                     ; 253         if (NewState != DISABLE)
1355  0052 7b02          	ld	a,(OFST+2,sp)
1356  0054 270a          	jreq	L764
1357                     ; 255             ADC1->TDRL &= (uint8_t)0x0;
1359  0056 725f5407      	clr	21511
1360                     ; 256             ADC1->TDRH &= (uint8_t)0x0;
1362  005a 725f5406      	clr	21510
1364  005e 2057          	jra	L374
1365  0060               L764:
1366                     ; 260             ADC1->TDRL |= (uint8_t)0xFF;
1368  0060 c65407        	ld	a,21511
1369  0063 aaff          	or	a,#255
1370  0065 c75407        	ld	21511,a
1371                     ; 261             ADC1->TDRH |= (uint8_t)0xFF;
1373  0068 c65406        	ld	a,21510
1374  006b aaff          	or	a,#255
1375  006d 2045          	jp	LC003
1376  006f               L564:
1377                     ; 264     else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1379  006f a108          	cp	a,#8
1380  0071 0d02          	tnz	(OFST+2,sp)
1381  0073 2420          	jruge	L574
1382                     ; 266         if (NewState != DISABLE)
1384  0075 2711          	jreq	L774
1385                     ; 268             ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1387  0077 ad40          	call	LC005
1388  0079 2704          	jreq	L432
1389  007b               L632:
1390  007b 48            	sll	a
1391  007c 5a            	decw	x
1392  007d 26fc          	jrne	L632
1393  007f               L432:
1394  007f 43            	cpl	a
1395  0080 c45407        	and	a,21511
1396  0083               LC004:
1397  0083 c75407        	ld	21511,a
1399  0086 202f          	jra	L374
1400  0088               L774:
1401                     ; 272             ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1403  0088 ad2f          	call	LC005
1404  008a 2704          	jreq	L042
1405  008c               L242:
1406  008c 48            	sll	a
1407  008d 5a            	decw	x
1408  008e 26fc          	jrne	L242
1409  0090               L042:
1410  0090 ca5407        	or	a,21511
1411  0093 20ee          	jp	LC004
1412  0095               L574:
1413                     ; 277         if (NewState != DISABLE)
1415  0095 2710          	jreq	L505
1416                     ; 279             ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1418  0097 a008          	sub	a,#8
1419  0099 ad1e          	call	LC005
1420  009b 2704          	jreq	L442
1421  009d               L642:
1422  009d 48            	sll	a
1423  009e 5a            	decw	x
1424  009f 26fc          	jrne	L642
1425  00a1               L442:
1426  00a1 43            	cpl	a
1427  00a2 c45406        	and	a,21510
1429  00a5 200d          	jp	LC003
1430  00a7               L505:
1431                     ; 283             ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1433  00a7 a008          	sub	a,#8
1434  00a9 ad0e          	call	LC005
1435  00ab 2704          	jreq	L052
1436  00ad               L252:
1437  00ad 48            	sll	a
1438  00ae 5a            	decw	x
1439  00af 26fc          	jrne	L252
1440  00b1               L052:
1441  00b1 ca5406        	or	a,21510
1442  00b4               LC003:
1443  00b4 c75406        	ld	21510,a
1444  00b7               L374:
1445                     ; 287 }
1448  00b7 85            	popw	x
1449  00b8 81            	ret	
1451  00b9               LC005:
1452  00b9 5f            	clrw	x
1453  00ba 97            	ld	xl,a
1454  00bb a601          	ld	a,#1
1455  00bd 5d            	tnzw	x
1456  00be 81            	ret	
1457  00bf               LC006:
1458  00bf 89            	pushw	x
1459  00c0 5f            	clrw	x
1460  00c1 89            	pushw	x
1461  00c2 ae0000        	ldw	x,#L542
1462  00c5 cd0000        	call	_assert_failed
1464  00c8 5b04          	addw	sp,#4
1465  00ca 81            	ret	
1522                     ; 300 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1522                     ; 301 {
1523                     .text:	section	.text,new
1524  0000               _ADC1_ConversionConfig:
1526  0000 89            	pushw	x
1527       00000000      OFST:	set	0
1530                     ; 304     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1532  0001 9e            	ld	a,xh
1533  0002 4d            	tnz	a
1534  0003 2709          	jreq	L262
1535  0005 9e            	ld	a,xh
1536  0006 4a            	dec	a
1537  0007 2705          	jreq	L262
1538  0009 ae0130        	ldw	x,#304
1539  000c ad6b          	call	LC007
1540  000e               L262:
1541                     ; 305     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1543  000e 7b02          	ld	a,(OFST+2,sp)
1544  0010 272d          	jreq	L272
1545  0012 a101          	cp	a,#1
1546  0014 2729          	jreq	L272
1547  0016 a102          	cp	a,#2
1548  0018 2725          	jreq	L272
1549  001a a103          	cp	a,#3
1550  001c 2721          	jreq	L272
1551  001e a104          	cp	a,#4
1552  0020 271d          	jreq	L272
1553  0022 a105          	cp	a,#5
1554  0024 2719          	jreq	L272
1555  0026 a106          	cp	a,#6
1556  0028 2715          	jreq	L272
1557  002a a107          	cp	a,#7
1558  002c 2711          	jreq	L272
1559  002e a108          	cp	a,#8
1560  0030 270d          	jreq	L272
1561  0032 a10c          	cp	a,#12
1562  0034 2709          	jreq	L272
1563  0036 a109          	cp	a,#9
1564  0038 2705          	jreq	L272
1565  003a ae0131        	ldw	x,#305
1566  003d ad3a          	call	LC007
1567  003f               L272:
1568                     ; 306     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1570  003f 7b05          	ld	a,(OFST+5,sp)
1571  0041 2709          	jreq	L203
1572  0043 a108          	cp	a,#8
1573  0045 2705          	jreq	L203
1574  0047 ae0132        	ldw	x,#306
1575  004a ad2d          	call	LC007
1576  004c               L203:
1577                     ; 309     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1579  004c 72175402      	bres	21506,#3
1580                     ; 311     ADC1->CR2 |= (uint8_t)(ADC1_Align);
1582  0050 c65402        	ld	a,21506
1583  0053 1a05          	or	a,(OFST+5,sp)
1584  0055 c75402        	ld	21506,a
1585                     ; 313     if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1587  0058 7b01          	ld	a,(OFST+1,sp)
1588  005a 4a            	dec	a
1589  005b 2606          	jrne	L735
1590                     ; 316         ADC1->CR1 |= ADC1_CR1_CONT;
1592  005d 72125401      	bset	21505,#1
1594  0061 2004          	jra	L145
1595  0063               L735:
1596                     ; 321         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1598  0063 72135401      	bres	21505,#1
1599  0067               L145:
1600                     ; 325     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1602  0067 c65400        	ld	a,21504
1603  006a a4f0          	and	a,#240
1604  006c c75400        	ld	21504,a
1605                     ; 327     ADC1->CSR |= (uint8_t)(ADC1_Channel);
1607  006f c65400        	ld	a,21504
1608  0072 1a02          	or	a,(OFST+2,sp)
1609  0074 c75400        	ld	21504,a
1610                     ; 329 }
1613  0077 85            	popw	x
1614  0078 81            	ret	
1616  0079               LC007:
1617  0079 89            	pushw	x
1618  007a 5f            	clrw	x
1619  007b 89            	pushw	x
1620  007c ae0000        	ldw	x,#L542
1621  007f cd0000        	call	_assert_failed
1623  0082 5b04          	addw	sp,#4
1624  0084 81            	ret	
1670                     ; 342 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1670                     ; 343 {
1671                     .text:	section	.text,new
1672  0000               _ADC1_ExternalTriggerConfig:
1674  0000 89            	pushw	x
1675       00000000      OFST:	set	0
1678                     ; 346     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1680  0001 9e            	ld	a,xh
1681  0002 4d            	tnz	a
1682  0003 270a          	jreq	L413
1683  0005 9e            	ld	a,xh
1684  0006 a110          	cp	a,#16
1685  0008 2705          	jreq	L413
1686  000a ae015a        	ldw	x,#346
1687  000d ad2c          	call	LC008
1688  000f               L413:
1689                     ; 347     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1691  000f 7b02          	ld	a,(OFST+2,sp)
1692  0011 2708          	jreq	L423
1693  0013 4a            	dec	a
1694  0014 2705          	jreq	L423
1695  0016 ae015b        	ldw	x,#347
1696  0019 ad20          	call	LC008
1697  001b               L423:
1698                     ; 350     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1700  001b c65402        	ld	a,21506
1701  001e a4cf          	and	a,#207
1702  0020 c75402        	ld	21506,a
1703                     ; 352     if (NewState != DISABLE)
1705  0023 7b02          	ld	a,(OFST+2,sp)
1706  0025 2706          	jreq	L565
1707                     ; 355         ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1709  0027 721c5402      	bset	21506,#6
1711  002b 2004          	jra	L765
1712  002d               L565:
1713                     ; 360         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1715  002d 721d5402      	bres	21506,#6
1716  0031               L765:
1717                     ; 364     ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1719  0031 c65402        	ld	a,21506
1720  0034 1a01          	or	a,(OFST+1,sp)
1721  0036 c75402        	ld	21506,a
1722                     ; 366 }
1725  0039 85            	popw	x
1726  003a 81            	ret	
1728  003b               LC008:
1729  003b 89            	pushw	x
1730  003c 5f            	clrw	x
1731  003d 89            	pushw	x
1732  003e ae0000        	ldw	x,#L542
1733  0041 cd0000        	call	_assert_failed
1735  0044 5b04          	addw	sp,#4
1736  0046 81            	ret	
1759                     ; 378 void ADC1_StartConversion(void)
1759                     ; 379 {
1760                     .text:	section	.text,new
1761  0000               _ADC1_StartConversion:
1765                     ; 380     ADC1->CR1 |= ADC1_CR1_ADON;
1767  0000 72105401      	bset	21505,#0
1768                     ; 381 }
1771  0004 81            	ret	
1811                     ; 390 uint16_t ADC1_GetConversionValue(void)
1811                     ; 391 {
1812                     .text:	section	.text,new
1813  0000               _ADC1_GetConversionValue:
1815  0000 5205          	subw	sp,#5
1816       00000005      OFST:	set	5
1819                     ; 393     uint16_t temph = 0;
1821                     ; 394     uint8_t templ = 0;
1823                     ; 396     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1825  0002 720754020e    	btjf	21506,#3,L716
1826                     ; 399         templ = ADC1->DRL;
1828  0007 c65405        	ld	a,21509
1829  000a 6b03          	ld	(OFST-2,sp),a
1830                     ; 401         temph = ADC1->DRH;
1832  000c c65404        	ld	a,21508
1833  000f 97            	ld	xl,a
1834                     ; 403         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1836  0010 7b03          	ld	a,(OFST-2,sp)
1837  0012 02            	rlwa	x,a
1839  0013 201a          	jra	L126
1840  0015               L716:
1841                     ; 408         temph = ADC1->DRH;
1843  0015 c65404        	ld	a,21508
1844  0018 97            	ld	xl,a
1845                     ; 410         templ = ADC1->DRL;
1847  0019 c65405        	ld	a,21509
1848  001c 6b03          	ld	(OFST-2,sp),a
1849                     ; 412         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1851  001e 4f            	clr	a
1852  001f 02            	rlwa	x,a
1853  0020 1f01          	ldw	(OFST-4,sp),x
1854  0022 7b03          	ld	a,(OFST-2,sp)
1855  0024 97            	ld	xl,a
1856  0025 a640          	ld	a,#64
1857  0027 42            	mul	x,a
1858  0028 01            	rrwa	x,a
1859  0029 1a02          	or	a,(OFST-3,sp)
1860  002b 01            	rrwa	x,a
1861  002c 1a01          	or	a,(OFST-4,sp)
1862  002e 01            	rrwa	x,a
1863  002f               L126:
1864                     ; 415     return ((uint16_t)temph);
1868  002f 5b05          	addw	sp,#5
1869  0031 81            	ret	
1916                     ; 427 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1916                     ; 428 {
1917                     .text:	section	.text,new
1918  0000               _ADC1_AWDChannelConfig:
1920  0000 89            	pushw	x
1921       00000000      OFST:	set	0
1924                     ; 430     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1926  0001 9f            	ld	a,xl
1927  0002 4d            	tnz	a
1928  0003 270a          	jreq	L243
1929  0005 9f            	ld	a,xl
1930  0006 4a            	dec	a
1931  0007 2706          	jreq	L243
1932  0009 ae01ae        	ldw	x,#430
1933  000c cd0092        	call	LC012
1934  000f               L243:
1935                     ; 431     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1937  000f 7b01          	ld	a,(OFST+1,sp)
1938  0011 272f          	jreq	L253
1939  0013 a101          	cp	a,#1
1940  0015 272b          	jreq	L253
1941  0017 a102          	cp	a,#2
1942  0019 2727          	jreq	L253
1943  001b a103          	cp	a,#3
1944  001d 2723          	jreq	L253
1945  001f a104          	cp	a,#4
1946  0021 271f          	jreq	L253
1947  0023 a105          	cp	a,#5
1948  0025 271b          	jreq	L253
1949  0027 a106          	cp	a,#6
1950  0029 2717          	jreq	L253
1951  002b a107          	cp	a,#7
1952  002d 2713          	jreq	L253
1953  002f a108          	cp	a,#8
1954  0031 270f          	jreq	L253
1955  0033 a10c          	cp	a,#12
1956  0035 270b          	jreq	L253
1957  0037 a109          	cp	a,#9
1958  0039 2707          	jreq	L253
1959  003b ae01af        	ldw	x,#431
1960  003e ad52          	call	LC012
1961  0040 7b01          	ld	a,(OFST+1,sp)
1962  0042               L253:
1963                     ; 433     if (Channel < (uint8_t)8)
1965  0042 a108          	cp	a,#8
1966  0044 0d02          	tnz	(OFST+2,sp)
1967  0046 2420          	jruge	L546
1968                     ; 435         if (NewState != DISABLE)
1970  0048 270d          	jreq	L746
1971                     ; 437             ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1973  004a ad40          	call	LC011
1974  004c 2704          	jreq	L653
1975  004e               L063:
1976  004e 48            	sll	a
1977  004f 5a            	decw	x
1978  0050 26fc          	jrne	L063
1979  0052               L653:
1980  0052 ca540f        	or	a,21519
1982  0055 200c          	jp	LC010
1983  0057               L746:
1984                     ; 441             ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1986  0057 ad33          	call	LC011
1987  0059 2704          	jreq	L263
1988  005b               L463:
1989  005b 48            	sll	a
1990  005c 5a            	decw	x
1991  005d 26fc          	jrne	L463
1992  005f               L263:
1993  005f 43            	cpl	a
1994  0060 c4540f        	and	a,21519
1995  0063               LC010:
1996  0063 c7540f        	ld	21519,a
1997  0066 2022          	jra	L356
1998  0068               L546:
1999                     ; 446         if (NewState != DISABLE)
2001  0068 270f          	jreq	L556
2002                     ; 448             ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
2004  006a a008          	sub	a,#8
2005  006c ad1e          	call	LC011
2006  006e 2704          	jreq	L663
2007  0070               L073:
2008  0070 48            	sll	a
2009  0071 5a            	decw	x
2010  0072 26fc          	jrne	L073
2011  0074               L663:
2012  0074 ca540e        	or	a,21518
2014  0077 200e          	jp	LC009
2015  0079               L556:
2016                     ; 452             ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
2018  0079 a008          	sub	a,#8
2019  007b ad0f          	call	LC011
2020  007d 2704          	jreq	L273
2021  007f               L473:
2022  007f 48            	sll	a
2023  0080 5a            	decw	x
2024  0081 26fc          	jrne	L473
2025  0083               L273:
2026  0083 43            	cpl	a
2027  0084 c4540e        	and	a,21518
2028  0087               LC009:
2029  0087 c7540e        	ld	21518,a
2030  008a               L356:
2031                     ; 455 }
2034  008a 85            	popw	x
2035  008b 81            	ret	
2037  008c               LC011:
2038  008c 5f            	clrw	x
2039  008d 97            	ld	xl,a
2040  008e a601          	ld	a,#1
2041  0090 5d            	tnzw	x
2042  0091 81            	ret	
2043  0092               LC012:
2044  0092 89            	pushw	x
2045  0093 5f            	clrw	x
2046  0094 89            	pushw	x
2047  0095 ae0000        	ldw	x,#L542
2048  0098 cd0000        	call	_assert_failed
2050  009b 5b04          	addw	sp,#4
2051  009d 81            	ret	
2083                     ; 463 void ADC1_SetHighThreshold(uint16_t Threshold)
2083                     ; 464 {
2084                     .text:	section	.text,new
2085  0000               _ADC1_SetHighThreshold:
2087  0000 89            	pushw	x
2088       00000000      OFST:	set	0
2091                     ; 465     ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
2093  0001 54            	srlw	x
2094  0002 54            	srlw	x
2095  0003 9f            	ld	a,xl
2096  0004 c75408        	ld	21512,a
2097                     ; 466     ADC1->HTRL = (uint8_t)Threshold;
2099  0007 7b02          	ld	a,(OFST+2,sp)
2100  0009 c75409        	ld	21513,a
2101                     ; 467 }
2104  000c 85            	popw	x
2105  000d 81            	ret	
2138                     ; 475 void ADC1_SetLowThreshold(uint16_t Threshold)
2138                     ; 476 {
2139                     .text:	section	.text,new
2140  0000               _ADC1_SetLowThreshold:
2144                     ; 477     ADC1->LTRL = (uint8_t)Threshold;
2146  0000 9f            	ld	a,xl
2147  0001 c7540b        	ld	21515,a
2148                     ; 478     ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
2150  0004 54            	srlw	x
2151  0005 54            	srlw	x
2152  0006 9f            	ld	a,xl
2153  0007 c7540a        	ld	21514,a
2154                     ; 479 }
2157  000a 81            	ret	
2205                     ; 488 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
2205                     ; 489 {
2206                     .text:	section	.text,new
2207  0000               _ADC1_GetBufferValue:
2209  0000 88            	push	a
2210  0001 5205          	subw	sp,#5
2211       00000005      OFST:	set	5
2214                     ; 491     uint16_t temph = 0;
2216                     ; 492     uint8_t templ = 0;
2218                     ; 495     assert_param(IS_ADC1_BUFFER_OK(Buffer));
2220  0003 7b06          	ld	a,(OFST+1,sp)
2221  0005 a10a          	cp	a,#10
2222  0007 2510          	jrult	L604
2223  0009 ae01ef        	ldw	x,#495
2224  000c 89            	pushw	x
2225  000d 5f            	clrw	x
2226  000e 89            	pushw	x
2227  000f ae0000        	ldw	x,#L542
2228  0012 cd0000        	call	_assert_failed
2230  0015 5b04          	addw	sp,#4
2231  0017 7b06          	ld	a,(OFST+1,sp)
2232  0019               L604:
2233                     ; 497     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
2235  0019 48            	sll	a
2236  001a 5f            	clrw	x
2237  001b 97            	ld	xl,a
2238  001c 7207540213    	btjf	21506,#3,L137
2239                     ; 500         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2241  0021 d653e1        	ld	a,(21473,x)
2242  0024 6b03          	ld	(OFST-2,sp),a
2243                     ; 502         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2245  0026 7b06          	ld	a,(OFST+1,sp)
2246  0028 48            	sll	a
2247  0029 5f            	clrw	x
2248  002a 97            	ld	xl,a
2249  002b d653e0        	ld	a,(21472,x)
2250  002e 97            	ld	xl,a
2251                     ; 504         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
2253  002f 7b03          	ld	a,(OFST-2,sp)
2254  0031 02            	rlwa	x,a
2256  0032 2024          	jra	L337
2257  0034               L137:
2258                     ; 509         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2260  0034 d653e0        	ld	a,(21472,x)
2261  0037 5f            	clrw	x
2262  0038 97            	ld	xl,a
2263  0039 1f04          	ldw	(OFST-1,sp),x
2264                     ; 511         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2266  003b 7b06          	ld	a,(OFST+1,sp)
2267  003d 48            	sll	a
2268  003e 5f            	clrw	x
2269  003f 97            	ld	xl,a
2270  0040 d653e1        	ld	a,(21473,x)
2271  0043 6b03          	ld	(OFST-2,sp),a
2272                     ; 513         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
2274  0045 1e04          	ldw	x,(OFST-1,sp)
2275  0047 4f            	clr	a
2276  0048 02            	rlwa	x,a
2277  0049 1f01          	ldw	(OFST-4,sp),x
2278  004b 7b03          	ld	a,(OFST-2,sp)
2279  004d 97            	ld	xl,a
2280  004e a640          	ld	a,#64
2281  0050 42            	mul	x,a
2282  0051 01            	rrwa	x,a
2283  0052 1a02          	or	a,(OFST-3,sp)
2284  0054 01            	rrwa	x,a
2285  0055 1a01          	or	a,(OFST-4,sp)
2286  0057 01            	rrwa	x,a
2287  0058               L337:
2288                     ; 516     return ((uint16_t)temph);
2292  0058 5b06          	addw	sp,#6
2293  005a 81            	ret	
2358                     ; 526 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2358                     ; 527 {
2359                     .text:	section	.text,new
2360  0000               _ADC1_GetAWDChannelStatus:
2362  0000 88            	push	a
2363  0001 88            	push	a
2364       00000001      OFST:	set	1
2367                     ; 528     uint8_t status = 0;
2369  0002 0f01          	clr	(OFST+0,sp)
2370                     ; 531     assert_param(IS_ADC1_CHANNEL_OK(Channel));
2372  0004 4d            	tnz	a
2373  0005 2736          	jreq	L024
2374  0007 a101          	cp	a,#1
2375  0009 2732          	jreq	L024
2376  000b a102          	cp	a,#2
2377  000d 272e          	jreq	L024
2378  000f a103          	cp	a,#3
2379  0011 272a          	jreq	L024
2380  0013 a104          	cp	a,#4
2381  0015 2726          	jreq	L024
2382  0017 a105          	cp	a,#5
2383  0019 2722          	jreq	L024
2384  001b a106          	cp	a,#6
2385  001d 271e          	jreq	L024
2386  001f a107          	cp	a,#7
2387  0021 271a          	jreq	L024
2388  0023 a108          	cp	a,#8
2389  0025 2716          	jreq	L024
2390  0027 a10c          	cp	a,#12
2391  0029 2712          	jreq	L024
2392  002b a109          	cp	a,#9
2393  002d 270e          	jreq	L024
2394  002f ae0213        	ldw	x,#531
2395  0032 89            	pushw	x
2396  0033 5f            	clrw	x
2397  0034 89            	pushw	x
2398  0035 ae0000        	ldw	x,#L542
2399  0038 cd0000        	call	_assert_failed
2401  003b 5b04          	addw	sp,#4
2402  003d               L024:
2403                     ; 533     if (Channel < (uint8_t)8)
2405  003d 7b02          	ld	a,(OFST+1,sp)
2406  003f a108          	cp	a,#8
2407  0041 2410          	jruge	L567
2408                     ; 535         status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2410  0043 5f            	clrw	x
2411  0044 97            	ld	xl,a
2412  0045 a601          	ld	a,#1
2413  0047 5d            	tnzw	x
2414  0048 2704          	jreq	L424
2415  004a               L624:
2416  004a 48            	sll	a
2417  004b 5a            	decw	x
2418  004c 26fc          	jrne	L624
2419  004e               L424:
2420  004e c4540d        	and	a,21517
2422  0051 2010          	jra	L767
2423  0053               L567:
2424                     ; 539         status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2426  0053 a008          	sub	a,#8
2427  0055 5f            	clrw	x
2428  0056 97            	ld	xl,a
2429  0057 a601          	ld	a,#1
2430  0059 5d            	tnzw	x
2431  005a 2704          	jreq	L034
2432  005c               L234:
2433  005c 48            	sll	a
2434  005d 5a            	decw	x
2435  005e 26fc          	jrne	L234
2436  0060               L034:
2437  0060 c4540c        	and	a,21516
2438  0063               L767:
2439                     ; 542     return ((FlagStatus)status);
2443  0063 85            	popw	x
2444  0064 81            	ret	
2599                     ; 551 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2599                     ; 552 {
2600                     .text:	section	.text,new
2601  0000               _ADC1_GetFlagStatus:
2603  0000 88            	push	a
2604  0001 88            	push	a
2605       00000001      OFST:	set	1
2608                     ; 553     uint8_t flagstatus = 0;
2610                     ; 554     uint8_t temp = 0;
2612                     ; 557     assert_param(IS_ADC1_FLAG_OK(Flag));
2614  0002 7b02          	ld	a,(OFST+1,sp)
2615  0004 a180          	cp	a,#128
2616  0006 2740          	jreq	L244
2617  0008 a141          	cp	a,#65
2618  000a 273c          	jreq	L244
2619  000c a140          	cp	a,#64
2620  000e 2738          	jreq	L244
2621  0010 a110          	cp	a,#16
2622  0012 2734          	jreq	L244
2623  0014 a111          	cp	a,#17
2624  0016 2730          	jreq	L244
2625  0018 a112          	cp	a,#18
2626  001a 272c          	jreq	L244
2627  001c a113          	cp	a,#19
2628  001e 2728          	jreq	L244
2629  0020 a114          	cp	a,#20
2630  0022 2724          	jreq	L244
2631  0024 a115          	cp	a,#21
2632  0026 2720          	jreq	L244
2633  0028 a116          	cp	a,#22
2634  002a 271c          	jreq	L244
2635  002c a117          	cp	a,#23
2636  002e 2718          	jreq	L244
2637  0030 a118          	cp	a,#24
2638  0032 2714          	jreq	L244
2639  0034 a119          	cp	a,#25
2640  0036 2710          	jreq	L244
2641  0038 ae022d        	ldw	x,#557
2642  003b 89            	pushw	x
2643  003c 5f            	clrw	x
2644  003d 89            	pushw	x
2645  003e ae0000        	ldw	x,#L542
2646  0041 cd0000        	call	_assert_failed
2648  0044 5b04          	addw	sp,#4
2649  0046 7b02          	ld	a,(OFST+1,sp)
2650  0048               L244:
2651                     ; 559     if ((Flag & 0x0F) == 0x01)
2653  0048 a40f          	and	a,#15
2654  004a 4a            	dec	a
2655  004b 2607          	jrne	L3501
2656                     ; 562         flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2658  004d c65403        	ld	a,21507
2659  0050 a440          	and	a,#64
2661  0052 2039          	jra	L5501
2662  0054               L3501:
2663                     ; 564     else if ((Flag & 0xF0) == 0x10)
2665  0054 7b02          	ld	a,(OFST+1,sp)
2666  0056 a4f0          	and	a,#240
2667  0058 a110          	cp	a,#16
2668  005a 262c          	jrne	L7501
2669                     ; 567         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2671  005c 7b02          	ld	a,(OFST+1,sp)
2672  005e a40f          	and	a,#15
2673  0060 6b01          	ld	(OFST+0,sp),a
2674                     ; 568         if (temp < 8)
2676  0062 a108          	cp	a,#8
2677  0064 2410          	jruge	L1601
2678                     ; 570             flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2680  0066 5f            	clrw	x
2681  0067 97            	ld	xl,a
2682  0068 a601          	ld	a,#1
2683  006a 5d            	tnzw	x
2684  006b 2704          	jreq	L644
2685  006d               L054:
2686  006d 48            	sll	a
2687  006e 5a            	decw	x
2688  006f 26fc          	jrne	L054
2689  0071               L644:
2690  0071 c4540d        	and	a,21517
2692  0074 2017          	jra	L5501
2693  0076               L1601:
2694                     ; 574             flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2696  0076 a008          	sub	a,#8
2697  0078 5f            	clrw	x
2698  0079 97            	ld	xl,a
2699  007a a601          	ld	a,#1
2700  007c 5d            	tnzw	x
2701  007d 2704          	jreq	L254
2702  007f               L454:
2703  007f 48            	sll	a
2704  0080 5a            	decw	x
2705  0081 26fc          	jrne	L454
2706  0083               L254:
2707  0083 c4540c        	and	a,21516
2708  0086 2005          	jra	L5501
2709  0088               L7501:
2710                     ; 579         flagstatus = (uint8_t)(ADC1->CSR & Flag);
2712  0088 c65400        	ld	a,21504
2713  008b 1402          	and	a,(OFST+1,sp)
2714  008d               L5501:
2715                     ; 581     return ((FlagStatus)flagstatus);
2719  008d 85            	popw	x
2720  008e 81            	ret	
2763                     ; 591 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2763                     ; 592 {
2764                     .text:	section	.text,new
2765  0000               _ADC1_ClearFlag:
2767  0000 88            	push	a
2768  0001 88            	push	a
2769       00000001      OFST:	set	1
2772                     ; 593     uint8_t temp = 0;
2774  0002 0f01          	clr	(OFST+0,sp)
2775                     ; 596     assert_param(IS_ADC1_FLAG_OK(Flag));
2777  0004 a180          	cp	a,#128
2778  0006 273e          	jreq	L464
2779  0008 a141          	cp	a,#65
2780  000a 273a          	jreq	L464
2781  000c a140          	cp	a,#64
2782  000e 2736          	jreq	L464
2783  0010 a110          	cp	a,#16
2784  0012 2732          	jreq	L464
2785  0014 a111          	cp	a,#17
2786  0016 272e          	jreq	L464
2787  0018 a112          	cp	a,#18
2788  001a 272a          	jreq	L464
2789  001c a113          	cp	a,#19
2790  001e 2726          	jreq	L464
2791  0020 a114          	cp	a,#20
2792  0022 2722          	jreq	L464
2793  0024 a115          	cp	a,#21
2794  0026 271e          	jreq	L464
2795  0028 a116          	cp	a,#22
2796  002a 271a          	jreq	L464
2797  002c a117          	cp	a,#23
2798  002e 2716          	jreq	L464
2799  0030 a118          	cp	a,#24
2800  0032 2712          	jreq	L464
2801  0034 a119          	cp	a,#25
2802  0036 270e          	jreq	L464
2803  0038 ae0254        	ldw	x,#596
2804  003b 89            	pushw	x
2805  003c 5f            	clrw	x
2806  003d 89            	pushw	x
2807  003e ae0000        	ldw	x,#L542
2808  0041 cd0000        	call	_assert_failed
2810  0044 5b04          	addw	sp,#4
2811  0046               L464:
2812                     ; 598     if ((Flag & 0x0F) == 0x01)
2814  0046 7b02          	ld	a,(OFST+1,sp)
2815  0048 a40f          	and	a,#15
2816  004a 4a            	dec	a
2817  004b 2606          	jrne	L7011
2818                     ; 601         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2820  004d 721d5403      	bres	21507,#6
2822  0051 2045          	jra	L1111
2823  0053               L7011:
2824                     ; 603     else if ((Flag & 0xF0) == 0x10)
2826  0053 7b02          	ld	a,(OFST+1,sp)
2827  0055 a4f0          	and	a,#240
2828  0057 a110          	cp	a,#16
2829  0059 2634          	jrne	L3111
2830                     ; 606         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2832  005b 7b02          	ld	a,(OFST+1,sp)
2833  005d a40f          	and	a,#15
2834  005f 6b01          	ld	(OFST+0,sp),a
2835                     ; 607         if (temp < 8)
2837  0061 a108          	cp	a,#8
2838  0063 2414          	jruge	L5111
2839                     ; 609             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2841  0065 5f            	clrw	x
2842  0066 97            	ld	xl,a
2843  0067 a601          	ld	a,#1
2844  0069 5d            	tnzw	x
2845  006a 2704          	jreq	L074
2846  006c               L274:
2847  006c 48            	sll	a
2848  006d 5a            	decw	x
2849  006e 26fc          	jrne	L274
2850  0070               L074:
2851  0070 43            	cpl	a
2852  0071 c4540d        	and	a,21517
2853  0074 c7540d        	ld	21517,a
2855  0077 201f          	jra	L1111
2856  0079               L5111:
2857                     ; 613             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2859  0079 a008          	sub	a,#8
2860  007b 5f            	clrw	x
2861  007c 97            	ld	xl,a
2862  007d a601          	ld	a,#1
2863  007f 5d            	tnzw	x
2864  0080 2704          	jreq	L474
2865  0082               L674:
2866  0082 48            	sll	a
2867  0083 5a            	decw	x
2868  0084 26fc          	jrne	L674
2869  0086               L474:
2870  0086 43            	cpl	a
2871  0087 c4540c        	and	a,21516
2872  008a c7540c        	ld	21516,a
2873  008d 2009          	jra	L1111
2874  008f               L3111:
2875                     ; 618         ADC1->CSR &= (uint8_t) (~Flag);
2877  008f 7b02          	ld	a,(OFST+1,sp)
2878  0091 43            	cpl	a
2879  0092 c45400        	and	a,21504
2880  0095 c75400        	ld	21504,a
2881  0098               L1111:
2882                     ; 620 }
2885  0098 85            	popw	x
2886  0099 81            	ret	
2940                     ; 640 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2940                     ; 641 {
2941                     .text:	section	.text,new
2942  0000               _ADC1_GetITStatus:
2944  0000 89            	pushw	x
2945  0001 88            	push	a
2946       00000001      OFST:	set	1
2949                     ; 642     ITStatus itstatus = RESET;
2951                     ; 643     uint8_t temp = 0;
2953                     ; 646     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2955  0002 1e02          	ldw	x,(OFST+1,sp)
2956  0004 a30080        	cpw	x,#128
2957  0007 274a          	jreq	L605
2958  0009 a30140        	cpw	x,#320
2959  000c 2745          	jreq	L605
2960  000e a30110        	cpw	x,#272
2961  0011 2740          	jreq	L605
2962  0013 a30111        	cpw	x,#273
2963  0016 273b          	jreq	L605
2964  0018 a30112        	cpw	x,#274
2965  001b 2736          	jreq	L605
2966  001d a30113        	cpw	x,#275
2967  0020 2731          	jreq	L605
2968  0022 a30114        	cpw	x,#276
2969  0025 272c          	jreq	L605
2970  0027 a30115        	cpw	x,#277
2971  002a 2727          	jreq	L605
2972  002c a30116        	cpw	x,#278
2973  002f 2722          	jreq	L605
2974  0031 a30117        	cpw	x,#279
2975  0034 271d          	jreq	L605
2976  0036 a30118        	cpw	x,#280
2977  0039 2718          	jreq	L605
2978  003b a3011c        	cpw	x,#284
2979  003e 2713          	jreq	L605
2980  0040 a30119        	cpw	x,#281
2981  0043 270e          	jreq	L605
2982  0045 ae0286        	ldw	x,#646
2983  0048 89            	pushw	x
2984  0049 5f            	clrw	x
2985  004a 89            	pushw	x
2986  004b ae0000        	ldw	x,#L542
2987  004e cd0000        	call	_assert_failed
2989  0051 5b04          	addw	sp,#4
2990  0053               L605:
2991                     ; 648     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2993  0053 7b03          	ld	a,(OFST+2,sp)
2994  0055 a4f0          	and	a,#240
2995  0057 5f            	clrw	x
2996  0058 02            	rlwa	x,a
2997  0059 a30010        	cpw	x,#16
2998  005c 262c          	jrne	L7411
2999                     ; 651         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3001  005e 7b03          	ld	a,(OFST+2,sp)
3002  0060 a40f          	and	a,#15
3003  0062 6b01          	ld	(OFST+0,sp),a
3004                     ; 652         if (temp < 8)
3006  0064 a108          	cp	a,#8
3007  0066 2410          	jruge	L1511
3008                     ; 654             itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
3010  0068 5f            	clrw	x
3011  0069 97            	ld	xl,a
3012  006a a601          	ld	a,#1
3013  006c 5d            	tnzw	x
3014  006d 2704          	jreq	L215
3015  006f               L415:
3016  006f 48            	sll	a
3017  0070 5a            	decw	x
3018  0071 26fc          	jrne	L415
3019  0073               L215:
3020  0073 c4540d        	and	a,21517
3022  0076 2017          	jra	L5511
3023  0078               L1511:
3024                     ; 658             itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
3026  0078 a008          	sub	a,#8
3027  007a 5f            	clrw	x
3028  007b 97            	ld	xl,a
3029  007c a601          	ld	a,#1
3030  007e 5d            	tnzw	x
3031  007f 2704          	jreq	L615
3032  0081               L025:
3033  0081 48            	sll	a
3034  0082 5a            	decw	x
3035  0083 26fc          	jrne	L025
3036  0085               L615:
3037  0085 c4540c        	and	a,21516
3038  0088 2005          	jra	L5511
3039  008a               L7411:
3040                     ; 663         itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
3042  008a c65400        	ld	a,21504
3043  008d 1403          	and	a,(OFST+2,sp)
3044  008f               L5511:
3045                     ; 665     return ((ITStatus)itstatus);
3049  008f 5b03          	addw	sp,#3
3050  0091 81            	ret	
3094                     ; 687 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
3094                     ; 688 {
3095                     .text:	section	.text,new
3096  0000               _ADC1_ClearITPendingBit:
3098  0000 89            	pushw	x
3099  0001 88            	push	a
3100       00000001      OFST:	set	1
3103                     ; 689     uint8_t temp = 0;
3105  0002 0f01          	clr	(OFST+0,sp)
3106                     ; 692     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
3108  0004 a30080        	cpw	x,#128
3109  0007 274a          	jreq	L035
3110  0009 a30140        	cpw	x,#320
3111  000c 2745          	jreq	L035
3112  000e a30110        	cpw	x,#272
3113  0011 2740          	jreq	L035
3114  0013 a30111        	cpw	x,#273
3115  0016 273b          	jreq	L035
3116  0018 a30112        	cpw	x,#274
3117  001b 2736          	jreq	L035
3118  001d a30113        	cpw	x,#275
3119  0020 2731          	jreq	L035
3120  0022 a30114        	cpw	x,#276
3121  0025 272c          	jreq	L035
3122  0027 a30115        	cpw	x,#277
3123  002a 2727          	jreq	L035
3124  002c a30116        	cpw	x,#278
3125  002f 2722          	jreq	L035
3126  0031 a30117        	cpw	x,#279
3127  0034 271d          	jreq	L035
3128  0036 a30118        	cpw	x,#280
3129  0039 2718          	jreq	L035
3130  003b a3011c        	cpw	x,#284
3131  003e 2713          	jreq	L035
3132  0040 a30119        	cpw	x,#281
3133  0043 270e          	jreq	L035
3134  0045 ae02b4        	ldw	x,#692
3135  0048 89            	pushw	x
3136  0049 5f            	clrw	x
3137  004a 89            	pushw	x
3138  004b ae0000        	ldw	x,#L542
3139  004e cd0000        	call	_assert_failed
3141  0051 5b04          	addw	sp,#4
3142  0053               L035:
3143                     ; 694     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
3145  0053 7b03          	ld	a,(OFST+2,sp)
3146  0055 a4f0          	and	a,#240
3147  0057 5f            	clrw	x
3148  0058 02            	rlwa	x,a
3149  0059 a30010        	cpw	x,#16
3150  005c 2634          	jrne	L7711
3151                     ; 697         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3153  005e 7b03          	ld	a,(OFST+2,sp)
3154  0060 a40f          	and	a,#15
3155  0062 6b01          	ld	(OFST+0,sp),a
3156                     ; 698         if (temp < 8)
3158  0064 a108          	cp	a,#8
3159  0066 2414          	jruge	L1021
3160                     ; 700             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
3162  0068 5f            	clrw	x
3163  0069 97            	ld	xl,a
3164  006a a601          	ld	a,#1
3165  006c 5d            	tnzw	x
3166  006d 2704          	jreq	L435
3167  006f               L635:
3168  006f 48            	sll	a
3169  0070 5a            	decw	x
3170  0071 26fc          	jrne	L635
3171  0073               L435:
3172  0073 43            	cpl	a
3173  0074 c4540d        	and	a,21517
3174  0077 c7540d        	ld	21517,a
3176  007a 201f          	jra	L5021
3177  007c               L1021:
3178                     ; 704             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
3180  007c a008          	sub	a,#8
3181  007e 5f            	clrw	x
3182  007f 97            	ld	xl,a
3183  0080 a601          	ld	a,#1
3184  0082 5d            	tnzw	x
3185  0083 2704          	jreq	L045
3186  0085               L245:
3187  0085 48            	sll	a
3188  0086 5a            	decw	x
3189  0087 26fc          	jrne	L245
3190  0089               L045:
3191  0089 43            	cpl	a
3192  008a c4540c        	and	a,21516
3193  008d c7540c        	ld	21516,a
3194  0090 2009          	jra	L5021
3195  0092               L7711:
3196                     ; 709         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
3198  0092 7b03          	ld	a,(OFST+2,sp)
3199  0094 43            	cpl	a
3200  0095 c45400        	and	a,21504
3201  0098 c75400        	ld	21504,a
3202  009b               L5021:
3203                     ; 711 }
3206  009b 5b03          	addw	sp,#3
3207  009d 81            	ret	
3220                     	xdef	_ADC1_ClearITPendingBit
3221                     	xdef	_ADC1_GetITStatus
3222                     	xdef	_ADC1_ClearFlag
3223                     	xdef	_ADC1_GetFlagStatus
3224                     	xdef	_ADC1_GetAWDChannelStatus
3225                     	xdef	_ADC1_GetBufferValue
3226                     	xdef	_ADC1_SetLowThreshold
3227                     	xdef	_ADC1_SetHighThreshold
3228                     	xdef	_ADC1_GetConversionValue
3229                     	xdef	_ADC1_StartConversion
3230                     	xdef	_ADC1_AWDChannelConfig
3231                     	xdef	_ADC1_ExternalTriggerConfig
3232                     	xdef	_ADC1_ConversionConfig
3233                     	xdef	_ADC1_SchmittTriggerConfig
3234                     	xdef	_ADC1_PrescalerConfig
3235                     	xdef	_ADC1_ITConfig
3236                     	xdef	_ADC1_DataBufferCmd
3237                     	xdef	_ADC1_ScanModeCmd
3238                     	xdef	_ADC1_Cmd
3239                     	xdef	_ADC1_Init
3240                     	xdef	_ADC1_DeInit
3241                     	xref	_assert_failed
3242                     .const:	section	.text
3243  0000               L542:
3244  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
3245  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
3246  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
3247  0036 5f616463312e  	dc.b	"_adc1.c",0
3267                     	end
