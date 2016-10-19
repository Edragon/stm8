   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     .const:	section	.text
   5  0000               __vectab:
   6  0000 82            	dc.b	130
   8  0001 00            	dc.b	page(__stext)
   9  0002 0000          	dc.w	__stext
  10  0004 82            	dc.b	130
  12  0005 00            	dc.b	page(f_TRAP_IRQHandler)
  13  0006 0000          	dc.w	f_TRAP_IRQHandler
  14  0008 82            	dc.b	130
  16  0009 00            	dc.b	page(f_TLI_IRQHandler)
  17  000a 0000          	dc.w	f_TLI_IRQHandler
  18  000c 82            	dc.b	130
  20  000d 00            	dc.b	page(f_AWU_IRQHandler)
  21  000e 0000          	dc.w	f_AWU_IRQHandler
  22  0010 82            	dc.b	130
  24  0011 00            	dc.b	page(f_CLK_IRQHandler)
  25  0012 0000          	dc.w	f_CLK_IRQHandler
  26  0014 82            	dc.b	130
  28  0015 00            	dc.b	page(f_EXTI_PORTA_IRQHandler)
  29  0016 0000          	dc.w	f_EXTI_PORTA_IRQHandler
  30  0018 82            	dc.b	130
  32  0019 00            	dc.b	page(f_EXTI_PORTB_IRQHandler)
  33  001a 0000          	dc.w	f_EXTI_PORTB_IRQHandler
  34  001c 82            	dc.b	130
  36  001d 00            	dc.b	page(f_EXTI_PORTC_IRQHandler)
  37  001e 0000          	dc.w	f_EXTI_PORTC_IRQHandler
  38  0020 82            	dc.b	130
  40  0021 00            	dc.b	page(f_EXTI_PORTD_IRQHandler)
  41  0022 0000          	dc.w	f_EXTI_PORTD_IRQHandler
  42  0024 82            	dc.b	130
  44  0025 00            	dc.b	page(f_EXTI_PORTE_IRQHandler)
  45  0026 0000          	dc.w	f_EXTI_PORTE_IRQHandler
  46  0028 82            	dc.b	130
  48  0029 00            	dc.b	page(f_NonHandledInterrupt)
  49  002a 0000          	dc.w	f_NonHandledInterrupt
  50  002c 82            	dc.b	130
  52  002d 00            	dc.b	page(f_NonHandledInterrupt)
  53  002e 0000          	dc.w	f_NonHandledInterrupt
  54  0030 82            	dc.b	130
  56  0031 00            	dc.b	page(f_SPI_IRQHandler)
  57  0032 0000          	dc.w	f_SPI_IRQHandler
  58  0034 82            	dc.b	130
  60  0035 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_BRK_IRQHandler)
  61  0036 0000          	dc.w	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
  62  0038 82            	dc.b	130
  64  0039 00            	dc.b	page(f_TIM1_CAP_COM_IRQHandler)
  65  003a 0000          	dc.w	f_TIM1_CAP_COM_IRQHandler
  66  003c 82            	dc.b	130
  68  003d 00            	dc.b	page(f_TIM2_UPD_OVF_BRK_IRQHandler)
  69  003e 0000          	dc.w	f_TIM2_UPD_OVF_BRK_IRQHandler
  70  0040 82            	dc.b	130
  72  0041 00            	dc.b	page(f_TIM2_CAP_COM_IRQHandler)
  73  0042 0000          	dc.w	f_TIM2_CAP_COM_IRQHandler
  74  0044 82            	dc.b	130
  76  0045 00            	dc.b	page(f_TIM3_UPD_OVF_BRK_IRQHandler)
  77  0046 0000          	dc.w	f_TIM3_UPD_OVF_BRK_IRQHandler
  78  0048 82            	dc.b	130
  80  0049 00            	dc.b	page(f_TIM3_CAP_COM_IRQHandler)
  81  004a 0000          	dc.w	f_TIM3_CAP_COM_IRQHandler
  82  004c 82            	dc.b	130
  84  004d 00            	dc.b	page(f_NonHandledInterrupt)
  85  004e 0000          	dc.w	f_NonHandledInterrupt
  86  0050 82            	dc.b	130
  88  0051 00            	dc.b	page(f_NonHandledInterrupt)
  89  0052 0000          	dc.w	f_NonHandledInterrupt
  90  0054 82            	dc.b	130
  92  0055 00            	dc.b	page(f_I2C_IRQHandler)
  93  0056 0000          	dc.w	f_I2C_IRQHandler
  94  0058 82            	dc.b	130
  96  0059 00            	dc.b	page(f_UART2_TX_IRQHandler)
  97  005a 0000          	dc.w	f_UART2_TX_IRQHandler
  98  005c 82            	dc.b	130
 100  005d 00            	dc.b	page(f_UART2_RX_IRQHandler)
 101  005e 0000          	dc.w	f_UART2_RX_IRQHandler
 102  0060 82            	dc.b	130
 104  0061 00            	dc.b	page(f_ADC1_IRQHandler)
 105  0062 0000          	dc.w	f_ADC1_IRQHandler
 106  0064 82            	dc.b	130
 108  0065 00            	dc.b	page(f_TIM4_UPD_OVF_IRQHandler)
 109  0066 0000          	dc.w	f_TIM4_UPD_OVF_IRQHandler
 110  0068 82            	dc.b	130
 112  0069 00            	dc.b	page(f_EEPROM_EEC_IRQHandler)
 113  006a 0000          	dc.w	f_EEPROM_EEC_IRQHandler
 114  006c 82            	dc.b	130
 116  006d 00            	dc.b	page(f_NonHandledInterrupt)
 117  006e 0000          	dc.w	f_NonHandledInterrupt
 118  0070 82            	dc.b	130
 120  0071 00            	dc.b	page(f_NonHandledInterrupt)
 121  0072 0000          	dc.w	f_NonHandledInterrupt
 122  0074 82            	dc.b	130
 124  0075 00            	dc.b	page(f_NonHandledInterrupt)
 125  0076 0000          	dc.w	f_NonHandledInterrupt
 126  0078 82            	dc.b	130
 128  0079 00            	dc.b	page(f_NonHandledInterrupt)
 129  007a 0000          	dc.w	f_NonHandledInterrupt
 130  007c 82            	dc.b	130
 132  007d 00            	dc.b	page(f_NonHandledInterrupt)
 133  007e 0000          	dc.w	f_NonHandledInterrupt
 193                     	xdef	__vectab
 194                     	xref	f_EEPROM_EEC_IRQHandler
 195                     	xref	f_TIM4_UPD_OVF_IRQHandler
 196                     	xref	f_ADC1_IRQHandler
 197                     	xref	f_UART2_TX_IRQHandler
 198                     	xref	f_UART2_RX_IRQHandler
 199                     	xref	f_I2C_IRQHandler
 200                     	xref	f_TIM3_CAP_COM_IRQHandler
 201                     	xref	f_TIM3_UPD_OVF_BRK_IRQHandler
 202                     	xref	f_TIM2_CAP_COM_IRQHandler
 203                     	xref	f_TIM2_UPD_OVF_BRK_IRQHandler
 204                     	xref	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 205                     	xref	f_TIM1_CAP_COM_IRQHandler
 206                     	xref	f_SPI_IRQHandler
 207                     	xref	f_EXTI_PORTE_IRQHandler
 208                     	xref	f_EXTI_PORTD_IRQHandler
 209                     	xref	f_EXTI_PORTC_IRQHandler
 210                     	xref	f_EXTI_PORTB_IRQHandler
 211                     	xref	f_EXTI_PORTA_IRQHandler
 212                     	xref	f_CLK_IRQHandler
 213                     	xref	f_AWU_IRQHandler
 214                     	xref	f_TLI_IRQHandler
 215                     	xref	f_TRAP_IRQHandler
 216                     	xref	f_NonHandledInterrupt
 217                     	xref	__stext
 236                     	end
