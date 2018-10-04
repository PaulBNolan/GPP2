PVector circlePos;
PVector circleVel;
float mass;

float radius;
float red;
float green;
float blue;

PImage guard;
int guardScale;
PVector guardPosition;
PVector guardVelocity;
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
  
  guard = loadImage("Assets/GuardSprite.png");
  guardScale = 1;
  guardPosition = new PVector(width/4, height/4);
  guardVelocity = new PVector(1,0);
}

void draw()
{
  background(0,0,0);
  
  guardPosition.x += guardVelocity.x;
  print(guardPosition.x, "\n");
  if((guardPosition.x > (-width/4) && guardScale == -1) || guardPosition.x > (width / 4) * 3)
  {
    //print(guardPosition.x);
    guardScale = -guardScale;
    //guardVelocity.x = -guardVelocity.x;
    guardPosition.x = -guardPosition.x - guard.width;
  }
  
  fill(red,green,blue);
  ellipse(circlePos.x,circlePos.y,radius,radius);
  
  //pushMatrix();
  scale(guardScale,1.0);
  image(guard,guardPosition.x, guardPosition.y);
  //popMatrix();
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
