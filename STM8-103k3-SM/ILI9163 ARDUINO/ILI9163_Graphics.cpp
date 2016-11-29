/* 	ILI9163_Graphics.h -- High-level graphic routines for TFT panel					*/ 
/* 	Author- xy																	*/
/* 	Web - www.nuelectronics.com													*/
/*	Version - v0.1																*/
/*	Date - 10/04/2010															*/


#include "ILI9163_Graphics.h"


ILI9163_Graphics::ILI9163_Graphics()
{
	
}

void ILI9163_Graphics::initialize(uint8_t orient)
{
	 
	ILI9163::SetColor(WHITE);
	ILI9163::Init(orient);
}

void ILI9163_Graphics::SetOrientation(uint8_t orient)
{	
	ILI9163::SetOrientation(orient);
	}
void ILI9163_Graphics::SetOrient(uint8_t orientation)
{
	ILI9163::SetOrientation(orientation);
	
}


void ILI9163_Graphics::SetCursor(uint16_t x, uint16_t y){
	ILI9163::gotoXY(x,y);
}

void ILI9163_Graphics::ClearScreen(uint16_t color){

	
	ILI9163::resetArea();
	ILI9163::fill(ILI9163::GetWidth()-1, ILI9163::GetHeight()-1, color);
}


// fast solid rectangle draw method
void ILI9163_Graphics::FastSolidRect(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2, uint16_t color){
	ILI9163::setArea(x1,y1,x2,y2);
	 
	ILI9163::fill(x2-x1+1, y2-y1+1, color);
	ILI9163::resetArea();

}

void ILI9163_Graphics::DrawPixel(uint16_t x, uint16_t y, uint16_t color){
	ILI9163::putPixel(x,y, color);
}


void ILI9163_Graphics::VerticalScroll(int16_t y){
	//ILI9163::Scroll(y);
}

void ILI9163_Graphics::DrawLine(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2, uint16_t color){
	
	if(x1==x2)  // vertical line
	{
		FastSolidRect(x1,y1,x2, y2, color);
	}
	else if(y1==y2)  // horizontal line  
	{
		FastSolidRect(x1,y1,x2, y2, color);
	}
	else // any line - use Bresenham line drawing algorithm
	{
		int dy = y2 - y1; 
		int dx = x2 - x1; 
		int stepx, stepy; 
		if (dy < 0) { dy = -dy;  stepy = -1; } else { stepy = 1; } 
		if (dx < 0) { dx = -dx;  stepx = -1; } else { stepx = 1; } 
 
		dy <<= 1;        // dy is now 2*dy 
		dx <<= 1;        // dx is now 2*dx 
 
		DrawPixel(x1, y1, color); 
 
		if (dx > dy) { 					// the line is more horizontal than vertical
			int fraction = dy - (dx >> 1);  // same as 2*dy - dx 
			while (x1!= x2) { 
				if (fraction >= 0) { 
					y1 += stepy; 
					fraction -= dx;    // same as fraction -= 2*dx 
				} 
				x1 += stepx; 
 
				fraction += dy;    // same as fraction -= 2*dy 
				DrawPixel(x1, y1, color); 
			} 
		} 
		else { 							// the line is more vertical than horizontal
			int fraction = dx - (dy >> 1); 
			while (y1 != y2) { 
				if (fraction >= 0) { 
					x1 += stepx; 
					fraction -= dy; 
				} 
				y1 += stepy; 
				fraction += dx; 
				DrawPixel(x1, y1, color); 
			}
		} 
 	} 
 }
		
void ILI9163_Graphics::DrawCircle(uint16_t x, uint16_t y, uint16_t radius, uint16_t color, uint8_t fill)
{
	int xoff, yoff, balance;
	
	xoff = 0;
	yoff = radius;
	balance = -radius;
	
	while (xoff <= yoff) {
		if(!fill){   // no fill - draw pixel in 8 octants 
			DrawPixel(x+xoff, y+yoff, color);
			DrawPixel(x-xoff, y+yoff, color);
			DrawPixel(x-xoff, y-yoff, color);
			DrawPixel(x+xoff, y-yoff, color);
			DrawPixel(x+yoff, y+xoff, color);
			DrawPixel(x-yoff, y+xoff, color);
			DrawPixel(x-yoff, y-xoff, color);
			DrawPixel(x+yoff, y-xoff, color);
		}
		else{  // fill - draw 4 horizontal line to link 8 octant points
			
			DrawLine(x-xoff, y+yoff, x+xoff, y+yoff, color);
			DrawLine(x-xoff, y-yoff, x+xoff, y-yoff, color);
			DrawLine(x-yoff, y+xoff, x+yoff, y+xoff, color);
			DrawLine(x-yoff, y-xoff, x+yoff, y-xoff, color);
		}
			
		if ((balance += xoff++ + xoff)>= 0) {
			balance-= 	2*(yoff-1);//(--yoff)+yoff;
			yoff--;
		}
	}
}


void ILI9163_Graphics::DrawRect(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2,  uint16_t color, uint8_t fill)
{

 	if(!fill){   // draw 4 lines
		DrawLine(x1,y1,x2,y1,color);
		DrawLine(x2,y1,x2,y2,color);
		DrawLine(x1,y2,x2,y2,color);
		DrawLine(x1,y1,x1,y2,color);
	}
	else{
		FastSolidRect(x1,y1,x2,y2,color);
	}
	 
}

void ILI9163_Graphics::DrawRoundRect(uint16_t x1, uint16_t y1, uint16_t x2, uint16_t y2, uint16_t radius, uint16_t color, uint8_t fill)
{

	
	if(!radius)  // simple rectangle
	{
		if(!fill){   // draw 4 lines
			DrawLine(x1,y1,x2,y1,color);
			DrawLine(x2,y1,x2,y2,color);
			DrawLine(x1,y2,x2,y2,color);
			DrawLine(x1,y1,x1,y2,color);
		}
		else{
			FastSolidRect(x1,y1,x2,y2,color);
		}
	}
	else
	{
		int xoff, yoff, balance;
		int x1_R, y1_R, x2_R, y2_R;
		xoff = 0;
		yoff = radius;
		balance = -radius;
		
		x1_R = x1+radius;
		y1_R = y1+radius;
		x2_R = x2-radius;
		y2_R = y2-radius;
	
		// first draw the rectangle area
		if(!fill){
			DrawLine(x1_R,y1,x2_R,y1,color);
			DrawLine(x2,y1_R,x2,y2_R,color);
			DrawLine(x1_R,y2,x2_R,y2,color);
			DrawLine(x1,y1_R,x1,y2_R,color);
		}
		else{
			FastSolidRect(x1,y1_R,x2,y2_R,color);
		}
		
		while (xoff <= yoff) {
			if(!fill){   // no fill - draw pixel in 8 octants 
				DrawPixel(x2_R+xoff, y2_R+yoff,  color);
				DrawPixel(x1_R-xoff, y2_R+yoff, color);
				DrawPixel(x1_R-xoff, y1_R-yoff, color);
				DrawPixel(x2_R+xoff, y1_R-yoff, color);
				DrawPixel(x2_R+yoff, y2_R+xoff, color);
				DrawPixel(x1_R-yoff, y2_R+xoff, color);
				DrawPixel(x1_R-yoff, y1_R-xoff, color);
				DrawPixel(x2_R+yoff, y1_R-xoff, color);
			}
			else{  // fill - draw 4 horizontal line to link 8 octant points
			
				DrawLine(x1_R-xoff, y2_R+yoff, x2_R+xoff, y2_R+yoff, color);
				DrawLine(x1_R-xoff, y1_R-yoff, x2_R+xoff, y1_R-yoff, color);
				DrawLine(x1_R-yoff, y2_R+xoff, x2_R+yoff, y2_R+xoff, color);
				DrawLine(x1_R-yoff, y1_R-xoff, x2_R+yoff, y1_R-xoff, color);
			}
			
			if ((balance += xoff++ + xoff)>= 0) {
				balance-= 2* (yoff-1);  //--yoff+yoff;
				yoff--;
			}
		}		
	}

}