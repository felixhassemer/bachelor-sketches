void setup() {
  size(1000, 1000);
  background(153, 37, 68);
  frameRate(30);
  colorMode(RGB);
  noFill();
  stroke(59, 181, 155);
  strokeWeight(3);
}

void draw() {
  background(153, 37, 68);
  for (int i = 100; i < 1000; i += 100) {
    for (int j = 100; j < 1000; j += 100){
      arc(i, j, 130, 130, radians(mouseX), radians(mouseY), OPEN);
    }
  }
  saveFrame("/data/arcs-######.png");
}
