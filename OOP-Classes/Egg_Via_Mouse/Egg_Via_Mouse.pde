Egg humpty; // Declare the object
Egg humpty2; 
void setup() {
size(100, 100);
smooth();
// Inputs: x-coordinate, y-coordinate, tilt, height
humpty = new Egg(70, 100, PI/32, 50);
humpty2 = new Egg(25, 100, PI/32, 40);
}
void draw() {
background(20);
humpty.wobble1();
humpty.display1();
humpty2.wobble2();
humpty2.display();
}