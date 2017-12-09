ArrayList<PVector> 
  a=new ArrayList();
void setup() {
  size(400, 400);
  stroke(255);
}
void draw() {
  background(0);
  for (int i=0; i<a.size(); i++) {
    a.get(i).y++;
    a.get(i).x+=width;
    a.get(i).x%=width;
    point(a.get(i).x, a.get(i).y);
  }
  if (mousePressed)a.add(new PVector(mouseX, mouseY, 0));
}