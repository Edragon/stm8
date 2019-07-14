   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 55 void WFE_DeInit(void)
  43                     ; 56 {
  45                     	switch	.text
  46  0000               _WFE_DeInit:
  50                     ; 57   WFE->CR1 = WFE_CR1_RESET_VALUE;
  52  0000 725f50a6      	clr	20646
  53                     ; 58   WFE->CR2 = WFE_CR2_RESET_VALUE;
  55  0004 725f50a7      	clr	20647
  56                     ; 59 }
  59  0008 81            	ret
 236                     ; 80 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 236                     ; 81 {
 237                     	switch	.text
 238  0009               _WFE_WakeUpSourceEventCmd:
 240  0009 89            	pushw	x
 241  000a 88            	push	a
 242       00000001      OFST:	set	1
 245                     ; 82   uint8_t register_index = 0;
 247                     ; 84   assert_param(IS_WFE_SOURCE_OK(WFE_Source));
 249                     ; 85   assert_param(IS_FUNCTIONAL_STATE(NewState));
 251                     ; 88   register_index = (uint8_t)((uint16_t)WFE_Source >> (uint8_t)0x08);
 253  000b 9e            	ld	a,xh
 254  000c 6b01          	ld	(OFST+0,sp),a
 255                     ; 90   if (NewState != DISABLE)
 257  000e 0d06          	tnz	(OFST+5,sp)
 258  0010 2722          	jreq	L721
 259                     ; 92     switch (register_index)
 261  0012 7b01          	ld	a,(OFST+0,sp)
 263                     ; 102       default:
 263                     ; 103         break;
 264  0014 4a            	dec	a
 265  0015 2705          	jreq	L12
 266  0017 4a            	dec	a
 267  0018 270c          	jreq	L32
 268  001a 202b          	jra	L531
 269  001c               L12:
 270                     ; 94       case 1:
 270                     ; 95         WFE->CR1 |= (uint8_t)WFE_Source;
 272  001c c650a6        	ld	a,20646
 273  001f 1a03          	or	a,(OFST+2,sp)
 274  0021 c750a6        	ld	20646,a
 275                     ; 96         break;
 277  0024 2021          	jra	L531
 278  0026               L32:
 279                     ; 98       case 2:
 279                     ; 99         WFE->CR2 |= (uint8_t)WFE_Source;
 281  0026 c650a7        	ld	a,20647
 282  0029 1a03          	or	a,(OFST+2,sp)
 283  002b c750a7        	ld	20647,a
 284                     ; 100         break;
 286  002e 2017          	jra	L531
 287  0030               L52:
 288                     ; 102       default:
 288                     ; 103         break;
 290  0030 2015          	jra	L531
 291  0032               L331:
 293  0032 2013          	jra	L531
 294  0034               L721:
 295                     ; 108     switch (register_index)
 297  0034 7b01          	ld	a,(OFST+0,sp)
 299                     ; 118       default:
 299                     ; 119         break;
 300  0036 4a            	dec	a
 301  0037 2705          	jreq	L72
 302  0039 4a            	dec	a
 303  003a 270e          	jreq	L13
 304  003c 2009          	jra	L531
 305  003e               L72:
 306                     ; 110       case 1:
 306                     ; 111         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 308  003e 7b03          	ld	a,(OFST+2,sp)
 309  0040 43            	cpl	a
 310  0041 c450a6        	and	a,20646
 311  0044 c750a6        	ld	20646,a
 312                     ; 112         break;
 313  0047               L531:
 314                     ; 122 }
 317  0047 5b03          	addw	sp,#3
 318  0049 81            	ret
 319  004a               L13:
 320                     ; 114       case 2:
 320                     ; 115         WFE->CR2 &= (uint8_t)(~(uint8_t)WFE_Source);
 322  004a 7b03          	ld	a,(OFST+2,sp)
 323  004c 43            	cpl	a
 324  004d c450a7        	and	a,20647
 325  0050 c750a7        	ld	20647,a
 326                     ; 116         break;
 328  0053 20f2          	jra	L531
 329  0055               L33:
 330                     ; 118       default:
 330                     ; 119         break;
 332  0055 20f0          	jra	L531
 333  0057               L141:
 334  0057 20ee          	jra	L531
 381                     ; 142 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 381                     ; 143 {
 382                     	switch	.text
 383  0059               _WFE_GetWakeUpSourceEventStatus:
 385  0059 89            	pushw	x
 386  005a 88            	push	a
 387       00000001      OFST:	set	1
 390                     ; 144   FunctionalState status = DISABLE;
 392  005b 0f01          	clr	(OFST+0,sp)
 393                     ; 146   assert_param(IS_WFE_SOURCE_OK(WFE_Source));
 395                     ; 148   switch (WFE_Source)
 398                     ; 187     default:
 398                     ; 188       break;
 399  005d 1d0101        	subw	x,#257
 400  0060 2735          	jreq	L341
 401  0062 5a            	decw	x
 402  0063 2732          	jreq	L341
 403  0065 1d000e        	subw	x,#14
 404  0068 272d          	jreq	L341
 405  006a 1d0010        	subw	x,#16
 406  006d 2728          	jreq	L341
 407  006f 1d0020        	subw	x,#32
 408  0072 2723          	jreq	L341
 409  0074 1d0040        	subw	x,#64
 410  0077 271e          	jreq	L341
 411  0079 1d0081        	subw	x,#129
 412  007c 272a          	jreq	L541
 413  007e 5a            	decw	x
 414  007f 2727          	jreq	L541
 415  0081 1d0002        	subw	x,#2
 416  0084 2722          	jreq	L541
 417  0086 1d0004        	subw	x,#4
 418  0089 271d          	jreq	L541
 419  008b 1d0008        	subw	x,#8
 420  008e 2718          	jreq	L541
 421  0090 1d0010        	subw	x,#16
 422  0093 2713          	jreq	L541
 423  0095 2020          	jra	L571
 424  0097               L341:
 425                     ; 150     case WFE_Source_TIM2_EV0:
 425                     ; 151     case WFE_Source_TIM2_EV1:
 425                     ; 152     case WFE_Source_EXTI_EV0:
 425                     ; 153     case WFE_Source_EXTI_EV1:
 425                     ; 154     case WFE_Source_EXTI_EV2:
 425                     ; 155     case WFE_Source_EXTI_EV3:
 425                     ; 156 
 425                     ; 157       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 427  0097 c650a6        	ld	a,20646
 428  009a 1503          	bcp	a,(OFST+2,sp)
 429  009c 2706          	jreq	L771
 430                     ; 160         status = ENABLE;
 432  009e a601          	ld	a,#1
 433  00a0 6b01          	ld	(OFST+0,sp),a
 435  00a2 2013          	jra	L571
 436  00a4               L771:
 437                     ; 165         status = DISABLE;
 439  00a4 0f01          	clr	(OFST+0,sp)
 440  00a6 200f          	jra	L571
 441  00a8               L541:
 442                     ; 169     case WFE_Source_EXTI_EV4:
 442                     ; 170     case WFE_Source_EXTI_EV5:
 442                     ; 171     case WFE_Source_EXTI_EV6:
 442                     ; 172     case WFE_Source_EXTI_EV7:
 442                     ; 173     case WFE_Source_EXTI_EVB:
 442                     ; 174     case WFE_Source_EXTI_EVD:
 442                     ; 175 
 442                     ; 176       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 444  00a8 c650a7        	ld	a,20647
 445  00ab 1503          	bcp	a,(OFST+2,sp)
 446  00ad 2706          	jreq	L302
 447                     ; 179         status = ENABLE;
 449  00af a601          	ld	a,#1
 450  00b1 6b01          	ld	(OFST+0,sp),a
 452  00b3 2002          	jra	L571
 453  00b5               L302:
 454                     ; 184         status = DISABLE;
 456  00b5 0f01          	clr	(OFST+0,sp)
 457  00b7               L741:
 458                     ; 187     default:
 458                     ; 188       break;
 460  00b7               L571:
 461                     ; 190   return status;
 463  00b7 7b01          	ld	a,(OFST+0,sp)
 466  00b9 5b03          	addw	sp,#3
 467  00bb 81            	ret
 480                     	xdef	_WFE_GetWakeUpSourceEventStatus
 481                     	xdef	_WFE_WakeUpSourceEventCmd
 482                     	xdef	_WFE_DeInit
 501                     	end
