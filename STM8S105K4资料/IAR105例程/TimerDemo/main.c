#include "IOSTM8S105K4.h"
unsigned char i=0;

void Init_Timer4(void)
{
    TIM4_CR1=0x01;//ʹ�ܼ�����
  //TIM4_IER=0x00;
    TIM4_IER=0x01;//�����ж�ʹ��
    TIM4_EGR=0x01;
    TIM4_CNTR=255;//������ֵ
    TIM4_ARR=255;//�Զ���װ��ֵ
    TIM4_PSCR=0x07;//��Ƶֵ

}
void Init_GPIO(void)
{
    PE_DDR|=0x20;
    PE_CR1|=0x20;
    PE_CR2|=0x00;
}

/*
�ж�
����һ���ж�������˵�����£�

#pragma vector=0x02
__interrupt void interrupt_handler(void)
{

}
˵��:
#pragma vector��
��IAR�ж�����ָ��
=0x02 :
�����ִ����ж�������š�STM8�ĵ�ַ�Ǵ�0x00800��ʼ��IAR���жϱ�Ŵ�0��ʼ���ж����������ΰ����жϵ�ַ�������磺
��λ������0x008000���ж���������0x00
TRAP���жϵ�ַ��0x008004�ж���������0x01
SPI�жϺ���0x0C;��ϸ���±�
__interrupt void interrupt_handler
(void):
������һ���жϺ�����ע��interrupt�������»��ߣ�interrupt_handler���жϺ������֣����Լ�����

*/
#pragma vector=TIM4_OVR_UIF_vector//0x19
__interrupt void TIM4_OVR_UIF_IRQHandler(void)//��ӦIAP���жϵ�ַ��0x8060
{
  //asm("JP 0x9060\n");
      i++;
      TIM4_SR=0x00;
      if(i==61)
      {
	  PE_ODR^=0x20;
	  i=0;
      }
      //return;
}

int main( void )
{
    Init_GPIO();
    Init_Timer4();
    asm("rim");//��ȫ���ж�
    while(1);
    //return 0;
}
