/**
* particles following mouse in 3D
*
* @author aa_debdeb
* @date 2016/05/18
*/

float MAX_VEL = 20.0;
float MAX_ACC = 1.0;

ArrayList<Particle> particles;

void setup(){
  size(1280, 720, P3D);
  sphereDetail(16);
  particles = new ArrayList<Particle>();
  for(int i = 0; i < 300; i++){
    particles.add(new Particle());
  }
  noStroke();  
  fill(0, 255, 255);
}

void draw(){
  background(0);
  lights();
  translate(width / 2, height / 2, 0);
  for(Particle p: particles){
    p.display();
    p.update();
  }
}

class Particle{
  
  PVector pos, vel;
 
  Particle(){
    float posSize = random(800);
    float posAng1 = random(PI);
    float posAng2 = random(TWO_PI);
    float posX = posSize * cos(posAng1) * cos(posAng2);
    float posY = posSize * cos(posAng1) * sin(posAng2); 
    float posZ = posSize * sin(posAng1);
    pos = new PVector(posX, posY, posZ);
    float velSize = random(MAX_VEL);
    float velAng1 = random(PI);
    float velAng2 = random(TWO_PI);
    float velX = velSize * cos(velAng1) * cos(velAng1);
    float velY = velSize * cos(velAng1) * sin(velAng2);
    float velZ = velSize * sin(velAng1);
    vel = new PVector(velX, velY, velZ);
  } 
  
  void update(){
    PVector mouse = new PVector(map(mouseX, 0, width, -width / 2, width / 2), map(mouseY, 0, height, -height / 2, height / 2), 0);
    PVector acc = PVector.sub(mouse, pos);
    acc.limit(MAX_ACC);
    vel.add(acc);
    vel.limit(MAX_VEL);
    pos.add(vel);
  }
  
  void display(){
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    sphere(10);
    popMatrix();
  }
}