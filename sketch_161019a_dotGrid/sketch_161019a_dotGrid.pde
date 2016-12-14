// Kreisraster mit Zufallsbewegungen


int increment;
float strokeColor, contour, randomRange, randomSize;

void setup() {
  size(1000,1000);
  frameRate(25);

}

void draw() {
  increment = mouseX/4+50;
  strokeColor = 0;
  randomRange = mouseY/10;
  contour = mouseX/4+30;

  background(255);
  noFill();
  smooth();
  pixelRaster();
}



void pixelRaster() {
  if (increment > 1) {
    stroke(strokeColor);
    strokeWeight(contour);
    for (int i = 0; i < 1000; i += increment) {
      for (int j = 0; j < 1000; j += increment) {
        point(i+random(-randomRange, randomRange), j+(random(-randomRange, randomRange)));
      }
    }
  }

}
