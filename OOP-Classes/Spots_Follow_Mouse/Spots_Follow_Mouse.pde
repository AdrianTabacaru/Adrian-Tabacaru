//With Syphone Screen to Resolume
import codeanticode.syphon.*;
SyphonServer server;
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

int numSpots = 20;
// Declare and create the array
Spot[] spots = new Spot[numSpots]; 
void setup() {
size(1280, 720, P2D);
  frameRate(50);
 // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
 /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
   myRemoteLocation = new NetAddress("127.0.0.1",12000);
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
/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());
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
server.sendScreen();
}
}
}