//With Syphone Screen to Resolume
import codeanticode.syphon.*;
SyphonServer server;


int numSpots = 20;
// Declare and create the array
Spot[] spots = new Spot[numSpots]; 
void setup() {
size(1280, 720, P2D);
  frameRate(50);
 // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
//fullScreen();
smooth();
noStroke();
//noCursor();
for (int i = 0; i < spots.length; i++) {
float x = 1 + i*72;
float rate = 2 + i*0.25;
// Create each object
spots[i] = new Spot(x, 50, 16, rate);
}
}

void draw() {
fill(0, 12);
rect(0, 0, width, height);
fill(255);
for (int i = 1; i < spots.length; i++) {
spots[i].move(); // Move each object
if (mousePressed == true) {
spots[i].display1(); // Display each object
}else{ 
spots[i].display(); // Display each object
//Send Screen to Resolume

}
server.sendScreen();
}
}