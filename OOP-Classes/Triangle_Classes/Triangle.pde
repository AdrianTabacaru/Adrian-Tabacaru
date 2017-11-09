class Triangle {
  float x = 200; 
  float y = 400;
  
 Triangle (float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }
  void rotation1() {

translate(width/2,height/2);
rotate(frameCount*radians(120) / 10);
translate(-100, 0);

  }
    void rotation2() {
translate(width/2,height/2);
rotate(frameCount*radians(90) / 20);
translate(-100, 0);
  }
  void display() {
   if (mousePressed == true) {
    triangle (mouseX, mouseY, mouseX, 10, 60, 50);
}else{
    triangle (3, 5, 2, 1, 6, 50);
  }
 }
}
  