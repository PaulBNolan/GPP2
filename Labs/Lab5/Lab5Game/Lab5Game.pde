PVector circlePos;
PVector circleVel;
PVector playerRelativePosition;
float mass;

float radius;
float red;
float green;
float blue;

PImage guard;
int guardScale;
PVector guardPosition;
PVector guardVelocity;
PVector guardDirection;
float fieldOfView;
void setup()
{
  size(1200,1200);
  
  circlePos = new PVector(width/2,height/2);
  circleVel = new PVector(20,20);
  //mass = new float[10];
  radius = 50.0f;
  red = random(0,255);
  green = random(0,255);
  blue = random(0,255);
  
  guard = loadImage("Assets/GuardSprite.png");
  guardScale = 1;
  guardPosition = new PVector(width/4, height/4);
  guardVelocity = new PVector(1,0);
  guardDirection = new PVector(1,0);
}

void draw()
{
  background(0,0,0);
  
  guardPosition.x += guardVelocity.x;
  if((guardPosition.x > (-width/4) && guardScale == -1) || guardPosition.x > (width / 4) * 3)
  {
    //print(guardPosition.x);
    guardScale = -guardScale;
    //guardVelocity.x = -guardVelocity.x;
    guardPosition.x = -guardPosition.x - guard.width;
  }
  
  if(guardPosition.x > 0)
  {
  playerRelativePosition = new PVector(circlePos.x - guardPosition.x,circlePos.y - guardPosition.y - guard.height / 2);
  }
  else
  {
    playerRelativePosition = new PVector(-circlePos.x - guardPosition.x,circlePos.y - guardPosition.y - guard.height / 2);
  }
  fieldOfView = (guardDirection.x * playerRelativePosition.x) - (guardDirection.y * playerRelativePosition.y);
  
  
  fill(red,green,blue);
  
  if(fieldOfView > 0)
  {
    PVector normalisedDirection = new PVector(
    guardDirection.x/sqrt(sq(guardDirection.x) + sq(guardDirection.y)),
    guardDirection.y/sqrt(sq(guardDirection.x) + sq(guardDirection.y)));
    
    PVector normalisedRelative = new PVector(
    playerRelativePosition.x/sqrt(sq(playerRelativePosition.x) + sq(playerRelativePosition.y)),
    playerRelativePosition.y/sqrt(sq(playerRelativePosition.x) + sq(playerRelativePosition.y)));
    
    float angleR = acos(normalisedDirection.x * normalisedRelative.x + normalisedDirection.y * normalisedRelative.y);
    float angleD = degrees(angleR);
    if(angleD <= 60.0f)
    {
      fill(120,120,120);
    }
    print(angleD, "\n");
  }
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
