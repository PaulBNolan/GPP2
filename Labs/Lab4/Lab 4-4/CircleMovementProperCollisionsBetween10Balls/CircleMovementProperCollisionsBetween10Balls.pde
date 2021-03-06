PVector[] circlePos;
PVector[] circleVel;
float[] mass;

float[] radius;
float[] red;
float[] green;
float[] blue;

float lengthBetween;

boolean collision = false;
void setup()
{
  size(1200,1200);
  
  circlePos = new PVector[10];
  circleVel = new PVector[10];
  mass = new float[10];
  radius = new float[10];
  red = new float[10];
  green = new float[10];
  blue = new float[10];
  
  
  for(int i = 0; i < circlePos.length; i++)
  {
     circlePos[i] = new PVector(width / random(2,10),height / random(2,10),0);
     circleVel[i] = new PVector(random(-20,20),random(-20,20),0);
     mass[i] = random(5,10);
     radius[i] = random(40,75);
     red[i] = random(0,255);
     green[i] = random(0,255);
     blue[i] = random(0,255);
  }
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
      circlePos[i].add(circleVel[i]);
    }
    
    if(circlePos[i].y - radius[i] / 2 < 0 || circlePos[i].y + radius[i]/2 > height)
    {
      circleVel[i].y = -circleVel[i].y;
      circlePos[i].add(circleVel[i]);
    }
  }
  
   lengthBetween = sqrt(pow(circlePos[0].x - circlePos[1].x,2) + pow(circlePos[0].y - circlePos[1].y,2));
  
  for(int i = 0; i < circlePos.length; i++)
  {
    for(int i2 = 0; i2 < circlePos.length; i2++)
    {
      lengthBetween = sqrt(pow(circlePos[i].x - circlePos[i2].x,2) + pow(circlePos[i].y - circlePos[i2].y,2));
      if(lengthBetween < radius[i] / 2 + radius[i2] / 2 && i != i2 && collision != true)
      {
        PVector[] newVectors = new PVector[2];
        
        float v1x = (circleVel[i].x * (mass[i] - mass[i2]) + 2 *(mass[i2] * circleVel[i2].x))/(mass[i] + mass[i2]);
        float v1y = (circleVel[i].y * (mass[i] - mass[i2]) + 2 *(mass[i2] * circleVel[i2].y))/(mass[i] + mass[i2]);
    
        float v2x = (circleVel[i2].x * (mass[i2] - mass[i]) + 2 * (mass[i] * circleVel[i].x))/(mass[i] + mass[i2]);
        float v2y = (circleVel[i2].y * (mass[i2] - mass[i]) + 2 * (mass[i] * circleVel[i].y))/(mass[i] + mass[i2]);
        
        newVectors[0] = new PVector(v1x,v1y);
        newVectors[1] = new PVector(v2x,v2y);
    
        circleVel[i] = newVectors[0];
        circleVel[i2] = newVectors[1];
        collision = true;
      }
    }
  }
  collision = false;
  
  for(int i = 0; i < circlePos.length; i++)
  {
  fill(red[i],green[i],blue[i]);
  ellipse(circlePos[i].x,circlePos[i].y,radius[i],radius[i]);
  }
}
