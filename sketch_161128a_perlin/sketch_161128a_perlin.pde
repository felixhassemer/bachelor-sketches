
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
}

void draw() {
  float xoff = xstart;
  float yoff = ystart;
  // noiseDetail(10);
  background(0);

  beginShape();
  for (int x = 0; x<width; x++) {
    float scale = map(noise(yoff), 0, 1, 0, 10);
    float y = map(sin(xoff), -1, 1, width/scale, width-width/scale);
    vertex(x, y);
    xoff += xincr;
    yoff += yincr;
  }
  xstart += xincr;
  ystart += yincr;
  endShape();


  // fill(0, 5);
  // rect(0, 0, width, height);
  // println(xoff, n);
}
