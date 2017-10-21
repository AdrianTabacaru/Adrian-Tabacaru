void setup (){
    size (100, 100);}             // set the screen size to 100x100 pixels
boolean Click;                    // True oe False "Click"
void draw () {
  background (200, 20, 0);        //Draw RED background
 
  if (Click == false) {           //
 strokeWeight(10);                // stroke is 10
 stroke(#E4F500);                 // make it yellow
   line (0, 100, 100, 0); }       // draw forward line

else                              //else

//strokeWeight(10);               // stroke is 10
// stroke(#05FFF0);               // make it blue
   line (0, 0, 100, 100); }       // draw backward line
  
  void mousePressed () {
    if (Click == true) {Click = false;}
    else {Click = true;}
/* mai poate fi scris si asa:
  Click = !Click;
  */
}