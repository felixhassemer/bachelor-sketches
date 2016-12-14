float sizeModifier;
void setup() {
  size(1000, 1000);
  background(255);
  noFill();
  stroke(0);
}

void draw() {
  background(255);
  sizeModifier = mouseX;
  rectPattern();
  // lineDrawing();
}

void rectPattern() {
  rectMode(CENTER);
  for (int y = 9; y < height; y += 20) {
    for (int x = 9; x < width; x += 20) {
      for (int d = 18; d > 0; d -= 4) {
        rect (x, y, d, d);
      }
    }
  }
}

void lineDrawing() {
  for(int y = 200; y <= 800; y *= 1.02) {
    for (int x = 200; x <= 800; x +=15) {
      if((x % 10) == 0) {
        line(x, y, x-10, y-10);
        } else {
          line(x, y, x-10, y+10);
        }
      }
    }
}
