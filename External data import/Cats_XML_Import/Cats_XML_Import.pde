XML xml;

void setup() {
  size (500, 500);
  background (0);
  xml = loadXML("mammals.xml");
  XML[] children = xml.getChildren("animal");

  for (int i = 0; i < children.length; i++) {
    int id = children[i].getInt("id");
    String coloring = children[i].getString("species");
    String name = children[i].getContent();
    ellipse (i*100+50, i+100, height/8, width/8);
    println(id + ", " + coloring + ", " + name);   
  
   text(id + ", " + coloring + ", " + name, i*100+30, i+150, height/8, width/8);

    }  

}