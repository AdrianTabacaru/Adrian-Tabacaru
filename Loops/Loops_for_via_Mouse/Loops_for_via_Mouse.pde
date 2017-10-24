//Loops - For - via Mouse
void setup (){
    size (100, 100);}             // set the screen size to 100x100 pixels

int N = 50;
int drawX = 0;

void draw() {
  if (mousePressed == true) {
    for (int drawX = 0; drawX < N; drawX+=6)
line(drawX, 0, drawX, 100);
    } else {
line(drawX, 0, drawX, 100);
  }
}