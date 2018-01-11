/**
* particles in vortices
*
* @author aa_debdeb
* @date 2016/07/29
*/

ArrayList<Vortex> vortices;
ArrayList<Particle> particles;

void setup(){
  size(1280, 720);
  vortices = new ArrayList<Vortex>();
  for(int i = 0;  i < 15; i++){
    vortices.add(new Vortex());
  }
  particles = new ArrayList<Particle>();
  for(int i = 0;  i < 7000; i++){
    particles.add(new Particle());
  }
  background(0);
}

void draw(){
  noStroke();
  fill(0, 100);
  rect(0, 0, width, height);
  
  noStroke();
  fill(255, 255, 230, 150);
  for(Particle p: particles){
    p.display();
    p.update();
  }
}

class Particle{
  PVector loc;
  
  Particle(){
    float size = map(sqrt(random(1)), 0, 1, 0, 400);
    float angle = random(TWO_PI);
    loc = new PVector(size * cos(angle) + width / 2, size * sin(angle) + height / 2);
  }
  
  void display(){
    ellipse(loc.x, loc.y, 2, 2);
  }
  
  void update(){
    PVector force = new PVector(0, 0);
    for(Vortex v: vortices){
      float d = PVector.dist(loc, v.loc);
      if(d < v.range){
        PVector f = PVector.sub(loc, v.loc);
        f.normalize();
        f.mult(map(d, 0, v.range, 1, 0));
        if(v.clockwise){
          f.rotate(HALF_PI);
        } else {
          f.rotate(-HALF_PI);        
        }
        force.add(f);
      }
    }
    force.limit(10);
    loc.add(force);
  }
  
}

class Vortex{
  PVector loc;
  float range;
  boolean clockwise;
  Vortex(){
    loc = new PVector(random(width), random(height));
    range = random(100, 300);
    clockwise = random(1) < 0.5 ? true: false;
  }
}