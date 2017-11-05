Square sp1, sp2, sp3, sp4; // Declare the objects
void setup() {
size(200, 200);
//fullScreen();
smooth();
noStroke();
sp1 = new Square(20, 20, 10, 2); // Construct sp1
sp2 = new Square(40, 30, 10, 3); // Construct sp2
sp3 = new Square(60, 40, 10, 4); // Construct sp3
sp4 = new Square(80, 50, 10, 5); // Construct sp4
}
void draw() {
fill(0, 15);
rect(0, 0, width, height);
fill(255);
sp1.move();
sp2.move();
sp3.move();
sp4.move();
sp1.display();
sp2.display();
sp3.display();
sp4.display();
}