//With Syphone Screen to Resolume
import codeanticode.syphon.*;
SyphonServer server;

PImage img;
void setup () {

  size (1280, 720, P2D);
  frameRate(50);
  background (#0F0F0F);
  smooth(8);
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");

  img = loadImage("Moon.png");
}


void draw() {
  image(img, 0, 0);
server.sendScreen();
}