class Ship {
  float x, y, angle, speed;
  int cycle;
  
  Ship() {
    x = random(width); 
    y = random(height);
  }
  Ship(float _x, float _y) {
  x = _x;
  y = _y;
    
}
  void move() {
    if (keyPressed) {
    if (key == ' ') { // accelerate
      speed = 3;
    }
  } else if (speed > 0) {
      speed -= 0.2;
  }
  angle += float(mouseX - pmouseX) / 20;
  x += speed * sin(angle);
  y -= speed * cos(angle);
    // screen edges
  if (x > width) x = 0;
  if (x < 0) x = width;
  if (y > height) y = 0;
  if (y < 0) y = height;
 }
 
  void display() {
  pushMatrix();
  translate(x, y);
  rotate(angle);
  scale(pulseShip());
  beginShape();
  vertex(-20, 0);
  bezierVertex(13, -15, 0, -30, 0, -30);
  bezierVertex(0, -30, -13, -15, 20, 0);
  vertex(-20, 0);
  endShape();
  popMatrix();
  }
}