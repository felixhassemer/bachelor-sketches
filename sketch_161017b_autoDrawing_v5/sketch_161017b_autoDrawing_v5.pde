// Easing!!!
// wichtig
import processing.sound.*;
boolean fileInput = false;

// Globale Variabeln festlegen
float padding = 200;
float i = 0;
float j = 0;
float objSize;
// easing-Faktor
float easing = 0.15;
// Variabeln für neuen zufälligen Wert
float rX = 0;
float rY = 0;
int countVal = 1;

// Sound Variabeln
float sizeEasing = 0.25;
SoundFile file;
AudioIn in;
Amplitude amp;

// Farbe
int hsbMod = 1;
float satMod = 0;

Shape myShape;

//-----------------------------------------------------------

void setup() {
  size(1000, 1000, P2D);
  // fullScreen();
  background(0, 0, 0);
  frameRate(100);

  strokeWeight(2);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);

  myShape = new Shape(color(0,0,0), width/2, height/2);

  // Sound initialisieren
  amp = new Amplitude(this);
  if (!fileInput) {
    in = new AudioIn(this, 0);
    in.start();
    amp.input(in);
  } else {
    file = new SoundFile(this, "everythingbefore.mp3");
    file.play();
    amp.input(file);
  }
}

//-----------------------------------------------------------

void draw() {
  translate(width/2, height/2);
  // Farben definieren
  color fillColor = color(0, 0, 0),
        bgndColor = color(0, 0, 0);

  fill(fillColor);
  satMod = map(amp.analyze(), 0, 0.5, 0, 100);
  stroke(hsbMod, satMod, satMod);


  // Farbwechsel
  if (frameCount % 6 == 1) {
    hsbMod += 1;
  }
  // Farbloop
  if (hsbMod == 360) {
    hsbMod = 1;
  }

  // TARGET
  if (frameCount % 40 == 1) {
    rX = random(-width/2+padding, width/2-padding);
    rY = random(-height/2+padding,height/2-padding);
  }

  // EASING
  float targetX = rX;
  float dx = targetX - j;
  j += dx * easing;

  float targetY = rY;
  float dy = targetY -i;
  i += dy * easing;

  // Hintergrund leeren alle x frames
  if (frameCount % 360 == 1) {
    background(bgndColor);
  }

  // Sound einfügen
  float soundTarget = map(amp.analyze(), 0, 0.5, 0, 220);
  float dSound = soundTarget - objSize;
  // easing
  objSize += dSound * sizeEasing;

  myShape.display();

  // Hintergrund mit Mausklick zurücksetzen
  if (mouseButton == CENTER) {
    background(bgndColor);
  }
}

// ----------------------------------------------------------

class Shape {
  // Data
  float xPos;
  float yPos;
  float objSize;
  color sColor;
  color fColor;

  // Constructor
  Shape(color tempC, float tempX, float tempY) {
    sColor = tempC;
    xPos = tempX;
    yPos = tempY;
  }

  // Funktionalität
  void display() {
    if (objSize < 80) {
      objSize = 6;
      noStroke();
      fill(hsbMod, 100, 100);
    }
    stroke(hsbMod, satMod, satMod);
    fill(fColor);
    if (objSize < 200) {
      ellipse(xPos, yPos, objSize, objSize);
    } else {
      rect(xPos, yPos, objSize, objSize);
    }
  }
}