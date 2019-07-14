#ifndef __SGP18T_ILI9163B_ACSII_H__
#define __SGP18T_ILI9163B_ASCII_H__



#include "ILI9163.h"
#include "SGP18T_ILI9163B_config.h"

//void LCD_PutString(unsigned short x, unsigned short y, unsigned char *s, unsigned int fColor, unsigned int bColor);
//void PutGB1616(unsigned short x, unsigned short  y, unsigned char c[2], unsigned int fColor,unsigned int bColor);
/*--------------------------------------------------------------*/
#if 	(PRINTCHAR16	> 0)	//(8*16����)
/*--------------------------------------------------------------*/
//Һ���ַ����(8*16����)
//x: 0 -15   (��)
//y: 0 -9	 (��)
void LCD_printc16(uint8 x, uint8 y, uint8 c_dat,uint16 word_color,uint16 back_color);

/*--------------------------------------------------------------*/
//Һ���ַ������(8*16����)
//x: 0 - 15 (��)
//y: 0 -0   (��)
void LCD_prints16(uint8 x, uint8 y, uint8 *s_dat,uint16 word_color,uint16 back_color);
/*--------------------------------------------------------------*/
#endif/*8*16����*/



#if	 (PRINTCHAR6 == 1)
/*--------------------------------------------------------------*/
//Һ���ַ����(6*8����)
//x: 0 - 20	(��)
//y: 0 - 19	(��)
void LCD_printc6(uint8 x, uint8 y, uint8 c_dat,uint16 word_color,uint16 back_color);

/*--------------------------------------------------------------*/
//Һ���ַ������(6*8����)
//x: 0 - 20 (��)
//y: 0 - 19 (��)
void LCD_prints6(uint8 x, uint8 y, uint8 *s_dat,uint16 word_color,uint16 back_color);

/*--------------------------------------------------------------*/ 
//��λ�������
//x: 0 - 20  (��)
//y: 0 - 19  (��)
//num: 0 - 65535	Ҫ��ʾ������
//num_bit: 0 - 5	���ֵ�λ��
void LCD_printn6(uint8 x, uint8 y, uint16 num, uint8 num_bit,uint16 word_color,uint16 back_color);
/*--------------------------------------------------------------*/
#endif/*8*6����ѡ��*/


#if	 (PRINTCHAR8 == 1)
/*--------------------------------------------------------------*/
//Һ���ַ����(8*8����)
//x: 0 - 15	(��)
//y: 0 -19	(��)
void LCD_printc(uint8 x, uint8 y, uint8 c_dat,uint16 word_color,uint16 back_color);

/*--------------------------------------------------------------*/
//Һ���ַ������(8*8����)
//x: 0 - 15 (��)
//y: 0 -19 (��)
void LCD_prints(uint8 x, uint8 y, uint8 *s_dat,uint16 word_color,uint16 back_color);

/*--------------------------------------------------------------*/ 
//��λ�������
//x: 0 - 15  (��)
//y: 0 - 19 (��)
//num: 0 - 65535	Ҫ��ʾ������
//num_bit: 0 - 5	���ֵ�λ��
void LCD_printn(uint8 x, uint8 y, uint16 num, uint8 num_bit,uint16 word_color,uint16 back_color);
/*--------------------------------------------------------------*/ 
#endif /*8*8����ѡ��*/







#endif //SGP18T_ILI9163B_ascii.h