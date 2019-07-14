   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  57                     ; 10 INT8U SPI_ExchangeByte( INT8U input )
  57                     ; 11 {
  59                     	switch	.text
  60  0000               _SPI_ExchangeByte:
  62  0000 88            	push	a
  63       00000000      OFST:	set	0
  66  0001               L13:
  67                     ; 12 	while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
  69  0001 a602          	ld	a,#2
  70  0003 cd0000        	call	_SPI_GetFlagStatus
  72  0006 4d            	tnz	a
  73  0007 27f8          	jreq	L13
  74                     ; 13 	SPI_SendData( input );
  76  0009 7b01          	ld	a,(OFST+1,sp)
  77  000b cd0000        	call	_SPI_SendData
  80  000e               L73:
  81                     ; 14 	while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
  83  000e a601          	ld	a,#1
  84  0010 cd0000        	call	_SPI_GetFlagStatus
  86  0013 4d            	tnz	a
  87  0014 27f8          	jreq	L73
  88                     ; 15 	return SPI_ReceiveData( );
  90  0016 cd0000        	call	_SPI_ReceiveData
  94  0019 5b01          	addw	sp,#1
  95  001b 81            	ret
 125                     ; 18 void SPIInit( void )
 125                     ; 19 {
 126                     	switch	.text
 127  001c               _SPIInit:
 131                     ; 21 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI, ENABLE);
 133  001c ae0001        	ldw	x,#1
 134  001f a610          	ld	a,#16
 135  0021 95            	ld	xh,a
 136  0022 cd0000        	call	_CLK_PeripheralClockConfig
 138                     ; 22 	SPI_DeInit( );
 140  0025 cd0000        	call	_SPI_DeInit
 142                     ; 23 	SPI_Init( SPI_FirstBit_MSB, SPI_BaudRatePrescaler_2,
 142                     ; 24             SPI_Mode_Master, SPI_CPOL_Low, SPI_CPHA_1Edge,
 142                     ; 25             SPI_Direction_2Lines_FullDuplex, SPI_NSS_Soft );
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
 155                     ; 26 	SPI_Cmd( ENABLE );
 157  003a a601          	ld	a,#1
 158  003c cd0000        	call	_SPI_Cmd
 160                     ; 28 	GPIO_Init( GPIOB, GPIO_Pin_7,GPIO_Mode_In_PU_No_IT );
 162  003f 4b40          	push	#64
 163  0041 4b80          	push	#128
 164  0043 ae5005        	ldw	x,#20485
 165  0046 cd0000        	call	_GPIO_Init
 167  0049 85            	popw	x
 168                     ; 29 	GPIO_Init( GPIOB, GPIO_Pin_5 | GPIO_Pin_6, GPIO_Mode_Out_PP_High_Slow );
 170  004a 4bd0          	push	#208
 171  004c 4b60          	push	#96
 172  004e ae5005        	ldw	x,#20485
 173  0051 cd0000        	call	_GPIO_Init
 175  0054 85            	popw	x
 176                     ; 30 	GPIO_Init( GPIOB, GPIO_Pin_4, GPIO_Mode_Out_PP_High_Slow );
 178  0055 4bd0          	push	#208
 179  0057 4b10          	push	#16
 180  0059 ae5005        	ldw	x,#20485
 181  005c cd0000        	call	_GPIO_Init
 183  005f 85            	popw	x
 184                     ; 31 	GPIO_SetBits( GPIOB, GPIO_Pin_4 );
 186  0060 4b10          	push	#16
 187  0062 ae5005        	ldw	x,#20485
 188  0065 cd0000        	call	_GPIO_SetBits
 190  0068 84            	pop	a
 191                     ; 32 	GPIO_ResetBits( GPIOB, GPIO_Pin_4 );
 193  0069 4b10          	push	#16
 194  006b ae5005        	ldw	x,#20485
 195  006e cd0000        	call	_GPIO_ResetBits
 197  0071 84            	pop	a
 198                     ; 33 	GPIO_SetBits( GPIOB, GPIO_Pin_4 );	 
 200  0072 4b10          	push	#16
 201  0074 ae5005        	ldw	x,#20485
 202  0077 cd0000        	call	_GPIO_SetBits
 204  007a 84            	pop	a
 205                     ; 34 }
 208  007b 81            	ret
 211                     .const:	section	.text
 212  0000               L35_txBuffer:
 213  0000 00            	dc.b	0
 214  0001 01            	dc.b	1
 215  0002 02            	dc.b	2
 216  0003 03            	dc.b	3
 217  0004 04            	dc.b	4
 218  0005 05            	dc.b	5
 219  0006 06            	dc.b	6
 220  0007 07            	dc.b	7
 221  0008 08            	dc.b	8
 222  0009 09            	dc.b	9
 270                     	switch	.const
 271  000a               L21:
 272  000a 000001f4      	dc.l	500
 273  000e               L41:
 274  000e 00004e20      	dc.l	20000
 275                     ; 37 main()  
 275                     ; 38 {
 276                     	switch	.text
 277  007c               _main:
 279  007c 520e          	subw	sp,#14
 280       0000000e      OFST:	set	14
 283                     ; 39 	volatile INT8U txBuffer[10] = {0,1,2,3,4,5,6,7,8,9 };
 285  007e 96            	ldw	x,sp
 286  007f 1c0001        	addw	x,#OFST-13
 287  0082 90ae0000      	ldw	y,#L35_txBuffer
 288  0086 a60a          	ld	a,#10
 289  0088 cd0000        	call	c_xymvx
 291                     ; 42 	SPIInit( );
 293  008b ad8f          	call	_SPIInit
 295                     ; 45 	GPIO_Init( GPIOA, GPIO_Pin_3 | GPIO_Pin_2, GPIO_Mode_In_PU_No_IT );
 297  008d 4b40          	push	#64
 298  008f 4b0c          	push	#12
 299  0091 ae5000        	ldw	x,#20480
 300  0094 cd0000        	call	_GPIO_Init
 302  0097 85            	popw	x
 303                     ; 48 	GPIO_Init( GPIOB, GPIO_Pin_0 | GPIO_Pin_1,GPIO_Mode_Out_OD_Low_Fast );
 305  0098 4ba0          	push	#160
 306  009a 4b03          	push	#3
 307  009c ae5005        	ldw	x,#20485
 308  009f cd0000        	call	_GPIO_Init
 310  00a2 85            	popw	x
 311                     ; 51 	CC1101Init( );
 313  00a3 cd0000        	call	_CC1101Init
 315  00a6               L77:
 316                     ; 56 		CC2500SendPacket( txBuffer,10 );
 318  00a6 4b0a          	push	#10
 319  00a8 96            	ldw	x,sp
 320  00a9 1c0002        	addw	x,#OFST-12
 321  00ac cd0000        	call	_CC2500SendPacket
 323  00af 84            	pop	a
 324                     ; 57 		GPIO_ResetBits( GPIOB, GPIO_Pin_1 | GPIO_Pin_0 );	
 326  00b0 4b03          	push	#3
 327  00b2 ae5005        	ldw	x,#20485
 328  00b5 cd0000        	call	_GPIO_ResetBits
 330  00b8 84            	pop	a
 331                     ; 58 		for( x = 0; x < 500; x ++ );
 333  00b9 ae0000        	ldw	x,#0
 334  00bc 1f0d          	ldw	(OFST-1,sp),x
 335  00be ae0000        	ldw	x,#0
 336  00c1 1f0b          	ldw	(OFST-3,sp),x
 337  00c3               L301:
 341  00c3 96            	ldw	x,sp
 342  00c4 1c000b        	addw	x,#OFST-3
 343  00c7 a601          	ld	a,#1
 344  00c9 cd0000        	call	c_lgadc
 348  00cc 96            	ldw	x,sp
 349  00cd 1c000b        	addw	x,#OFST-3
 350  00d0 cd0000        	call	c_ltor
 352  00d3 ae000a        	ldw	x,#L21
 353  00d6 cd0000        	call	c_lcmp
 355  00d9 25e8          	jrult	L301
 356                     ; 59 		GPIO_SetBits( GPIOB, GPIO_Pin_1 | GPIO_Pin_0 );
 358  00db 4b03          	push	#3
 359  00dd ae5005        	ldw	x,#20485
 360  00e0 cd0000        	call	_GPIO_SetBits
 362  00e3 84            	pop	a
 363                     ; 60 		for( x = 0; x < 20000; x ++ );
 365  00e4 ae0000        	ldw	x,#0
 366  00e7 1f0d          	ldw	(OFST-1,sp),x
 367  00e9 ae0000        	ldw	x,#0
 368  00ec 1f0b          	ldw	(OFST-3,sp),x
 369  00ee               L111:
 373  00ee 96            	ldw	x,sp
 374  00ef 1c000b        	addw	x,#OFST-3
 375  00f2 a601          	ld	a,#1
 376  00f4 cd0000        	call	c_lgadc
 380  00f7 96            	ldw	x,sp
 381  00f8 1c000b        	addw	x,#OFST-3
 382  00fb cd0000        	call	c_ltor
 384  00fe ae000e        	ldw	x,#L41
 385  0101 cd0000        	call	c_lcmp
 387  0104 25e8          	jrult	L111
 389  0106 209e          	jra	L77
 402                     	xdef	_main
 403                     	xdef	_SPIInit
 404                     	xref	_CC1101Init
 405                     	xref	_CC2500SendPacket
 406                     	xdef	_SPI_ExchangeByte
 407                     	xref	_SPI_GetFlagStatus
 408                     	xref	_SPI_ReceiveData
 409                     	xref	_SPI_SendData
 410                     	xref	_SPI_Cmd
 411                     	xref	_SPI_Init
 412                     	xref	_SPI_DeInit
 413                     	xref	_GPIO_ResetBits
 414                     	xref	_GPIO_SetBits
 415                     	xref	_GPIO_Init
 416                     	xref	_CLK_PeripheralClockConfig
 417                     	xref.b	c_x
 436                     	xref	c_lcmp
 437                     	xref	c_ltor
 438                     	xref	c_lgadc
 439                     	xref	c_xymvx
 440                     	end
