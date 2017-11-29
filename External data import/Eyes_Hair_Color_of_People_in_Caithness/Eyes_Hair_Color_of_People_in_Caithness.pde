Table table;


void setup() {
  size(1280, 1024);
  background (30);
  smooth();
  noStroke();
  
  table = loadTable("caith.csv", "header");

  println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows()) {
    
    int id = row.getInt("eye");
    String fair = row.getString("fair");
    String red = row.getString("red");
    String medium = row.getString("medium");
    String dark = row.getString("dark");
    String black = row.getString("black");
    String eye = row.getString ("eye");
    
       fill(#F3FC00, float(fair)/2);
       ellipse(int(fair),int(fair),int(fair)/2, int(fair)/2);
       fill(#0A0101);
       text(int(fair),int(fair),int(fair), int(fair));
      
       fill(#FC0008, float(red)/2);
       ellipse(float(red),float(red),float(red)/2, float(red)/2);
       fill(#FFFFFF);
       text (int(red),int(red),int(red), int(red));
       
       fill(#3B3535, float(medium)/4);
       ellipse(int(medium),int(medium),int(medium)/2, int(medium)/2);
       fill(#FFFFFF);
       text (int(medium),int(medium),int(medium), int(medium));
       
       fill(#0A0101,float(dark)/4);
       ellipse(int(dark),int(dark),int(dark)/2, int(dark)/2);
       fill(#FFFFFF);
       text (int(medium),int(medium),int(medium), int(medium));
       
       fill(#000000,float(black)/4);
       ellipse(int(black),int(black),int(black)/2, int(black)/2);
       fill(#FFFFFF);
       text (int(medium),int(medium),int(medium), int(medium));
       
  println("Eyes Color " + eye +": " + " fair " + fair + " red " + red + " medium " + medium + " dark " + dark + " black " + black);
    } 
}