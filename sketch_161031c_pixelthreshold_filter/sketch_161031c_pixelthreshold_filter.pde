
//Variablen
PImage image;
float dSize;
float grayValue;
color c;
int increment;
int rMod;
int offset = 2;

void setup() {
  size(800, 800);
  background(235, 245, 51);
  frameRate(10);
  noStroke();
  fill(0);
  image = loadImage("vanessa.jpg");
  image.resize(0, 800);
}

void draw() {
  background(235, 245, 51);
  if (mousePressed == true) {
    image(image, 0, 0);
  } else {
    pixVerarbeitung();
  }
}

void pixVerarbeitung() {
  increment = 3;
  for (int x = 0; x < image.width; x += increment) {
    for (int y = 0; y < image.height; y += increment) {
      rMod = round(random(-offset, offset));
      c = image.get(x, y);
      grayValue = 255-brightness(c);
      fill(201, 31, 118);
      ellipse(x+rMod, y+rMod, grayValue/40, grayValue/40);
    }
  }
}
