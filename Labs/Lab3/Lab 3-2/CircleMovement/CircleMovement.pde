PVector circlePos;
PVector circleVel;
PVector accel;

PVector mouse;

void setup()
{
  size(1280,1280);
  
  circlePos = new PVector(0,0,0);
  circleVel = new PVector(0,0,0);
}

void draw()
{
  background(255,255,255);
  
  mouse = new PVector(mouseX,mouseY);
  


  accel = mouse.sub(circlePos);
  
  accel.setMag(1.6);
  //circleVel.mag();
  //print(circleVel.mag());
  
  circleVel.add(accel);
  circleVel.limit(5);
  
  circlePos.add(circleVel);
  
  ellipse(circlePos.x,circlePos.y,40,40);
}
