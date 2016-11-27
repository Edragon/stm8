   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 30 void main(void)
  33                     ; 31 {
  35                     .text:	section	.text,new
  36  0000               _main:
  40  0000               L12:
  41  0000 20fe          	jra	L12
  76                     ; 49 void assert_failed(u8* file, u32 line)
  76                     ; 50 { 
  77                     .text:	section	.text,new
  78  0000               _assert_failed:
  82  0000               L34:
  83  0000 20fe          	jra	L34
  96                     	xdef	_main
  97                     	xdef	_assert_failed
 116                     	end
