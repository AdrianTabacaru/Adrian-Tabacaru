PImage maze;

Guy mazeGuy = new Guy (80, 80);

void setup() {
  size (640, 480);
  maze = loadImage("maze.png");
}
void draw() {
  background(maze);

  if (mousePressed)
    mazeGuy.goTo(mouseX, mouseY);
  mazeGuy.display();
}