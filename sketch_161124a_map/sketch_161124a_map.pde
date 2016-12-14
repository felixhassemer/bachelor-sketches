int c;

void setup() {
  size(1000,1000);
}

void draw() {
  c = round(random(0, 1));
  // println(map(mouseX, 0, width, 0, 255));
  // c = map(mouseX, 0, width, 0, 255);
  println(c);
  background(c, 0, 0);
}
