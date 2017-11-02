import oscP5.*;
import netP5.*;

int shipX, shipY; 
float shipScale, shipAngle, shipSpeed; {

}
  
OscP5 oscP5;
NetAddress myRemoteLocation;
void setup () {
size (800, 400);
//fullScreen();
frameRate(25);

  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
}

void draw () {
  drawBackground();
  moveShip();
  rotateShip();
  drawShip();
}

void drawBackground() {
 background(0);
 randomSeed(42);
 for (int i=0; i<20; i++) {
   int starX = (int)random(width);
   int starY = (int)random(height);
   point(starX, starY);
 }
}

void drawShip() {
  translate(shipX, shipY);
  scale(1);
  rotate(shipAngle);
  triangle(20, 0, -20, 0, 0, -50);
  triangle(20, 0, -20, 0, 0, -30);
  triangle(20, 0, 20, 20, -20, -50);
  ellipse(20, 20, 10, 10);
}

void moveShip() {
if (keyPressed && key == ' ') { 
shipSpeed = 10;
}else if (shipSpeed > 0){
  shipSpeed = shipSpeed - 0.5;
}
  shipX = shipX + (int)(shipSpeed * sin(shipAngle));
  shipY = shipY + (int)(-shipSpeed * cos(shipAngle));

  if (shipX > width) shipX = 0;
  if (shipX < 0) shipX = width;
  if (shipY > height) shipY = 0;
  if (shipY < 0) shipY = height;
  
  }
void rotateShip() {
  shipAngle = mouseX / 30.;
}

//scale in functie de speed

//String Click = "OSC1";
void mousePressed() {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("OSC1");
  
  //myMessage.add(Click); /* add an int to the osc message */

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 
}



  