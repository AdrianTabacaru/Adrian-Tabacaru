float speed;
boolean freeze;
void setup () {
  size (100, 100);
}

void draw () {
  if (freeze == false) {
    //background (200); //sterge linia cu un fundal peste
    speed = pow(mouseX-pmouseX, 2) + pow(mouseY-pmouseY, 2); //a^2 este pow(a,2)
    line (mouseX, 0, mouseX, speed/2 + 10);
    //text(speed, 10, 10); 
  } else background (100);
}
void mousePressed() {
  freeze = !freeze;
  /* mai poate fi scris si asa:
 if (freeze == true) {freeze = false;}
  else {freze = true;}
  */ 
  
  
}


/* cu int convertit
int speed;
void setup () {
  size (100, 100);
}

void draw () {
 background (200); //sterge linia cu un fundal peste
  speed = (int)pow(mouseX-pmouseX, 2) + (int)pow(mouseY-pmouseY, 2); //a^2 este pow(a,2)
   line (mouseX, 0, mouseX, speed/2 + 10);
   text(speed, 10, 10);
  
}*/