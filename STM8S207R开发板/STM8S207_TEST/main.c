#include"stm8s.h"

void delay_ms(unsigned int z)//ms��ʱ����
{
	unsigned int x,y;
	for(x=z;x>0;x--)
		for(y=250;y>0;y--);
}

void LED_GPIO_Init(void)
{
	GPIO_Init(GPIOC, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST);
}

main()
{
	unsigned char temp=0x02;
	
	LED_GPIO_Init();
	while (1)
	{
		GPIO_Write(GPIOC,temp);
		delay_ms(200);
		temp=temp<<1;//����һλ
		if(temp==0x00) temp=0x02;//���1�����λ�Ƴ������λ��1
	}
}

