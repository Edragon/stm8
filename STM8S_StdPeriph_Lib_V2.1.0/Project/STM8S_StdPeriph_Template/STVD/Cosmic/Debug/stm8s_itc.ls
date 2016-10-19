   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 44 uint8_t ITC_GetCPUCC(void)
  33                     ; 45 {
  35                     .text:	section	.text,new
  36  0000               _ITC_GetCPUCC:
  40                     ; 47   _asm("push cc");
  43  0000 8a            	push	cc
  45                     ; 48   _asm("pop a");
  48  0001 84            	pop	a
  50                     ; 49   return; /* Ignore compiler warning, the returned value is in A register */
  53  0002 81            	ret	
  76                     ; 74 void ITC_DeInit(void)
  76                     ; 75 {
  77                     .text:	section	.text,new
  78  0000               _ITC_DeInit:
  82                     ; 76     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  84  0000 35ff7f70      	mov	32624,#255
  85                     ; 77     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  87  0004 35ff7f71      	mov	32625,#255
  88                     ; 78     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  90  0008 35ff7f72      	mov	32626,#255
  91                     ; 79     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  93  000c 35ff7f73      	mov	32627,#255
  94                     ; 80     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  96  0010 35ff7f74      	mov	32628,#255
  97                     ; 81     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  99  0014 35ff7f75      	mov	32629,#255
 100                     ; 82     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 102  0018 35ff7f76      	mov	32630,#255
 103                     ; 83     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 105  001c 35ff7f77      	mov	32631,#255
 106                     ; 84 }
 109  0020 81            	ret	
 134                     ; 91 uint8_t ITC_GetSoftIntStatus(void)
 134                     ; 92 {
 135                     .text:	section	.text,new
 136  0000               _ITC_GetSoftIntStatus:
 140                     ; 93     return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 142  0000 cd0000        	call	_ITC_GetCPUCC
 144  0003 a428          	and	a,#40
 147  0005 81            	ret	
 407                     .const:	section	.text
 408  0000               L23:
 409  0000 0037          	dc.w	L14
 410  0002 0037          	dc.w	L14
 411  0004 0037          	dc.w	L14
 412  0006 0037          	dc.w	L14
 413  0008 003c          	dc.w	L34
 414  000a 003c          	dc.w	L34
 415  000c 003c          	dc.w	L34
 416  000e 003c          	dc.w	L34
 417  0010 005c          	dc.w	L502
 418  0012 005c          	dc.w	L502
 419  0014 0041          	dc.w	L54
 420  0016 0041          	dc.w	L54
 421  0018 0046          	dc.w	L74
 422  001a 0046          	dc.w	L74
 423  001c 0046          	dc.w	L74
 424  001e 0046          	dc.w	L74
 425  0020 004b          	dc.w	L15
 426  0022 004b          	dc.w	L15
 427  0024 004b          	dc.w	L15
 428  0026 004b          	dc.w	L15
 429  0028 0050          	dc.w	L35
 430  002a 0050          	dc.w	L35
 431  002c 0050          	dc.w	L35
 432  002e 0050          	dc.w	L35
 433  0030 0055          	dc.w	L55
 434                     ; 101 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 434                     ; 102 {
 435                     .text:	section	.text,new
 436  0000               _ITC_GetSoftwarePriority:
 438  0000 88            	push	a
 439  0001 89            	pushw	x
 440       00000002      OFST:	set	2
 443                     ; 104     uint8_t Value = 0;
 445  0002 0f02          	clr	(OFST+0,sp)
 446                     ; 105     uint8_t Mask = 0;
 448                     ; 108     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 450  0004 7b03          	ld	a,(OFST+1,sp)
 451  0006 a119          	cp	a,#25
 452  0008 2510          	jrult	L02
 453  000a ae006c        	ldw	x,#108
 454  000d 89            	pushw	x
 455  000e 5f            	clrw	x
 456  000f 89            	pushw	x
 457  0010 ae0064        	ldw	x,#L102
 458  0013 cd0000        	call	_assert_failed
 460  0016 5b04          	addw	sp,#4
 461  0018 7b03          	ld	a,(OFST+1,sp)
 462  001a               L02:
 463                     ; 111     Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 465  001a a403          	and	a,#3
 466  001c 48            	sll	a
 467  001d 5f            	clrw	x
 468  001e 97            	ld	xl,a
 469  001f a603          	ld	a,#3
 470  0021 5d            	tnzw	x
 471  0022 2704          	jreq	L42
 472  0024               L62:
 473  0024 48            	sll	a
 474  0025 5a            	decw	x
 475  0026 26fc          	jrne	L62
 476  0028               L42:
 477  0028 6b01          	ld	(OFST-1,sp),a
 478                     ; 113     switch (IrqNum)
 480  002a 7b03          	ld	a,(OFST+1,sp)
 482                     ; 185     default:
 482                     ; 186         break;
 483  002c a119          	cp	a,#25
 484  002e 242c          	jruge	L502
 485  0030 5f            	clrw	x
 486  0031 97            	ld	xl,a
 487  0032 58            	sllw	x
 488  0033 de0000        	ldw	x,(L23,x)
 489  0036 fc            	jp	(x)
 490  0037               L14:
 491                     ; 115     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 491                     ; 116     case ITC_IRQ_AWU:
 491                     ; 117     case ITC_IRQ_CLK:
 491                     ; 118     case ITC_IRQ_PORTA:
 491                     ; 119         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 493  0037 c67f70        	ld	a,32624
 494                     ; 120         break;
 496  003a 201c          	jp	LC001
 497  003c               L34:
 498                     ; 121     case ITC_IRQ_PORTB:
 498                     ; 122     case ITC_IRQ_PORTC:
 498                     ; 123     case ITC_IRQ_PORTD:
 498                     ; 124     case ITC_IRQ_PORTE:
 498                     ; 125         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 500  003c c67f71        	ld	a,32625
 501                     ; 126         break;
 503  003f 2017          	jp	LC001
 504  0041               L54:
 505                     ; 136     case ITC_IRQ_SPI:
 505                     ; 137     case ITC_IRQ_TIM1_OVF:
 505                     ; 138         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 507  0041 c67f72        	ld	a,32626
 508                     ; 139         break;
 510  0044 2012          	jp	LC001
 511  0046               L74:
 512                     ; 140     case ITC_IRQ_TIM1_CAPCOM:
 512                     ; 141 #ifdef STM8S903
 512                     ; 142     case ITC_IRQ_TIM5_OVFTRI:
 512                     ; 143     case ITC_IRQ_TIM5_CAPCOM:
 512                     ; 144 #else
 512                     ; 145     case ITC_IRQ_TIM2_OVF:
 512                     ; 146     case ITC_IRQ_TIM2_CAPCOM:
 512                     ; 147 #endif /*STM8S903*/
 512                     ; 148 
 512                     ; 149     case ITC_IRQ_TIM3_OVF:
 512                     ; 150         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 514  0046 c67f73        	ld	a,32627
 515                     ; 151         break;
 517  0049 200d          	jp	LC001
 518  004b               L15:
 519                     ; 152     case ITC_IRQ_TIM3_CAPCOM:
 519                     ; 153     case ITC_IRQ_UART1_TX:
 519                     ; 154     case ITC_IRQ_UART1_RX:
 519                     ; 155     case ITC_IRQ_I2C:
 519                     ; 156         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 521  004b c67f74        	ld	a,32628
 522                     ; 157         break;
 524  004e 2008          	jp	LC001
 525  0050               L35:
 526                     ; 159     case ITC_IRQ_UART2_TX:
 526                     ; 160     case ITC_IRQ_UART2_RX:
 526                     ; 161 #endif /*STM8S105 or STM8AF626x*/
 526                     ; 162 
 526                     ; 163 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 526                     ; 164     defined(STM8AF62Ax)
 526                     ; 165     case ITC_IRQ_UART3_TX:
 526                     ; 166     case ITC_IRQ_UART3_RX:
 526                     ; 167     case ITC_IRQ_ADC2:
 526                     ; 168 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 526                     ; 169 
 526                     ; 170 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 526                     ; 171     defined(STM8S903) || defined(STM8AF626x)
 526                     ; 172     case ITC_IRQ_ADC1:
 526                     ; 173 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 526                     ; 174 
 526                     ; 175 #ifdef STM8S903
 526                     ; 176     case ITC_IRQ_TIM6_OVFTRI:
 526                     ; 177 #else
 526                     ; 178     case ITC_IRQ_TIM4_OVF:
 526                     ; 179 #endif /*STM8S903*/
 526                     ; 180         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 528  0050 c67f75        	ld	a,32629
 529                     ; 181         break;
 531  0053 2003          	jp	LC001
 532  0055               L55:
 533                     ; 182     case ITC_IRQ_EEPROM_EEC:
 533                     ; 183         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 535  0055 c67f76        	ld	a,32630
 536  0058               LC001:
 537  0058 1401          	and	a,(OFST-1,sp)
 538  005a 6b02          	ld	(OFST+0,sp),a
 539                     ; 184         break;
 541                     ; 185     default:
 541                     ; 186         break;
 543  005c               L502:
 544                     ; 189     Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 546  005c 7b03          	ld	a,(OFST+1,sp)
 547  005e a403          	and	a,#3
 548  0060 48            	sll	a
 549  0061 5f            	clrw	x
 550  0062 97            	ld	xl,a
 551  0063 7b02          	ld	a,(OFST+0,sp)
 552  0065 5d            	tnzw	x
 553  0066 2704          	jreq	L43
 554  0068               L63:
 555  0068 44            	srl	a
 556  0069 5a            	decw	x
 557  006a 26fc          	jrne	L63
 558  006c               L43:
 559                     ; 191     return((ITC_PriorityLevel_TypeDef)Value);
 563  006c 5b03          	addw	sp,#3
 564  006e 81            	ret	
 626                     	switch	.const
 627  0032               L201:
 628  0032 0067          	dc.w	L702
 629  0034 0067          	dc.w	L702
 630  0036 0067          	dc.w	L702
 631  0038 0067          	dc.w	L702
 632  003a 0079          	dc.w	L112
 633  003c 0079          	dc.w	L112
 634  003e 0079          	dc.w	L112
 635  0040 0079          	dc.w	L112
 636  0042 00e3          	dc.w	L752
 637  0044 00e3          	dc.w	L752
 638  0046 008b          	dc.w	L312
 639  0048 008b          	dc.w	L312
 640  004a 009d          	dc.w	L512
 641  004c 009d          	dc.w	L512
 642  004e 009d          	dc.w	L512
 643  0050 009d          	dc.w	L512
 644  0052 00af          	dc.w	L712
 645  0054 00af          	dc.w	L712
 646  0056 00af          	dc.w	L712
 647  0058 00af          	dc.w	L712
 648  005a 00c1          	dc.w	L122
 649  005c 00c1          	dc.w	L122
 650  005e 00c1          	dc.w	L122
 651  0060 00c1          	dc.w	L122
 652  0062 00d3          	dc.w	L322
 653                     ; 208 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 653                     ; 209 {
 654                     .text:	section	.text,new
 655  0000               _ITC_SetSoftwarePriority:
 657  0000 89            	pushw	x
 658  0001 89            	pushw	x
 659       00000002      OFST:	set	2
 662                     ; 211     uint8_t Mask = 0;
 664                     ; 212     uint8_t NewPriority = 0;
 666                     ; 215     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 668  0002 7b03          	ld	a,(OFST+1,sp)
 669  0004 a119          	cp	a,#25
 670  0006 2506          	jrult	L44
 671  0008 ae00d7        	ldw	x,#215
 672  000b cd00e6        	call	LC002
 673  000e               L44:
 674                     ; 216     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 676  000e 7b04          	ld	a,(OFST+2,sp)
 677  0010 a102          	cp	a,#2
 678  0012 2711          	jreq	L45
 679  0014 4a            	dec	a
 680  0015 270e          	jreq	L45
 681  0017 7b04          	ld	a,(OFST+2,sp)
 682  0019 270a          	jreq	L45
 683  001b a103          	cp	a,#3
 684  001d 2706          	jreq	L45
 685  001f ae00d8        	ldw	x,#216
 686  0022 cd00e6        	call	LC002
 687  0025               L45:
 688                     ; 219     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 690  0025 cd0000        	call	_ITC_GetSoftIntStatus
 692  0028 a128          	cp	a,#40
 693  002a 2706          	jreq	L46
 694  002c ae00db        	ldw	x,#219
 695  002f cd00e6        	call	LC002
 696  0032               L46:
 697                     ; 223     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 699  0032 7b03          	ld	a,(OFST+1,sp)
 700  0034 a403          	and	a,#3
 701  0036 48            	sll	a
 702  0037 5f            	clrw	x
 703  0038 97            	ld	xl,a
 704  0039 a603          	ld	a,#3
 705  003b 5d            	tnzw	x
 706  003c 2704          	jreq	L07
 707  003e               L27:
 708  003e 48            	sll	a
 709  003f 5a            	decw	x
 710  0040 26fc          	jrne	L27
 711  0042               L07:
 712  0042 43            	cpl	a
 713  0043 6b01          	ld	(OFST-1,sp),a
 714                     ; 226     NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 716  0045 7b03          	ld	a,(OFST+1,sp)
 717  0047 a403          	and	a,#3
 718  0049 48            	sll	a
 719  004a 5f            	clrw	x
 720  004b 97            	ld	xl,a
 721  004c 7b04          	ld	a,(OFST+2,sp)
 722  004e 5d            	tnzw	x
 723  004f 2704          	jreq	L47
 724  0051               L67:
 725  0051 48            	sll	a
 726  0052 5a            	decw	x
 727  0053 26fc          	jrne	L67
 728  0055               L47:
 729  0055 6b02          	ld	(OFST+0,sp),a
 730                     ; 228     switch (IrqNum)
 732  0057 7b03          	ld	a,(OFST+1,sp)
 734                     ; 314     default:
 734                     ; 315         break;
 735  0059 a119          	cp	a,#25
 736  005b 2503cc00e3    	jruge	L752
 737  0060 5f            	clrw	x
 738  0061 97            	ld	xl,a
 739  0062 58            	sllw	x
 740  0063 de0032        	ldw	x,(L201,x)
 741  0066 fc            	jp	(x)
 742  0067               L702:
 743                     ; 231     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 743                     ; 232     case ITC_IRQ_AWU:
 743                     ; 233     case ITC_IRQ_CLK:
 743                     ; 234     case ITC_IRQ_PORTA:
 743                     ; 235         ITC->ISPR1 &= Mask;
 745  0067 c67f70        	ld	a,32624
 746  006a 1401          	and	a,(OFST-1,sp)
 747  006c c77f70        	ld	32624,a
 748                     ; 236         ITC->ISPR1 |= NewPriority;
 750  006f c67f70        	ld	a,32624
 751  0072 1a02          	or	a,(OFST+0,sp)
 752  0074 c77f70        	ld	32624,a
 753                     ; 237         break;
 755  0077 206a          	jra	L752
 756  0079               L112:
 757                     ; 239     case ITC_IRQ_PORTB:
 757                     ; 240     case ITC_IRQ_PORTC:
 757                     ; 241     case ITC_IRQ_PORTD:
 757                     ; 242     case ITC_IRQ_PORTE:
 757                     ; 243         ITC->ISPR2 &= Mask;
 759  0079 c67f71        	ld	a,32625
 760  007c 1401          	and	a,(OFST-1,sp)
 761  007e c77f71        	ld	32625,a
 762                     ; 244         ITC->ISPR2 |= NewPriority;
 764  0081 c67f71        	ld	a,32625
 765  0084 1a02          	or	a,(OFST+0,sp)
 766  0086 c77f71        	ld	32625,a
 767                     ; 245         break;
 769  0089 2058          	jra	L752
 770  008b               L312:
 771                     ; 255     case ITC_IRQ_SPI:
 771                     ; 256     case ITC_IRQ_TIM1_OVF:
 771                     ; 257         ITC->ISPR3 &= Mask;
 773  008b c67f72        	ld	a,32626
 774  008e 1401          	and	a,(OFST-1,sp)
 775  0090 c77f72        	ld	32626,a
 776                     ; 258         ITC->ISPR3 |= NewPriority;
 778  0093 c67f72        	ld	a,32626
 779  0096 1a02          	or	a,(OFST+0,sp)
 780  0098 c77f72        	ld	32626,a
 781                     ; 259         break;
 783  009b 2046          	jra	L752
 784  009d               L512:
 785                     ; 261     case ITC_IRQ_TIM1_CAPCOM:
 785                     ; 262 #ifdef STM8S903
 785                     ; 263     case ITC_IRQ_TIM5_OVFTRI:
 785                     ; 264     case ITC_IRQ_TIM5_CAPCOM:
 785                     ; 265 #else
 785                     ; 266     case ITC_IRQ_TIM2_OVF:
 785                     ; 267     case ITC_IRQ_TIM2_CAPCOM:
 785                     ; 268 #endif /*STM8S903*/
 785                     ; 269 
 785                     ; 270     case ITC_IRQ_TIM3_OVF:
 785                     ; 271         ITC->ISPR4 &= Mask;
 787  009d c67f73        	ld	a,32627
 788  00a0 1401          	and	a,(OFST-1,sp)
 789  00a2 c77f73        	ld	32627,a
 790                     ; 272         ITC->ISPR4 |= NewPriority;
 792  00a5 c67f73        	ld	a,32627
 793  00a8 1a02          	or	a,(OFST+0,sp)
 794  00aa c77f73        	ld	32627,a
 795                     ; 273         break;
 797  00ad 2034          	jra	L752
 798  00af               L712:
 799                     ; 275     case ITC_IRQ_TIM3_CAPCOM:
 799                     ; 276     case ITC_IRQ_UART1_TX:
 799                     ; 277     case ITC_IRQ_UART1_RX:
 799                     ; 278     case ITC_IRQ_I2C:
 799                     ; 279         ITC->ISPR5 &= Mask;
 801  00af c67f74        	ld	a,32628
 802  00b2 1401          	and	a,(OFST-1,sp)
 803  00b4 c77f74        	ld	32628,a
 804                     ; 280         ITC->ISPR5 |= NewPriority;
 806  00b7 c67f74        	ld	a,32628
 807  00ba 1a02          	or	a,(OFST+0,sp)
 808  00bc c77f74        	ld	32628,a
 809                     ; 281         break;
 811  00bf 2022          	jra	L752
 812  00c1               L122:
 813                     ; 284     case ITC_IRQ_UART2_TX:
 813                     ; 285     case ITC_IRQ_UART2_RX:
 813                     ; 286 #endif /*STM8S105 or STM8AF626x */
 813                     ; 287 
 813                     ; 288 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 813                     ; 289     defined(STM8AF62Ax)
 813                     ; 290     case ITC_IRQ_UART3_TX:
 813                     ; 291     case ITC_IRQ_UART3_RX:
 813                     ; 292     case ITC_IRQ_ADC2:
 813                     ; 293 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 813                     ; 294 
 813                     ; 295 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 813                     ; 296     defined(STM8S903) || defined(STM8AF626x)
 813                     ; 297     case ITC_IRQ_ADC1:
 813                     ; 298 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 813                     ; 299 
 813                     ; 300 #ifdef STM8S903
 813                     ; 301     case ITC_IRQ_TIM6_OVFTRI:
 813                     ; 302 #else
 813                     ; 303     case ITC_IRQ_TIM4_OVF:
 813                     ; 304 #endif /*STM8S903*/
 813                     ; 305         ITC->ISPR6 &= Mask;
 815  00c1 c67f75        	ld	a,32629
 816  00c4 1401          	and	a,(OFST-1,sp)
 817  00c6 c77f75        	ld	32629,a
 818                     ; 306         ITC->ISPR6 |= NewPriority;
 820  00c9 c67f75        	ld	a,32629
 821  00cc 1a02          	or	a,(OFST+0,sp)
 822  00ce c77f75        	ld	32629,a
 823                     ; 307         break;
 825  00d1 2010          	jra	L752
 826  00d3               L322:
 827                     ; 309     case ITC_IRQ_EEPROM_EEC:
 827                     ; 310         ITC->ISPR7 &= Mask;
 829  00d3 c67f76        	ld	a,32630
 830  00d6 1401          	and	a,(OFST-1,sp)
 831  00d8 c77f76        	ld	32630,a
 832                     ; 311         ITC->ISPR7 |= NewPriority;
 834  00db c67f76        	ld	a,32630
 835  00de 1a02          	or	a,(OFST+0,sp)
 836  00e0 c77f76        	ld	32630,a
 837                     ; 312         break;
 839                     ; 314     default:
 839                     ; 315         break;
 841  00e3               L752:
 842                     ; 319 }
 845  00e3 5b04          	addw	sp,#4
 846  00e5 81            	ret	
 848  00e6               LC002:
 849  00e6 89            	pushw	x
 850  00e7 5f            	clrw	x
 851  00e8 89            	pushw	x
 852  00e9 ae0064        	ldw	x,#L102
 853  00ec cd0000        	call	_assert_failed
 855  00ef 5b04          	addw	sp,#4
 856  00f1 81            	ret	
 868                     	xdef	_ITC_GetSoftwarePriority
 869                     	xdef	_ITC_SetSoftwarePriority
 870                     	xdef	_ITC_GetSoftIntStatus
 871                     	xdef	_ITC_DeInit
 872                     	xdef	_ITC_GetCPUCC
 873                     	xref	_assert_failed
 874                     	switch	.const
 875  0064               L102:
 876  0064 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 877  0076 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 878  0088 685f64726976  	dc.b	"h_driver\src\stm8s"
 879  009a 5f6974632e63  	dc.b	"_itc.c",0
 899                     	end
