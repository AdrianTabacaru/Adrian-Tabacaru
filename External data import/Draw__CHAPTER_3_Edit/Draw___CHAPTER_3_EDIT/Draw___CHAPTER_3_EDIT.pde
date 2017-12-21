Table coordonate;
int i;

void setup () {
  size (1280, 720, P2D);
  background (0);
  smooth(8);
  coordonate = loadTable("coordonate.csv", "header");
  println(coordonate.getRowCount()-1 + " total rows in table"); 
  fill(255);
}
void draw () {
}
void mousePressed() {
  TableRow row = coordonate.getRow(i);
  int x = row.getInt("x");
  int y = row.getInt("y");
  ellipse(x, y, 4, 4);
  i++;
  println(x, y);
}