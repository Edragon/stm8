   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  35                     ; 50 void main(void)
  35                     ; 51 {
  37                     	switch	.text
  38  0000               _main:
  42                     ; 54   GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
  44  0000 4be0          	push	#224
  45  0002 4b20          	push	#32
  46  0004 ae5014        	ldw	x,#20500
  47  0007 cd0000        	call	_GPIO_Init
  49  000a 85            	popw	x
  50  000b               L12:
  51                     ; 59     GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
  53  000b 4b20          	push	#32
  54  000d ae5014        	ldw	x,#20500
  55  0010 cd0000        	call	_GPIO_WriteReverse
  57  0013 84            	pop	a
  58                     ; 60     Delay(0xFFFF);
  60  0014 aeffff        	ldw	x,#65535
  61  0017 ad02          	call	_Delay
  64  0019 20f0          	jra	L12
  98                     ; 70 void Delay(uint16_t nCount)
  98                     ; 71 {
  99                     	switch	.text
 100  001b               _Delay:
 102  001b 89            	pushw	x
 103       00000000      OFST:	set	0
 106  001c 2007          	jra	L54
 107  001e               L34:
 108                     ; 75     nCount--;
 110  001e 1e01          	ldw	x,(OFST+1,sp)
 111  0020 1d0001        	subw	x,#1
 112  0023 1f01          	ldw	(OFST+1,sp),x
 113  0025               L54:
 114                     ; 73   while (nCount != 0)
 116  0025 1e01          	ldw	x,(OFST+1,sp)
 117  0027 26f5          	jrne	L34
 118                     ; 77 }
 121  0029 85            	popw	x
 122  002a 81            	ret
 157                     ; 88 void assert_failed(uint8_t* file, uint32_t line)
 157                     ; 89 { 
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
