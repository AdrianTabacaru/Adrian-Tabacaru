int[] x = { 
  5, 18, 3, 6, 20
};

fill(0);
// Read one array element each time through the for loop
for (int i = 0; i < x.length; i++) {
  ellipse(i*20+10, 100-x[i]*4, 8, 8);
}
for (int i = 1; i < x.length; i++) {
  line ((i-1)*20+10, 100-x[i-1]*4, i*20+10, 100-x[i]*4);
}