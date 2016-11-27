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

#ifndef __spi_h
#define __spi_h

#include "stm8s.h"
#include "spi.h"


void SPI_Init(void);
u8 SPI_RW(u8 Data);
void SPI_IOConfig(void);

#define SPI_CS               (1<<4)
#define SPI_SCK              (1<<5)
#define SPI_MOSI             (1<<6)
#define SPI_MISO             (1<<7)

#define SPI_CS_GPIO          GPIOC
#define SPI_MISO_GPIO        GPIOC
#define SPI_MOSI_GPIO        GPIOC
#define SPI_SCK_GPIO         GPIOC


#endif