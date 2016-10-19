/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */
#include "STM8S103K3.h"
unsigned char HexTable[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
void Init_AD(void)
{
		ADC_CSR=0x03; //ѡ��ͨ��AIN3/PD2
		ADC_CR2|=0x08; // ��������,�Ҷ���
		ADC_TDRL=0x01;
}
void Init_UART1(void)
{
      UART1_CR1=0x00;
      UART1_CR2=0x00;
      UART1_CR3=0x00;
      // ���ò����ʣ�����ע�����¼��㣺
      // (1) ������дBRR2
      // (2) BRR1��ŵ��Ƿ�Ƶϵ���ĵ�11λ����4λ��
      // (3) BRR2��ŵ��Ƿ�Ƶϵ���ĵ�15λ����12λ���͵�3λ
      // ����0λ
      // ������ڲ�����λ9600ʱ����Ƶϵ��=2000000/9600=208
      // ��Ӧ��ʮ��������Ϊ00D0��BBR1=0D,BBR2=00

      UART1_BRR2=0x00;
      UART1_BRR1=0x0d;

      UART1_CR2=0x2c;//������գ����ͣ��������ж�
}
void UART1_sendchar(unsigned char c)
{
      while((UART1_SR & 0x80)==0x00);
      UART1_DR=c;
}
void UART1_sendhex(unsigned char dat)
{
		UART1_sendchar('0');
		UART1_sendchar('x');
		UART1_sendchar(HexTable[dat>>4]);
		UART1_sendchar(HexTable[dat&0x0f]);
		UART1_sendchar(' ');
}
void UART1_sendstr(unsigned char *dat)
{
		while(*dat!='\0')
		{
				UART1_sendchar(*dat);
				dat++;
				//delay2us();
		}
}

main()
{
		int i=0;
		Init_UART1();
		Init_AD();
		while (1)
		{
				ADC_CR1|=0x01;
				for(i=0;i<100;i++); // ��ʱһ��ʱ�䣬����7uS����֤ADC ģ���ϵ�����
				ADC_CR1|=0x01;      // �ٴν�CR1�Ĵ��������λ��1,����ADת��

				while((ADC_CSR & 0x80)!=0x80); // �ȴ�ת������
				//UART2_sendchar(ADC_DRH);
				//UART2_sendchar(ADC_DRL);
				UART1_sendhex(ADC_DRH);
				UART1_sendhex(ADC_DRL);
				UART1_sendstr("\r\n");
				ADC_CSR&=(~0x80);
		}
}