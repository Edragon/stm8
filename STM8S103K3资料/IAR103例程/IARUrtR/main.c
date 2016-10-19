#include"iostm8s103K3.h"
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
main()
{
	//unsigned char i=0;
	Init_UART1();
	asm("rim");//���жϣ�simΪ���ж�
	while (1);
}
//���յ��������ٷ��ͳ�ȥ
#pragma vector= UART1_R_OR_vector//0x19
__interrupt void UART1_R_OR_IRQHandler(void)
{
      unsigned char ch;
      ch=UART1_DR;
			UART1_sendchar(ch);
      return;
}
