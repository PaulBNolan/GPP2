PVector pos1;
PVector pos2;
PVector relativePos;

float mag;

void setup()
{
  size(640,640);
  
  pos1 = new PVector(0,0);
  
  pos2 = new PVector(0,0); 
  
  relativePos = new PVector(0,0);
  
  mag = 0;
}

void draw()
{
  background(255,255,255);
  line(pos1.x,pos1.y,pos2.x,pos2.y);
  
  if(pos1.x != 0 && pos1.y != 0 && pos2.x != 0 && pos2.y != 0 && mag == 0)
  {
    print("Vector 1 { ",pos1.x,", ", pos1.y,"}");
    print("Vector 2 { ",pos2.x,", ", pos2.y,"}");
    
    relativePos.x = pos2.x - pos1.x;
    relativePos.y = pos2.y - pos1.y;
    
    print(  relativePos.mag());
  }
}

void mouseClicked()
{
   if(pos1.x == 0 && pos1.y == 0)
  {
    pos1 = new PVector(mouseX,mouseY);
  }
  else if(pos2.x == 0 && pos2.y == 0)
  {
    pos2 = new PVector(mouseX, mouseY);
  }
}
