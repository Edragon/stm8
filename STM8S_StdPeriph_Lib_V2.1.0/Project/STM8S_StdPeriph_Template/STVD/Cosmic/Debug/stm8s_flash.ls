   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  66                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  66                     ; 82 {
  68                     .text:	section	.text,new
  69  0000               _FLASH_Unlock:
  71  0000 88            	push	a
  72       00000000      OFST:	set	0
  75                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  77  0001 a1fd          	cp	a,#253
  78  0003 2712          	jreq	L21
  79  0005 a1f7          	cp	a,#247
  80  0007 270e          	jreq	L21
  81  0009 ae0054        	ldw	x,#84
  82  000c 89            	pushw	x
  83  000d 5f            	clrw	x
  84  000e 89            	pushw	x
  85  000f ae0010        	ldw	x,#L73
  86  0012 cd0000        	call	_assert_failed
  88  0015 5b04          	addw	sp,#4
  89  0017               L21:
  90                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
  92  0017 7b01          	ld	a,(OFST+1,sp)
  93  0019 a1fd          	cp	a,#253
  94  001b 260a          	jrne	L14
  95                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
  97  001d 35565062      	mov	20578,#86
  98                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
 100  0021 35ae5062      	mov	20578,#174
 102  0025 2008          	jra	L34
 103  0027               L14:
 104                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 106  0027 35ae5064      	mov	20580,#174
 107                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 109  002b 35565064      	mov	20580,#86
 110  002f               L34:
 111                     ; 98 }
 114  002f 84            	pop	a
 115  0030 81            	ret	
 151                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 151                     ; 107 {
 152                     .text:	section	.text,new
 153  0000               _FLASH_Lock:
 155  0000 88            	push	a
 156       00000000      OFST:	set	0
 159                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 161  0001 a1fd          	cp	a,#253
 162  0003 2712          	jreq	L42
 163  0005 a1f7          	cp	a,#247
 164  0007 270e          	jreq	L42
 165  0009 ae006d        	ldw	x,#109
 166  000c 89            	pushw	x
 167  000d 5f            	clrw	x
 168  000e 89            	pushw	x
 169  000f ae0010        	ldw	x,#L73
 170  0012 cd0000        	call	_assert_failed
 172  0015 5b04          	addw	sp,#4
 173  0017               L42:
 174                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 176  0017 c6505f        	ld	a,20575
 177  001a 1401          	and	a,(OFST+1,sp)
 178  001c c7505f        	ld	20575,a
 179                     ; 113 }
 182  001f 84            	pop	a
 183  0020 81            	ret	
 206                     ; 120 void FLASH_DeInit(void)
 206                     ; 121 {
 207                     .text:	section	.text,new
 208  0000               _FLASH_DeInit:
 212                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 214  0000 725f505a      	clr	20570
 215                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 217  0004 725f505b      	clr	20571
 218                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 220  0008 35ff505c      	mov	20572,#255
 221                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 223  000c 7217505f      	bres	20575,#3
 224                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 226  0010 7213505f      	bres	20575,#1
 227                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 229  0014 c6505f        	ld	a,20575
 230                     ; 128 }
 233  0017 81            	ret	
 289                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 289                     ; 137 {
 290                     .text:	section	.text,new
 291  0000               _FLASH_ITConfig:
 293  0000 88            	push	a
 294       00000000      OFST:	set	0
 297                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 299  0001 4d            	tnz	a
 300  0002 2711          	jreq	L04
 301  0004 4a            	dec	a
 302  0005 270e          	jreq	L04
 303  0007 ae008b        	ldw	x,#139
 304  000a 89            	pushw	x
 305  000b 5f            	clrw	x
 306  000c 89            	pushw	x
 307  000d ae0010        	ldw	x,#L73
 308  0010 cd0000        	call	_assert_failed
 310  0013 5b04          	addw	sp,#4
 311  0015               L04:
 312                     ; 141     if (NewState != DISABLE)
 314  0015 7b01          	ld	a,(OFST+1,sp)
 315  0017 2706          	jreq	L121
 316                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 318  0019 7212505a      	bset	20570,#1
 320  001d 2004          	jra	L321
 321  001f               L121:
 322                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 324  001f 7213505a      	bres	20570,#1
 325  0023               L321:
 326                     ; 149 }
 329  0023 84            	pop	a
 330  0024 81            	ret	
 363                     .const:	section	.text
 364  0000               L45:
 365  0000 00008000      	dc.l	32768
 366  0004               L65:
 367  0004 00010000      	dc.l	65536
 368  0008               L06:
 369  0008 00004000      	dc.l	16384
 370  000c               L26:
 371  000c 00004400      	dc.l	17408
 372                     ; 158 void FLASH_EraseByte(uint32_t Address)
 372                     ; 159 {
 373                     .text:	section	.text,new
 374  0000               _FLASH_EraseByte:
 376       00000000      OFST:	set	0
 379                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 381  0000 96            	ldw	x,sp
 382  0001 1c0003        	addw	x,#OFST+3
 383  0004 cd0000        	call	c_ltor
 385  0007 ae0000        	ldw	x,#L45
 386  000a cd0000        	call	c_lcmp
 388  000d 250f          	jrult	L25
 389  000f 96            	ldw	x,sp
 390  0010 1c0003        	addw	x,#OFST+3
 391  0013 cd0000        	call	c_ltor
 393  0016 ae0004        	ldw	x,#L65
 394  0019 cd0000        	call	c_lcmp
 396  001c 252c          	jrult	L46
 397  001e               L25:
 398  001e 96            	ldw	x,sp
 399  001f 1c0003        	addw	x,#OFST+3
 400  0022 cd0000        	call	c_ltor
 402  0025 ae0008        	ldw	x,#L06
 403  0028 cd0000        	call	c_lcmp
 405  002b 250f          	jrult	L64
 406  002d 96            	ldw	x,sp
 407  002e 1c0003        	addw	x,#OFST+3
 408  0031 cd0000        	call	c_ltor
 410  0034 ae000c        	ldw	x,#L26
 411  0037 cd0000        	call	c_lcmp
 413  003a 250e          	jrult	L46
 414  003c               L64:
 415  003c ae00a1        	ldw	x,#161
 416  003f 89            	pushw	x
 417  0040 5f            	clrw	x
 418  0041 89            	pushw	x
 419  0042 ae0010        	ldw	x,#L73
 420  0045 cd0000        	call	_assert_failed
 422  0048 5b04          	addw	sp,#4
 423  004a               L46:
 424                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 426  004a 1e05          	ldw	x,(OFST+5,sp)
 427  004c 7f            	clr	(x)
 428                     ; 166 }
 431  004d 81            	ret	
 471                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 471                     ; 177 {
 472                     .text:	section	.text,new
 473  0000               _FLASH_ProgramByte:
 475       00000000      OFST:	set	0
 478                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 480  0000 96            	ldw	x,sp
 481  0001 1c0003        	addw	x,#OFST+3
 482  0004 cd0000        	call	c_ltor
 484  0007 ae0000        	ldw	x,#L45
 485  000a cd0000        	call	c_lcmp
 487  000d 250f          	jrult	L67
 488  000f 96            	ldw	x,sp
 489  0010 1c0003        	addw	x,#OFST+3
 490  0013 cd0000        	call	c_ltor
 492  0016 ae0004        	ldw	x,#L65
 493  0019 cd0000        	call	c_lcmp
 495  001c 252c          	jrult	L001
 496  001e               L67:
 497  001e 96            	ldw	x,sp
 498  001f 1c0003        	addw	x,#OFST+3
 499  0022 cd0000        	call	c_ltor
 501  0025 ae0008        	ldw	x,#L06
 502  0028 cd0000        	call	c_lcmp
 504  002b 250f          	jrult	L27
 505  002d 96            	ldw	x,sp
 506  002e 1c0003        	addw	x,#OFST+3
 507  0031 cd0000        	call	c_ltor
 509  0034 ae000c        	ldw	x,#L26
 510  0037 cd0000        	call	c_lcmp
 512  003a 250e          	jrult	L001
 513  003c               L27:
 514  003c ae00b3        	ldw	x,#179
 515  003f 89            	pushw	x
 516  0040 5f            	clrw	x
 517  0041 89            	pushw	x
 518  0042 ae0010        	ldw	x,#L73
 519  0045 cd0000        	call	_assert_failed
 521  0048 5b04          	addw	sp,#4
 522  004a               L001:
 523                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 525  004a 7b07          	ld	a,(OFST+7,sp)
 526  004c 1e05          	ldw	x,(OFST+5,sp)
 527  004e f7            	ld	(x),a
 528                     ; 181 }
 531  004f 81            	ret	
 564                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 564                     ; 191 {
 565                     .text:	section	.text,new
 566  0000               _FLASH_ReadByte:
 568       00000000      OFST:	set	0
 571                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 573  0000 96            	ldw	x,sp
 574  0001 1c0003        	addw	x,#OFST+3
 575  0004 cd0000        	call	c_ltor
 577  0007 ae0000        	ldw	x,#L45
 578  000a cd0000        	call	c_lcmp
 580  000d 250f          	jrult	L211
 581  000f 96            	ldw	x,sp
 582  0010 1c0003        	addw	x,#OFST+3
 583  0013 cd0000        	call	c_ltor
 585  0016 ae0004        	ldw	x,#L65
 586  0019 cd0000        	call	c_lcmp
 588  001c 252c          	jrult	L411
 589  001e               L211:
 590  001e 96            	ldw	x,sp
 591  001f 1c0003        	addw	x,#OFST+3
 592  0022 cd0000        	call	c_ltor
 594  0025 ae0008        	ldw	x,#L06
 595  0028 cd0000        	call	c_lcmp
 597  002b 250f          	jrult	L601
 598  002d 96            	ldw	x,sp
 599  002e 1c0003        	addw	x,#OFST+3
 600  0031 cd0000        	call	c_ltor
 602  0034 ae000c        	ldw	x,#L26
 603  0037 cd0000        	call	c_lcmp
 605  003a 250e          	jrult	L411
 606  003c               L601:
 607  003c ae00c1        	ldw	x,#193
 608  003f 89            	pushw	x
 609  0040 5f            	clrw	x
 610  0041 89            	pushw	x
 611  0042 ae0010        	ldw	x,#L73
 612  0045 cd0000        	call	_assert_failed
 614  0048 5b04          	addw	sp,#4
 615  004a               L411:
 616                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 618  004a 1e05          	ldw	x,(OFST+5,sp)
 619  004c f6            	ld	a,(x)
 622  004d 81            	ret	
 662                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 662                     ; 208 {
 663                     .text:	section	.text,new
 664  0000               _FLASH_ProgramWord:
 666       00000000      OFST:	set	0
 669                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 671  0000 96            	ldw	x,sp
 672  0001 1c0003        	addw	x,#OFST+3
 673  0004 cd0000        	call	c_ltor
 675  0007 ae0000        	ldw	x,#L45
 676  000a cd0000        	call	c_lcmp
 678  000d 250f          	jrult	L621
 679  000f 96            	ldw	x,sp
 680  0010 1c0003        	addw	x,#OFST+3
 681  0013 cd0000        	call	c_ltor
 683  0016 ae0004        	ldw	x,#L65
 684  0019 cd0000        	call	c_lcmp
 686  001c 252c          	jrult	L031
 687  001e               L621:
 688  001e 96            	ldw	x,sp
 689  001f 1c0003        	addw	x,#OFST+3
 690  0022 cd0000        	call	c_ltor
 692  0025 ae0008        	ldw	x,#L06
 693  0028 cd0000        	call	c_lcmp
 695  002b 250f          	jrult	L221
 696  002d 96            	ldw	x,sp
 697  002e 1c0003        	addw	x,#OFST+3
 698  0031 cd0000        	call	c_ltor
 700  0034 ae000c        	ldw	x,#L26
 701  0037 cd0000        	call	c_lcmp
 703  003a 250e          	jrult	L031
 704  003c               L221:
 705  003c ae00d2        	ldw	x,#210
 706  003f 89            	pushw	x
 707  0040 5f            	clrw	x
 708  0041 89            	pushw	x
 709  0042 ae0010        	ldw	x,#L73
 710  0045 cd0000        	call	_assert_failed
 712  0048 5b04          	addw	sp,#4
 713  004a               L031:
 714                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 716  004a 721c505b      	bset	20571,#6
 717                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 719  004e 721d505c      	bres	20572,#6
 720                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 722  0052 7b07          	ld	a,(OFST+7,sp)
 723  0054 1e05          	ldw	x,(OFST+5,sp)
 724  0056 f7            	ld	(x),a
 725                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 727  0057 7b08          	ld	a,(OFST+8,sp)
 728  0059 e701          	ld	(1,x),a
 729                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 731  005b 7b09          	ld	a,(OFST+9,sp)
 732  005d e702          	ld	(2,x),a
 733                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 735  005f 7b0a          	ld	a,(OFST+10,sp)
 736  0061 e703          	ld	(3,x),a
 737                     ; 224 }
 740  0063 81            	ret	
 782                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 782                     ; 233 {
 783                     .text:	section	.text,new
 784  0000               _FLASH_ProgramOptionByte:
 786  0000 89            	pushw	x
 787       00000000      OFST:	set	0
 790                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 792  0001 a34800        	cpw	x,#18432
 793  0004 2505          	jrult	L631
 794  0006 a34880        	cpw	x,#18560
 795  0009 250e          	jrult	L041
 796  000b               L631:
 797  000b ae00eb        	ldw	x,#235
 798  000e 89            	pushw	x
 799  000f 5f            	clrw	x
 800  0010 89            	pushw	x
 801  0011 ae0010        	ldw	x,#L73
 802  0014 cd0000        	call	_assert_failed
 804  0017 5b04          	addw	sp,#4
 805  0019               L041:
 806                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 808  0019 721e505b      	bset	20571,#7
 809                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 811  001d 721f505c      	bres	20572,#7
 812                     ; 242     if (Address == 0x4800)
 814  0021 1e01          	ldw	x,(OFST+1,sp)
 815  0023 a34800        	cpw	x,#18432
 816  0026 2605          	jrne	L722
 817                     ; 245        *((NEAR uint8_t*)Address) = Data;
 819  0028 7b05          	ld	a,(OFST+5,sp)
 820  002a f7            	ld	(x),a
 822  002b 2006          	jra	L132
 823  002d               L722:
 824                     ; 250        *((NEAR uint8_t*)Address) = Data;
 826  002d 7b05          	ld	a,(OFST+5,sp)
 827  002f f7            	ld	(x),a
 828                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 830  0030 43            	cpl	a
 831  0031 e701          	ld	(1,x),a
 832  0033               L132:
 833                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 835  0033 a6fd          	ld	a,#253
 836  0035 cd0000        	call	_FLASH_WaitForLastOperation
 838                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 840  0038 721f505b      	bres	20571,#7
 841                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 843  003c 721e505c      	bset	20572,#7
 844                     ; 258 }
 847  0040 85            	popw	x
 848  0041 81            	ret	
 883                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 883                     ; 266 {
 884                     .text:	section	.text,new
 885  0000               _FLASH_EraseOptionByte:
 887  0000 89            	pushw	x
 888       00000000      OFST:	set	0
 891                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 893  0001 a34800        	cpw	x,#18432
 894  0004 2505          	jrult	L051
 895  0006 a34880        	cpw	x,#18560
 896  0009 250e          	jrult	L251
 897  000b               L051:
 898  000b ae010c        	ldw	x,#268
 899  000e 89            	pushw	x
 900  000f 5f            	clrw	x
 901  0010 89            	pushw	x
 902  0011 ae0010        	ldw	x,#L73
 903  0014 cd0000        	call	_assert_failed
 905  0017 5b04          	addw	sp,#4
 906  0019               L251:
 907                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
 909  0019 721e505b      	bset	20571,#7
 910                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 912  001d 721f505c      	bres	20572,#7
 913                     ; 275      if (Address == 0x4800)
 915  0021 1e01          	ldw	x,(OFST+1,sp)
 916  0023 a34800        	cpw	x,#18432
 917  0026 2603          	jrne	L742
 918                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 920  0028 7f            	clr	(x)
 922  0029 2005          	jra	L152
 923  002b               L742:
 924                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 926  002b 7f            	clr	(x)
 927                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 929  002c a6ff          	ld	a,#255
 930  002e e701          	ld	(1,x),a
 931  0030               L152:
 932                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 934  0030 a6fd          	ld	a,#253
 935  0032 cd0000        	call	_FLASH_WaitForLastOperation
 937                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 939  0035 721f505b      	bres	20571,#7
 940                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 942  0039 721e505c      	bset	20572,#7
 943                     ; 291 }
 946  003d 85            	popw	x
 947  003e 81            	ret	
1003                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1003                     ; 298 {
1004                     .text:	section	.text,new
1005  0000               _FLASH_ReadOptionByte:
1007  0000 89            	pushw	x
1008  0001 5204          	subw	sp,#4
1009       00000004      OFST:	set	4
1012                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
1014                     ; 300     uint16_t res_value = 0;
1016                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1018  0003 1e05          	ldw	x,(OFST+1,sp)
1019  0005 a34800        	cpw	x,#18432
1020  0008 2505          	jrult	L261
1021  000a a34880        	cpw	x,#18560
1022  000d 2510          	jrult	L461
1023  000f               L261:
1024  000f ae012f        	ldw	x,#303
1025  0012 89            	pushw	x
1026  0013 5f            	clrw	x
1027  0014 89            	pushw	x
1028  0015 ae0010        	ldw	x,#L73
1029  0018 cd0000        	call	_assert_failed
1031  001b 5b04          	addw	sp,#4
1032  001d 1e05          	ldw	x,(OFST+1,sp)
1033  001f               L461:
1034                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1036  001f f6            	ld	a,(x)
1037  0020 6b02          	ld	(OFST-2,sp),a
1038                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1040  0022 e601          	ld	a,(1,x)
1041  0024 6b01          	ld	(OFST-3,sp),a
1042                     ; 310     if (Address == 0x4800)	 
1044  0026 a34800        	cpw	x,#18432
1045  0029 2606          	jrne	L572
1046                     ; 312         res_value =	 value_optbyte;
1048  002b 7b02          	ld	a,(OFST-2,sp)
1049  002d 5f            	clrw	x
1050  002e 97            	ld	xl,a
1052  002f 201c          	jra	L772
1053  0031               L572:
1054                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
1056  0031 43            	cpl	a
1057  0032 1102          	cp	a,(OFST-2,sp)
1058  0034 2614          	jrne	L103
1059                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1061  0036 7b02          	ld	a,(OFST-2,sp)
1062  0038 97            	ld	xl,a
1063  0039 4f            	clr	a
1064  003a 02            	rlwa	x,a
1065  003b 1f03          	ldw	(OFST-1,sp),x
1066                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
1068  003d 7b01          	ld	a,(OFST-3,sp)
1069  003f 5f            	clrw	x
1070  0040 97            	ld	xl,a
1071  0041 01            	rrwa	x,a
1072  0042 1a04          	or	a,(OFST+0,sp)
1073  0044 01            	rrwa	x,a
1074  0045 1a03          	or	a,(OFST-1,sp)
1075  0047 01            	rrwa	x,a
1077  0048 2003          	jra	L772
1078  004a               L103:
1079                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
1081  004a ae5555        	ldw	x,#21845
1082  004d               L772:
1083                     ; 326     return(res_value);
1087  004d 5b06          	addw	sp,#6
1088  004f 81            	ret	
1163                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1163                     ; 336 {
1164                     .text:	section	.text,new
1165  0000               _FLASH_SetLowPowerMode:
1167  0000 88            	push	a
1168       00000000      OFST:	set	0
1171                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1173  0001 a104          	cp	a,#4
1174  0003 2719          	jreq	L671
1175  0005 a108          	cp	a,#8
1176  0007 2715          	jreq	L671
1177  0009 4d            	tnz	a
1178  000a 2712          	jreq	L671
1179  000c a10c          	cp	a,#12
1180  000e 270e          	jreq	L671
1181  0010 ae0152        	ldw	x,#338
1182  0013 89            	pushw	x
1183  0014 5f            	clrw	x
1184  0015 89            	pushw	x
1185  0016 ae0010        	ldw	x,#L73
1186  0019 cd0000        	call	_assert_failed
1188  001c 5b04          	addw	sp,#4
1189  001e               L671:
1190                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1192  001e c6505a        	ld	a,20570
1193  0021 a4f3          	and	a,#243
1194  0023 c7505a        	ld	20570,a
1195                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1197  0026 c6505a        	ld	a,20570
1198  0029 1a01          	or	a,(OFST+1,sp)
1199  002b c7505a        	ld	20570,a
1200                     ; 345 }
1203  002e 84            	pop	a
1204  002f 81            	ret	
1263                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1263                     ; 354 {
1264                     .text:	section	.text,new
1265  0000               _FLASH_SetProgrammingTime:
1267  0000 88            	push	a
1268       00000000      OFST:	set	0
1271                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1273  0001 4d            	tnz	a
1274  0002 2711          	jreq	L012
1275  0004 4a            	dec	a
1276  0005 270e          	jreq	L012
1277  0007 ae0164        	ldw	x,#356
1278  000a 89            	pushw	x
1279  000b 5f            	clrw	x
1280  000c 89            	pushw	x
1281  000d ae0010        	ldw	x,#L73
1282  0010 cd0000        	call	_assert_failed
1284  0013 5b04          	addw	sp,#4
1285  0015               L012:
1286                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1288  0015 7211505a      	bres	20570,#0
1289                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1291  0019 c6505a        	ld	a,20570
1292  001c 1a01          	or	a,(OFST+1,sp)
1293  001e c7505a        	ld	20570,a
1294                     ; 360 }
1297  0021 84            	pop	a
1298  0022 81            	ret	
1323                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1323                     ; 368 {
1324                     .text:	section	.text,new
1325  0000               _FLASH_GetLowPowerMode:
1329                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1331  0000 c6505a        	ld	a,20570
1332  0003 a40c          	and	a,#12
1335  0005 81            	ret	
1360                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1360                     ; 378 {
1361                     .text:	section	.text,new
1362  0000               _FLASH_GetProgrammingTime:
1366                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1368  0000 c6505a        	ld	a,20570
1369  0003 a401          	and	a,#1
1372  0005 81            	ret	
1404                     ; 387 uint32_t FLASH_GetBootSize(void)
1404                     ; 388 {
1405                     .text:	section	.text,new
1406  0000               _FLASH_GetBootSize:
1408  0000 5204          	subw	sp,#4
1409       00000004      OFST:	set	4
1412                     ; 389     uint32_t temp = 0;
1414  0002 5f            	clrw	x
1415  0003 1f03          	ldw	(OFST-1,sp),x
1416  0005 1f01          	ldw	(OFST-3,sp),x
1417                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1419  0007 c6505d        	ld	a,20573
1420  000a 97            	ld	xl,a
1421  000b 90ae0200      	ldw	y,#512
1422  000f cd0000        	call	c_umul
1424  0012 96            	ldw	x,sp
1425  0013 5c            	incw	x
1426  0014 cd0000        	call	c_rtol
1428                     ; 395     if (FLASH->FPR == 0xFF)
1430  0017 c6505d        	ld	a,20573
1431  001a 4c            	inc	a
1432  001b 260d          	jrne	L124
1433                     ; 397         temp += 512;
1435  001d ae0200        	ldw	x,#512
1436  0020 bf02          	ldw	c_lreg+2,x
1437  0022 5f            	clrw	x
1438  0023 bf00          	ldw	c_lreg,x
1439  0025 96            	ldw	x,sp
1440  0026 5c            	incw	x
1441  0027 cd0000        	call	c_lgadd
1443  002a               L124:
1444                     ; 401     return(temp);
1446  002a 96            	ldw	x,sp
1447  002b 5c            	incw	x
1448  002c cd0000        	call	c_ltor
1452  002f 5b04          	addw	sp,#4
1453  0031 81            	ret	
1563                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1563                     ; 413 {
1564                     .text:	section	.text,new
1565  0000               _FLASH_GetFlagStatus:
1567  0000 88            	push	a
1568  0001 88            	push	a
1569       00000001      OFST:	set	1
1572                     ; 414     FlagStatus status = RESET;
1574  0002 0f01          	clr	(OFST+0,sp)
1575                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1577  0004 a140          	cp	a,#64
1578  0006 271d          	jreq	L032
1579  0008 a108          	cp	a,#8
1580  000a 2719          	jreq	L032
1581  000c a104          	cp	a,#4
1582  000e 2715          	jreq	L032
1583  0010 a102          	cp	a,#2
1584  0012 2711          	jreq	L032
1585  0014 4a            	dec	a
1586  0015 270e          	jreq	L032
1587  0017 ae01a0        	ldw	x,#416
1588  001a 89            	pushw	x
1589  001b 5f            	clrw	x
1590  001c 89            	pushw	x
1591  001d ae0010        	ldw	x,#L73
1592  0020 cd0000        	call	_assert_failed
1594  0023 5b04          	addw	sp,#4
1595  0025               L032:
1596                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1598  0025 c6505f        	ld	a,20575
1599  0028 1502          	bcp	a,(OFST+1,sp)
1600  002a 2704          	jreq	L374
1601                     ; 421         status = SET; /* FLASH_FLAG is set */
1603  002c a601          	ld	a,#1
1605  002e 2001          	jra	L574
1606  0030               L374:
1607                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1609  0030 4f            	clr	a
1610  0031               L574:
1611                     ; 429     return status;
1615  0031 85            	popw	x
1616  0032 81            	ret	
1705                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1705                     ; 532 {
1706                     .text:	section	.text,new
1707  0000               _FLASH_WaitForLastOperation:
1709  0000 5205          	subw	sp,#5
1710       00000005      OFST:	set	5
1713                     ; 533     uint8_t flagstatus = 0x00;
1715  0002 0f05          	clr	(OFST+0,sp)
1716                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1718  0004 aeffff        	ldw	x,#65535
1719  0007 1f03          	ldw	(OFST-2,sp),x
1720  0009 ae000f        	ldw	x,#15
1721  000c 1f01          	ldw	(OFST-4,sp),x
1722                     ; 539     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1724  000e a1fd          	cp	a,#253
1725  0010 262b          	jrne	L355
1727  0012 200e          	jra	L145
1728  0014               L735:
1729                     ; 543             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1729                     ; 544                                               FLASH_IAPSR_WR_PG_DIS));
1731  0014 c6505f        	ld	a,20575
1732  0017 a405          	and	a,#5
1733  0019 6b05          	ld	(OFST+0,sp),a
1734                     ; 545             timeout--;
1736  001b 96            	ldw	x,sp
1737  001c 5c            	incw	x
1738  001d a601          	ld	a,#1
1739  001f cd0000        	call	c_lgsbc
1741  0022               L145:
1742                     ; 541         while ((flagstatus == 0x00) && (timeout != 0x00))
1744  0022 7b05          	ld	a,(OFST+0,sp)
1745  0024 2622          	jrne	L745
1747  0026 96            	ldw	x,sp
1748  0027 5c            	incw	x
1749  0028 cd0000        	call	c_lzmp
1751  002b 26e7          	jrne	L735
1752  002d 2019          	jra	L745
1753  002f               L155:
1754                     ; 552             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1754                     ; 553                                               FLASH_IAPSR_WR_PG_DIS));
1756  002f c6505f        	ld	a,20575
1757  0032 a441          	and	a,#65
1758  0034 6b05          	ld	(OFST+0,sp),a
1759                     ; 554             timeout--;
1761  0036 96            	ldw	x,sp
1762  0037 5c            	incw	x
1763  0038 a601          	ld	a,#1
1764  003a cd0000        	call	c_lgsbc
1766  003d               L355:
1767                     ; 550         while ((flagstatus == 0x00) && (timeout != 0x00))
1769  003d 7b05          	ld	a,(OFST+0,sp)
1770  003f 2607          	jrne	L745
1772  0041 96            	ldw	x,sp
1773  0042 5c            	incw	x
1774  0043 cd0000        	call	c_lzmp
1776  0046 26e7          	jrne	L155
1777  0048               L745:
1778                     ; 566     if (timeout == 0x00 )
1780  0048 96            	ldw	x,sp
1781  0049 5c            	incw	x
1782  004a cd0000        	call	c_lzmp
1784  004d 2604          	jrne	L165
1785                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1787  004f a602          	ld	a,#2
1788  0051 6b05          	ld	(OFST+0,sp),a
1789  0053               L165:
1790                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1792  0053 7b05          	ld	a,(OFST+0,sp)
1795  0055 5b05          	addw	sp,#5
1796  0057 81            	ret	
1856                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1856                     ; 582 {
1857                     .text:	section	.text,new
1858  0000               _FLASH_EraseBlock:
1860  0000 89            	pushw	x
1861  0001 5206          	subw	sp,#6
1862       00000006      OFST:	set	6
1865                     ; 583   uint32_t startaddress = 0;
1867  0003 96            	ldw	x,sp
1868  0004 1c0003        	addw	x,#OFST-3
1869  0007 cd0000        	call	c_ltor
1871                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1873  000a 7b0b          	ld	a,(OFST+5,sp)
1874  000c a1fd          	cp	a,#253
1875  000e 270b          	jreq	L442
1876  0010 a1f7          	cp	a,#247
1877  0012 2707          	jreq	L442
1878  0014 ae0251        	ldw	x,#593
1879  0017 ad50          	call	LC001
1880  0019 7b0b          	ld	a,(OFST+5,sp)
1881  001b               L442:
1882                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1884  001b a1fd          	cp	a,#253
1885  001d 2611          	jrne	L116
1886                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1888  001f 1e07          	ldw	x,(OFST+1,sp)
1889  0021 a30100        	cpw	x,#256
1890  0024 2505          	jrult	L252
1891  0026 ae0254        	ldw	x,#596
1892  0029 ad3e          	call	LC001
1893  002b               L252:
1894                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1896  002b ae8000        	ldw	x,#32768
1898  002e 200f          	jra	L316
1899  0030               L116:
1900                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1902  0030 1e07          	ldw	x,(OFST+1,sp)
1903  0032 a30008        	cpw	x,#8
1904  0035 2505          	jrult	L062
1905  0037 ae0259        	ldw	x,#601
1906  003a ad2d          	call	LC001
1907  003c               L062:
1908                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1910  003c ae4000        	ldw	x,#16384
1911  003f               L316:
1912  003f 1f05          	ldw	(OFST-1,sp),x
1913  0041 5f            	clrw	x
1914  0042 1f03          	ldw	(OFST-3,sp),x
1915                     ; 610     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1917  0044 1e07          	ldw	x,(OFST+1,sp)
1918  0046 a680          	ld	a,#128
1919  0048 cd0000        	call	c_cmulx
1921  004b 96            	ldw	x,sp
1922  004c 1c0003        	addw	x,#OFST-3
1923  004f cd0000        	call	c_ladd
1925  0052 be02          	ldw	x,c_lreg+2
1926  0054 1f01          	ldw	(OFST-5,sp),x
1927                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
1929  0056 721a505b      	bset	20571,#5
1930                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1932  005a 721b505c      	bres	20572,#5
1933                     ; 619     *pwFlash = (uint32_t)0;
1935  005e 4f            	clr	a
1936  005f e703          	ld	(3,x),a
1937  0061 e702          	ld	(2,x),a
1938  0063 e701          	ld	(1,x),a
1939  0065 f7            	ld	(x),a
1940                     ; 627 }
1943  0066 5b08          	addw	sp,#8
1944  0068 81            	ret	
1946  0069               LC001:
1947  0069 89            	pushw	x
1948  006a 5f            	clrw	x
1949  006b 89            	pushw	x
1950  006c ae0010        	ldw	x,#L73
1951  006f cd0000        	call	_assert_failed
1953  0072 5b04          	addw	sp,#4
1954  0074 81            	ret	
2052                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2052                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2052                     ; 640 {
2053                     .text:	section	.text,new
2054  0000               _FLASH_ProgramBlock:
2056  0000 89            	pushw	x
2057  0001 5206          	subw	sp,#6
2058       00000006      OFST:	set	6
2061                     ; 641     uint16_t Count = 0;
2063                     ; 642     uint32_t startaddress = 0;
2065  0003 96            	ldw	x,sp
2066  0004 5c            	incw	x
2067  0005 cd0000        	call	c_ltor
2069                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2071  0008 7b0b          	ld	a,(OFST+5,sp)
2072  000a a1fd          	cp	a,#253
2073  000c 2709          	jreq	L272
2074  000e a1f7          	cp	a,#247
2075  0010 2705          	jreq	L272
2076  0012 ae0285        	ldw	x,#645
2077  0015 ad76          	call	LC002
2078  0017               L272:
2079                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2081  0017 7b0c          	ld	a,(OFST+6,sp)
2082  0019 2709          	jreq	L203
2083  001b a110          	cp	a,#16
2084  001d 2705          	jreq	L203
2085  001f ae0286        	ldw	x,#646
2086  0022 ad69          	call	LC002
2087  0024               L203:
2088                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
2090  0024 7b0b          	ld	a,(OFST+5,sp)
2091  0026 a1fd          	cp	a,#253
2092  0028 2611          	jrne	L166
2093                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2095  002a 1e07          	ldw	x,(OFST+1,sp)
2096  002c a30100        	cpw	x,#256
2097  002f 2505          	jrult	L013
2098  0031 ae0289        	ldw	x,#649
2099  0034 ad57          	call	LC002
2100  0036               L013:
2101                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2103  0036 ae8000        	ldw	x,#32768
2105  0039 200f          	jra	L366
2106  003b               L166:
2107                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2109  003b 1e07          	ldw	x,(OFST+1,sp)
2110  003d a30008        	cpw	x,#8
2111  0040 2505          	jrult	L613
2112  0042 ae028e        	ldw	x,#654
2113  0045 ad46          	call	LC002
2114  0047               L613:
2115                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2117  0047 ae4000        	ldw	x,#16384
2118  004a               L366:
2119  004a 1f03          	ldw	(OFST-3,sp),x
2120  004c 5f            	clrw	x
2121  004d 1f01          	ldw	(OFST-5,sp),x
2122                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2124  004f 1e07          	ldw	x,(OFST+1,sp)
2125  0051 a680          	ld	a,#128
2126  0053 cd0000        	call	c_cmulx
2128  0056 96            	ldw	x,sp
2129  0057 5c            	incw	x
2130  0058 cd0000        	call	c_lgadd
2132                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2134  005b 7b0c          	ld	a,(OFST+6,sp)
2135  005d 260a          	jrne	L566
2136                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
2138  005f 7210505b      	bset	20571,#0
2139                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2141  0063 7211505c      	bres	20572,#0
2143  0067 2008          	jra	L766
2144  0069               L566:
2145                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
2147  0069 7218505b      	bset	20571,#4
2148                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2150  006d 7219505c      	bres	20572,#4
2151  0071               L766:
2152                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2154  0071 5f            	clrw	x
2155  0072 1f05          	ldw	(OFST-1,sp),x
2156  0074               L176:
2157                     ; 680   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2159  0074 1e0d          	ldw	x,(OFST+7,sp)
2160  0076 72fb05        	addw	x,(OFST-1,sp)
2161  0079 f6            	ld	a,(x)
2162  007a 1e03          	ldw	x,(OFST-3,sp)
2163  007c 72fb05        	addw	x,(OFST-1,sp)
2164  007f f7            	ld	(x),a
2165                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2167  0080 1e05          	ldw	x,(OFST-1,sp)
2168  0082 5c            	incw	x
2169  0083 1f05          	ldw	(OFST-1,sp),x
2172  0085 a30080        	cpw	x,#128
2173  0088 25ea          	jrult	L176
2174                     ; 685 }
2177  008a 5b08          	addw	sp,#8
2178  008c 81            	ret	
2180  008d               LC002:
2181  008d 89            	pushw	x
2182  008e 5f            	clrw	x
2183  008f 89            	pushw	x
2184  0090 ae0010        	ldw	x,#L73
2185  0093 cd0000        	call	_assert_failed
2187  0096 5b04          	addw	sp,#4
2188  0098 81            	ret	
2200                     	xdef	_FLASH_WaitForLastOperation
2201                     	xdef	_FLASH_ProgramBlock
2202                     	xdef	_FLASH_EraseBlock
2203                     	xdef	_FLASH_GetFlagStatus
2204                     	xdef	_FLASH_GetBootSize
2205                     	xdef	_FLASH_GetProgrammingTime
2206                     	xdef	_FLASH_GetLowPowerMode
2207                     	xdef	_FLASH_SetProgrammingTime
2208                     	xdef	_FLASH_SetLowPowerMode
2209                     	xdef	_FLASH_EraseOptionByte
2210                     	xdef	_FLASH_ProgramOptionByte
2211                     	xdef	_FLASH_ReadOptionByte
2212                     	xdef	_FLASH_ProgramWord
2213                     	xdef	_FLASH_ReadByte
2214                     	xdef	_FLASH_ProgramByte
2215                     	xdef	_FLASH_EraseByte
2216                     	xdef	_FLASH_ITConfig
2217                     	xdef	_FLASH_DeInit
2218                     	xdef	_FLASH_Lock
2219                     	xdef	_FLASH_Unlock
2220                     	xref	_assert_failed
2221                     	switch	.const
2222  0010               L73:
2223  0010 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
2224  0022 6965735c7374  	dc.b	"ies\stm8s_stdperip"
2225  0034 685f64726976  	dc.b	"h_driver\src\stm8s"
2226  0046 5f666c617368  	dc.b	"_flash.c",0
2227                     	xref.b	c_lreg
2247                     	xref	c_ladd
2248                     	xref	c_cmulx
2249                     	xref	c_lzmp
2250                     	xref	c_lgsbc
2251                     	xref	c_lgadd
2252                     	xref	c_rtol
2253                     	xref	c_umul
2254                     	xref	c_lcmp
2255                     	xref	c_ltor
2256                     	end
