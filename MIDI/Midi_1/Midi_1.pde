// SimpleMidi.pde

import themidibus.*; //Import the library
import javax.sound.midi.MidiMessage; 

MidiBus myBus; 


int currentColor = 0;
float xpos = 0;
float ypos = 0;
float fill = 0;
float scale = 0;
int midiDevice  = 3;


void setup() {
  size(1280, 720);
  MidiBus.list(); 
  myBus = new MidiBus(this, midiDevice, 1);
}

void draw() {

  background(0);
  ellipse (xpos, ypos, scale, scale);
  fill(fill);
  stroke(255);
}

void midiMessage(MidiMessage message, long timestamp, String bus_name) { 
  int note = (int)(message.getMessage()[1] & 0xFF) ;
  int vel = (int)(message.getMessage()[2] & 0xFF);


  //notes x Position mapped to width
  float  x1 = map(note, 0, width, -250, 16000);
  if (note > 0) {
    xpos = note+x1;
  }

  //notes Fixed Y position

  //C2
  if (note == 84 ) {
    ypos = 100;
  }
  //H2
  if (note == 83 ) {
    ypos = 110;
  }
  //G2
  if (note == 79 ) {
    ypos = 130;
  }
  //E2
  if (note == 76 ) {
    ypos = 150;
  }
  //C1
  if (note == 72 ) {
    ypos = 170;
  }
  //H1
  if (note == 71 ) {
    ypos = 180;
  }
  //G1
  if (note == 67 ) {
    ypos = 200;
  }
  //A1
  if (note == 33 ) {
    ypos = 600;
  }

//Velocity mapped to fill intensity
  if (vel > 0) {
    fill = vel*2;
  }
  
  //Velocity mapped to scale
  if (vel > 0) {
    scale = vel/2;
  }
  //println("Bus " + bus_name + ": Note "+ note + ", vel " + vel);
  println (note);
}