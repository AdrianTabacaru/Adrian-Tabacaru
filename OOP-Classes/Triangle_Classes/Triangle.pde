class Triangle {
  float x = 200; 
  float y = 400;
  float rotation;
  
 Triangle(float xpos, float ypos, float rot) {
    x = xpos;
    y = ypos;
    rotation = rot;
  }
  void rotation() {
x += sin(x * y*20);
y += cos(x * y*20);

  }
  void display() {
    if (mousePressed == true) {
    triangle (y, x, mouseX, mouseY, x, x);
  }else{
    triangle (mouseY, mouseX, mouseX, mouseY, x, y);

  }
  }
}
  