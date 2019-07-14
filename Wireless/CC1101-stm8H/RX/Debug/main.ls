   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  57                     ; 11 INT8U SPI_ExchangeByte( INT8U input )
  57                     ; 12 {
  59                     	switch	.text
  60  0000               _SPI_ExchangeByte:
  62  0000 88            	push	a
  63       00000000      OFST:	set	0
  66  0001               L13:
  67                     ; 13 	while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
  69  0001 a602          	ld	a,#2
  70  0003 cd0000        	call	_SPI_GetFlagStatus
  72  0006 4d            	tnz	a
  73  0007 27f8          	jreq	L13
  74                     ; 14 	SPI_SendData( input );
  76  0009 7b01          	ld	a,(OFST+1,sp)
  77  000b cd0000        	call	_SPI_SendData
  80  000e               L73:
  81                     ; 15 	while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
  83  000e a601          	ld	a,#1
  84  0010 cd0000        	call	_SPI_GetFlagStatus
  86  0013 4d            	tnz	a
  87  0014 27f8          	jreq	L73
  88                     ; 16 	return SPI_ReceiveData( );
  90  0016 cd0000        	call	_SPI_ReceiveData
  94  0019 5b01          	addw	sp,#1
  95  001b 81            	ret
 125                     ; 19 void SPIInit( void )
 125                     ; 20 {
 126                     	switch	.text
 127  001c               _SPIInit:
 131                     ; 22 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI, ENABLE);
 133  001c ae0001        	ldw	x,#1
 134  001f a610          	ld	a,#16
 135  0021 95            	ld	xh,a
 136  0022 cd0000        	call	_CLK_PeripheralClockConfig
 138                     ; 23 	SPI_DeInit( );
 140  0025 cd0000        	call	_SPI_DeInit
 142                     ; 24 	SPI_Init( SPI_FirstBit_MSB, SPI_BaudRatePrescaler_2,
 142                     ; 25             SPI_Mode_Master, SPI_CPOL_Low, SPI_CPHA_1Edge,
 142                     ; 26             SPI_Direction_2Lines_FullDuplex, SPI_NSS_Soft );
 144  0028 4b02          	push	#2
 145  002a 4b00          	push	#0
 146  002c 4b00          	push	#0
 147  002e 4b00          	push	#0
 148  0030 4b04          	push	#4
 149  0032 5f            	clrw	x
 150  0033 4f            	clr	a
 151  0034 95            	ld	xh,a
 152  0035 cd0000        	call	_SPI_Init
 154  0038 5b05          	addw	sp,#5
 155                     ; 27 	SPI_Cmd( ENABLE );
 157  003a a601          	ld	a,#1
 158  003c cd0000        	call	_SPI_Cmd
 160                     ; 29 	GPIO_Init( GPIOB, GPIO_Pin_7,GPIO_Mode_In_PU_No_IT );
 162  003f 4b40          	push	#64
 163  0041 4b80          	push	#128
 164  0043 ae5005        	ldw	x,#20485
 165  0046 cd0000        	call	_GPIO_Init
 167  0049 85            	popw	x
 168                     ; 30 	GPIO_Init( GPIOB, GPIO_Pin_5 | GPIO_Pin_6, GPIO_Mode_Out_PP_High_Slow );
 170  004a 4bd0          	push	#208
 171  004c 4b60          	push	#96
 172  004e ae5005        	ldw	x,#20485
 173  0051 cd0000        	call	_GPIO_Init
 175  0054 85            	popw	x
 176                     ; 31 	GPIO_Init( GPIOB, GPIO_Pin_4, GPIO_Mode_Out_PP_High_Slow );
 178  0055 4bd0          	push	#208
 179  0057 4b10          	push	#16
 180  0059 ae5005        	ldw	x,#20485
 181  005c cd0000        	call	_GPIO_Init
 183  005f 85            	popw	x
 184                     ; 32 	GPIO_SetBits( GPIOB, GPIO_Pin_4 );
 186  0060 4b10          	push	#16
 187  0062 ae5005        	ldw	x,#20485
 188  0065 cd0000        	call	_GPIO_SetBits
 190  0068 84            	pop	a
 191                     ; 33 	GPIO_ResetBits( GPIOB, GPIO_Pin_4 );
 193  0069 4b10          	push	#16
 194  006b ae5005        	ldw	x,#20485
 195  006e cd0000        	call	_GPIO_ResetBits
 197  0071 84            	pop	a
 198                     ; 34 	GPIO_SetBits( GPIOB, GPIO_Pin_4 );	
 200  0072 4b10          	push	#16
 201  0074 ae5005        	ldw	x,#20485
 202  0077 cd0000        	call	_GPIO_SetBits
 204  007a 84            	pop	a
 205                     ; 35 }
 208  007b 81            	ret
 211                     .const:	section	.text
 212  0000               L35_rxBuffer:
 213  0000 00            	dc.b	0
 214  0001 000000000000  	ds.b	9
 280                     	switch	.const
 281  000a               L21:
 282  000a 00000064      	dc.l	100
 283                     ; 38 main()
 283                     ; 39 {
 284                     	switch	.text
 285  007c               _main:
 287  007c 5210          	subw	sp,#16
 288       00000010      OFST:	set	16
 291                     ; 40 	volatile INT8U rxBuffer[10] = {0}, length, i;
 293  007e 96            	ldw	x,sp
 294  007f 1c0002        	addw	x,#OFST-14
 295  0082 90ae0000      	ldw	y,#L35_rxBuffer
 296  0086 a60a          	ld	a,#10
 297  0088 cd0000        	call	c_xymvx
 299                     ; 43 	SPIInit( );
 301  008b ad8f          	call	_SPIInit
 303                     ; 46 	GPIO_Init( GPIOA, GPIO_Pin_3 | GPIO_Pin_2, GPIO_Mode_In_PU_No_IT );
 305  008d 4b40          	push	#64
 306  008f 4b0c          	push	#12
 307  0091 ae5000        	ldw	x,#20480
 308  0094 cd0000        	call	_GPIO_Init
 310  0097 85            	popw	x
 311                     ; 49 	GPIO_Init( GPIOB, GPIO_Pin_0 | GPIO_Pin_1,GPIO_Mode_Out_OD_Low_Fast );
 313  0098 4ba0          	push	#160
 314  009a 4b03          	push	#3
 315  009c ae5005        	ldw	x,#20485
 316  009f cd0000        	call	_GPIO_Init
 318  00a2 85            	popw	x
 319                     ; 51   CC1101Init(  );                        // Write RF settings to config reg  
 321  00a3 cd0000        	call	_CC1101Init
 323                     ; 53 	CC1101SetTRMode( RX_MODE );
 325  00a6 a601          	ld	a,#1
 326  00a8 cd0000        	call	_CC1101SetTRMode
 328  00ab               L701:
 329                     ; 59 		for( x = 0; x < 100; x ++ );
 331  00ab ae0000        	ldw	x,#0
 332  00ae 1f0e          	ldw	(OFST-2,sp),x
 333  00b0 ae0000        	ldw	x,#0
 334  00b3 1f0c          	ldw	(OFST-4,sp),x
 335  00b5               L311:
 339  00b5 96            	ldw	x,sp
 340  00b6 1c000c        	addw	x,#OFST-4
 341  00b9 a601          	ld	a,#1
 342  00bb cd0000        	call	c_lgadc
 346  00be 96            	ldw	x,sp
 347  00bf 1c000c        	addw	x,#OFST-4
 348  00c2 cd0000        	call	c_ltor
 350  00c5 ae000a        	ldw	x,#L21
 351  00c8 cd0000        	call	c_lcmp
 353  00cb 25e8          	jrult	L311
 354                     ; 60 		length = 10;
 356  00cd a60a          	ld	a,#10
 357  00cf 6b01          	ld	(OFST-15,sp),a
 358                     ; 61 		i = CC1101RecPacket( rxBuffer, &length );
 360  00d1 96            	ldw	x,sp
 361  00d2 1c0001        	addw	x,#OFST-15
 362  00d5 89            	pushw	x
 363  00d6 96            	ldw	x,sp
 364  00d7 1c0004        	addw	x,#OFST-12
 365  00da cd0000        	call	_CC1101RecPacket
 367  00dd 85            	popw	x
 368  00de 6b10          	ld	(OFST+0,sp),a
 369                     ; 62 		if(i != 0 )
 371  00e0 0d10          	tnz	(OFST+0,sp)
 372  00e2 27c7          	jreq	L701
 373                     ; 64 			for( i = 0; i < 10; i ++ ){ rxBuffer[i] = 0xFF;}
 375  00e4 0f10          	clr	(OFST+0,sp)
 377  00e6 2011          	jra	L721
 378  00e8               L321:
 381  00e8 96            	ldw	x,sp
 382  00e9 1c0002        	addw	x,#OFST-14
 383  00ec 9f            	ld	a,xl
 384  00ed 5e            	swapw	x
 385  00ee 1b10          	add	a,(OFST+0,sp)
 386  00f0 2401          	jrnc	L41
 387  00f2 5c            	incw	x
 388  00f3               L41:
 389  00f3 02            	rlwa	x,a
 390  00f4 a6ff          	ld	a,#255
 391  00f6 f7            	ld	(x),a
 394  00f7 0c10          	inc	(OFST+0,sp)
 395  00f9               L721:
 398  00f9 7b10          	ld	a,(OFST+0,sp)
 399  00fb a10a          	cp	a,#10
 400  00fd 25e9          	jrult	L321
 401                     ; 65 			GPIO_ToggleBits( GPIOB, GPIO_Pin_1 | GPIO_Pin_0 );
 403  00ff 4b03          	push	#3
 404  0101 ae5005        	ldw	x,#20485
 405  0104 cd0000        	call	_GPIO_ToggleBits
 407  0107 84            	pop	a
 408  0108 20a1          	jra	L701
 421                     	xdef	_main
 422                     	xdef	_SPIInit
 423                     	xref	_CC1101Init
 424                     	xref	_CC1101RecPacket
 425                     	xref	_CC1101SetTRMode
 426                     	xdef	_SPI_ExchangeByte
 427                     	xref	_SPI_GetFlagStatus
 428                     	xref	_SPI_ReceiveData
 429                     	xref	_SPI_SendData
 430                     	xref	_SPI_Cmd
 431                     	xref	_SPI_Init
 432                     	xref	_SPI_DeInit
 433                     	xref	_GPIO_ToggleBits
 434                     	xref	_GPIO_ResetBits
 435                     	xref	_GPIO_SetBits
 436                     	xref	_GPIO_Init
 437                     	xref	_CLK_PeripheralClockConfig
 438                     	xref.b	c_x
 457                     	xref	c_lcmp
 458                     	xref	c_ltor
 459                     	xref	c_lgadc
 460                     	xref	c_xymvx
 461                     	end
