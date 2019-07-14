   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  45                     ; 13 void halRfWriteRfSettings(void) 
  45                     ; 14 {
  47                     	switch	.text
  48  0000               _halRfWriteRfSettings:
  52                     ; 55 	TI_CC_SPIWriteReg(CCxxx0_IOCFG2,0x06);  //GDO0 Output Pin Configuration
  54  0000 ae0006        	ldw	x,#6
  55  0003 4f            	clr	a
  56  0004 95            	ld	xh,a
  57  0005 cd0195        	call	_CC1101WriteReg
  59                     ; 56 	TI_CC_SPIWriteReg(CCxxx0_IOCFG0,0x06);  //GDO0 Output Pin Configuration
  61  0008 ae0006        	ldw	x,#6
  62  000b a602          	ld	a,#2
  63  000d 95            	ld	xh,a
  64  000e cd0195        	call	_CC1101WriteReg
  66                     ; 57 	TI_CC_SPIWriteReg(CCxxx0_FIFOTHR,0x47); //RX FIFO and TX FIFO Thresholds
  68  0011 ae0047        	ldw	x,#71
  69  0014 a603          	ld	a,#3
  70  0016 95            	ld	xh,a
  71  0017 cd0195        	call	_CC1101WriteReg
  73                     ; 58 	TI_CC_SPIWriteReg(CCxxx0_PKTCTRL0,0x05);//Packet Automation Control
  75  001a ae0005        	ldw	x,#5
  76  001d a608          	ld	a,#8
  77  001f 95            	ld	xh,a
  78  0020 cd0195        	call	_CC1101WriteReg
  80                     ; 59 	TI_CC_SPIWriteReg(CCxxx0_FSCTRL1,0x06); //Frequency Synthesizer Control
  82  0023 ae0006        	ldw	x,#6
  83  0026 a60b          	ld	a,#11
  84  0028 95            	ld	xh,a
  85  0029 cd0195        	call	_CC1101WriteReg
  87                     ; 60 	TI_CC_SPIWriteReg(CCxxx0_FREQ2,0x10);   //Frequency Control Word, High Byte
  89  002c ae0010        	ldw	x,#16
  90  002f a60d          	ld	a,#13
  91  0031 95            	ld	xh,a
  92  0032 cd0195        	call	_CC1101WriteReg
  94                     ; 61 	TI_CC_SPIWriteReg(CCxxx0_FREQ1,0xB1);   //Frequency Control Word, Middle Byte
  96  0035 ae00b1        	ldw	x,#177
  97  0038 a60e          	ld	a,#14
  98  003a 95            	ld	xh,a
  99  003b cd0195        	call	_CC1101WriteReg
 101                     ; 62 	TI_CC_SPIWriteReg(CCxxx0_FREQ0,0x3B);   //Frequency Control Word, Low Byte
 103  003e ae003b        	ldw	x,#59
 104  0041 a60f          	ld	a,#15
 105  0043 95            	ld	xh,a
 106  0044 cd0195        	call	_CC1101WriteReg
 108                     ; 63 	TI_CC_SPIWriteReg(CCxxx0_MDMCFG4,0xF6); //Modem Configuration
 110  0047 ae00f6        	ldw	x,#246
 111  004a a610          	ld	a,#16
 112  004c 95            	ld	xh,a
 113  004d cd0195        	call	_CC1101WriteReg
 115                     ; 64 	TI_CC_SPIWriteReg(CCxxx0_MDMCFG3,0x83); //Modem Configuration
 117  0050 ae0083        	ldw	x,#131
 118  0053 a611          	ld	a,#17
 119  0055 95            	ld	xh,a
 120  0056 cd0195        	call	_CC1101WriteReg
 122                     ; 65 	TI_CC_SPIWriteReg(CCxxx0_MDMCFG2,0x13); //Modem Configuration
 124  0059 ae0013        	ldw	x,#19
 125  005c a612          	ld	a,#18
 126  005e 95            	ld	xh,a
 127  005f cd0195        	call	_CC1101WriteReg
 129                     ; 66 	TI_CC_SPIWriteReg(CCxxx0_DEVIATN,0x15); //Modem Deviation Setting
 131  0062 ae0015        	ldw	x,#21
 132  0065 a615          	ld	a,#21
 133  0067 95            	ld	xh,a
 134  0068 cd0195        	call	_CC1101WriteReg
 136                     ; 67 	TI_CC_SPIWriteReg(CCxxx0_MCSM0,0x18);   //Main Radio Control State Machine Configuration
 138  006b ae0018        	ldw	x,#24
 139  006e a618          	ld	a,#24
 140  0070 95            	ld	xh,a
 141  0071 cd0195        	call	_CC1101WriteReg
 143                     ; 68 	TI_CC_SPIWriteReg(CCxxx0_FOCCFG,0x16);  //Frequency Offset Compensation Configuration
 145  0074 ae0016        	ldw	x,#22
 146  0077 a619          	ld	a,#25
 147  0079 95            	ld	xh,a
 148  007a cd0195        	call	_CC1101WriteReg
 150                     ; 69 	TI_CC_SPIWriteReg(CCxxx0_WORCTRL,0xFB); //Wake On Radio Control
 152  007d ae00fb        	ldw	x,#251
 153  0080 a620          	ld	a,#32
 154  0082 95            	ld	xh,a
 155  0083 cd0195        	call	_CC1101WriteReg
 157                     ; 70 	TI_CC_SPIWriteReg(CCxxx0_FSCAL3,0xE9);  //Frequency Synthesizer Calibration
 159  0086 ae00e9        	ldw	x,#233
 160  0089 a623          	ld	a,#35
 161  008b 95            	ld	xh,a
 162  008c cd0195        	call	_CC1101WriteReg
 164                     ; 71 	TI_CC_SPIWriteReg(CCxxx0_FSCAL2,0x2A);  //Frequency Synthesizer Calibration
 166  008f ae002a        	ldw	x,#42
 167  0092 a624          	ld	a,#36
 168  0094 95            	ld	xh,a
 169  0095 cd0195        	call	_CC1101WriteReg
 171                     ; 72 	TI_CC_SPIWriteReg(CCxxx0_FSCAL1,0x00);  //Frequency Synthesizer Calibration
 173  0098 5f            	clrw	x
 174  0099 a625          	ld	a,#37
 175  009b 95            	ld	xh,a
 176  009c cd0195        	call	_CC1101WriteReg
 178                     ; 73 	TI_CC_SPIWriteReg(CCxxx0_FSCAL0,0x1F);  //Frequency Synthesizer Calibration
 180  009f ae001f        	ldw	x,#31
 181  00a2 a626          	ld	a,#38
 182  00a4 95            	ld	xh,a
 183  00a5 cd0195        	call	_CC1101WriteReg
 185                     ; 74 	TI_CC_SPIWriteReg(CCxxx0_TEST2,0x81);   //Various Test Settings
 187  00a8 ae0081        	ldw	x,#129
 188  00ab a62c          	ld	a,#44
 189  00ad 95            	ld	xh,a
 190  00ae cd0195        	call	_CC1101WriteReg
 192                     ; 75 	TI_CC_SPIWriteReg(CCxxx0_TEST1,0x35);   //Various Test Settings
 194  00b1 ae0035        	ldw	x,#53
 195  00b4 a62d          	ld	a,#45
 196  00b6 95            	ld	xh,a
 197  00b7 cd0195        	call	_CC1101WriteReg
 199                     ; 76 	TI_CC_SPIWriteReg(CCxxx0_TEST0,0x09);   //Various Test Settings
 201  00ba ae0009        	ldw	x,#9
 202  00bd a62e          	ld	a,#46
 203  00bf 95            	ld	xh,a
 204  00c0 cd0195        	call	_CC1101WriteReg
 206                     ; 78 }
 209  00c3 81            	ret
 256                     ; 91 INT8U CC1101ReadReg( INT8U addr )
 256                     ; 92 {
 257                     	switch	.text
 258  00c4               _CC1101ReadReg:
 260  00c4 88            	push	a
 261  00c5 88            	push	a
 262       00000001      OFST:	set	1
 265                     ; 94 	CC_CSN_LOW( );
 267  00c6 4b10          	push	#16
 268  00c8 ae5005        	ldw	x,#20485
 269  00cb cd0000        	call	_GPIO_ResetBits
 271  00ce 84            	pop	a
 273  00cf               L54:
 276  00cf 4b80          	push	#128
 277  00d1 ae5005        	ldw	x,#20485
 278  00d4 cd0000        	call	_GPIO_ReadInputDataBit
 280  00d7 5b01          	addw	sp,#1
 281  00d9 4d            	tnz	a
 282  00da 26f3          	jrne	L54
 283                     ; 95 	SPI_ExchangeByte( addr | READ_SINGLE);
 286  00dc 7b02          	ld	a,(OFST+1,sp)
 287  00de aa80          	or	a,#128
 288  00e0 cd0000        	call	_SPI_ExchangeByte
 290                     ; 96 	i = SPI_ExchangeByte( 0xFF );
 292  00e3 a6ff          	ld	a,#255
 293  00e5 cd0000        	call	_SPI_ExchangeByte
 295  00e8 6b01          	ld	(OFST+0,sp),a
 296                     ; 97 	CC_CSN_HIGH( );
 298  00ea 4b10          	push	#16
 299  00ec ae5005        	ldw	x,#20485
 300  00ef cd0000        	call	_GPIO_SetBits
 302  00f2 84            	pop	a
 303                     ; 98 	return i;
 305  00f3 7b01          	ld	a,(OFST+0,sp)
 308  00f5 85            	popw	x
 309  00f6 81            	ret
 384                     ; 110 void CC1101ReadMultiReg( INT8U addr, INT8U *buff, INT8U size )
 384                     ; 111 {
 385                     	switch	.text
 386  00f7               _CC1101ReadMultiReg:
 388  00f7 88            	push	a
 389  00f8 89            	pushw	x
 390       00000002      OFST:	set	2
 393                     ; 113 	CC_CSN_LOW( );
 395  00f9 4b10          	push	#16
 396  00fb ae5005        	ldw	x,#20485
 397  00fe cd0000        	call	_GPIO_ResetBits
 399  0101 84            	pop	a
 401  0102               L111:
 404  0102 4b80          	push	#128
 405  0104 ae5005        	ldw	x,#20485
 406  0107 cd0000        	call	_GPIO_ReadInputDataBit
 408  010a 5b01          	addw	sp,#1
 409  010c 4d            	tnz	a
 410  010d 26f3          	jrne	L111
 411                     ; 114 	SPI_ExchangeByte( addr | READ_BURST);
 414  010f 7b03          	ld	a,(OFST+1,sp)
 415  0111 aac0          	or	a,#192
 416  0113 cd0000        	call	_SPI_ExchangeByte
 418                     ; 115 	for( i = 0; i < size; i ++ )
 420  0116 0f01          	clr	(OFST-1,sp)
 422  0118 201f          	jra	L121
 423  011a               L511:
 424                     ; 117 		for( j = 0; j < 20; j ++ );
 426  011a 0f02          	clr	(OFST+0,sp)
 427  011c               L521:
 431  011c 0c02          	inc	(OFST+0,sp)
 434  011e 7b02          	ld	a,(OFST+0,sp)
 435  0120 a114          	cp	a,#20
 436  0122 25f8          	jrult	L521
 437                     ; 118 		*( buff + i ) = SPI_ExchangeByte( 0xFF );
 439  0124 7b06          	ld	a,(OFST+4,sp)
 440  0126 97            	ld	xl,a
 441  0127 7b07          	ld	a,(OFST+5,sp)
 442  0129 1b01          	add	a,(OFST-1,sp)
 443  012b 2401          	jrnc	L21
 444  012d 5c            	incw	x
 445  012e               L21:
 446  012e 02            	rlwa	x,a
 447  012f 89            	pushw	x
 448  0130 a6ff          	ld	a,#255
 449  0132 cd0000        	call	_SPI_ExchangeByte
 451  0135 85            	popw	x
 452  0136 f7            	ld	(x),a
 453                     ; 115 	for( i = 0; i < size; i ++ )
 455  0137 0c01          	inc	(OFST-1,sp)
 456  0139               L121:
 459  0139 7b01          	ld	a,(OFST-1,sp)
 460  013b 1108          	cp	a,(OFST+6,sp)
 461  013d 25db          	jrult	L511
 462                     ; 120 	CC_CSN_HIGH( );
 464  013f 4b10          	push	#16
 465  0141 ae5005        	ldw	x,#20485
 466  0144 cd0000        	call	_GPIO_SetBits
 468  0147 84            	pop	a
 469                     ; 121 }
 472  0148 5b03          	addw	sp,#3
 473  014a 81            	ret
 520                     ; 130 INT8U CC1101ReadStatus( INT8U addr )
 520                     ; 131 {
 521                     	switch	.text
 522  014b               _CC1101ReadStatus:
 524  014b 88            	push	a
 525  014c 88            	push	a
 526       00000001      OFST:	set	1
 529                     ; 133 	CC_CSN_LOW( );
 531  014d 4b10          	push	#16
 532  014f ae5005        	ldw	x,#20485
 533  0152 cd0000        	call	_GPIO_ResetBits
 535  0155 84            	pop	a
 537  0156               L751:
 540  0156 4b80          	push	#128
 541  0158 ae5005        	ldw	x,#20485
 542  015b cd0000        	call	_GPIO_ReadInputDataBit
 544  015e 5b01          	addw	sp,#1
 545  0160 4d            	tnz	a
 546  0161 26f3          	jrne	L751
 547                     ; 134 	SPI_ExchangeByte( addr | READ_BURST);
 550  0163 7b02          	ld	a,(OFST+1,sp)
 551  0165 aac0          	or	a,#192
 552  0167 cd0000        	call	_SPI_ExchangeByte
 554                     ; 135 	i = SPI_ExchangeByte( 0xFF );
 556  016a a6ff          	ld	a,#255
 557  016c cd0000        	call	_SPI_ExchangeByte
 559  016f 6b01          	ld	(OFST+0,sp),a
 560                     ; 136 	CC_CSN_HIGH( );
 562  0171 4b10          	push	#16
 563  0173 ae5005        	ldw	x,#20485
 564  0176 cd0000        	call	_GPIO_SetBits
 566  0179 84            	pop	a
 567                     ; 137 	return i;
 569  017a 7b01          	ld	a,(OFST+0,sp)
 572  017c 85            	popw	x
 573  017d 81            	ret
 629                     ; 147 void CC1101SetTRMode( TRMODE mode )
 629                     ; 148 {
 630                     	switch	.text
 631  017e               _CC1101SetTRMode:
 633  017e 88            	push	a
 634       00000000      OFST:	set	0
 637                     ; 149 	if( mode == TX_MODE ) 		
 639  017f 4d            	tnz	a
 640  0180 2607          	jrne	L112
 641                     ; 151 		CC1101WriteCmd( CCxxx0_STX ); 
 643  0182 a635          	ld	a,#53
 644  0184 cd0206        	call	_CC1101WriteCmd
 647  0187 200a          	jra	L312
 648  0189               L112:
 649                     ; 153 	else if( mode == RX_MODE )	
 651  0189 7b01          	ld	a,(OFST+1,sp)
 652  018b a101          	cp	a,#1
 653  018d 2604          	jrne	L312
 654                     ; 155 		CC1101WriteCmd( CCxxx0_SRX ); 
 656  018f a634          	ld	a,#52
 657  0191 ad73          	call	_CC1101WriteCmd
 659  0193               L312:
 660                     ; 157 }
 663  0193 84            	pop	a
 664  0194 81            	ret
 711                     ; 167 void CC1101WriteReg( INT8U addr, INT8U value )
 711                     ; 168 {
 712                     	switch	.text
 713  0195               _CC1101WriteReg:
 715  0195 89            	pushw	x
 716       00000000      OFST:	set	0
 719                     ; 169 	CC_CSN_LOW( );
 721  0196 4b10          	push	#16
 722  0198 ae5005        	ldw	x,#20485
 723  019b cd0000        	call	_GPIO_ResetBits
 725  019e 84            	pop	a
 727  019f               L342:
 730  019f 4b80          	push	#128
 731  01a1 ae5005        	ldw	x,#20485
 732  01a4 cd0000        	call	_GPIO_ReadInputDataBit
 734  01a7 5b01          	addw	sp,#1
 735  01a9 4d            	tnz	a
 736  01aa 26f3          	jrne	L342
 737                     ; 170 	SPI_ExchangeByte( addr );
 740  01ac 7b01          	ld	a,(OFST+1,sp)
 741  01ae cd0000        	call	_SPI_ExchangeByte
 743                     ; 171 	SPI_ExchangeByte( value );
 745  01b1 7b02          	ld	a,(OFST+2,sp)
 746  01b3 cd0000        	call	_SPI_ExchangeByte
 748                     ; 172 	CC_CSN_HIGH( );
 750  01b6 4b10          	push	#16
 751  01b8 ae5005        	ldw	x,#20485
 752  01bb cd0000        	call	_GPIO_SetBits
 754  01be 84            	pop	a
 755                     ; 173 }
 758  01bf 85            	popw	x
 759  01c0 81            	ret
 826                     ; 184 void CC1101WriteMultiReg( INT8U addr, INT8U *buff, INT8U size )
 826                     ; 185 {
 827                     	switch	.text
 828  01c1               _CC1101WriteMultiReg:
 830  01c1 88            	push	a
 831  01c2 88            	push	a
 832       00000001      OFST:	set	1
 835                     ; 187 	CC_CSN_LOW( );
 837  01c3 4b10          	push	#16
 838  01c5 ae5005        	ldw	x,#20485
 839  01c8 cd0000        	call	_GPIO_ResetBits
 841  01cb 84            	pop	a
 843  01cc               L303:
 846  01cc 4b80          	push	#128
 847  01ce ae5005        	ldw	x,#20485
 848  01d1 cd0000        	call	_GPIO_ReadInputDataBit
 850  01d4 5b01          	addw	sp,#1
 851  01d6 4d            	tnz	a
 852  01d7 26f3          	jrne	L303
 853                     ; 188 	SPI_ExchangeByte( addr | WRITE_BURST );
 856  01d9 7b02          	ld	a,(OFST+1,sp)
 857  01db aa40          	or	a,#64
 858  01dd cd0000        	call	_SPI_ExchangeByte
 860                     ; 189 	for( i = 0; i < size; i ++ )
 862  01e0 0f01          	clr	(OFST+0,sp)
 864  01e2 2011          	jra	L313
 865  01e4               L703:
 866                     ; 191 		SPI_ExchangeByte( *( buff + i ) );	
 868  01e4 7b05          	ld	a,(OFST+4,sp)
 869  01e6 97            	ld	xl,a
 870  01e7 7b06          	ld	a,(OFST+5,sp)
 871  01e9 1b01          	add	a,(OFST+0,sp)
 872  01eb 2401          	jrnc	L42
 873  01ed 5c            	incw	x
 874  01ee               L42:
 875  01ee 02            	rlwa	x,a
 876  01ef f6            	ld	a,(x)
 877  01f0 cd0000        	call	_SPI_ExchangeByte
 879                     ; 189 	for( i = 0; i < size; i ++ )
 881  01f3 0c01          	inc	(OFST+0,sp)
 882  01f5               L313:
 885  01f5 7b01          	ld	a,(OFST+0,sp)
 886  01f7 1107          	cp	a,(OFST+6,sp)
 887  01f9 25e9          	jrult	L703
 888                     ; 193 	CC_CSN_HIGH( );
 890  01fb 4b10          	push	#16
 891  01fd ae5005        	ldw	x,#20485
 892  0200 cd0000        	call	_GPIO_SetBits
 894  0203 84            	pop	a
 895                     ; 194 }
 898  0204 85            	popw	x
 899  0205 81            	ret
 937                     ; 203 void CC1101WriteCmd( INT8U command )
 937                     ; 204 {
 938                     	switch	.text
 939  0206               _CC1101WriteCmd:
 941  0206 88            	push	a
 942       00000000      OFST:	set	0
 945                     ; 205 	CC_CSN_LOW( );
 947  0207 4b10          	push	#16
 948  0209 ae5005        	ldw	x,#20485
 949  020c cd0000        	call	_GPIO_ResetBits
 951  020f 84            	pop	a
 953  0210               L733:
 956  0210 4b80          	push	#128
 957  0212 ae5005        	ldw	x,#20485
 958  0215 cd0000        	call	_GPIO_ReadInputDataBit
 960  0218 5b01          	addw	sp,#1
 961  021a 4d            	tnz	a
 962  021b 26f3          	jrne	L733
 963                     ; 206 	SPI_ExchangeByte( command );
 966  021d 7b01          	ld	a,(OFST+1,sp)
 967  021f cd0000        	call	_SPI_ExchangeByte
 969                     ; 207 	CC_CSN_HIGH( );
 971  0222 4b10          	push	#16
 972  0224 ae5005        	ldw	x,#20485
 973  0227 cd0000        	call	_GPIO_SetBits
 975  022a 84            	pop	a
 976                     ; 208 }
 979  022b 84            	pop	a
 980  022c 81            	ret
1018                     ; 217 void CC1101Reset( void )
1018                     ; 218 {
1019                     	switch	.text
1020  022d               _CC1101Reset:
1022  022d 88            	push	a
1023       00000001      OFST:	set	1
1026                     ; 221 	CC_CSN_HIGH( );
1028  022e 4b10          	push	#16
1029  0230 ae5005        	ldw	x,#20485
1030  0233 cd0000        	call	_GPIO_SetBits
1032  0236 84            	pop	a
1033                     ; 222 	CC_CSN_LOW( );
1035  0237 4b10          	push	#16
1036  0239 ae5005        	ldw	x,#20485
1037  023c cd0000        	call	_GPIO_ResetBits
1039  023f 84            	pop	a
1041  0240               L363:
1044  0240 4b80          	push	#128
1045  0242 ae5005        	ldw	x,#20485
1046  0245 cd0000        	call	_GPIO_ReadInputDataBit
1048  0248 5b01          	addw	sp,#1
1049  024a 4d            	tnz	a
1050  024b 26f3          	jrne	L363
1051                     ; 223 	CC_CSN_HIGH( );
1054  024d 4b10          	push	#16
1055  024f ae5005        	ldw	x,#20485
1056  0252 cd0000        	call	_GPIO_SetBits
1058  0255 84            	pop	a
1059                     ; 224 	for( x = 0; x < 100; x ++ );
1061  0256 0f01          	clr	(OFST+0,sp)
1062  0258               L763:
1066  0258 0c01          	inc	(OFST+0,sp)
1069  025a 7b01          	ld	a,(OFST+0,sp)
1070  025c a164          	cp	a,#100
1071  025e 25f8          	jrult	L763
1072                     ; 225 	CC1101WriteCmd( CCxxx0_SRES );	
1074  0260 a630          	ld	a,#48
1075  0262 ada2          	call	_CC1101WriteCmd
1077                     ; 226 }
1080  0264 84            	pop	a
1081  0265 81            	ret
1105                     ; 235 void CC1101SetIdle( void )
1105                     ; 236 {
1106                     	switch	.text
1107  0266               _CC1101SetIdle:
1111                     ; 237     CC1101WriteCmd(CCxxx0_SIDLE);
1113  0266 a636          	ld	a,#54
1114  0268 ad9c          	call	_CC1101WriteCmd
1116                     ; 238 }
1119  026a 81            	ret
1144                     ; 247 void CC1101ClrTXBuff( void )
1144                     ; 248 {
1145                     	switch	.text
1146  026b               _CC1101ClrTXBuff:
1150                     ; 249     CC1101SetIdle();//!!必须在Idle状态
1152  026b adf9          	call	_CC1101SetIdle
1154                     ; 250     CC1101WriteCmd( CCxxx0_SFTX );
1156  026d a63b          	ld	a,#59
1157  026f ad95          	call	_CC1101WriteCmd
1159                     ; 251 }
1162  0271 81            	ret
1187                     ; 260 void CC1101ClrRXBuff( void )
1187                     ; 261 {
1188                     	switch	.text
1189  0272               _CC1101ClrRXBuff:
1193                     ; 262     CC1101SetIdle();//!!必须在Idle状态
1195  0272 adf2          	call	_CC1101SetIdle
1197                     ; 263     CC1101WriteCmd( CCxxx0_SFRX );
1199  0274 a63a          	ld	a,#58
1200  0276 ad8e          	call	_CC1101WriteCmd
1202                     ; 264 }
1205  0278 81            	ret
1254                     ; 274 void CC2500SendPacket( INT8U *txbuffer, INT8U size )
1254                     ; 275 {
1255                     	switch	.text
1256  0279               _CC2500SendPacket:
1258  0279 89            	pushw	x
1259       00000000      OFST:	set	0
1262                     ; 276     CC1101ClrTXBuff( );
1264  027a adef          	call	_CC1101ClrTXBuff
1266                     ; 277     CC1101WriteReg( CCxxx0_TXFIFO, size );
1268  027c 7b05          	ld	a,(OFST+5,sp)
1269  027e 97            	ld	xl,a
1270  027f a63f          	ld	a,#63
1271  0281 95            	ld	xh,a
1272  0282 cd0195        	call	_CC1101WriteReg
1274                     ; 278     CC1101WriteMultiReg( CCxxx0_TXFIFO, txbuffer, size );
1276  0285 7b05          	ld	a,(OFST+5,sp)
1277  0287 88            	push	a
1278  0288 1e02          	ldw	x,(OFST+2,sp)
1279  028a 89            	pushw	x
1280  028b a63f          	ld	a,#63
1281  028d cd01c1        	call	_CC1101WriteMultiReg
1283  0290 5b03          	addw	sp,#3
1284                     ; 279     CC1101SetTRMode( TX_MODE );
1286  0292 4f            	clr	a
1287  0293 cd017e        	call	_CC1101SetTRMode
1290  0296               L154:
1291                     ; 281     while( GPIO_ReadInputDataBit( GPIOA, GPIO_Pin_2 ) == 0 );
1293  0296 4b04          	push	#4
1294  0298 ae5000        	ldw	x,#20480
1295  029b cd0000        	call	_GPIO_ReadInputDataBit
1297  029e 5b01          	addw	sp,#1
1298  02a0 4d            	tnz	a
1299  02a1 27f3          	jreq	L154
1301  02a3               L754:
1302                     ; 282     while( GPIO_ReadInputDataBit( GPIOA, GPIO_Pin_2 ) != 0 );
1304  02a3 4b04          	push	#4
1305  02a5 ae5000        	ldw	x,#20480
1306  02a8 cd0000        	call	_GPIO_ReadInputDataBit
1308  02ab 5b01          	addw	sp,#1
1309  02ad 4d            	tnz	a
1310  02ae 26f3          	jrne	L754
1311                     ; 284     CC1101ClrTXBuff( );
1313  02b0 adb9          	call	_CC1101ClrTXBuff
1315                     ; 285 }
1318  02b2 85            	popw	x
1319  02b3 81            	ret
1343                     ; 294 INT8U CC1101GetRXCnt( void )
1343                     ; 295 {
1344                     	switch	.text
1345  02b4               _CC1101GetRXCnt:
1349                     ; 296     return ( CC1101ReadStatus( CCxxx0_RXBYTES )  & BYTES_IN_RXFIFO );
1351  02b4 a63b          	ld	a,#59
1352  02b6 cd014b        	call	_CC1101ReadStatus
1354  02b9 a47f          	and	a,#127
1357  02bb 81            	ret
1445                     ; 307 INT8U CC1101RecPacket( INT8U *rxBuffer, INT8U *length )
1445                     ; 308 {
1446                     	switch	.text
1447  02bc               _CC1101RecPacket:
1449  02bc 89            	pushw	x
1450  02bd 5207          	subw	sp,#7
1451       00000007      OFST:	set	7
1454                     ; 311 	INT16U x , j = 0;
1456  02bf 5f            	clrw	x
1457  02c0 1f03          	ldw	(OFST-4,sp),x
1458                     ; 313 	CC1101SetTRMode( RX_MODE );
1460  02c2 a601          	ld	a,#1
1461  02c4 cd017e        	call	_CC1101SetTRMode
1464  02c7 2020          	jra	L735
1465  02c9               L535:
1466                     ; 316 		for( x = 0; x < 10; x ++ );
1468  02c9 5f            	clrw	x
1469  02ca 1f06          	ldw	(OFST-1,sp),x
1470  02cc               L345:
1474  02cc 1e06          	ldw	x,(OFST-1,sp)
1475  02ce 1c0001        	addw	x,#1
1476  02d1 1f06          	ldw	(OFST-1,sp),x
1479  02d3 1e06          	ldw	x,(OFST-1,sp)
1480  02d5 a3000a        	cpw	x,#10
1481  02d8 25f2          	jrult	L345
1482                     ; 317 		if( ++j >= 20 )  return 0;
1484  02da 1e03          	ldw	x,(OFST-4,sp)
1485  02dc 1c0001        	addw	x,#1
1486  02df 1f03          	ldw	(OFST-4,sp),x
1487  02e1 a30014        	cpw	x,#20
1488  02e4 2503          	jrult	L735
1491  02e6 4f            	clr	a
1493  02e7 205c          	jra	L64
1494  02e9               L735:
1495                     ; 314 	while( GPIO_ReadInputDataBit( GPIOA, GPIO_Pin_2 ) != 0 )
1497  02e9 4b04          	push	#4
1498  02eb ae5000        	ldw	x,#20480
1499  02ee cd0000        	call	_GPIO_ReadInputDataBit
1501  02f1 5b01          	addw	sp,#1
1502  02f3 4d            	tnz	a
1503  02f4 26d3          	jrne	L535
1504                     ; 320 	if ( CC1101GetRXCnt( ) != 0 )
1506  02f6 adbc          	call	_CC1101GetRXCnt
1508  02f8 4d            	tnz	a
1509  02f9 275b          	jreq	L355
1510                     ; 322 		for( x = 0; x < 200; x ++ );
1512  02fb 5f            	clrw	x
1513  02fc 1f06          	ldw	(OFST-1,sp),x
1514  02fe               L555:
1518  02fe 1e06          	ldw	x,(OFST-1,sp)
1519  0300 1c0001        	addw	x,#1
1520  0303 1f06          	ldw	(OFST-1,sp),x
1523  0305 1e06          	ldw	x,(OFST-1,sp)
1524  0307 a300c8        	cpw	x,#200
1525  030a 25f2          	jrult	L555
1526                     ; 323 		pktLen = CC1101ReadReg(CCxxx0_RXFIFO);   // Read length byte
1528  030c a63f          	ld	a,#63
1529  030e cd00c4        	call	_CC1101ReadReg
1531  0311 6b05          	ld	(OFST-2,sp),a
1532                     ; 325 		if (pktLen <= *length)                    // If pktLen size <= rxBuffer
1534  0313 1e0c          	ldw	x,(OFST+5,sp)
1535  0315 f6            	ld	a,(x)
1536  0316 1105          	cp	a,(OFST-2,sp)
1537  0318 2531          	jrult	L365
1538                     ; 327 			CC1101ReadMultiReg(CCxxx0_RXFIFO, rxBuffer, pktLen); // Pull data
1540  031a 7b05          	ld	a,(OFST-2,sp)
1541  031c 88            	push	a
1542  031d 1e09          	ldw	x,(OFST+2,sp)
1543  031f 89            	pushw	x
1544  0320 a63f          	ld	a,#63
1545  0322 cd00f7        	call	_CC1101ReadMultiReg
1547  0325 5b03          	addw	sp,#3
1548                     ; 328 			*length = pktLen;                     // Return the actual size
1550  0327 7b05          	ld	a,(OFST-2,sp)
1551  0329 1e0c          	ldw	x,(OFST+5,sp)
1552  032b f7            	ld	(x),a
1553                     ; 329 			CC1101ReadMultiReg(CCxxx0_RXFIFO, status, 2);// Read  status bytes
1555  032c 4b02          	push	#2
1556  032e 96            	ldw	x,sp
1557  032f 1c0002        	addw	x,#OFST-5
1558  0332 89            	pushw	x
1559  0333 a63f          	ld	a,#63
1560  0335 cd00f7        	call	_CC1101ReadMultiReg
1562  0338 5b03          	addw	sp,#3
1563                     ; 331 			CC1101ClrRXBuff( );
1565  033a cd0272        	call	_CC1101ClrRXBuff
1567                     ; 332 			if( status[1]&CRC_OK ) { return 1; }
1569  033d 7b02          	ld	a,(OFST-5,sp)
1570  033f a580          	bcp	a,#128
1571  0341 2705          	jreq	L565
1574  0343 a601          	ld	a,#1
1576  0345               L64:
1578  0345 5b09          	addw	sp,#9
1579  0347 81            	ret
1580  0348               L565:
1581                     ; 333 			else {   return 0; }
1583  0348 4f            	clr	a
1585  0349 20fa          	jra	L64
1586  034b               L365:
1587                     ; 337 			*length = pktLen;                   // Return the large size
1589  034b 7b05          	ld	a,(OFST-2,sp)
1590  034d 1e0c          	ldw	x,(OFST+5,sp)
1591  034f f7            	ld	(x),a
1592                     ; 338 			CC1101ClrRXBuff( );      	        // Flush RXFIFO
1594  0350 cd0272        	call	_CC1101ClrRXBuff
1596                     ; 339 			return 0;                           // Error
1598  0353 4f            	clr	a
1600  0354 20ef          	jra	L64
1601  0356               L355:
1602                     ; 342 	else   {  return 0; }                       // Error
1604  0356 4f            	clr	a
1606  0357 20ec          	jra	L64
1609                     .const:	section	.text
1610  0000               L575_PaTabel:
1611  0000 c0            	dc.b	192
1657                     ; 345 void CC1101Init( void )
1657                     ; 346 {
1658                     	switch	.text
1659  0359               _CC1101Init:
1661  0359 89            	pushw	x
1662       00000002      OFST:	set	2
1665                     ; 347 	INT8U PaTabel[] = {0xc0};   //10dBm   
1667  035a c60000        	ld	a,L575_PaTabel
1668  035d 6b01          	ld	(OFST-1,sp),a
1669                     ; 350 	CC1101Reset( );
1671  035f cd022d        	call	_CC1101Reset
1673                     ; 351 	halRfWriteRfSettings( );
1675  0362 cd0000        	call	_halRfWriteRfSettings
1677                     ; 352 	CC1101WriteMultiReg(CCxxx0_PATABLE, PaTabel, 1);
1679  0365 4b01          	push	#1
1680  0367 96            	ldw	x,sp
1681  0368 1c0002        	addw	x,#OFST+0
1682  036b 89            	pushw	x
1683  036c a63e          	ld	a,#62
1684  036e cd01c1        	call	_CC1101WriteMultiReg
1686  0371 5b03          	addw	sp,#3
1687                     ; 354 	i = CC1101ReadStatus( CCxxx0_PARTNUM );//for test, must be 0x80
1689  0373 a630          	ld	a,#48
1690  0375 cd014b        	call	_CC1101ReadStatus
1692  0378 6b02          	ld	(OFST+0,sp),a
1693                     ; 355 	i = CC1101ReadStatus( CCxxx0_VERSION );//for test, refer to the datasheet
1695  037a a631          	ld	a,#49
1696  037c cd014b        	call	_CC1101ReadStatus
1698  037f 6b02          	ld	(OFST+0,sp),a
1699                     ; 356 }
1702  0381 85            	popw	x
1703  0382 81            	ret
1716                     	xdef	_halRfWriteRfSettings
1717                     	xdef	_CC1101Init
1718                     	xdef	_CC1101RecPacket
1719                     	xdef	_CC1101GetRXCnt
1720                     	xdef	_CC2500SendPacket
1721                     	xdef	_CC1101ClrRXBuff
1722                     	xdef	_CC1101ClrTXBuff
1723                     	xdef	_CC1101SetIdle
1724                     	xdef	_CC1101Reset
1725                     	xdef	_CC1101WriteCmd
1726                     	xdef	_CC1101WriteMultiReg
1727                     	xdef	_CC1101WriteReg
1728                     	xdef	_CC1101SetTRMode
1729                     	xdef	_CC1101ReadStatus
1730                     	xdef	_CC1101ReadMultiReg
1731                     	xdef	_CC1101ReadReg
1732                     	xref	_SPI_ExchangeByte
1733                     	xref	_GPIO_ReadInputDataBit
1734                     	xref	_GPIO_ResetBits
1735                     	xref	_GPIO_SetBits
1754                     	end
