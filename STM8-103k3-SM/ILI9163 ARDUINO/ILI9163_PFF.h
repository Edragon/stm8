#ifndef _ILI9163_PFF_H_
#define _ILI9163_PFF_H_


extern "C"
{
  #include <inttypes.h>
  #include "integer.h"
  #include "pff.h"
  #include "diskio.h"
}


class ILI9163_PFF
{
  public:
    FATFS fs;
    ILI9163_PFF();
   
};


#endif 
