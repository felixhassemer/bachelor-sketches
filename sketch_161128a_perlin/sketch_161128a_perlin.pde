
float start = 0;
float incr = 0.001;

void setup() {
  size(1000, 1000);
  background(0);
  frameRate(60);
  strokeWeight(3);
  stroke(255);
  noFill();
}

void draw() {
  float xoff = start;
  noiseDetail(10);
  background(0);

  beginShape();
  for (int x = 0; x<width; x++) {
    float y = map(noise(xoff), 0, 1, 0, width);
    vertex(x, y);
    xoff += incr;
  }
  start += incr;

  endShape();

  // fill(0, 5);
  // rect(0, 0, width, height);
  // println(xoff, n);
}
