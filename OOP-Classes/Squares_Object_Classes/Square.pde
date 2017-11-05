class Square {
float x, y; // X-coordinate, y-coordinate
float size; // size of the circle
float speed; // Distance moved each frame
int direction = 1; // Direction of motion (1 is down, -1 is up)
// Constructor
Square(float xpos, float ypos, float siz, float sp) {
x = xpos;
y = ypos;
size = siz;
speed = sp;
}
void move() {
y += (speed * direction);
if ((y > (height - size/2)) || (y < size/2)) {
direction *= -1;
}
}
void display() {
rect(x, y, size, size);
}
}