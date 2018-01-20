PImage img;
Table coordonate;
int i;
int x;
int y;


//With Syphone Screen to Resolume
import codeanticode.syphon.*;
SyphonServer server;

// SimpleMidi.pde
import themidibus.*; //Import the library
import javax.sound.midi.MidiMessage; 

MidiBus myBus; 

int midiDevice  = 3;


void setup () {
  i=0;
  frameRate(50);
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");


  MidiBus.list(); 
  myBus = new MidiBus(this, midiDevice, 1);
  size (1280, 720, P2D);
  background (#0F0F0F);
  //smooth(8);
  coordonate = loadTable("ImageOrder.csv", "header");
  println(coordonate.getRowCount() + " total rows in table");
}

void draw () {
  //tint(255, 2);
  // ellipse(x, y, 4, 4);
}

void incremental() {
  {
    TableRow row = coordonate.getRow(i);
    x = row.getInt("x");
    println(x);
    delay(30);
    i++;
    if (i==coordonate.getRowCount()) 
    {
      i=0;
    }
  }
}

void mousePressed() {
  img = loadImage("0000.png");
  image(img, 0, 0);
  server.sendScreen();
}

void midiMessage(MidiMessage message, long timestamp, String bus_name) { 
  int note = (int)(message.getMessage()[1] & 0xFF);
  int vel = (int)(message.getMessage()[2] & 0xFF);
  if (vel > 0) {
    incremental();
  }
}