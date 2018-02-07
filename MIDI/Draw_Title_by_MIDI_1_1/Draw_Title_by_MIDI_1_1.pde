//PImage img;
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

int midiDevice  = 13; // 13 from Max 1


void setup () {

  i=0;
  frameRate(50);
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");

  // img = loadImage("Moon.png");
  MidiBus.list(); 
  myBus = new MidiBus(this, midiDevice, 1);
  size (1280, 720, P2D);
  background (#0F0F0F);
  smooth(4);
  coordonate = loadTable("Coordinates_Rand.csv", "header");
  // println(coordonate.getRowCount() + " total rows in table");
}

void draw () {
  //tint(255, 2);
  //ellipse(326, 296, 160, 160); //Black
  //fill(0);
  //ellipse(306, 296, 160, 160); //White
  //fill(255);

  // image(img, 0, 0);
  ellipse(x, y, 4, 4);
  server.sendScreen();
}

void incremental() {
  {
    TableRow row = coordonate.getRow(i);
    x = row.getInt("x");
    y = row.getInt("y");
    // println(x, y);
    delay(30);
    i++;
    if (i==coordonate.getRowCount()) 
    {
      i=0;
    }
  }
}

/*
void mousePressed() {
 TableRow row = coordonate.getRow(i);
 incremental();
 }
 */

void midiMessage(MidiMessage message, long timestamp, String bus_name) { 
  int note = (int)(message.getMessage()[1] & 0xFF);
  int vel = (int)(message.getMessage()[2] & 0xFF);
  if (vel > 0) {
    incremental();
  }
}