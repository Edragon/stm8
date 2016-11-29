#ifndef __ILI9163_H__
#define __ILI9163_H__



//LCD²ÎÊý
#define uint8 	unsigned char
#define uint16 	unsigned short int
#define uint32	unsigned long int
#define int8	signed char
#define int16	signed short int
#define int32 	signed long int
#define uint64	signed long long int
#define int64	signed long long int
 	
void ILI9163B_write_para16(uint16 dat);
void ILI9163B_write_command(uint8 cmd);
void ILI9163B_write_para8(uint8 dat);

/*
#define TRUE 	0xFF
#define FALSE	0x00
#define OK		0xFF
#define ERROR	0x00
#define NULL	0x00*/
#endif