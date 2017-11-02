float diameter; 
float angle = 0;

void setup() {
  size(640, 360);
  diameter = 10;
  noStroke();
  noStroke();
  fill(255, 204, 0);
}

void draw() {
  
  background(0);

  float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  ellipse(width/2, height/2, d2, d2);
  angle += 0.22;
}