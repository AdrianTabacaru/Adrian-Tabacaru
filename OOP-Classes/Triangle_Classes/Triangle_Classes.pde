Triangle tr1, tr2, tr3, tr4;
void setup() {
size(300, 300);
//fullScreen();
smooth();
frameRate(50);
noStroke();

tr1 = new Triangle (250, 20, 0);
tr2 = new Triangle (10, 150, 0);
tr3 = new Triangle (250, 240, 0);
tr4 = new Triangle (100, 200, 0);
}

void draw() {
  fill(0, 20);
  rect(0,0, width, height);
  fill(255);
  tr1.rotation();
  tr2.rotation();
  tr3.rotation();
  tr4.rotation();
  tr1.display();
  tr2.display();
  tr3.display();
  tr4.display();
}