// Particles, by Daniel Shiffman.

ParticleSystem ps;
PImage sprite;  

void setup() {
  size(1280, 720, P2D);
  orientation(LANDSCAPE);
  sprite = loadImage("sprite.png");
  ps = new ParticleSystem(36);

  // Writing to the depth buffer is disabled to avoid rendering
  // artifacts due to the fact that the particles are semi-transparent
  // but not z-sorted.
  hint(DISABLE_DEPTH_MASK);
} 

void draw () {
  background(0);
  ps.update();
  ps.display();
  
  ps.setEmitter(mouseX,mouseY);
  
  /*
  fill(255);
  textSize(16);
  text("Frame rate: " + int(frameRate), 10, 20);
  */
}