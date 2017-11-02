Ship nava = new Ship();
Ship nava2 = new Ship(300, 300);

void setup() {
 size(400, 400); 
 stroke(100);
 strokeWeight(2);
 smooth(2);
 fill(230);
}

void draw() {
  background(20);
  drawBg();
  nava.move();
  nava.display();
  nava2.move();
  nava2.display();
}

void drawBg() {
  color(60);
  randomSeed(20);  // same pseudo-random points to be drawn
  for(int i = 0; i < 20; i++) {
    int starX = int(random(width));
    int starY = int(random(height));
    point(starX, starY);
  }
}

float pulseShip() {
  nava.cycle ++;
  nava.cycle %= 360;
  float shipScale = 1 + sin(nava.cycle) * nava.speed / 40;
  return shipScale;
}