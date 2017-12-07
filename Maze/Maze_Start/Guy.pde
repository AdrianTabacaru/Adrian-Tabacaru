class Guy {
  float x, y;

  Guy (float initX, float initY) {
    x= initX;
    y= initY;
  }
  void display() {
    ellipse (x, y, 20, 20);
  }

  boolean wall (float x1, float y1, float x2, float y2) {
    if (x1 > x2) return wall(x2, y1, x1, y2);
    if (y1 > y2) return wall(x1, y2, x2, y1);

    boolean isWall = false;
    int i, j;
    for (i = (int)x1; i < x2; i++) {
      for (j = (int)y1; j<y2; j++) {
        if (maze.get(i, j) == -1) {
          isWall = true;
          println (isWall);
        }
      }
    }

    return isWall;
  }

  void goTo(float toX, float toY) {
    float dx = toX - x;
    float dy = toY - y;
    float newX = dx/10 + x;
    float newY = dy/10 +y;
    if (!wall(x, y, newX, newY)) {
      x = newX;
      y = newY;
    }
  }
}