PVector circlePos;
PVector circleVel;
float mass;

float radius;
float red;
float green;
float blue;

float lengthBetween;

boolean collision = false;
void setup()
{
  size(1200,1200);
  
  circlePos = new PVector(width/2,height/2);
  circleVel = new PVector(2,2);
  //mass = new float[10];
  radius = 50.0f;
  red = random(0,255);
  green = random(0,255);
  blue = random(0,255);
  
}

void draw()
{
  background(0,0,0);
  
  fill(red,green,blue);
  ellipse(circlePos.x,circlePos.y,radius,radius);
  
}

void keyPressed()
{
  if(keyCode == UP)
  {
    circlePos.y -= circleVel.y;
  }
  
  if(keyCode == DOWN)
  {
    circlePos.y += circleVel.y;
  }
  
  if(keyCode == LEFT)
  {
    circlePos.x -= circleVel.x;
  }
  
  if(keyCode == RIGHT)
  {
    circlePos.x += circleVel.x;
  }
}
