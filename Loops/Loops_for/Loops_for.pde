//Loops - For

size (100, 100);
int N = 50;

/*
while (drawX < N) {  
line(drawX, 0, drawX, 100);
drawX = drawX + 4; // drawX+=4
}
*/

for ( int drawX = 0; drawX < N; drawX+=6){
line(drawX, 0, drawX, 100);
}