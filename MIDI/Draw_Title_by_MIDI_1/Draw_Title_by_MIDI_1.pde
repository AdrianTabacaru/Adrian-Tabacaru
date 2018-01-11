PImage img;
float transparency = 255;
Table coordonate;
int i;
//With Syphone Screen to Resolume
import codeanticode.syphon.*;
SyphonServer server;

// SimpleMidi.pde
import themidibus.*; //Import the library
import javax.sound.midi.MidiMessage; 

MidiBus myBus; 

int currentColor = 0;
float xpos = 0;
float ypos = 0;
float fill = 0;
float scale = 0;
int midiDevice  = 9;


void setup () {
   frameRate(50);
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
  
  img = loadImage("Moon.png");
  MidiBus.list(); 
  myBus = new MidiBus(this, midiDevice, 1);
  size (1280, 720, P2D);
  background (#0F0F0F);
  smooth(8);
  coordonate = loadTable("coordonate.csv", "header");
  println(coordonate.getRowCount()-1 + " total rows in table"); // de pus ceva care sa opreasca numaratoarea cand ajunge la maxim
}

void draw () {

  //tint(255, 2);
  image(img, 0, 0);
  server.sendScreen();
}

void mousePressed() {
  TableRow row = coordonate.getRow(i);
  int x = row.getInt("x");
  int y = row.getInt("y");
  ellipse(x, y, 4, 4);
  i++;
  println(x, y);
}

void midiMessage(MidiMessage message, long timestamp, String bus_name) { 
  int note = (int)(message.getMessage()[1] & 0xFF);
  int vel = (int)(message.getMessage()[2] & 0xFF);
  if (note > 0) {
    TableRow row = coordonate.getRow(i);
    int x = row.getInt("x");
    int y = row.getInt("y");
    ellipse(x, y, 4, 4);
    i++;
    println (note);
    println(x, y);
  }
}