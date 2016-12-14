void setup() {
  size(1000, 1000);
  background(150);
  fill(255);
  noStroke();
  frameRate(2);
}

void draw() {
  rectMode(CENTER);
  fill(255);
  rect(random(1000), random(1000), random(600), random(600));
  fill(190, 90, 90);
  rect(random(1000), random(1000), random(400), random(400));
  fill(40);
  rect(random(1000), random(1000), random(600), random(600));
  fill(150, 104);
  // rect(0, 0, 1000, 1000);
}
