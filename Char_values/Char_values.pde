textFont(createFont("SourceCodePro-Regular.ttf",10));
size (200,15);
background(0);

char a = 'a'; // "a" character in ASCII is 97 (American Standard Code for Infomational Interchange)
char b = 'b'; // "a" character in ASCII is 98 
int c = a+b;  // "97+98=195 

  text("The value of variable 'c' is: " + c, 10, 12);