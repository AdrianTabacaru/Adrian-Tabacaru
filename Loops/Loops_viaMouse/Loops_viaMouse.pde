//Loops - while - via Mouse
void setup () {
  size (300, 100);
}             // set the screen size to 300x100 pixels

int N = 50;


void draw() {
  
  if (mousePressed == true) {
    background(250);
    int drawX = 0;
    while (drawX <= mouseX) {
      line(drawX, 0, drawX, 100);
      drawX = drawX + 10;
    }
  }
}