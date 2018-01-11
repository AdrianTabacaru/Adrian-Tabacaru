//With Syphone Screen to Resolume
import codeanticode.syphon.*;
SyphonServer server;
import de.voidplus.leapmotion.*; 
LeapMotion leap; 
ArrayList<PVector> points; 
PVector fp; 
int time = millis();

void setup() {
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
  size(1280, 720, P3D);
  frameRate(50);
  background(0);
  leap = new LeapMotion(this);
  points = new ArrayList<PVector>(); 


  smooth(8);
  noStroke();
}

void draw() {
  server.sendScreen();
  if (millis() > time + 1666)
  {
    time = millis();
    points = new ArrayList<PVector>();
  }


  background(0);
  int fps = leap.getFrameRate();
  frameRate(fps);
  for (Hand hand : leap.getHands()) {
    for (Finger finger : hand.getFingers()) {
      fp   = finger.getPosition(); 

      if (fp.z <= 30) {
        fill(25);
        ellipse(fp.x, fp.y, constrain(fp.z, 10, 20), constrain(fp.z, 10, 20));
      } else if (fp.z > 30) {
        points.add(new PVector(fp.x, fp.y));
      }
    }
  }
  for (int i = points.size()-1; i >= 0; i--) {
    PVector p = points.get(i);
    fill(255);
    ellipse(p.x, p.y, 3, 3);
  }
}

void keyPressed() {
  if (key == 32) {
    points = new ArrayList<PVector>();
  }
}