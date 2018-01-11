/**
* particles with repultion
*
* @author aa_debdeb
* @date 2016/06/14
*/

float G = 200.0;
float MAX_VEL = 5.0;
float MAX_ACC = 1.0;
ArrayList<Particle> particles;

void setup(){
  size(1280, 720);
  particles = new ArrayList<Particle>();
}

void draw(){
  background(60);
  for(Particle p1: particles){
    for(Particle p2: particles){
      if(p1 != p2){
        p1.addForce(p2);
      }
    }
  }
  for(Particle p: particles){
    p.update();
    p.display();
  }
}

void mousePressed(){
  particles.add(new Particle(mouseX, mouseY));  
}

class Particle{

  PVector pos, vel, acc;
  
  Particle(float x, float y){
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }
  
  void addForce(Particle p){
    float d = sq(pos.dist(p.pos));
    PVector force = PVector.sub(pos, p.pos);
    force.normalize();
    force.mult(G / d);
    acc.add(force);  
  }
  
  void display(){
    noStroke();
    fill(255, 255, 0, 200);
    ellipse(pos.x, pos.y, 20, 20);
    fill(255, 200);
    ellipse(pos.x, pos.y, 5, 5);    
  }
  
  void update(){
    acc.limit(MAX_ACC);
    vel.add(acc);
    vel.limit(MAX_VEL);
    acc = new PVector(0, 0);
    pos.add(vel);
    if(pos.x < 0){
      vel.x *= -1;
      pos.x += vel.x;
    }
    if(pos.x >= width){
      vel.x *= -1;
      pos.x += vel.x;
    }
    if(pos.y < 0){
      vel.y *= -1;
      pos.y += vel.y;
    }
    if(pos.y >= width){
      vel.y *= -1;
      pos.y += vel.y;
    }
  }
}