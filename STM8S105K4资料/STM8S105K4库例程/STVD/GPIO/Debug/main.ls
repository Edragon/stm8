   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  43                     ; 30 void Delay(uint16_t nCount)
  43                     ; 31 {
  45                     	switch	.text
  46  0000               _Delay:
  48  0000 89            	pushw	x
  49       00000000      OFST:	set	0
  52  0001 2007          	jra	L13
  53  0003               L72:
  54                     ; 35     nCount--;
  56  0003 1e01          	ldw	x,(OFST+1,sp)
  57  0005 1d0001        	subw	x,#1
  58  0008 1f01          	ldw	(OFST+1,sp),x
  59  000a               L13:
  60                     ; 33   while (nCount != 0)
  62  000a 1e01          	ldw	x,(OFST+1,sp)
  63  000c 26f5          	jrne	L72
  64                     ; 37 }
  67  000e 85            	popw	x
  68  000f 81            	ret
  94                     ; 38 void main(void)
  94                     ; 39 {
  95                     	switch	.text
  96  0010               _main:
 100                     ; 41   GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
 102  0010 4be0          	push	#224
 103  0012 4b20          	push	#32
 104  0014 ae5014        	ldw	x,#20500
 105  0017 cd0000        	call	_GPIO_Init
 107  001a 85            	popw	x
 108  001b               L54:
 109                     ; 46     GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
 111  001b 4b20          	push	#32
 112  001d ae5014        	ldw	x,#20500
 113  0020 cd0000        	call	_GPIO_WriteReverse
 115  0023 84            	pop	a
 116                     ; 47     Delay(0xFFFF);
 118  0024 aeffff        	ldw	x,#65535
 119  0027 add7          	call	_Delay
 122  0029 20f0          	jra	L54
 157                     ; 61 void assert_failed(u8* file, u32 line)
 157                     ; 62 { 
 158                     	switch	.text
 159  002b               _assert_failed:
 163  002b               L76:
 164  002b 20fe          	jra	L76
 177                     	xdef	_main
 178                     	xdef	_Delay
 179                     	xdef	_assert_failed
 180                     	xref	_GPIO_WriteReverse
 181                     	xref	_GPIO_Init
 200                     	end
