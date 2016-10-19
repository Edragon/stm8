   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  35                     ; 30 void Init_UART2(void)
  35                     ; 31 {
  37                     	switch	.text
  38  0000               _Init_UART2:
  42                     ; 32 	UART2_DeInit();
  44  0000 cd0000        	call	_UART2_DeInit
  46                     ; 33 	UART2_Init((u32)9600, UART2_WORDLENGTH_8D, UART2_STOPBITS_1, UART2_PARITY_NO, UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TXRX_ENABLE);
  48  0003 4b0c          	push	#12
  49  0005 4b80          	push	#128
  50  0007 4b00          	push	#0
  51  0009 4b00          	push	#0
  52  000b 4b00          	push	#0
  53  000d ae2580        	ldw	x,#9600
  54  0010 89            	pushw	x
  55  0011 ae0000        	ldw	x,#0
  56  0014 89            	pushw	x
  57  0015 cd0000        	call	_UART2_Init
  59  0018 5b09          	addw	sp,#9
  60                     ; 35 UART2_ITConfig(UART2_IT_RXNE_OR, ENABLE);
  62  001a 4b01          	push	#1
  63  001c ae0205        	ldw	x,#517
  64  001f cd0000        	call	_UART2_ITConfig
  66  0022 84            	pop	a
  67                     ; 38 }
  70  0023 81            	ret
 106                     ; 39 void Send(uint8_t dat)
 106                     ; 40 {
 107                     	switch	.text
 108  0024               _Send:
 110  0024 88            	push	a
 111       00000000      OFST:	set	0
 114  0025               L14:
 115                     ; 41   while(( UART2_GetFlagStatus(UART2_FLAG_TXE)==RESET));
 117  0025 ae0080        	ldw	x,#128
 118  0028 cd0000        	call	_UART2_GetFlagStatus
 120  002b 4d            	tnz	a
 121  002c 27f7          	jreq	L14
 122                     ; 43 		UART2_SendData8(dat);
 124  002e 7b01          	ld	a,(OFST+1,sp)
 125  0030 cd0000        	call	_UART2_SendData8
 127                     ; 45 }
 130  0033 84            	pop	a
 131  0034 81            	ret
 167                     ; 46 void main(void)
 167                     ; 47 {
 168                     	switch	.text
 169  0035               _main:
 171  0035 88            	push	a
 172       00000001      OFST:	set	1
 175                     ; 48     uint8_t i=0; 
 177  0036 0f01          	clr	(OFST+0,sp)
 178                     ; 50 		Init_UART2();
 180  0038 adc6          	call	_Init_UART2
 182                     ; 51 		enableInterrupts(); 
 185  003a 9a            rim
 187  003b               L36:
 189  003b 20fe          	jra	L36
 224                     ; 67 void assert_failed(u8* file, u32 line)
 224                     ; 68 { 
 225                     	switch	.text
 226  003d               _assert_failed:
 230  003d               L501:
 231  003d 20fe          	jra	L501
 244                     	xdef	_main
 245                     	xdef	_Send
 246                     	xdef	_Init_UART2
 247                     	xdef	_assert_failed
 248                     	xref	_UART2_GetFlagStatus
 249                     	xref	_UART2_SendData8
 250                     	xref	_UART2_ITConfig
 251                     	xref	_UART2_Init
 252                     	xref	_UART2_DeInit
 271                     	end
