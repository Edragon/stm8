   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 30 void main(void)
  32                     ; 31 {
  34                     	switch	.text
  35  0000               _main:
  39  0000               L12:
  40  0000 20fe          	jra	L12
  75                     ; 49 void assert_failed(u8* file, u32 line)
  75                     ; 50 { 
  76                     	switch	.text
  77  0002               _assert_failed:
  81  0002               L34:
  82  0002 20fe          	jra	L34
  95                     	xdef	_main
  96                     	xdef	_assert_failed
 115                     	end
