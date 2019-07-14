/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */


#include "main.h"
#include "CC1101.h"

 
INT8U SPI_ExchangeByte( INT8U input )
{
	while (SPI_GetFlagStatus(SPI_FLAG_TXE) == RESET);
	SPI_SendData( input );
	while (SPI_GetFlagStatus(SPI_FLAG_RXNE) == RESET);
	return SPI_ReceiveData( );
}

void SPIInit( void )
{
	//��ʼ��SPI�ӿ�
	CLK_PeripheralClockConfig(CLK_Peripheral_SPI, ENABLE);
	SPI_DeInit( );
	SPI_Init( SPI_FirstBit_MSB, SPI_BaudRatePrescaler_2,
            SPI_Mode_Master, SPI_CPOL_Low, SPI_CPHA_1Edge,
            SPI_Direction_2Lines_FullDuplex, SPI_NSS_Soft );
	SPI_Cmd( ENABLE );

	GPIO_Init( GPIOB, GPIO_Pin_7,GPIO_Mode_In_PU_No_IT );
	GPIO_Init( GPIOB, GPIO_Pin_5 | GPIO_Pin_6, GPIO_Mode_Out_PP_High_Slow );
	GPIO_Init( GPIOB, GPIO_Pin_4, GPIO_Mode_Out_PP_High_Slow );
	GPIO_SetBits( GPIOB, GPIO_Pin_4 );
	GPIO_ResetBits( GPIOB, GPIO_Pin_4 );
	GPIO_SetBits( GPIOB, GPIO_Pin_4 );	
}


main()
{
	volatile INT8U rxBuffer[10] = {0}, length, i;
	INT32U x;
	
	SPIInit( );
	
	//��ʼ��״̬���IO�ڣ�ʹ�ò�ѯ��ʽ
	GPIO_Init( GPIOA, GPIO_Pin_3 | GPIO_Pin_2, GPIO_Mode_In_PU_No_IT );
	
	//��ʼ��LED״̬
	GPIO_Init( GPIOB, GPIO_Pin_0 | GPIO_Pin_1,GPIO_Mode_Out_OD_Low_Fast );
	
  CC1101Init(  );                        // Write RF settings to config reg  
	
	CC1101SetTRMode( RX_MODE );

	while( 1 )
	
	{
		//������յ����ݰ���LED״̬��תһ��
		for( x = 0; x < 100; x ++ );
		length = 10;
		i = CC1101RecPacket( rxBuffer, &length );
		if(i != 0 )
		{
			for( i = 0; i < 10; i ++ ){ rxBuffer[i] = 0xFF;}
			GPIO_ToggleBits( GPIOB, GPIO_Pin_1 | GPIO_Pin_0 );
		}
	}
}