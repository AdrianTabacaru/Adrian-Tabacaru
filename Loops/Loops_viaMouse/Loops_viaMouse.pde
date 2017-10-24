//Loops - while - via Mouse
void setup (){
    size (300, 100);}             // set the screen size to 300x100 pixels
    
int N = 0;
int drawX = 0;

void draw() {
  if (mousePressed == true) {
   while (drawX < N)   
line(drawX, 0, drawX, 100);
drawX = drawX + 1;
  } else {
line (drawX, 0, drawX, 100);
  } 
}