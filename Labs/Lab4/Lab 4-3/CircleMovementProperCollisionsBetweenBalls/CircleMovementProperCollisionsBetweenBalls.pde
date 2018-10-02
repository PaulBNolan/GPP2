PVector[] circlePos;
PVector[] circleVel;
float[] mass;

float[] radius;
float lengthBetween;

boolean collision = false;
void setup()
{
  size(640,640);
  
  circlePos = new PVector[2];
  circleVel = new PVector[2];
  mass = new float[2];
  radius = new float[2];
  
  circlePos[0] = new PVector(width / 2,height / 2,0);
  circleVel[0] = new PVector(random(-20,20),random(-20,20),0);
  mass[0] = 4;
  radius[0] = 50;
  
  circlePos[1] = new PVector(width / 4, height / 4);
  circleVel[1] = new PVector(random(-20,20),random(-20,20));
  mass[1] = 8;
  radius[1] = 75;
}

void draw()
{
  background(0,0,0);
 
  for(int i = 0; i < circlePos.length; i++)
  {
  circlePos[i].add(circleVel[i]);
  
  if(circlePos[i].x - radius[i] /2 < 0 || circlePos[i].x + radius[i]/2 > width)
  {
    circleVel[i].x = -circleVel[i].x;
  }
  
  if(circlePos[i].y - radius[i] / 2 < 0 || circlePos[i].y + radius[i]/2 > height)
  {
    circleVel[i].y = -circleVel[i].y;
  }
  }
  
   lengthBetween = sqrt(pow(circlePos[0].x - circlePos[1].x,2) + pow(circlePos[0].y - circlePos[1].y,2));
  
  if(lengthBetween < radius[0] / 2 + radius[1] / 2 && collision == false)
  {
    PVector[] newVectors = new PVector[2];
    
    float v1x = (circleVel[0].x * (mass[0] - mass[1]) + 2 *(mass[1] * circleVel[1].x))/(mass[0] + mass[1]);
    float v1y = (circleVel[0].y * (mass[0] - mass[1]) + 2 *(mass[1] * circleVel[1].y))/(mass[0] + mass[1]);
    
    float v2x = (circleVel[1].x * (mass[1] - mass[0]) + 2 * (mass[0] * circleVel[0].x))/(mass[0] + mass[1]);
    float v2y = (circleVel[1].y * (mass[1] - mass[0]) + 2 * (mass[0] * circleVel[0].y))/(mass[0] + mass[1]);
    
    newVectors[0] = new PVector(v1x,v1y);
    newVectors[1] = new PVector(v2x, v2y);
    
    circleVel[0] = newVectors[0];
    circleVel[1] = newVectors[1];
    
    
    collision = true;
  }
  
  else if(lengthBetween > radius[0] / 2 + radius[1] / 2 && collision == true)
  {
    collision = false;
  }
  
  for(int i = 0; i < circlePos.length; i++)
  {
    
  ellipse(circlePos[i].x,circlePos[i].y,radius[i],radius[i]);
  }
}
