//With Syphone Screen to Resolume
import codeanticode.syphon.*;
SyphonServer server;

PImage img;
float transparency = 255;
Table coordonate;
int x = 0;
int y = 0;
int i;

// SimpleMidi.pde
import themidibus.*; //Import the library
import javax.sound.midi.MidiMessage; 

MidiBus myBus; 

int midiDevice  = 9;

void setup () {

  size (1280, 720, P2D);
  frameRate(50);
  background (#0F0F0F);
  smooth(8);

  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");

  img = loadImage("Moon.png");

  MidiBus.list(); 
  myBus = new MidiBus(this, midiDevice, 1);

  coordonate = loadTable("coordonate.csv", "header");
  println(coordonate.getRowCount()-1 + " total rows in table"); // de pus ceva care sa opreasca numaratoarea cand ajunge la maxim
}

void draw () {
  TableRow row = coordonate.getRow(i);
  x = row.getInt("x");
  y = row.getInt("y");
  ellipse(x, y, 4, 4);
  i++;
  //tint(255, 2);
  image(img, 0, 0);
  server.sendScreen();
}

/*
void mousePressed() {
 TableRow row = coordonate.getRow(i);
 x = row.getInt("x");
 y = row.getInt("y");
 ellipse(x, y, 4, 4);
 i++;
 println(x, y);
 }
 */

void midiMessage(MidiMessage message, long timestamp, String bus_name) { 
  int note = (int)(message.getMessage()[1] & 0xFF);
  int vel = (int)(message.getMessage()[2] & 0xFF);
  if (note > 0) {
    ellipse(x, y, 4, 4);
    i++;
    println (note);
    println(x, y);
  }
}