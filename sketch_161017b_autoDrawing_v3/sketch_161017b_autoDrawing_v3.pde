// Easing!!!
// wichtig
import processing.sound.*;

// Globale Variabeln festlegen
float i = 0;
float j = 0;
float objSize;
// easing-Faktor
float easing = 0.15;
// Variabeln für neuen zufälligen Wert
float randomX = 500;
float randomY = 500;
int countVal = 1;
// Sound Variabeln
SoundFile file;
Amplitude amp;
// Farbe
int hsbMod = 1;
float satMod = 0;


//-----------------------------------------------------------

void setup() {
  size(1000, 1000, P2D);
  background(0, 0, 0);
  frameRate(100);

  strokeWeight(2);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);

  // Sound initialisieren
  amp = new Amplitude(this);
  file = new SoundFile(this, "everythingbefore.mp3");
  file.play();
  amp.input(file);
}

//-----------------------------------------------------------

void draw() {
  // Farben definieren
  color fillColor = color(0, 0, 0),
        bgndColor = color(0, 0, 0);

  fill(fillColor);
  satMod = map(amp.analyze(), 0, 0.5, 0, 100);
  stroke(hsbMod, satMod, satMod);


  // Farbwechsel
  if (countVal % 6 == 1) {
    hsbMod += 1;
  }
  // Farbloop
  if (hsbMod == 361) {
    hsbMod = 1;
  }

  // ZIELPUNKT generieren
  if (countVal % 40 == 1) {
    randomX = random(width - 300) + 150;
    randomY = random(height - 300) + 150;
  }
  // println(randomX, randomY);

  // EASING
  float targetX = randomX;
  float dx = targetX - j;
  j += dx * easing;

  float targetY = randomY;
  float dy = targetY -i;
  i += dy * easing;

  // Weißer Hintergrund alle x frames
  if (countVal % 360 == 1) {
    background(bgndColor);
  }

  // Intervall für outlines (alle x frames)
  // if (countVal % 2 == 1) {
  //   stroke(0);
  // } else {
  //   stroke(255);
  // }

  if ((keyPressed == true) && (key == 's')) {
    saveFrame("box_circle-#####.png");
  }

  // Sound einfügen
  float sizeEasing = 0.25;
  float soundTarget = map(amp.analyze(), 0, 0.5, 0, 300);
  float dSound = soundTarget - objSize;
  objSize += dSound * sizeEasing;
  // println(objSize);

  if (objSize < 55) {
    objSize = 6;
    noStroke();
    fill(hsbMod, 100, 100);
  }

  if (objSize < 200) {
    ellipse(i, j, objSize, objSize);
  } else {
    rect(i, j, objSize, objSize);
  }

  // Hintergrund mit Mausklick zurücksetzen
  if (mouseButton == CENTER) {
    background(bgndColor);
  }
  // rectMode(CORNER);
  // fill(255, 1);
  // rect(0, 0, width, height);

  // increment
  countVal ++;
}
