void setup() {
  size(640, 360); 
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(0); 
  fill(255, 200);
  rect(mouseX, height/2, mouseY/2, mouseY/2);
  fill(100, 200);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/2, (inverseY/2), (inverseY/2));
}