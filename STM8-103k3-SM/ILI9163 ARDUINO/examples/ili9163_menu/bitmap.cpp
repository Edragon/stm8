
#include <string.h>
#include <ILI9163.h>
#include <util/delay.h>
extern "C"{
#include <pff.h>
#include <diskio.h>
}


#define BUF_SIZE 512
uint8_t bitmap_buf[BUF_SIZE];

typedef struct BMIH { //declares BitMap Info Header structure
  unsigned long biSize;            //Length of bitmap information header (40 bytes for Windows V3 bitmaps)
  unsigned long biWidth;           //Width (pixels)
  unsigned long biHeight;          //Height (pixels)
  unsigned short biPlanes;         //Color planes, always 1
  unsigned short biBitCount;       //Color bits per pixel (1, 4, 8, 16, 24 and 32)
  unsigned long biCompression;     //Compression method, we only read uncompressed (type 0)
  unsigned long biSizeImage;       //Image data length
  unsigned long biXPelsPerMeter;   //Horizontal resolution (pixels per meter)
  unsigned long biYPelsPerMeter;   //Vertical resolution (pixel per meter)
  unsigned long biClrUsed;         //Number of colors, ignored.
  unsigned long biClrImportant;    //Number of important colors, ignored.                                  
}BMP_INFO;

typedef struct BMFH { //declares BitMap File Header structure
  unsigned short bfType;           //Always 0x42 0x4D (hex for BM <-- indicating a bitmap)
  unsigned long  bfSize;           //File size (bytes)
  unsigned short bfReserved1;      //Reserved, ignored
  unsigned short bfReserved2;      //Reserved, ignored
  unsigned long  bfOffBits;        //Location in file of the first bitmap data               
}BMP_HEADER;

uint16_t bitmap_width;
uint16_t bitmap_height;

uint8_t rgb_cnt=0;		
uint8_t pad_len=0;		
uint8_t pad_cnt=0;
uint16_t pixel_cnt = 0;
uint8_t RGB[3];	

void buf_display(uint8_t *buf_ptr, uint16_t count)
{
	uint16_t i;
	uint16_t temp;
	
	for(i=0; i<count; i++)
	{
		if(!pad_cnt){  // skip padding bytes
			RGB[rgb_cnt++]= *(buf_ptr+i);
			if(rgb_cnt==3){
				ILI9163::ILI9163_write_para16(_RGB565(RGB[2], RGB[1], RGB[0]));
				rgb_cnt = 0;
				// check if there is padding data
				if(pad_len){
				pixel_cnt++;
				if(pixel_cnt>= bitmap_width)
				{
      			pad_cnt = 1;
						pixel_cnt = 0;  
				}
			}
		}
   	}
   	else {  // pad bytes
   		if(pad_cnt++>= pad_len) pad_cnt = 0;
   	}
  }
}
      	 



uint8_t bitmap_show(char* pFile)
{

	

  BMP_HEADER *ptr_header;
  BMP_INFO *ptr_info;

  uint8_t res;
  unsigned short br;			// File Read count

  res = pf_open(pFile);
  if (res)
    return res;

  res = pf_read(bitmap_buf, BUF_SIZE, &br);	// read bmp header
  if (res)
    return res;
	
	// set LCD area position
  ILI9163::resetArea();
 	ILI9163::fill(ILI9163::GetWidth()-1, ILI9163::GetHeight()-1, SILVER);
 	
	ptr_header= (BMP_HEADER *)bitmap_buf;
	ptr_info = (BMP_INFO *)(bitmap_buf+sizeof(BMP_HEADER));
	
  if (ptr_header->bfType != 0x4d42 )		// type is 'BM'
    return 0xff;
  

 	if (ptr_info->biWidth       >  128) return 0xff; 
 	if (ptr_info->biHeight      > 160) return 0xff; 
  if (ptr_info->biCompression !=   0) return 0xff; 

	// reset count values
	rgb_cnt=0;		
	pad_cnt=0;
	pixel_cnt = 0;

  // set data
  bitmap_width  = ptr_info->biWidth;
  bitmap_height  = ptr_info->biHeight;
  
  pad_len = (4 - ((bitmap_width*3)%4))%4;
  //pad_len = 1;
  ILI9163::setArea(  (ILI9163::GetWidth()-bitmap_width)>>1, (ILI9163::GetHeight()-bitmap_height)>>1, 
  							 ((ILI9163::GetWidth()+bitmap_width)>>1)-1, ((ILI9163::GetHeight()+bitmap_height)>>1)-1);
   
  
  // first display buffer - need to skip headers
  
  buf_display( bitmap_buf+sizeof(BMP_HEADER)+sizeof(BMP_INFO), br-(sizeof(BMP_HEADER)+sizeof(BMP_INFO)) );
  
  if(br!= BUF_SIZE) return 0;  // very small bitmap?
  
  
  do{
  	res = pf_read((void*)bitmap_buf, BUF_SIZE, &br);		// read data
    buf_display( bitmap_buf,br);
  } while (!res && (br == BUF_SIZE));  				// error or eof 
  
   
 
	return 0;
  
}
/*

uint8_t show_bitmap()
{
	
	 uint8_t res;
  FATFS fs;
   DIR dir;      
  FILINFO file_info;  
//	setup();

  res = disk_initialize();
  if (!res)
    res = pf_mount(&fs);
  
  while(1){
 	
  		res = pf_opendir(&dir, "/");
  	
  	if (!res )
  	{
 
    while(1)
    {
      res = pf_readdir(&dir, &file_info);
      if(res) break; 
       
      if (!file_info.fname[0])
        break;
      if (!(file_info.fattrib & AM_DIR))
      {
        if (strstr(file_info.fname, ".BMP") != 0)
        {
			if(bitmap_show(file_info.fname)==0)          
	      		_delay_ms(5000);
        }
      }
	}
  }
 }
}


*/


  FATFS fs;
  DIR dir;      


uint8_t mount_sd()
{
  uint8_t res;
  ILI9163::resetArea();
  ILI9163::fill(ILI9163::GetWidth()-1, ILI9163::GetHeight()-1, BLACK);

  res = disk_initialize();
  if (!res)
    res = pf_mount(&fs);
    
  return res;
}
  	
	

uint8_t open_root_dir()
{
	return pf_opendir(&dir, "/");
}

uint8_t show_bitmap()
{
	
  uint8_t res;
  FILINFO file_info;  
  
  res = pf_readdir(&dir, &file_info);
  if(res) return res;
       
  if (!file_info.fname[0])
  	return 0x10;     
   
  if (!(file_info.fattrib & AM_DIR))
  {
     if (strstr(file_info.fname, ".BMP") != 0)
     {
		if(bitmap_show(file_info.fname)==0)          
	       return 0;
     }
  }
	
  return 0x20;
}



