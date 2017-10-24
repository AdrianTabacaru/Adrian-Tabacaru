float speed;
boolean freeze;
void setup () {
  size (100, 100);
}
int x = mouseX;
int y = mouseY;

void draw () {
  if (freeze == false) {
    //background (200); //sterge linia cu un fundal peste
    speed = pow(x-y, 2) + pow(x-y, 2); //a^2 este pow(a,2)
    line (mouseX, 0, mouseX, speed/2 + 100);
    //text(speed, 10, 10); 
  } else background (200);
}
void mousePressed() {
  freeze = !freeze;
}