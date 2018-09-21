
float[] randomCounts;
color[] colorarray;

void setup() {
  size(1280,768);
  randomCounts = new float[1280];
  colorarray = new color[1280];
  
  for (int x = 0; x < randomCounts.length; x++) {
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    colorarray[x] = color(r,g,b);
  }

}

void draw() {
  background(255);
  
  float val = randomGaussian();
  
   float sd = 36;
  
  // Pick a random number and increase the count
  //int index = int(random(randomCounts.length));
  
  float mean = width/2;
  
  float a = (val * sd) + mean;
  
  randomCounts[int(a)] += 5;
  
  // Draw a rectangle to graph results
  stroke(0);
  strokeWeight(0);

  for (int x = 0; x < randomCounts.length; x++) 
  {
   fill(colorarray[x]);
   rect(x,height - randomCounts[x],1,randomCounts[x]);
  } 
}
