class Egg {
float x, y; // X-coordinate, y-coordinate
float tilt; // Left and right angle offset
float angle; // Used to define the tilt
float scalar; // Height of the egg
// Constructor
Egg(int xpos, int ypos, float t, float s) {
x = xpos;
y = ypos;
tilt = t;
scalar = s / 100.0;
}
void wobble1() {
tilt = cos(angle) / 2;
angle += 0.1;
}
void wobble2() {
tilt = cos(angle) / 8;
angle += 0.3;
}
void display1() {
noStroke();
fill(255);
pushMatrix();
translate(mouseX, mouseY+30);
rotate(tilt);
scale(scalar);
beginShape();
vertex(0, -100);
bezierVertex(25, -100, 40, -65, 40, -40);
bezierVertex(40, -15, 25, 0, 0, 0);
bezierVertex(-25, 0, -40, -15, -40, -40);
bezierVertex(-40, -65, -25, -100, 0, -100);
endShape();
popMatrix();
}
void display() {
noStroke();
fill(255);
pushMatrix();
translate(x, y);
rotate(tilt);
scale(scalar);
beginShape();
vertex(0, -100);
bezierVertex(25, -100, 40, -65, 40, -40);
bezierVertex(40, -15, 25, 0, 0, 0);
bezierVertex(-25, 0, -40, -15, -40, -40);
bezierVertex(-40, -65, -25, -100, 0, -100);
endShape();
popMatrix();
}
}