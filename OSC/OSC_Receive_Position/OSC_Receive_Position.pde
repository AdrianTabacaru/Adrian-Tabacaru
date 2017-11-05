
import oscP5.*;
import netP5.*;

OscP5 oscP5;
float x, y;

void setup() {
  size(400, 400);
  //fullScreen();
  oscP5 = new OscP5(this, 16000);
}

void draw() {
  background(255);
  ellipse(x+50, -y+350, 100, 100);
  fill(0);
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.addrPattern().equals("/rollFromMax")) {
    x = theOscMessage.get(0).intValue();
  }else if (theOscMessage.addrPattern().equals("/pitchFromMax")) {
    y = theOscMessage.get(0).intValue();
  }
}