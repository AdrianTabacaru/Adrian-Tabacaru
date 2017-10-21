
void setup() {
size(300, 300);
smooth();
noStroke();
}
void draw() {
frameRate(50);
background(126);
ellipse(mouseX*2, mouseY+0, 33, 33); // mouseX+offset or mouseX*2 for scaling offset
}