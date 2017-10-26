int shipX, shipY; 
float shipScale, shipAngle, shipSpeed;

void setup () {
// size (400, 400);
fullScreen();

stroke(150);
strokeWeight(3);
shipX = width/2;
shipY = height/2;

}
  
void draw () {
  drawBackground();
  moveShip();
  rotateShip();
  drawShip();
}

void drawBackground() {
 background(0);
 randomSeed(42);
 for (int i=0; i<20; i++) {
   int starX = (int)random(width);
   int starY = (int)random(height);
   point(starX, starY);
 }
}

void drawShip() {
  translate(shipX, shipY);
  scale(1);
  rotate(shipAngle);
  triangle(20, 0, -20, 0, 0, -50);
}

void moveShip() {
if (keyPressed && key == ' ') { 
shipSpeed = 10;
}else if (shipSpeed > 0){
  shipSpeed = shipSpeed - 0.5;
}
  shipX = shipX + (int)(shipSpeed * sin(shipAngle));
  shipY = shipY + (int)(-shipSpeed * cos(shipAngle));

  if (shipX > width) shipX = 0;
  if (shipX < 0) shipX = width;
  if (shipY > height) shipY = 0;
  if (shipY < 0) shipY = height;
  
  }
void rotateShip() {
  shipAngle = mouseX / 30.;
}

//scale in functie de speed