color dataColor [] = new color[3];
String dataName [] = new String[3];

String [] stuff = loadStrings("data.csv");
String values[] = (split(stuff[0], ';'));
dataName = (split(stuff[1], ';'));
for (int i = 0; i < values.length; i++) {
  dataColor[i] = unhex("FF"+values[i]);
  fill(dataColor[i]);
  ellipse(i*30+20,height/2,20, 18);
  text(dataName[i],i*35,height/4);
}


printArray(dataName);