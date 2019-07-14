   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  78                     ; 157 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgramTime)
  78                     ; 158 {
  80                     	switch	.text
  81  0000               _FLASH_SetProgrammingTime:
  85                     ; 160   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgramTime));
  87                     ; 162   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  89  0000 72115050      	bres	20560,#0
  90                     ; 163   FLASH->CR1 |= (uint8_t)FLASH_ProgramTime;
  92  0004 ca5050        	or	a,20560
  93  0007 c75050        	ld	20560,a
  94                     ; 164 }
  97  000a 81            	ret
 122                     ; 171 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 122                     ; 172 {
 123                     	switch	.text
 124  000b               _FLASH_GetProgrammingTime:
 128                     ; 173   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 130  000b c65050        	ld	a,20560
 131  000e a401          	and	a,#1
 134  0010 81            	ret
 157                     ; 215 void FLASH_DeInit(void)
 157                     ; 216 {
 158                     	switch	.text
 159  0011               _FLASH_DeInit:
 163                     ; 217   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 165  0011 725f5050      	clr	20560
 166                     ; 218   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 168  0015 725f5051      	clr	20561
 169                     ; 219   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 171  0019 35405054      	mov	20564,#64
 172                     ; 220   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 174  001d c65054        	ld	a,20564
 175                     ; 221 }
 178  0020 81            	ret
 234                     ; 231 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 234                     ; 232 {
 235                     	switch	.text
 236  0021               _FLASH_Unlock:
 238  0021 88            	push	a
 239       00000000      OFST:	set	0
 242                     ; 234   assert_param(IS_MEMORY_TYPE(FLASH_MemType));
 244                     ; 237   if (FLASH_MemType == FLASH_MemType_Program)
 246  0022 a1fd          	cp	a,#253
 247  0024 2608          	jrne	L501
 248                     ; 239     FLASH->PUKR = FLASH_RASS_KEY1;
 250  0026 35565052      	mov	20562,#86
 251                     ; 240     FLASH->PUKR = FLASH_RASS_KEY2;
 253  002a 35ae5052      	mov	20562,#174
 254  002e               L501:
 255                     ; 243   if (FLASH_MemType == FLASH_MemType_Data)
 257  002e 7b01          	ld	a,(OFST+1,sp)
 258  0030 a1f7          	cp	a,#247
 259  0032 2608          	jrne	L701
 260                     ; 245     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 262  0034 35ae5053      	mov	20563,#174
 263                     ; 246     FLASH->DUKR = FLASH_RASS_KEY1;
 265  0038 35565053      	mov	20563,#86
 266  003c               L701:
 267                     ; 249 }
 270  003c 84            	pop	a
 271  003d 81            	ret
 306                     ; 259 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 306                     ; 260 {
 307                     	switch	.text
 308  003e               _FLASH_Lock:
 312                     ; 262   assert_param(IS_MEMORY_TYPE(FLASH_MemType));
 314                     ; 264   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 316  003e c45054        	and	a,20564
 317  0041 c75054        	ld	20564,a
 318                     ; 265 }
 321  0044 81            	ret
 364                     ; 273 void FLASH_ProgramByte(uint16_t Address, uint8_t Data)
 364                     ; 274 {
 365                     	switch	.text
 366  0045               _FLASH_ProgramByte:
 368  0045 89            	pushw	x
 369       00000000      OFST:	set	0
 372                     ; 276   assert_param(IS_FLASH_ADDRESS(Address));
 374                     ; 278   *(PointerAttr uint8_t*) (uint16_t)Address = Data;  
 376  0046 7b05          	ld	a,(OFST+5,sp)
 377  0048 1e01          	ldw	x,(OFST+1,sp)
 378  004a f7            	ld	(x),a
 379                     ; 279 }
 382  004b 85            	popw	x
 383  004c 81            	ret
 417                     ; 286 void FLASH_EraseByte(uint16_t Address)
 417                     ; 287 {
 418                     	switch	.text
 419  004d               _FLASH_EraseByte:
 423                     ; 289   assert_param(IS_FLASH_ADDRESS(Address));
 425                     ; 291   *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 427  004d 7f            	clr	(x)
 428                     ; 292 }
 432  004e 81            	ret
 475                     ; 300 void FLASH_ProgramWord(uint16_t Address, uint32_t Data)
 475                     ; 301 {
 476                     	switch	.text
 477  004f               _FLASH_ProgramWord:
 479  004f 89            	pushw	x
 480       00000000      OFST:	set	0
 483                     ; 303   assert_param(IS_FLASH_ADDRESS(Address));
 485                     ; 306   FLASH->CR2 |= FLASH_CR2_WPRG;
 487  0050 721c5051      	bset	20561,#6
 488                     ; 309   *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));   
 490  0054 7b05          	ld	a,(OFST+5,sp)
 491  0056 1e01          	ldw	x,(OFST+1,sp)
 492  0058 f7            	ld	(x),a
 493                     ; 311   *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data) + 1);
 495  0059 7b06          	ld	a,(OFST+6,sp)
 496  005b 1e01          	ldw	x,(OFST+1,sp)
 497  005d e701          	ld	(1,x),a
 498                     ; 313   *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 500  005f 7b07          	ld	a,(OFST+7,sp)
 501  0061 1e01          	ldw	x,(OFST+1,sp)
 502  0063 e702          	ld	(2,x),a
 503                     ; 315   *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 505  0065 7b08          	ld	a,(OFST+8,sp)
 506  0067 1e01          	ldw	x,(OFST+1,sp)
 507  0069 e703          	ld	(3,x),a
 508                     ; 316 }
 511  006b 85            	popw	x
 512  006c 81            	ret
 546                     ; 323 uint8_t FLASH_ReadByte(uint16_t Address)
 546                     ; 324 {
 547                     	switch	.text
 548  006d               _FLASH_ReadByte:
 552                     ; 326   assert_param(IS_FLASH_ADDRESS(Address));
 554                     ; 329   return(*(PointerAttr uint8_t *) (uint16_t)Address);
 556  006d f6            	ld	a,(x)
 559  006e 81            	ret
 616                     ; 359 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 616                     ; 360 {
 617                     	switch	.text
 618  006f               _FLASH_GetReadOutProtectionStatus:
 620  006f 88            	push	a
 621       00000001      OFST:	set	1
 624                     ; 361   FunctionalState state = DISABLE;
 626                     ; 363   if (OPT->OPT0_LOCKBYTE == FLASH_READOUTPROTECTION_KEY)
 628  0070 c64800        	ld	a,18432
 629  0073 a1aa          	cp	a,#170
 630  0075 2606          	jrne	L552
 631                     ; 366     state = ENABLE;
 633  0077 a601          	ld	a,#1
 634  0079 6b01          	ld	(OFST+0,sp),a
 636  007b 2002          	jra	L752
 637  007d               L552:
 638                     ; 371     state = DISABLE;
 640  007d 0f01          	clr	(OFST+0,sp)
 641  007f               L752:
 642                     ; 374     return state;
 644  007f 7b01          	ld	a,(OFST+0,sp)
 647  0081 5b01          	addw	sp,#1
 648  0083 81            	ret
 682                     ; 382 uint16_t FLASH_GetBootSize(void)
 682                     ; 383 {
 683                     	switch	.text
 684  0084               _FLASH_GetBootSize:
 686  0084 89            	pushw	x
 687       00000002      OFST:	set	2
 690                     ; 384   uint16_t temp = 0;
 692                     ; 387   temp = (uint16_t)(OPT->OPT2_BOOTSIZE * (uint16_t)64);
 694  0085 c64802        	ld	a,18434
 695  0088 97            	ld	xl,a
 696  0089 a640          	ld	a,#64
 697  008b 42            	mul	x,a
 698  008c 1f01          	ldw	(OFST-1,sp),x
 699                     ; 390   if (OPT->OPT2_BOOTSIZE > 0x7F)
 701  008e c64802        	ld	a,18434
 702  0091 a180          	cp	a,#128
 703  0093 2505          	jrult	L772
 704                     ; 392     temp = 8192;
 706  0095 ae2000        	ldw	x,#8192
 707  0098 1f01          	ldw	(OFST-1,sp),x
 708  009a               L772:
 709                     ; 396   return(temp);
 711  009a 1e01          	ldw	x,(OFST-1,sp)
 714  009c 5b02          	addw	sp,#2
 715  009e 81            	ret
 749                     ; 405 uint16_t FLASH_GetDataSize(void)
 749                     ; 406 {
 750                     	switch	.text
 751  009f               _FLASH_GetDataSize:
 753  009f 89            	pushw	x
 754       00000002      OFST:	set	2
 757                     ; 407   uint16_t temp = 0;
 759                     ; 410   temp = (uint16_t)((uint16_t)OPT->OPT3_DATASIZE * (uint16_t)64);
 761  00a0 c64803        	ld	a,18435
 762  00a3 5f            	clrw	x
 763  00a4 97            	ld	xl,a
 764  00a5 58            	sllw	x
 765  00a6 58            	sllw	x
 766  00a7 58            	sllw	x
 767  00a8 58            	sllw	x
 768  00a9 58            	sllw	x
 769  00aa 58            	sllw	x
 770  00ab 1f01          	ldw	(OFST-1,sp),x
 771                     ; 413   if (OPT->OPT3_DATASIZE > 0x20)
 773  00ad c64803        	ld	a,18435
 774  00b0 a121          	cp	a,#33
 775  00b2 2505          	jrult	L713
 776                     ; 415     temp = 2048;
 778  00b4 ae0800        	ldw	x,#2048
 779  00b7 1f01          	ldw	(OFST-1,sp),x
 780  00b9               L713:
 781                     ; 419   return(temp);
 783  00b9 1e01          	ldw	x,(OFST-1,sp)
 786  00bb 5b02          	addw	sp,#2
 787  00bd 81            	ret
 822                     ; 443 void FLASH_ITConfig(FunctionalState NewState)
 822                     ; 444 {
 823                     	switch	.text
 824  00be               _FLASH_ITConfig:
 828                     ; 447   assert_param(IS_FUNCTIONAL_STATE(NewState));
 830                     ; 449   if (NewState != DISABLE)
 832  00be 4d            	tnz	a
 833  00bf 2706          	jreq	L733
 834                     ; 451     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 836  00c1 72125050      	bset	20560,#1
 838  00c5 2004          	jra	L143
 839  00c7               L733:
 840                     ; 455     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 842  00c7 72135050      	bres	20560,#1
 843  00cb               L143:
 844                     ; 457 }
 847  00cb 81            	ret
 949                     ; 470 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
 949                     ; 471 {
 950                     	switch	.text
 951  00cc               _FLASH_GetFlagStatus:
 953  00cc 88            	push	a
 954       00000001      OFST:	set	1
 957                     ; 472   FlagStatus status = RESET;
 959                     ; 474   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
 961                     ; 477   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
 963  00cd c45054        	and	a,20564
 964  00d0 2706          	jreq	L114
 965                     ; 479     status = SET; /* FLASH_FLAG is set*/
 967  00d2 a601          	ld	a,#1
 968  00d4 6b01          	ld	(OFST+0,sp),a
 970  00d6 2002          	jra	L314
 971  00d8               L114:
 972                     ; 483     status = RESET; /* FLASH_FLAG is reset*/
 974  00d8 0f01          	clr	(OFST+0,sp)
 975  00da               L314:
 976                     ; 487   return status;
 978  00da 7b01          	ld	a,(OFST+0,sp)
 981  00dc 5b01          	addw	sp,#1
 982  00de 81            	ret
1076                     ; 604 IN_RAM(void FLASH_ProgramBlock(uint8_t BlockNum, FLASH_ProgramMode_TypeDef FLASH_ProgramMode, uint8_t *Buffer))
1076                     ; 605 {
1077                     	switch	.text
1078  00df               _FLASH_ProgramBlock:
1080  00df 89            	pushw	x
1081  00e0 5204          	subw	sp,#4
1082       00000004      OFST:	set	4
1085                     ; 606   uint16_t Count = 0;
1087                     ; 607   uint16_t StartAddress = 0;
1089                     ; 610   assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1091                     ; 611   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgramMode));
1093                     ; 614   if (FLASH_ProgramMode == FLASH_ProgramMode_Standard)
1095  00e2 9f            	ld	a,xl
1096  00e3 4d            	tnz	a
1097  00e4 2606          	jrne	L364
1098                     ; 617     FLASH->CR2 |= FLASH_CR2_PRG;
1100  00e6 72105051      	bset	20561,#0
1102  00ea 2004          	jra	L564
1103  00ec               L364:
1104                     ; 622     FLASH->CR2 |= FLASH_CR2_FPRG;
1106  00ec 72185051      	bset	20561,#4
1107  00f0               L564:
1108                     ; 624   StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1110                     ; 626   StartAddress = StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE);
1112  00f0 7b05          	ld	a,(OFST+1,sp)
1113  00f2 5f            	clrw	x
1114  00f3 97            	ld	xl,a
1115  00f4 58            	sllw	x
1116  00f5 58            	sllw	x
1117  00f6 58            	sllw	x
1118  00f7 58            	sllw	x
1119  00f8 58            	sllw	x
1120  00f9 58            	sllw	x
1121  00fa 1c8000        	addw	x,#32768
1122  00fd 1f01          	ldw	(OFST-3,sp),x
1123                     ; 629   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1125  00ff 5f            	clrw	x
1126  0100 1f03          	ldw	(OFST-1,sp),x
1127  0102               L764:
1128                     ; 631     *((PointerAttr uint8_t*) (uint16_t)StartAddress + Count) = ((uint8_t)(Buffer[Count]));
1130  0102 1e09          	ldw	x,(OFST+5,sp)
1131  0104 72fb03        	addw	x,(OFST-1,sp)
1132  0107 f6            	ld	a,(x)
1133  0108 1e01          	ldw	x,(OFST-3,sp)
1134  010a 72fb03        	addw	x,(OFST-1,sp)
1135  010d f7            	ld	(x),a
1136                     ; 629   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1138  010e 1e03          	ldw	x,(OFST-1,sp)
1139  0110 1c0001        	addw	x,#1
1140  0113 1f03          	ldw	(OFST-1,sp),x
1143  0115 1e03          	ldw	x,(OFST-1,sp)
1144  0117 a30040        	cpw	x,#64
1145  011a 25e6          	jrult	L764
1146                     ; 633 }
1149  011c 5b06          	addw	sp,#6
1150  011e 81            	ret
1203                     ; 645 IN_RAM(void FLASH_EraseBlock(uint8_t BlockNum))
1203                     ; 646 {
1204                     	switch	.text
1205  011f               _FLASH_EraseBlock:
1207  011f 5204          	subw	sp,#4
1208       00000004      OFST:	set	4
1211                     ; 648   uint16_t StartAddress = 0;
1213                     ; 650   assert_param(IS_FLASH_BLOCK_NUMBER(BlockNum));
1215                     ; 652   StartAddress = FLASH_START_PHYSICAL_ADDRESS;
1217                     ; 654   pwFlash = (PointerAttr uint32_t *)(uint16_t)(StartAddress + ((uint16_t)BlockNum * (uint16_t)FLASH_BLOCK_SIZE));
1219  0121 5f            	clrw	x
1220  0122 97            	ld	xl,a
1221  0123 58            	sllw	x
1222  0124 58            	sllw	x
1223  0125 58            	sllw	x
1224  0126 58            	sllw	x
1225  0127 58            	sllw	x
1226  0128 58            	sllw	x
1227  0129 1c8000        	addw	x,#32768
1228  012c 1f01          	ldw	(OFST-3,sp),x
1229                     ; 657   FLASH->CR2 |= FLASH_CR2_ERASE;
1231  012e 721a5051      	bset	20561,#5
1232                     ; 659   *pwFlash = (uint32_t)0;
1234  0132 1e01          	ldw	x,(OFST-3,sp)
1235  0134 a600          	ld	a,#0
1236  0136 e703          	ld	(3,x),a
1237  0138 a600          	ld	a,#0
1238  013a e702          	ld	(2,x),a
1239  013c a600          	ld	a,#0
1240  013e e701          	ld	(1,x),a
1241  0140 a600          	ld	a,#0
1242  0142 f7            	ld	(x),a
1243                     ; 660 }
1246  0143 5b04          	addw	sp,#4
1247  0145 81            	ret
1322                     ; 672 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(void))
1322                     ; 673 {
1323                     	switch	.text
1324  0146               _FLASH_WaitForLastOperation:
1326  0146 5205          	subw	sp,#5
1327       00000005      OFST:	set	5
1330                     ; 674   uint32_t timeout = OPERATION_TIMEOUT;
1332  0148 ae1000        	ldw	x,#4096
1333  014b 1f03          	ldw	(OFST-2,sp),x
1334  014d ae0000        	ldw	x,#0
1335  0150 1f01          	ldw	(OFST-4,sp),x
1336                     ; 675   uint8_t My_FlagStatus = 0x00;
1338  0152 0f05          	clr	(OFST+0,sp)
1340  0154 2010          	jra	L365
1341  0156               L755:
1342                     ; 680     My_FlagStatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1344  0156 c65054        	ld	a,20564
1345  0159 a405          	and	a,#5
1346  015b 6b05          	ld	(OFST+0,sp),a
1347                     ; 681     timeout--;
1349  015d 96            	ldw	x,sp
1350  015e 1c0001        	addw	x,#OFST-4
1351  0161 a601          	ld	a,#1
1352  0163 cd0000        	call	c_lgsbc
1354  0166               L365:
1355                     ; 678   while ((My_FlagStatus == 0x00) && (timeout != 0x00))
1357  0166 0d05          	tnz	(OFST+0,sp)
1358  0168 2609          	jrne	L765
1360  016a 96            	ldw	x,sp
1361  016b 1c0001        	addw	x,#OFST-4
1362  016e cd0000        	call	c_lzmp
1364  0171 26e3          	jrne	L755
1365  0173               L765:
1366                     ; 684   if (timeout == 0x00)
1368  0173 96            	ldw	x,sp
1369  0174 1c0001        	addw	x,#OFST-4
1370  0177 cd0000        	call	c_lzmp
1372  017a 2604          	jrne	L175
1373                     ; 686     My_FlagStatus = (uint8_t)FLASH_Status_TimeOut;
1375  017c a602          	ld	a,#2
1376  017e 6b05          	ld	(OFST+0,sp),a
1377  0180               L175:
1378                     ; 689   return((FLASH_Status_TypeDef)My_FlagStatus);
1380  0180 7b05          	ld	a,(OFST+0,sp)
1383  0182 5b05          	addw	sp,#5
1384  0184 81            	ret
1397                     	xdef	_FLASH_WaitForLastOperation
1398                     	xdef	_FLASH_EraseBlock
1399                     	xdef	_FLASH_ProgramBlock
1400                     	xdef	_FLASH_GetFlagStatus
1401                     	xdef	_FLASH_ITConfig
1402                     	xdef	_FLASH_GetReadOutProtectionStatus
1403                     	xdef	_FLASH_GetDataSize
1404                     	xdef	_FLASH_GetBootSize
1405                     	xdef	_FLASH_ReadByte
1406                     	xdef	_FLASH_ProgramWord
1407                     	xdef	_FLASH_EraseByte
1408                     	xdef	_FLASH_ProgramByte
1409                     	xdef	_FLASH_Lock
1410                     	xdef	_FLASH_Unlock
1411                     	xdef	_FLASH_DeInit
1412                     	xdef	_FLASH_SetProgrammingTime
1413                     	xdef	_FLASH_GetProgrammingTime
1432                     	xref	c_lzmp
1433                     	xref	c_lgsbc
1434                     	end
