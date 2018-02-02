circle[] cir = new circle[1];
int n=0;

void setup(){
  size(1280,720);
  cir[0]=new circle();
  n++;
  noCursor();
}

void draw(){
  background(0);
  int num=(int)random(5,10);
  cir=(circle[])expand(cir,n+num);
  for(int i=0;i<n;i++){
    cir[i].move();
  }
  for(int i=n;i<n+num;i++){
    cir[i]= new circle();
    cir[i].make();
  }
  n+=num;
}

class circle{
  float _x=random(-1,1),_y=random(-1,1);
  float R=random(2,4);
  float x=0,y=0;
  int c=620,_c=4;

  void make(){
    noStroke();
    fill(#FFE603);
    ellipse(mouseX,mouseY,R,R);
    x=mouseX;
    y=mouseY;
  }
  
  void move(){
    if(c==0){
      return;
    }
    noStroke();
    fill(#FFE603,c);
    ellipse(x,y,R,R);
    x+=_x;
    y+=_y;
    c-=_c;
  }
  
}