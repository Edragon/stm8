/*************************************
              今明电子
凡在本店购买满30元，下次购买即可返还5角；
      满50元，下次购买即可返还1元；
     满100元，下次购买即可返还2元；
     满150元，下次购买即可返还4元；
      满200元，下次购买即可免邮
http://shop106001793.taobao.com/search.htm?spm=a1z10.5.w5002-3375901029.1.l1TXSl&search=y
              stm8s105
               V1.1
             2013.9.8
**************************************/

#include "spi.h"
#include "ALL_Includes.h"

 
/*********************************************
函数功能：SPI初始化
输入参数：无
输出参数：无
备    注：无
*********************************************/
void SPI_Init(void)
{   
    SPI_IOConfig(); 
  
    SPI->CR1 |= BIT(2)|BIT(1)|BIT(0);//主设备，高位先发，2分频
    
    SPI->CR2 |= BIT(1)|BIT(0);//nss软件管理  
    SPI->CR2 &=~(BIT(2)|BIT(7));//双线单向模式、全双工
    
    SPI->CR1 |= BIT(6); //使能SPI BIT(6)
   
}


/*********************************************
函数功能：SPI读写函数
输入参数：Data：需要写入的数据
输出参数：无
备    注：无
*********************************************/
u8 SPI_RW(u8 Data)
{

   while(!(SPI->SR&0X02));//等待发送缓冲区为空
   SPI->DR =Data;
   
   while(!(SPI->SR&0X01));//等待接收缓冲区为非空
   return (SPI->DR);      
}


/*********************************************
函数功能：SPI IO初始化
输入参数：无
输出参数：无
备    注：无
*********************************************/
void SPI_IOConfig(void)
{
     //设置SPI_SCK为输出
    SPI_SCK_GPIO->DDR  |=  SPI_SCK ;//输出模式
    SPI_SCK_GPIO->CR1  |=  SPI_SCK ;//推挽输出
    
     //设置PC6SPI_MOSI为输出
    SPI_MOSI_GPIO->DDR |=  SPI_MOSI;//输出模式
    SPI_MOSI_GPIO->CR1 |=  SPI_MOSI;//推挽输出
  
      //设置SPI_CS为输出
    SPI_CS_GPIO->DDR   |=  SPI_CS;//输出模式
    SPI_CS_GPIO->CR1   |=  SPI_CS;//推挽输出
    
       //设置SPI_MISO为输入
    SPI_MISO_GPIO->DDR &= ~SPI_MISO;//输入模式
    SPI_MISO_GPIO->CR1 |=  SPI_MISO;//上拉输入

}