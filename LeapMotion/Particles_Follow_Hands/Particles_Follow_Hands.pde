//With Syphone Screen to Resolume
import codeanticode.syphon.*;
SyphonServer server;
import de.voidplus.leapmotion.*; 
LeapMotion leap; 

float handX, handY, handZ;

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

  noStroke();
}

void draw() {
  server.sendScreen();
  if (millis() > time + 1600)
  {
    time = millis();
    points = new ArrayList<PVector>();
  }


  for (Hand hand : leap.getHands()) {

    handX=hand.getPosition().x;
    handY=hand.getPosition().y;
   // handZ=hand.getPosition().z;
  }

  background(0);

  int num=(int)random(5, 10);
  int total=constrain(n+num, 0, 226);



  for (int i=n-1; i>=0; i--) {
    if (cir[i].move()==false) {
      for (int j=i+1; j<n; j++) {
        cir [j-1]=cir[j];
      }
      cir=(circle[])shorten(cir);
      n--;
      //   println(n);
    }
  }

  cir=(circle[])expand(cir, total);
  for (int i=n; i<total; i++) {
    cir[i]= new circle();
    cir[i].make();
  }
  n=total;
}
class circle {
  float _x=random(-1, 1), _y=random(-1, 1);
  float R=random(2, 6);
  float x=0, y=0;
  int c=250, _c=10;


  void make() {
    noStroke();
    fill(#F2CA00);
    ellipse(handX, handY, R, R);
    x=handX;
    y=handY;
  }


  boolean move() {
    if (c==0) {
      return false;
    }
    noStroke();
    fill(#F2CA00, c-50);
    ellipse(x, y, 6, 6);
    x+=_x;
    y+=_y;
    c-=_c;
    return true;
  }
}