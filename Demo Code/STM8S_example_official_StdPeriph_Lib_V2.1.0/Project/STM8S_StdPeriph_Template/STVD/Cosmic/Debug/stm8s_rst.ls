   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
 108                     ; 48 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 108                     ; 49 {
 110                     .text:	section	.text,new
 111  0000               _RST_GetFlagStatus:
 113  0000 88            	push	a
 114       00000000      OFST:	set	0
 117                     ; 51     assert_param(IS_RST_FLAG_OK(RST_Flag));
 119  0001 a110          	cp	a,#16
 120  0003 271d          	jreq	L21
 121  0005 a108          	cp	a,#8
 122  0007 2719          	jreq	L21
 123  0009 a104          	cp	a,#4
 124  000b 2715          	jreq	L21
 125  000d a102          	cp	a,#2
 126  000f 2711          	jreq	L21
 127  0011 4a            	dec	a
 128  0012 270e          	jreq	L21
 129  0014 ae0033        	ldw	x,#51
 130  0017 89            	pushw	x
 131  0018 5f            	clrw	x
 132  0019 89            	pushw	x
 133  001a ae0000        	ldw	x,#L55
 134  001d cd0000        	call	_assert_failed
 136  0020 5b04          	addw	sp,#4
 137  0022               L21:
 138                     ; 55     return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 140  0022 c650b3        	ld	a,20659
 141  0025 1401          	and	a,(OFST+1,sp)
 144  0027 5b01          	addw	sp,#1
 145  0029 81            	ret	
 181                     ; 64 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 181                     ; 65 {
 182                     .text:	section	.text,new
 183  0000               _RST_ClearFlag:
 185  0000 88            	push	a
 186       00000000      OFST:	set	0
 189                     ; 67     assert_param(IS_RST_FLAG_OK(RST_Flag));
 191  0001 a110          	cp	a,#16
 192  0003 271d          	jreq	L42
 193  0005 a108          	cp	a,#8
 194  0007 2719          	jreq	L42
 195  0009 a104          	cp	a,#4
 196  000b 2715          	jreq	L42
 197  000d a102          	cp	a,#2
 198  000f 2711          	jreq	L42
 199  0011 4a            	dec	a
 200  0012 270e          	jreq	L42
 201  0014 ae0043        	ldw	x,#67
 202  0017 89            	pushw	x
 203  0018 5f            	clrw	x
 204  0019 89            	pushw	x
 205  001a ae0000        	ldw	x,#L55
 206  001d cd0000        	call	_assert_failed
 208  0020 5b04          	addw	sp,#4
 209  0022               L42:
 210                     ; 69     RST->SR = (uint8_t)RST_Flag;
 212  0022 7b01          	ld	a,(OFST+1,sp)
 213  0024 c750b3        	ld	20659,a
 214                     ; 70 }
 217  0027 84            	pop	a
 218  0028 81            	ret	
 231                     	xdef	_RST_ClearFlag
 232                     	xdef	_RST_GetFlagStatus
 233                     	xref	_assert_failed
 234                     .const:	section	.text
 235  0000               L55:
 236  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\..\librar"
 237  0012 6965735c7374  	dc.b	"ies\stm8s_stdperip"
 238  0024 685f64726976  	dc.b	"h_driver\src\stm8s"
 239  0036 5f7273742e63  	dc.b	"_rst.c",0
 259                     	end
