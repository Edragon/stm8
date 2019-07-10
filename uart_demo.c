1.系统时钟初始化为内部16M


  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);    //时钟   初始化时钟为1分频 16M   2分频8M

2.初始化串口
  UART1_DeInit();
  UART1_Init((u32)9600, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO, UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
  
  UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);

  UART1_Cmd(ENABLE);
  enableInterrupts(); 



3.编写主函数

void main(void)
{
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  Init_UART1();
  enableInterrupts(); 
 /* Infinite loop */
  while (1)
  {
    if(flagpacker)
    {
      flagpacker = 0;
      
      for(unsigned char num = 0; num < length;num++)
        Send(Rxpacker[num]);
    }
  }
}






4.编写中断服务函数

unsigned char flagpacker;   //全局变量    是否完整接收一个数据包  
unsigned char Rxpacker[255];    //全局变量    完整数据包 
unsigned char length;    //数据长度
 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 unsigned char RxBuf;                                             //临时接收  
  static unsigned char RxData[255];//接收数据缓存区  
  static unsigned char count;                                     //串口接收数据长度  
  static unsigned char rec;  //  判断是否正在接收数据
   UART1_ClearITPendingBit(UART1_IT_RXNE);
   RxBuf = UART1_ReceiveData8();
   
  if(RxBuf == (0xcc))  //帧头
  {  
    rec= 1;  
    count = 0;  
    flagpacker = 0;  
    return ;  
  }  
  if(RxBuf  == (0xcd))  //帧尾
  {  
    rec= 0;  
    //此处可以添加校验码  
    length = count;
    for(unsigned char i = 0; i<count;i++)  
    {  
      Rxpacker[i] =RxData[i];  
    }  
    flagpacker = 1;//告诉系统已接收一个完整的数据包   
    return ;  
  }  
  if(rec)                                              //判断是否处于接收状态  
  {  
    RxData[count++] = RxBuf;  
  }    
 }