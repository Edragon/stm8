#include"iostm8s105k4.h"
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
main()
{
	//unsigned char i=0;
	Init_UART2();
	asm("rim");//���жϣ�simΪ���ж�
	while (1);
}
//���յ��������ٷ��ͳ�ȥ
#pragma vector= UART2_R_OR_vector//0x19
__interrupt void UART2_R_OR_IRQHandler(void)
{
      unsigned char ch;
      ch=UART2_DR;
			UART2_sendchar(ch);
      return;
}
