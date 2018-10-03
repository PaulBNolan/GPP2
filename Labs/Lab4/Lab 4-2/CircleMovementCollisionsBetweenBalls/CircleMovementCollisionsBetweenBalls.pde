PVector[] circlePos;
PVector[] circleVel;

float radius;
float lengthBetween;
float seconds;

boolean collision = false;
void setup()
{
  size(1280,1280);
  
  circlePos = new PVector[2];
  circleVel = new PVector[2];
  
  circlePos[0] = new PVector(width / 2,height / 2,0);
  circleVel[0] = new PVector(random(-20,20),random(-20,20),0);
  
  circlePos[1] = new PVector(width / 4, height / 4);
  circleVel[1] = new PVector(random(-20,20),random(-20,20));
  
  radius = 100;
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
  
  if(circlePos[i].x - radius /2 < 0 || circlePos[i].x + radius / 2> width)
  {
    circleVel[i].x = -circleVel[i].x;
  }
  
  if(circlePos[i].y - radius / 2 < 0 || circlePos[i].y + radius / 2 > height)
  {
    circleVel[i].y = -circleVel[i].y;
  }
  }
  
  lengthBetween = sqrt(pow(circlePos[0].x - circlePos[1].x,2) + pow(circlePos[0].y - circlePos[1].y,2));
  
  if(lengthBetween < radius && collision == false)
  {
    fill(255,0,0);
    collision = true;
   seconds = millis();
  }
  
  if(seconds <= millis() - 1000)
  {
    fill(255,255,255);
    collision = false;
  }
  for(int i = 0; i < circlePos.length; i++)
  {
    
  ellipse(circlePos[i].x,circlePos[i].y,radius,radius);
  }
}
