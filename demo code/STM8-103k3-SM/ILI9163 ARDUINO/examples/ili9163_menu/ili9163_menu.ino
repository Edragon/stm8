#include <font12x12.h>
#include <ILI9163_Font.h>
#include <ILI9163_Graphics.h>
 
#include <stdlib.h>
#define NUM_MENU_ITEM 4
#define NUM_KEYS	5

//keypad debounce parameter
#define DEBOUNCE_MAX 15
#define DEBOUNCE_ON  10
#define DEBOUNCE_OFF 3 

#define MENU_START_X 20
#define MENU_START_Y 20
#define MENU_WIDTH	90
#define MENU_HEIGHT	20
#define MENU_GAP	2

#define MENU_FONT_COLOR		BLACK
#define MENU_NORMAL_COLOR	GREEN
#define MENU_HIGHLIGHT_COLOR	RED
 
// joystick number
#define UP_KEY 0
#define LEFT_KEY 2
#define CENTER_KEY 1
#define DOWN_KEY 4
#define RIGHT_KEY 3 

ILI9163_Graphics tft;

ILI9163_Font font;
 
// adc preset value, represent top value,incl. noise & margin,that the adc reads, when a key is pressed
// set noise & margin = 30 (0.15V@5V)
int  adc_key_val[5] ={20, 100, 240, 353, 502 };

// debounce counters
byte button_count[NUM_KEYS];
// button status - pressed/released
byte button_status[NUM_KEYS];
// button on flags for user program 
byte button_flag[NUM_KEYS];

void colormap();
void fontmap();
void bitmap();
uint8_t mount_sd();
uint8_t open_root_dir();
uint8_t show_bitmap();
 

typedef struct menu_item{
	uint16_t sx;
	uint16_t sy;
	uint16_t ex;
	uint16_t ey;
	char *str;
	void (*func)(void);
}MENUITEM;



MENUITEM menu[NUM_MENU_ITEM];

char current_menu_item;



void setup()
{
	byte i;
	
	// setup interrupt-driven joystick
	// reset button arrays
	for(byte i=0; i<NUM_KEYS; i++){
    	button_count[i]=0;
     	button_status[i]=0;
     	button_flag[i]=0;
   	}
  
  	// Setup timer2 -- Prescaler/256 - for reading the joystick
  	TCCR2A &= ~((1<<WGM21) | (1<<WGM20));
  	TCCR2B &= ~(1<<WGM22);
  	TCCR2B = (1<<CS22)|(1<<CS21);      
  
  	ASSR |=(0<<AS2);

   	// Use normal mode  
   	TCCR2A =0;    
    //Timer2 Overflow Interrupt Enable  
   	TIMSK2 |= (0<<OCIE2A);
    TCNT2=0x6;  // counting starts from 6;  
   	TIMSK2 = (1<<TOIE2);    
   	SREG|=1<<SREG_I;
	
	tft.initialize(LCD_VERTICAL);
	tft.ClearScreen(WHITE);
	font.set_Font(f12x12);
	 
	for(i=0; i<NUM_MENU_ITEM; i++)
	{
		menu[i].sx = MENU_START_X;
		menu[i].sy = MENU_START_Y + (MENU_HEIGHT + MENU_GAP)*i;
		menu[i].ex = MENU_START_X + MENU_WIDTH;
		menu[i].ey = menu[i].sy + MENU_HEIGHT;
	}
	menu[0].str = PSTR("COLORMAP");
	menu[0].func = colormap;
	
 	menu[1].str = PSTR("FONTMAP");
	menu[1].func = fontmap;
 	menu[2].str = PSTR("BITMAP");
	menu[2].func = bitmap;
 	menu[3].str = PSTR("ABOUT");
	menu[3].func = about;
      current_menu_item = 0;
init_menu();
}

void menu_item_P(uint16_t x1,uint16_t y1, uint16_t x2, uint16_t y2, uint16_t radius, uint16_t color, char* str_P)
{
 	tft.DrawRoundRect(x1,y1,x2,y2, radius, color, 1);
	font.set_Cursor( (x1+x2-font.str_Width_P(str_P))>>1, (y1+y2-font.Font_Height)>>1 );
	font.putstr_P(str_P); 
}

void init_menu()
{
	int i;
	font.set_Color(MENU_FONT_COLOR, MENU_NORMAL_COLOR,1);
        menu_item_P(	menu[0].sx, menu[0].sy, menu[0].ex, menu[0].ey, 3,MENU_HIGHLIGHT_COLOR, menu[0].str);
	for(i=1; i<4; i++)
		menu_item_P(	menu[i].sx, menu[i].sy, menu[i].ex, menu[i].ey, 3,MENU_NORMAL_COLOR, menu[i].str);
		
	current_menu_item = 0;
}

void menu_item(uint16_t x1,uint16_t y1, uint16_t x2, uint16_t y2, uint16_t radius, uint16_t color, char* str)
{
	tft.DrawRoundRect(x1,y1,x2,y2, radius, color, 1);
	font.set_Cursor( (x1+x2-font.str_Width(str))>>1, (y1+y2-font.Font_Height)>>1 );
	font.putstr(str); 
}





 /* loop */

void loop()
{
    byte i;
     for(i=0; i<NUM_KEYS; i++){
       if(button_flag[i] !=0){
            
            button_flag[i]=0;  // reset button flag
			switch(i){

				case UP_KEY:
					// current item to normal display
					menu_item_P(menu[current_menu_item].sx, menu[current_menu_item].sy, menu[current_menu_item].ex, menu[current_menu_item].ey, 3, MENU_NORMAL_COLOR, menu[current_menu_item].str);
					current_menu_item -=1;
					if(current_menu_item <0)  current_menu_item = NUM_MENU_ITEM -1;
					// next item to highlight display
					menu_item_P(menu[current_menu_item].sx, menu[current_menu_item].sy, menu[current_menu_item].ex, menu[current_menu_item].ey, 3, MENU_HIGHLIGHT_COLOR, menu[current_menu_item].str);
			 
					break;
				case DOWN_KEY:
					// current item to normal display
					menu_item_P(menu[current_menu_item].sx, menu[current_menu_item].sy, menu[current_menu_item].ex, menu[current_menu_item].ey, 3, MENU_NORMAL_COLOR, menu[current_menu_item].str);
			
					current_menu_item +=1;
					if(current_menu_item >(NUM_MENU_ITEM-1))  current_menu_item = 0;
					// next item to highlight display
					menu_item_P(menu[current_menu_item].sx, menu[current_menu_item].sy, menu[current_menu_item].ex, menu[current_menu_item].ey, 3, MENU_HIGHLIGHT_COLOR, menu[current_menu_item].str);
			
					break;
				case LEFT_KEY:
                  			init_menu();
					current_menu_item = 0;
					break;   
				case RIGHT_KEY:
        			      tft.ClearScreen(WHITE); 
                                      (*(menu[current_menu_item].func))();
				 	 
          			tft.ClearScreen(WHITE);
				 	init_menu();
					current_menu_item = 0;           
					break;	
			}
				
		}
    }
     
}

 


 


void colormap()
{
	uint8_t i,j,k;
	// draw a clolormap
	uint16_t color;
	tft.ClearScreen(WHITE);
	
	randomSeed(analogRead(1));
	
	// draw 256 (16x16) boxes, each with 8x8 pixels, with random color
	for(i=0; i<16; i++){		
	  for(j=0; j<16; j++){
			 
	    color = random(0,65535);
            tft.FastSolidRect(i*8, j*8, (i+1)*8, (j+1)*8, color );
	  }		
	}
	
	
	
	waitfor_OKkey();
	
}
void fontmap()
{
	char i,row;
	
        row=0;
 	tft.FastSolidRect( 10,10, 120,130,  YELLOW);
	
	font.set_Cursor(10, 10);
	for(i=font.Font_FirstChar; i<= font.Font_LastChar; i++)
	{
		if(font.CharWidth(i) !=0)
		{
			 if( (font.CursorX + font.CharWidth(i)) > 120)
			 {
			 		row++;
			 		
			 		 
			 		font.set_Cursor(10, 10+ (row* font.Font_Height));
			 	}
			 
                font.putChar(i);
		}
	}
	
	
	waitfor_OKkey();
	
}




void bitmap()
{
	uint8_t res;
	char temp[10];
	tft.ClearScreen(WHITE);
    		res = mount_sd();
		if(res) {
		    menu_item_P(	20, 40, 100, 80 , 5, MENU_HIGHLIGHT_COLOR, PSTR("Cannot mount SDcard"));
                   waitfor_OKkey();
                  }
		else
		{
			if(open_root_dir()) return;
			while(1){
				res= show_bitmap();
				if(!res){				
				//	if(wait_for_input()==1) {
				//		tft.ClearScreen(WHITE);
				//		break;  // ok button is pressed, break the loop
				//	}
				}
				else if(res==0x10)  // reopen root dir 
				{
						break;
				}	
					
			}
		}
			
			
	 
	 	waitfor_OKkey();
	 
	
}

void about()
{
  
    
    
}

 // waiting for center key press
void waitfor_OKkey(){
  byte i;
  byte key = 0xFF;
  
   menu_item_P(20, 135, 100, 155, 4, MENU_NORMAL_COLOR, PSTR("OK" ));
	while (key!= CENTER_KEY){
    for(i=0; i<NUM_KEYS; i++){
       if(button_flag[i] !=0){
           button_flag[i]=0;  // reset button flag
           if(i== CENTER_KEY) key=CENTER_KEY;
        }
     }
   }
		
}


// The followinging are interrupt-driven keypad reading functions
//  which includes DEBOUNCE ON/OFF mechanism, and continuous pressing detection


// Convert ADC value to key number
char get_key(unsigned int input)
{
	char k;
    
	for (k = 0; k < NUM_KEYS; k++)
	{
		if (input < adc_key_val[k])
		{
           
    return k;
        }
	}
    
    if (k >= NUM_KEYS)
        k = -1;     // No valid key pressed
    
    return k;
}

void update_adc_key(){
  int adc_key_in;
  char key_in;
  byte i;
  
  adc_key_in = analogRead(0);
  key_in = get_key(adc_key_in);
  for(i=0; i<NUM_KEYS; i++)
  {
    if(key_in==i)  //one key is pressed 
    { 
      if(button_count[i]<DEBOUNCE_MAX)
      {
        button_count[i]++;
        if(button_count[i]>DEBOUNCE_ON)
        {
          if(button_status[i] == 0)
          {
            button_flag[i] = 1;
            button_status[i] = 1; //button debounced to 'pressed' status
          }
		  
        }
      }
	
    }
    else // no button pressed
    {
      if (button_count[i] >0)
      {  
		button_flag[i] = 0;	
		button_count[i]--;
        if(button_count[i]<DEBOUNCE_OFF){
          button_status[i]=0;   //button debounced to 'released' status
        }
      }
    }
    
  }
}

// Timer2 interrupt routine -
// 1/(160000000/256/(256-6)) = 4ms interval

ISR(TIMER2_OVF_vect) {  
  TCNT2  = 6;
  update_adc_key();
}





