#include"iostm8s105k4.h"
unsigned char HexTable[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};
void Init_AD(void)
{
		ADC_CSR=0x00; //ѡ��ͨ��
		ADC_CR2|=0x08; // ��������,�Ҷ���
		ADC_TDRL=0x01;
}
void Init_UART2(void)
{
      UART2_CR1=0x00;
      UART2_CR2=0x00;
      UART2_CR3=0x00;
      // ���ò����ʣ�����ע�����¼��㣺
      // (1) ������дBRR2
      // (2) BRR1��ŵ��Ƿ�Ƶϵ���ĵ�11λ����4λ��
      // (3) BRR2��ŵ��Ƿ�Ƶϵ���ĵ�15λ����12λ���͵�3λ
      // ����0λ
      // ������ڲ�����λ9600ʱ����Ƶϵ��=2000000/9600=208
      // ��Ӧ��ʮ��������Ϊ00D0��BBR1=0D,BBR2=00

      UART2_BRR2=0x00;
      UART2_BRR1=0x0d;

      UART2_CR2=0x2c;//������գ����ͣ��������ж�
}
void UART2_sendchar(unsigned char c)
{
      while((UART2_SR & 0x80)==0x00);
      UART2_DR=c;
}
void UART2_sendhex(unsigned char dat)
{
		UART2_sendchar('0');
		
                UART2_sendchar('x');
		
                UART2_sendchar(HexTable[dat>>4]);
		
                UART2_sendchar(HexTable[dat&0x0f]);
		
                UART2_sendchar(' ');
}
void UART2_sendstr(unsigned char *dat)
{
		while(*dat!='\0')
		
                {
				
                  UART2_sendchar(*dat);
				
                  dat++;
				//delay2us();
		
                }
}

main()
{
		int i=0;
		Init_UART2();
		Init_AD();
		while (1)
		{
				ADC_CR1|=0x01;
				for(i=0;i<100;i++); // ��ʱһ��ʱ�䣬����7uS����֤ADC ģ���ϵ�����
				ADC_CR1|=0x01;      // �ٴν�CR1�Ĵ��������λ��1,����ADת��

				while((ADC_CSR & 0x80)!=0x80); // �ȴ�ת������
				//UART2_sendchar(ADC_DRH);
				//UART2_sendchar(ADC_DRL);
				UART2_sendhex(ADC_DRH);
				UART2_sendhex(ADC_DRL);
				UART2_sendstr("\r\n");
				ADC_CSR&=(~0x80);
		}
}