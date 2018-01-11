//With Syphone Screen to Resolume
import codeanticode.syphon.*;
SyphonServer server;
import de.voidplus.leapmotion.*; 
LeapMotion leap; 

circle[] cir = new circle[1];
int n=0;

ArrayList<PVector> points; 
PVector fp; 
int time = millis();

void setup() {
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
  size(1280, 720, P3D);
  frameRate(50);
  background(0);

  cir[0]=new circle();
  n++;
  //noCursor();

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

  int num=(int)random(5, 10);
  cir=(circle[])expand(cir, n+num);
  for (int i=0; i<n; i++) {
    cir[i].move();
  }
  for (int i=n; i<n+num; i++) {
    cir[i]= new circle();
    cir[i].make();
  }
  n+=num;

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
class circle {
  float _x=random(-1, 1), _y=random(-1, 1);
  float R=random(2, 4);
  float x=0, y=0;
  int c=220, _c=4;

  void make() {
    noStroke();
    fill(255);
    ellipse(mouseX, mouseY, R, R);
    x=mouseX;
    y=mouseY;
  }

  void move() {
    if (c==0) {
      return;
    }
    noStroke();
    fill(255, 255, 255, c);
    ellipse(x, y, R, R);
    x+=_x;
    y+=_y;
    c-=_c;
  }

  void keyPressed() {
    if (key == 32) {
      points = new ArrayList<PVector>();
    }
  }
}