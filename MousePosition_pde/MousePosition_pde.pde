/**
 * Datatype Conversion. 
 * 
 * It is sometimes beneficial to convert a value from one type of 
 * data to another. Each of the conversion functions converts its parameter 
 * to an equivalent representation within its datatype. 
 * The conversion functions include int(), float(), char(), byte(), and others. 
 */

void setup() {
size(640, 360);
background(0);
noStroke();

textFont(createFont("SourceCodePro-Regular.ttf",24));
}

//println(a);
void draw () {
  int a = mouseX;
  int b = mouseY;

background(0);

  text("The value of variable A is " + a, 20, 60);
  text("The value of variable b is " + b, 20, 30);
}