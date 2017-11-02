// modified from http://processingjs.org/learning/topic/collision/

// Global variables for the ball

float ball_x;
float ball_y;
float ball_dir = 1;
float diameter; 
float angle = 0;
float ball_size = 5;  // Radius
float dy = 2;  // Direction
boolean Click;


// Global variables for the paddle

int paddle_width = 5;
int paddle_height = 20;
int dist_wall = 15;

void setup(){
  size(200, 200);
  rectMode(RADIUS);
  ellipseMode(RADIUS);
  diameter = 10;
  noStroke();

  smooth();

  ball_y = height/2;
  ball_x = 1;
}



void draw() {

  background(51);  
float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
 // ellipse(width/2, height/2, d2, d2);
  angle += 0.22;
  ball_x += ball_dir * 1.0;
  ball_y += dy;

  // reset game
  if(ball_x > width+ball_size) {
    ball_x = -width/2 - ball_size;
    ball_y = random(0, height);
    dy = 0;
  }

  // Constrain paddle to screen
  float paddle_y = constrain(mouseY, paddle_height, height-paddle_height);

  // Test to see if the ball is touching the paddle
  float py = width-dist_wall-paddle_width-ball_size;

  if(ball_x == py 
     && ball_y > paddle_y - paddle_height - ball_size 
     && ball_y < paddle_y + paddle_height + ball_size) {
    ball_dir *= -1;
    if(mouseY != pmouseY) {
      dy = (mouseY-pmouseY)/2.0;
      dy = constrain(dy, -5, 5);
    }
  } 

  

  // If ball hits paddle or back wall, reverse direction
  if(ball_x < ball_size && ball_dir == -1) {
    ball_dir *= -1;
  }

  // If the ball is touching top or bottom edge, reverse direction
  if(ball_y > height-ball_size) {
    dy = dy * -1;
  }

  if(ball_y < ball_size) {
    dy = dy * -1;
  }

  // Draw ball
  if (Click == true) {
  fill(2);
  ellipse(ball_x, ball_y, d2, d2);
  }else{
fill(255);
ellipse(ball_x, ball_y, d2, d2);
  }
  // Draw the paddle
if (keyPressed && key == ' ') {
rect(width-dist_wall, paddle_y, paddle_width*2, paddle_height);
}else{
  rect(width-dist_wall, paddle_y, paddle_width, paddle_height);

 if (Click == true) {
  fill(125);
  rect(width-dist_wall, paddle_y, paddle_width, paddle_height);
 }else{
   fill(1);
  rect(width-dist_wall, paddle_y, paddle_width, paddle_height);
 }
 }
  
}
void mousePressed () {
    if (Click == true) {Click = false;}
    else {Click = true;}
  }