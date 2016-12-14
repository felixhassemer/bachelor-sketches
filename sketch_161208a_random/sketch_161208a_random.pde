float x = 0;
float y;

void setup() {
  size(1000, 1000);
  background(0);
  frameRate(60);
  strokeWeight(3);
  stroke(255);
  noFill();
}

void draw() {
  y = random(height);
  stroke(255);
  point(x, y);
  if (x < width){
    x++;
  } else {
    copy(0, 0, width, height, -1, 0, width, height);
    fill(0);
    noStroke();
    rect(width-1, 0, 10, height);
    x = width-1;
  }
}
