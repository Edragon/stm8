   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  43                     ; 31 void Delay(uint16_t nCount)
  43                     ; 32 {
  45                     	switch	.text
  46  0000               _Delay:
  48  0000 89            	pushw	x
  49       00000000      OFST:	set	0
  52  0001 2007          	jra	L13
  53  0003               L72:
  54                     ; 36     nCount--;
  56  0003 1e01          	ldw	x,(OFST+1,sp)
  57  0005 1d0001        	subw	x,#1
  58  0008 1f01          	ldw	(OFST+1,sp),x
  59  000a               L13:
  60                     ; 34   while (nCount != 0)
  62  000a 1e01          	ldw	x,(OFST+1,sp)
  63  000c 26f5          	jrne	L72
  64                     ; 38 }
  67  000e 85            	popw	x
  68  000f 81            	ret
  92                     ; 39 static void GPIO_Config(void)
  92                     ; 40 {
  93                     	switch	.text
  94  0010               L53_GPIO_Config:
  98                     ; 41   GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
 100  0010 4be0          	push	#224
 101  0012 4b20          	push	#32
 102  0014 ae5014        	ldw	x,#20500
 103  0017 cd0000        	call	_GPIO_Init
 105  001a 85            	popw	x
 106                     ; 43 }
 109  001b 81            	ret
 181                     ; 44 void main(void)
 181                     ; 45 {
 182                     	switch	.text
 183  001c               _main:
 185  001c 88            	push	a
 186       00000001      OFST:	set	1
 189                     ; 49     GPIO_Config();  
 191  001d adf1          	call	L53_GPIO_Config
 193                     ; 51     CLK_HSICmd(ENABLE);//开始内部高频RC
 195  001f a601          	ld	a,#1
 196  0021 cd0000        	call	_CLK_HSICmd
 198                     ; 52 		CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);//不分频
 200  0024 4f            	clr	a
 201  0025 cd0000        	call	_CLK_HSIPrescalerConfig
 203                     ; 54 		for(i=0;i<10;i++)
 205  0028 0f01          	clr	(OFST+0,sp)
 206  002a               L101:
 207                     ; 57        GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
 209  002a 4b20          	push	#32
 210  002c ae5014        	ldw	x,#20500
 211  002f cd0000        	call	_GPIO_WriteReverse
 213  0032 84            	pop	a
 214                     ; 58        Delay(0xFFFF);
 216  0033 aeffff        	ldw	x,#65535
 217  0036 adc8          	call	_Delay
 219                     ; 54 		for(i=0;i<10;i++)
 221  0038 0c01          	inc	(OFST+0,sp)
 224  003a 7b01          	ld	a,(OFST+0,sp)
 225  003c a10a          	cp	a,#10
 226  003e 25ea          	jrult	L101
 227                     ; 60 		CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV8);//8分频
 229  0040 a618          	ld	a,#24
 230  0042 cd0000        	call	_CLK_HSIPrescalerConfig
 232                     ; 62 		for(i=0;i<10;i++)
 234  0045 0f01          	clr	(OFST+0,sp)
 235  0047               L701:
 236                     ; 65        GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
 238  0047 4b20          	push	#32
 239  0049 ae5014        	ldw	x,#20500
 240  004c cd0000        	call	_GPIO_WriteReverse
 242  004f 84            	pop	a
 243                     ; 66        Delay(0xFFFF);
 245  0050 aeffff        	ldw	x,#65535
 246  0053 adab          	call	_Delay
 248                     ; 62 		for(i=0;i<10;i++)
 250  0055 0c01          	inc	(OFST+0,sp)
 253  0057 7b01          	ld	a,(OFST+0,sp)
 254  0059 a10a          	cp	a,#10
 255  005b 25ea          	jrult	L701
 256  005d               L511:
 257                     ; 72 			clk_return_status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 259  005d 4b00          	push	#0
 260  005f 4b00          	push	#0
 261  0061 ae00e1        	ldw	x,#225
 262  0064 a601          	ld	a,#1
 263  0066 95            	ld	xh,a
 264  0067 cd0000        	call	_CLK_ClockSwitchConfig
 266  006a 85            	popw	x
 267  006b 6b01          	ld	(OFST+0,sp),a
 268                     ; 73       if (clk_return_status == SUCCESS)  //SUCCESS or ERROR
 270  006d 7b01          	ld	a,(OFST+0,sp)
 271  006f a101          	cp	a,#1
 272  0071 262b          	jrne	L121
 273                     ; 75 			    CLK_ClockSwitchCmd(ENABLE);
 275  0073 a601          	ld	a,#1
 276  0075 cd0000        	call	_CLK_ClockSwitchCmd
 278                     ; 76 					CLK_HSICmd(ENABLE);//开始内部高频RC
 280  0078 a601          	ld	a,#1
 281  007a cd0000        	call	_CLK_HSICmd
 283                     ; 77 					CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);//不分频
 285  007d 4f            	clr	a
 286  007e cd0000        	call	_CLK_HSIPrescalerConfig
 288                     ; 78 					CLK_ClockSwitchCmd(DISABLE);
 290  0081 4f            	clr	a
 291  0082 cd0000        	call	_CLK_ClockSwitchCmd
 293                     ; 79 					for(i=0;i<10;i++)
 295  0085 0f01          	clr	(OFST+0,sp)
 296  0087               L321:
 297                     ; 82 						GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
 299  0087 4b20          	push	#32
 300  0089 ae5014        	ldw	x,#20500
 301  008c cd0000        	call	_GPIO_WriteReverse
 303  008f 84            	pop	a
 304                     ; 83 						Delay(0xFFFF);
 306  0090 aeffff        	ldw	x,#65535
 307  0093 cd0000        	call	_Delay
 309                     ; 79 					for(i=0;i<10;i++)
 311  0096 0c01          	inc	(OFST+0,sp)
 314  0098 7b01          	ld	a,(OFST+0,sp)
 315  009a a10a          	cp	a,#10
 316  009c 25e9          	jrult	L321
 317  009e               L121:
 318                     ; 89 			clk_return_status = CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_LSI, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 321  009e 4b00          	push	#0
 322  00a0 4b00          	push	#0
 323  00a2 ae00d2        	ldw	x,#210
 324  00a5 a601          	ld	a,#1
 325  00a7 95            	ld	xh,a
 326  00a8 cd0000        	call	_CLK_ClockSwitchConfig
 328  00ab 85            	popw	x
 329  00ac 6b01          	ld	(OFST+0,sp),a
 330                     ; 90 			if (clk_return_status == SUCCESS)  //SUCCESS or ERROR
 332  00ae 7b01          	ld	a,(OFST+0,sp)
 333  00b0 a101          	cp	a,#1
 334  00b2 26a9          	jrne	L511
 335                     ; 93 					CLK_ClockSwitchCmd(ENABLE);
 337  00b4 a601          	ld	a,#1
 338  00b6 cd0000        	call	_CLK_ClockSwitchCmd
 340                     ; 94 					CLK_LSICmd(ENABLE);
 342  00b9 a601          	ld	a,#1
 343  00bb cd0000        	call	_CLK_LSICmd
 345                     ; 95 					CLK_ClockSwitchCmd(DISABLE);
 347  00be 4f            	clr	a
 348  00bf cd0000        	call	_CLK_ClockSwitchCmd
 350                     ; 96 					for(i=0;i<2;i++)
 352  00c2 0f01          	clr	(OFST+0,sp)
 353  00c4               L331:
 354                     ; 98 						GPIO_WriteReverse(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS);
 356  00c4 4b20          	push	#32
 357  00c6 ae5014        	ldw	x,#20500
 358  00c9 cd0000        	call	_GPIO_WriteReverse
 360  00cc 84            	pop	a
 361                     ; 99 						Delay(0xFFFF);
 363  00cd aeffff        	ldw	x,#65535
 364  00d0 cd0000        	call	_Delay
 366                     ; 96 					for(i=0;i<2;i++)
 368  00d3 0c01          	inc	(OFST+0,sp)
 371  00d5 7b01          	ld	a,(OFST+0,sp)
 372  00d7 a102          	cp	a,#2
 373  00d9 25e9          	jrult	L331
 374  00db 2080          	jra	L511
 409                     ; 118 void assert_failed(u8* file, u32 line)
 409                     ; 119 { 
 410                     	switch	.text
 411  00dd               _assert_failed:
 415  00dd               L751:
 416  00dd 20fe          	jra	L751
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
