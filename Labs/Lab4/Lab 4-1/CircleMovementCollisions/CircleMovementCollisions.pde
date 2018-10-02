PVector[] circlePos;
PVector[] circleVel;

float radius;

void setup()
{
  size(1280,1280);
  
  circlePos = new PVector[2];
  circleVel = new PVector[2];
  
  circlePos = new PVector(width / 2,height / 2,0);
  circleVel = new PVector(random(-10,10),random(-10,10),0);
  
  circlePos2 = new PVector(width / 4, height / 4);
  circleVel2 = new PVector(random(-10,10),random(-10,10));
  
  radius = 40;
}

void draw()
{
  background(0,0,0);
 
  
  //accel.setMag(2 * random(0,5));
  //circleVel.mag();
  //print(circleVel.mag());
  
 // circleVel.add(accel);
 // circleVel.limit(5);
  
  circlePos.add(circleVel);
  
  if(circlePos.x - radius /2 < 0 || circlePos.x + radius / 2> width)
  {
    circleVel.x = -circleVel.x;
  }
  
  if(circlePos.y - radius / 2 < 0 || circlePos.y + radius / 2 > height)
  {
    circleVel.y = -circleVel.y;
  }
  
  ellipse(circlePos.x,circlePos.y,radius,radius);
}
