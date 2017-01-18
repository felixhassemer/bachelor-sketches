// Programm zur Übersetzung von Grauwerten in einzelne Objekte
//---------------------------------------------
// Variabeln definieren
PImage photo;
color c1, colorThresh;
int sizeVar = 60;
float redValue,
      greenValue,
      blueValue;
float mouseDist;

//---------------------------------------------

void setup() {
  size(1000, 1000);
  photo = loadImage("landscape.jpg");
  rectMode(CENTER);
  frameRate(5);
  // stroke(0);
  noStroke();
}

//---------------------------------------------

void draw() {
  background(0);
  if (mousePressed == true) {
    image(photo, 0, 0);
    photo.resize(1000, 1000);
  } else {
    pixelate();
  }
  // translateColor();
}

//---------------------------------------------

void translateColor() {
  // image(photo, 0, 0);
  photo.resize(1000, 1000);
  loadPixels();
  // fill(255);
  strokeWeight(10);
  for (int i = 0; i < 1000; i+=10) {
    for (int j = 0; j < 1000; j+=10) {
      mouseDist = dist(i, j, mouseX, mouseY);
      // Daten von Pixelwerten
      colorThresh = photo.get(i, j);
      // Isolierung der Farbwerte
      redValue = red(colorThresh);
      greenValue = green(colorThresh);
      blueValue = blue(colorThresh);
      // Distanz von Mauszeiger
      stroke(redValue - mouseDist/6);
      // Ellipse zeichnen
      point(i, j);
    }
  }
}

void pixelate() {
  // image(photo, 0, 0);
  photo.resize(1200, 0);
  loadPixels();
  if (keyPressed == true && key == '-') {
    sizeVar -= 1;
  } else if (keyPressed == true && key == '+'){
    sizeVar += 1;
  }

  int distVar = mouseX/6;
  if (distVar > 0){
    for (int i = 0; i < 1000; i += distVar) {
      for (int j = 0; j < 1000; j += distVar) {
        c1 = photo.get(i, j);
        fill(c1);
        ellipse(i, j, sizeVar, sizeVar);
      }
    }
  }
}
