// VARIABELN
int x, y;


void setup() {
  size(1000, 1000);
  background(255);
  stroke(0);
  strokeWeight(3);
}

void draw() {
  background(255);
  x = int(random(width));
  y = int(random(height));
  ellipse(x, y, 100, 100);
}
