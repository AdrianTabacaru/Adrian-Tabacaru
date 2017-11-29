Table table;

void setup() {
  size(1900, 500);
  background (0);
  smooth();
  noStroke();
  
  table = loadTable("CatsData.csv", "header");

  println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows()) {
    
    int id = row.getInt("id");
    String Sex = row.getString("Sex");
    String Bwt = row.getString("Bwt");
    String Hwt = row.getString("Hwt");
    
    
    // BODY WEIGHT    
   text("Body Weight:",30,30);
   ellipse(id*30,60,float(Bwt)*10, float(Bwt)*10);
   text(Bwt,id*30-4,90);  
   text("kg",id*30-4,100);
   // SEX
   text("Sex:",30,120);
   text(Sex,id*30-4,140);  
   //Heart Weight
      text("Heart Weight in grams:",30,160);
   text(Hwt,id*30-4,180);
   text("g",id*30-4,190);
   
   println("ID " + id + " Body Weight "+ Bwt + " Heart Weight " + Hwt + " Sex " + Sex);
  } 
}