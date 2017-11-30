XML xml;

void setup() {
  size (500, 500);
  frameRate(25);
}
  void draw (){
  background (20);
  
  xml = loadXML("LondonWind.xml");
  XML[] children = xml.getChildren("speed");
   for (int i = 0; i < children.length; i++) {
    float speed = children[i].getFloat("value");
    String name = children[i].getString("name");
    //String direction = children[i].getContent("direction");
  
translate(width/2, height/2);
rotate(speed);
rect(26, -26, 52, 52);
  }
  //  println(speed + " " + name);   
  
  // text(speed + "speed " + coloring + ", " + name, i*100+30, i+150, height/8, width/8);
  }