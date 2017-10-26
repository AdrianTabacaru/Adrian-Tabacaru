float speed;
boolean freeze;
void setup () {
  size (100, 100);
}
int x, y;

void draw () {
  if (freeze == false) {

    //background (200); //sterge linia cu un fundal peste
    speed = pow(x-mouseX, 2) + pow(y-mouseY, 2); //a^2 este pow(a,2)
    line (mouseX, 0, mouseX, speed/2 +10);
    //text(speed, 10, 10); 
  } else background (200);
x = mouseX;
y = mouseY;
}
void mousePressed() {
  freeze = !freeze;
}