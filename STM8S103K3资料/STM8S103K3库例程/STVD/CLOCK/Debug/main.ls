   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  43                     ; 33 void Delay(uint16_t nCount)
  43                     ; 34 {
  45                     	switch	.text
  46  0000               _Delay:
  48  0000 89            	pushw	x
  49       00000000      OFST:	set	0
  52  0001 2007          	jra	L53
  53  0003               L33:
  54                     ; 38     nCount--;
  56  0003 1e01          	ldw	x,(OFST+1,sp)
  57  0005 1d0001        	subw	x,#1
  58  0008 1f01          	ldw	(OFST+1,sp),x
  59  000a               L53:
  60                     ; 36   while (nCount != 0)
  62  000a 1e01          	ldw	x,(OFST+1,sp)
  63  000c 26f5          	jrne	L33
  64                     ; 40 }
  67  000e 85            	popw	x
  68  000f 81            	ret
 140                     ; 42 void main(void)
 140                     ; 43 {
 141                     	switch	.text
 142  0010               _main:
 144  0010 88            	push	a
 145       00000001      OFST:	set	1
 148                     ; 48     GPIO_Config();  
 150  0011 cd00d2        	call	L5_GPIO_Config
 152                     ; 50     CLK_HSICmd(ENABLE);//开始内部高频RC
 154  0014 a601          	ld	a,#1
 155  0016 cd0000        	call	_CLK_HSICmd
 157                     ; 51 		CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);//不分频
 159  0019 4f            	clr	a
 160  001a cd0000        	call	_CLK_HSIPrescalerConfig
 162                     ; 53 		for(i=0;i<10;i++)
 164  001d 0f01          	clr	(OFST+0,sp)
 165  001f               L37:
 166                     ; 56        GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
 168  001f 4b20          	push	#32
 169  0021 ae5014        	ldw	x,#20500
 170  0024 cd0000        	call	_GPIO_WriteReverse
 172  0027 84            	pop	a
 173                     ; 57        Delay(0xFFFF);
 175  0028 aeffff        	ldw	x,#65535
 176  002b add3          	call	_Delay
 178                     ; 53 		for(i=0;i<10;i++)
 180  002d 0c01          	inc	(OFST+0,sp)
 183  002f 7b01          	ld	a,(OFST+0,sp)
 184  0031 a10a          	cp	a,#10
 185  0033 25ea          	jrult	L37
 186                     ; 59 		CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);//8分频
 188  0035 a618          	ld	a,#24
 189  0037 cd0000        	call	_CLK_HSIPrescalerConfig
 191                     ; 61 		for(i=0;i<10;i++)
 193  003a 0f01          	clr	(OFST+0,sp)
 194  003c               L101:
 195                     ; 64        GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
 197  003c 4b20          	push	#32
 198  003e ae5014        	ldw	x,#20500
 199  0041 cd0000        	call	_GPIO_WriteReverse
 201  0044 84            	pop	a
 202                     ; 65        Delay(0xFFFF);
 204  0045 aeffff        	ldw	x,#65535
 205  0048 adb6          	call	_Delay
 207                     ; 61 		for(i=0;i<10;i++)
 209  004a 0c01          	inc	(OFST+0,sp)
 212  004c 7b01          	ld	a,(OFST+0,sp)
 213  004e a10a          	cp	a,#10
 214  0050 25ea          	jrult	L101
 215  0052               L701:
 216                     ; 71 			clk_return_status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 218  0052 4b00          	push	#0
 219  0054 4b00          	push	#0
 220  0056 ae00e1        	ldw	x,#225
 221  0059 a601          	ld	a,#1
 222  005b 95            	ld	xh,a
 223  005c cd0000        	call	_CLK_ClockSwitchConfig
 225  005f 85            	popw	x
 226  0060 6b01          	ld	(OFST+0,sp),a
 227                     ; 72       if (clk_return_status == SUCCESS)  //SUCCESS or ERROR
 229  0062 7b01          	ld	a,(OFST+0,sp)
 230  0064 a101          	cp	a,#1
 231  0066 262b          	jrne	L311
 232                     ; 74 			    CLK_ClockSwitchCmd(ENABLE);
 234  0068 a601          	ld	a,#1
 235  006a cd0000        	call	_CLK_ClockSwitchCmd
 237                     ; 75 					CLK_HSICmd(ENABLE);//开始内部高频RC
 239  006d a601          	ld	a,#1
 240  006f cd0000        	call	_CLK_HSICmd
 242                     ; 76 					CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);//不分频
 244  0072 4f            	clr	a
 245  0073 cd0000        	call	_CLK_HSIPrescalerConfig
 247                     ; 77 					CLK_ClockSwitchCmd(DISABLE);
 249  0076 4f            	clr	a
 250  0077 cd0000        	call	_CLK_ClockSwitchCmd
 252                     ; 78 					for(i=0;i<10;i++)
 254  007a 0f01          	clr	(OFST+0,sp)
 255  007c               L511:
 256                     ; 81 						GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
 258  007c 4b20          	push	#32
 259  007e ae5014        	ldw	x,#20500
 260  0081 cd0000        	call	_GPIO_WriteReverse
 262  0084 84            	pop	a
 263                     ; 82 						Delay(0xFFFF);
 265  0085 aeffff        	ldw	x,#65535
 266  0088 cd0000        	call	_Delay
 268                     ; 78 					for(i=0;i<10;i++)
 270  008b 0c01          	inc	(OFST+0,sp)
 273  008d 7b01          	ld	a,(OFST+0,sp)
 274  008f a10a          	cp	a,#10
 275  0091 25e9          	jrult	L511
 276  0093               L311:
 277                     ; 88 			clk_return_status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_LSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 280  0093 4b00          	push	#0
 281  0095 4b00          	push	#0
 282  0097 ae00d2        	ldw	x,#210
 283  009a a601          	ld	a,#1
 284  009c 95            	ld	xh,a
 285  009d cd0000        	call	_CLK_ClockSwitchConfig
 287  00a0 85            	popw	x
 288  00a1 6b01          	ld	(OFST+0,sp),a
 289                     ; 89 			if (clk_return_status == SUCCESS)  //SUCCESS or ERROR
 291  00a3 7b01          	ld	a,(OFST+0,sp)
 292  00a5 a101          	cp	a,#1
 293  00a7 26a9          	jrne	L701
 294                     ; 92 					CLK_ClockSwitchCmd(ENABLE);
 296  00a9 a601          	ld	a,#1
 297  00ab cd0000        	call	_CLK_ClockSwitchCmd
 299                     ; 93 					CLK_LSICmd(ENABLE);
 301  00ae a601          	ld	a,#1
 302  00b0 cd0000        	call	_CLK_LSICmd
 304                     ; 94 					CLK_ClockSwitchCmd(DISABLE);
 306  00b3 4f            	clr	a
 307  00b4 cd0000        	call	_CLK_ClockSwitchCmd
 309                     ; 95 					for(i=0;i<2;i++)
 311  00b7 0f01          	clr	(OFST+0,sp)
 312  00b9               L521:
 313                     ; 97 						GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
 315  00b9 4b20          	push	#32
 316  00bb ae5014        	ldw	x,#20500
 317  00be cd0000        	call	_GPIO_WriteReverse
 319  00c1 84            	pop	a
 320                     ; 98 						Delay(0xFFFF);
 322  00c2 aeffff        	ldw	x,#65535
 323  00c5 cd0000        	call	_Delay
 325                     ; 95 					for(i=0;i<2;i++)
 327  00c8 0c01          	inc	(OFST+0,sp)
 330  00ca 7b01          	ld	a,(OFST+0,sp)
 331  00cc a102          	cp	a,#2
 332  00ce 25e9          	jrult	L521
 333  00d0 2080          	jra	L701
 357                     ; 113 static void GPIO_Config(void)
 357                     ; 114 {
 358                     	switch	.text
 359  00d2               L5_GPIO_Config:
 363                     ; 115   GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
 365  00d2 4be0          	push	#224
 366  00d4 4b20          	push	#32
 367  00d6 ae5014        	ldw	x,#20500
 368  00d9 cd0000        	call	_GPIO_Init
 370  00dc 85            	popw	x
 371                     ; 117 }
 374  00dd 81            	ret
 409                     ; 131 void assert_failed(uint8_t* file, uint32_t line)
 409                     ; 132 { 
 410                     	switch	.text
 411  00de               _assert_failed:
 415  00de               L161:
 416  00de 20fe          	jra	L161
 429                     	xdef	_main
 430                     	xdef	_Delay
 431                     	xdef	_assert_failed
 432                     	xref	_GPIO_WriteReverse
 433                     	xref	_GPIO_Init
 434                     	xref	_CLK_HSIPrescalerConfig
 435                     	xref	_CLK_ClockSwitchConfig
 436                     	xref	_CLK_ClockSwitchCmd
 437                     	xref	_CLK_LSICmd
 438                     	xref	_CLK_HSICmd
 457                     	end
