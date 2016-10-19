   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  34                     ; 30 void Init_UART2(void)
  34                     ; 31 {
  36                     	switch	.text
  37  0000               _Init_UART2:
  41                     ; 32 	UART2_DeInit();
  43  0000 cd0000        	call	_UART2_DeInit
  45                     ; 33 	UART2_Init((u32)9600, UART2_WORDLENGTH_8D, UART2_STOPBITS_1, UART2_PARITY_NO, UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TX_ENABLE);
  47  0003 4b04          	push	#4
  48  0005 4b80          	push	#128
  49  0007 4b00          	push	#0
  50  0009 4b00          	push	#0
  51  000b 4b00          	push	#0
  52  000d ae2580        	ldw	x,#9600
  53  0010 89            	pushw	x
  54  0011 ae0000        	ldw	x,#0
  55  0014 89            	pushw	x
  56  0015 cd0000        	call	_UART2_Init
  58  0018 5b09          	addw	sp,#9
  59                     ; 35 }
  62  001a 81            	ret
  98                     ; 36 void Send(uint8_t dat)
  98                     ; 37 {
  99                     	switch	.text
 100  001b               _Send:
 102  001b 88            	push	a
 103       00000000      OFST:	set	0
 106  001c               L14:
 107                     ; 38   while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
 109  001c ae0080        	ldw	x,#128
 110  001f cd0000        	call	_UART2_GetFlagStatus
 112  0022 4d            	tnz	a
 113  0023 27f7          	jreq	L14
 114                     ; 40 		UART2_SendData8(dat);
 116  0025 7b01          	ld	a,(OFST+1,sp)
 117  0027 cd0000        	call	_UART2_SendData8
 119                     ; 42 }
 122  002a 84            	pop	a
 123  002b 81            	ret
 159                     ; 43 void main(void)
 159                     ; 44 {
 160                     	switch	.text
 161  002c               _main:
 163  002c 88            	push	a
 164       00000001      OFST:	set	1
 167                     ; 45   uint8_t i=0; 
 169  002d 0f01          	clr	(OFST+0,sp)
 170                     ; 47 		Init_UART2();
 172  002f adcf          	call	_Init_UART2
 174  0031               L36:
 175                     ; 51 		Send(i);
 177  0031 7b01          	ld	a,(OFST+0,sp)
 178  0033 ade6          	call	_Send
 180                     ; 53 		i++;
 182  0035 0c01          	inc	(OFST+0,sp)
 184  0037 20f8          	jra	L36
 219                     ; 67 void assert_failed(u8* file, u32 line)
 219                     ; 68 { 
 220                     	switch	.text
 221  0039               _assert_failed:
 225  0039               L501:
 226  0039 20fe          	jra	L501
 239                     	xdef	_main
 240                     	xdef	_Send
 241                     	xdef	_Init_UART2
 242                     	xdef	_assert_failed
 243                     	xref	_UART2_GetFlagStatus
 244                     	xref	_UART2_SendData8
 245                     	xref	_UART2_Init
 246                     	xref	_UART2_DeInit
 265                     	end
