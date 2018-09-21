void setup()
{
  size(1280,1280);
  
  background(0,0,0);
}

void draw()
{

  float x = random(1280);
  float y = random(1280);
  float r = random(400);
 
  fill(random(255),random(255),random(255));
  
  ellipse(x,y,r,r);
  
}
