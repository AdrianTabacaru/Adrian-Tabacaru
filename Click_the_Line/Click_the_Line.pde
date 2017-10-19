float y;
 
// The statements in the setup() function 
// execute once when the program begins
void setup() {
  size(720, 800);  // Size should be the first statement
  stroke(0);     // Set line drawing color to BLACK
  noLoop();
  y = height * 0.8;
}

// The statements in draw() are executed until the 
// program is stopped. Each statement is executed in 
// sequence and after the last line is read, the first 
// line is executed again.
void draw() { 
  background(100);   // Set the background to GREY
  y = y - 60;        // Bigger Steps 
  if (y < 0) { y = height; } 
  line(0, y, width, y);  
} 

void mousePressed() {
  redraw();
}