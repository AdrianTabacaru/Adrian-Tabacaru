XML xml;
float diameter; 
float angle = 0;
int counter;

void setup() {
  xml = loadXML("LondonWind.xml");
  size(640, 360);
  frameRate(25);
  noStroke();
  smooth();
}

void draw() {
  diameter = 3;
  background(60);
  
  counter ++;
  if (counter == 300) 
  {
    xml = loadXML("LondonWind.xml");
    counter = 0;
  }


  XML[] children1 = xml.getChildren("speed1");
  for (int i = 0; i < children1.length; i++) {
    float speed1 = children1[i].getFloat("value");
    String name1 = children1[i].getString("name");

    XML[] children2 = xml.getChildren("speed2");
    float speed2 = children2[i].getFloat("value");
    String name2 = children2[i].getString("name");

    float d2 = 8 + (sin(angle + PI/2) * diameter/2) + diameter/2;

    pushMatrix();
    translate(width/2-30, height/2);
    fill(255, 204, 0);
    ellipse(0, 0, d2, d2);
    angle += 0.2;
    rotate(angle*speed1/100);

    fill(255, 204, 0);
    beginShape(TRIANGLES);
    vertex(0, 0);
    vertex(20, 40);
    vertex(40, 20);
    vertex(0, 0);
    vertex(-20, -40);
    vertex(-40, -20);
    endShape();
    popMatrix();

    fill(#FFFFFF);
    text(speed1, width/2-45, height/2+60);
    text("m/s", width/2-40, height/2+70);
    text(name1, width/2-40, height/2+85);

    pushMatrix();
    translate(width/2+90, height/2);

    fill(255, 204, 0);
    ellipse(0, 0, d2, d2);
    angle += 0.2;

    rotate(angle*speed2/100);
    fill(255, 204, 0);
    beginShape(TRIANGLES);
    vertex(0, 0);
    vertex(20, 40);
    vertex(40, 20);
    vertex(0, 0);
    vertex(-20, -40);
    vertex(-40, -20);
    endShape();
    popMatrix();

    fill(#FFFFFF);
    text(speed2, width/2+65, height/2+60);
    text("m/s", width/2+69, height/2+70);
    text(name2, width/2+70, height/2+85);

    println(speed2 + " " + name2);
  }
}