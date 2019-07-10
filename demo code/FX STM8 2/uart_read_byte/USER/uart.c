

/******************** (C) COPYRIGHT  风驰iCreate嵌入式开发工作室 ***************************

 * 文件名  ：uart.c
 * 描述    ：串口通信配置函数库     
 * 实验平台：iCreate STM8开发板
 * 库版本  ：V2.0.0
 * 作者    ：ling_guansheng  QQ：779814207
 * 博客    ：
 *修改时间 ：2011-12-20
  iCreate STM8开发板硬件连接
    |--------------------|
    |  USART1_RX-PA4     |
    |  USART1_TX-PA5     |
    |--------------------|

****************************************************************************************/

#include "uart.h"
#include "stm8s.h"
#include "stm8s_clk.h"
#include <stdarg.h>
/* ********************************************
UART1  configured as follow:
  - BaudRate = 115200 baud  
  - Word Length = 8 Bits
  - One Stop Bit
  - No parity
  - Receive and transmit enabled
 -  Receive interrupt
  - UART1 Clock disabled
*********************************************/
void Uart_Init(void)
{
    UART1_DeInit();
    UART1_Init((u32)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, \
    UART1_PARITY_NO , UART1_SYNCMODE_CLOCK_DISABLE , UART1_MODE_TXRX_ENABLE);
    UART1_ITConfig(UART1_IT_RXNE_OR,ENABLE  );
    UART1_Cmd(ENABLE );
  
}

void UART1_SendByte(u8 data)
{
    UART1_SendData8((unsigned char)data);
  /* Loop until the end of transmission */
  while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
}

void UART1_SendString(u8* Data,u16 len)
{
  u16 i=0;
  for(;i<len;i++)
    UART1_SendByte(Data[i]);
  
}

u8 UART1_ReceiveByte(void)
{
     u8 USART1_RX_BUF; 
     while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
     USART1_RX_BUF=UART1_ReceiveData8();
     return  USART1_RX_BUF;
    
}

/*
 * 函数名：fputc
 * 描述  ：重定向c库函数printf到USART1
 * 输入  ：无
 * 输出  ：无
 * 调用  ：由printf调用
 */
int fputc(int ch, FILE *f)
{  
/* 将Printf内容发往串口 */
  UART1_SendData8((unsigned char) ch);
  while (!(UART1->SR & UART1_FLAG_TXE));
 
  return (ch);
}

/********************************************************
 * 函数名：itoa
 * 描述  ：将整形数据转换成字符串
 * 输入  ：-radix =10 表示10进制，其他结果为0
 *         -value 要转换的整形数
 *         -buf 转换后的字符串
 *         -radix = 10
 * 输出  ：无
 * 返回  ：无
 * 调用  ：被USART1_printf()调用
 *******************************************************/
static char *itoa(int value, char *string, int radix)
{
    int     i, d;
    int     flag = 0;
    char    *ptr = string;

    /* This implementation only works for decimal numbers. */
    if (radix != 10)
    {
        *ptr = 0;
        return string;
    }

    if (!value)
    {
        *ptr++ = 0x30;
        *ptr = 0;
        return string;
    }

    /* if this is a negative value insert the minus sign. */
    if (value < 0)
    {
        *ptr++ = '-';

        /* Make the value positive. */
        value *= -1;
    }

    for (i = 10000; i > 0; i /= 10)
    {
        d = value / i;

        if (d || flag)
        {
            *ptr++ = (char)(d + 0x30);
            value -= (d * i);
            flag = 1;
        }
    }

    /* Null terminate the string. */
    *ptr = 0;

    return string;

} /* NCL_Itoa */

/************************************************************************
 * 函数名：USART1_printf
 * 描述  ：格式化输出，类似于C库中的printf，但这里没有用到C库
 * 输入  ：-USARTx 串口通道，这里只用到了串口1，即USART1
 *		     -Data   要发送到串口的内容的指针
 *			   -...    其他参数
 * 输出  ：无
 * 返回  ：无 
 * 调用  ：外部调用
 *         典型应用USART1_printf( "\r\n this is a demo \r\n" );
 *            		 USART1_printf(  "\r\n %d \r\n", i );
 *            		 USART1_printf(  "\r\n %s \r\n", j );
 ***************************************************************************/
void USART1_printf( uint8_t *Data,...)
{
  const char *s;
  int d;   
  char buf[16];
  va_list ap;
  va_start(ap, Data);

  while ( *Data != 0)     // 判断是否到达字符串结束符
  {				                          
      if ( *Data == 0x5c )  //'\'
      {									  
              switch ( *++Data )
              {
                      case 'r':							          //回车符
                              UART1_SendData8(0x0d);
                              Data ++;
                              break;

                      case 'n':							          //换行符
                              UART1_SendData8(0x0a);	
                              Data ++;
                              break;
                      
                      default:
                              Data ++;
                          break;
              }			 
      }
      else if ( *Data == '%')
      {					//
	switch ( *++Data )
	  {				
	    case 's':						//字符串
		s = va_arg(ap, const char *);
          for ( ; *s; s++) 
	  {
	    UART1_SendData8(*s);
	    while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
          }
	  Data++;
          break;

          case 'd':	//十进制
          d = va_arg(ap, int);
          itoa(d, buf, 10);
          for (s = buf; *s; s++) 
	{
	  UART1_SendData8(*s);
	  while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
        }
	Data++;
        break;
	default:
	Data++;
	break;
	}		 
     } /* end of else if */
    else UART1_SendData8(*Data++);
    while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
  }
}


/******************* (C) COPYRIGHT 风驰iCreate嵌入式开发工作室 *****END OF FILE****/