import com.leapmotion.leap.*;

int width = 1280;
int height = 720;
color canvasColor = 000000;
float alphaVal = 10;
 
Controller leap = new Controller();
 
void setup()
{
   frameRate(120);
   size(1280, 720);
   background(canvasColor);
   stroke(#FFFFFF);
}
 
 
void draw(){
  Frame frame = leap.frame();
  Pointable pointer = frame.pointables().frontmost();
  if( pointer.isValid() )
  {
 
    color frontColor = color( 255, 0, 0, alphaVal );
 
    InteractionBox iBox = frame.interactionBox();
    Vector tip = iBox.normalizePoint(pointer.tipPosition());
    fingerPaint(tip, frontColor);
  }
}
 
void fingerPaint(Vector tip, color paintColor)
{
   fill(paintColor);
    float x = tip.getX() * width;
    float y = height - tip.getY() * height;
    ellipse( x, y, 10, 10);   
}
 
void keyPressed()
{
   background(canvasColor);
}