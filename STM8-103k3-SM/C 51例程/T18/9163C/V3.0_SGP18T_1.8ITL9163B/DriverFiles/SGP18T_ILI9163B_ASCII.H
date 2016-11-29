#ifndef __SGP18T_ILI9163B_ACSII_H__
#define __SGP18T_ILI9163B_ASCII_H__


#include<reg51.h>
#include "MyType.h"
#include "SGP18T_ILI9163B_config.h"



/*--------------------------------------------------------------*/
#if 	(PRINTCHAR16	> 0)	//(8*16字体)
/*--------------------------------------------------------------*/
//液晶字符输出(8*16字体)
//x: 0 -15   (行)
//y: 0 -9	 (列)
void LCD_printc16(uint8 x, uint8 y, uint8 c_dat,uint16 word_color,uint16 back_color);

/*--------------------------------------------------------------*/
//液晶字符串输出(8*16字体)
//x: 0 - 15 (行)
//y: 0 -0   (列)
void LCD_prints16(uint8 x, uint8 y, uint8 *s_dat,uint16 word_color,uint16 back_color);
/*--------------------------------------------------------------*/
#endif/*8*16字体*/



#if	 (PRINTCHAR6 == 1)
/*--------------------------------------------------------------*/
//液晶字符输出(6*8字体)
//x: 0 - 20	(行)
//y: 0 - 19	(列)
void LCD_printc6(uint8 x, uint8 y, uint8 c_dat,uint16 word_color,uint16 back_color);

/*--------------------------------------------------------------*/
//液晶字符串输出(6*8字体)
//x: 0 - 20 (行)
//y: 0 - 19 (列)
void LCD_prints6(uint8 x, uint8 y, uint8 *s_dat,uint16 word_color,uint16 back_color);

/*--------------------------------------------------------------*/ 
//定位输出数字
//x: 0 - 20  (行)
//y: 0 - 19  (列)
//num: 0 - 65535	要显示的数字
//num_bit: 0 - 5	数字的位数
void LCD_printn6(uint8 x, uint8 y, uint16 num, uint8 num_bit,uint16 word_color,uint16 back_color);
/*--------------------------------------------------------------*/
#endif/*8*6字体选择*/


#if	 (PRINTCHAR8 == 1)
/*--------------------------------------------------------------*/
//液晶字符输出(8*8字体)
//x: 0 - 15	(行)
//y: 0 -19	(列)
void LCD_printc(uint8 x, uint8 y, uint8 c_dat,uint16 word_color,uint16 back_color);

/*--------------------------------------------------------------*/
//液晶字符串输出(8*8字体)
//x: 0 - 15 (行)
//y: 0 -19 (列)
void LCD_prints(uint8 x, uint8 y, uint8 *s_dat,uint16 word_color,uint16 back_color);

/*--------------------------------------------------------------*/ 
//定位输出数字
//x: 0 - 15  (行)
//y: 0 - 19 (列)
//num: 0 - 65535	要显示的数字
//num_bit: 0 - 5	数字的位数
void LCD_printn(uint8 x, uint8 y, uint16 num, uint8 num_bit,uint16 word_color,uint16 back_color);
/*--------------------------------------------------------------*/ 
#endif /*8*8字体选择*/







#endif //SGP18T_ILI9163B_ascii.h