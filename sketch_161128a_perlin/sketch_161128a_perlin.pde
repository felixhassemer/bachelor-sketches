
float xstart = 0;
float ystart = 1000;
float xincr = 0.05;
float yincr = 0.001;



void setup() {
  size(1000, 1000);
  background(0);
  frameRate(200);
  strokeWeight(10);
  stroke(255);
  noFill();
  strokeJoin(ROUND);
}

void draw() {
  background(0);
  float offset = height/2;
  float scaleVal = 35.0;
  float angleInc = PI/28.0;
  float xoff = xstart;
  float yoff = ystart;
  float angle = 0;
  beginShape();
  for (int x = 0; x < width; x++) {
    float y = offset + (sin(angle) * scaleVal);
    vertex(x, y);
    angle += angleInc;
  }
  endShape();
}
