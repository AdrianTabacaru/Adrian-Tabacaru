Triangle tr1, tr2, tr3, tr4;
void setup() {
size(500, 500);
//fullScreen();
smooth();
frameRate(50);
noStroke();

tr1 = new Triangle (650, 60);
tr2 = new Triangle (650, 60);
//tr3 = new Triangle (0, 0);
//tr4 = new Triangle (0, 0);
}

void draw() {

  fill(0, 10);
  rect(0,0, width, height);
  fill(255);
  pushMatrix();
  tr1.rotation1();
  tr1.display();
  popMatrix();
  pushMatrix();
  tr2.rotation2();
  tr2.display();
  popMatrix();
//tr3.rotation1();
//tr4.rotation1();
  

//tr3.display();
//tr4.display();

}