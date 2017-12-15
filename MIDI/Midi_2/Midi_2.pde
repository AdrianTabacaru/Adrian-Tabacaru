//With Syphone Screen to Resolume
import codeanticode.syphon.*;
SyphonServer server;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
import themidibus.*; 
import javax.sound.midi.MidiMessage; 

MidiBus myBus; 

int currentColor = 0;
float xpos = 0;
float ypos = 0;
float fill = 0;
float scale = 0;
//float pScale = 0;
//int midiDevice  = 3; // From USB MIDI IN
int midiDevice  = 7; // From Max 1

ArrayList<PVector> 
  a=new ArrayList();

void setup() {
  size(1280, 720, P2D);
  frameRate(50);
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);

  smooth();
  stroke(255);
  MidiBus.list(); 
  myBus = new MidiBus(this, midiDevice, 1);
}

void draw() {

  background(0);
  ellipse (xpos, ypos, scale, scale);
  fill(fill);
  stroke(255);
  for (int i=0; i<a.size(); i++) {


    //From Top to Bottom
    a.get(i).y++;
    a.get(i).x+=width;
    a.get(i).x%=width;
    ellipse(a.get(i).x, a.get(i).y, 10, 10);
  }
}

void midiMessage(MidiMessage message, long timestamp, String bus_name) { 
  int note = (int)(message.getMessage()[1] & 0xFF) ;
  int vel = (int)(message.getMessage()[2] & 0xFF);


  //notes x Position mapped to width
  float  x1 = map(note, 0, width, -250, 16000);
  /*
if (vel > 0) {
   pScale = vel/3;
   }
   */

  if (note > 0) {
    xpos = note+x1;
  }
  if (note > 0) {
    ypos = 20;
  }


  //Velocity mapped to fill intensity
  if (vel > 0) {
    fill = vel*2;
  }

  //Velocity mapped to scale
  if (vel > 0) {
    scale = vel/2;
  }
  if (note>0)a.add(new PVector(xpos, ypos, 20));

  //println("Bus " + bus_name + ": Note "+ note + ", vel " + vel);
  println (note);
}