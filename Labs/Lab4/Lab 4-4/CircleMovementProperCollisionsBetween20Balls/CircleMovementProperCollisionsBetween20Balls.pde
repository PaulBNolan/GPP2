PVector[] circlePos;
PVector[] circleVel;
float[] mass;

float[] radius;
float lengthBetween;

boolean collision = false;
void setup()
{
  size(1200,1200);
  
  circlePos = new PVector[10];
  circleVel = new PVector[10];
  mass = new float[10];
  radius = new float[10];
  
  circlePos[0] = new PVector(width / 2,height / 2,0);
  circleVel[0] = new PVector(random(-20,20),random(-20,20),0);
  mass[0] = 4;
  radius[0] = 50;
  
  circlePos[1] = new PVector(width / 4, height / 4);
  circleVel[1] = new PVector(random(-20,20),random(-20,20));
  mass[1] = 8;
  radius[1] = 75;
  for(int i = 0; i < circlePos.length; i++)
  {
     circlePos[i] = new PVector(width / random(2,10),height / random(2,10),0);
     circleVel[i] = new PVector(random(-20,20),random(-20,20),0);
     mass[i] = random(5,10);
     radius[i] = random(40,75);
  }
}

void draw()
{
  background(0,0,0);
 
  
  //accel.setMag(2 * random(0,5));
  //circleVel.mag();
  //print(circleVel.mag());
  
 // circleVel.add(accel);
 // circleVel.limit(5);
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
    
  ellipse(circlePos[i].x,circlePos[i].y,radius[i],radius[i]);
  }
}
