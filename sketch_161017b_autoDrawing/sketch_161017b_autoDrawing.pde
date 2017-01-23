// Easing!!!
// wichtig

void setup() {
  size(1000, 1000);
  background(255);
  frameRate(100);
  strokeWeight(1);
  fill(255);
  rectMode(CENTER);
}

//-----------------------------------------------------------

// Globale Variabeln festlegen
float i = 0;
float j = 0;
// easing-Faktor
float easing = 0.01;
// Variabeln für neuen zufälligen Wert
float randomX = 500;
float randomY = 500;
int countVal = 1;

//-----------------------------------------------------------

void draw() {
  countVal = countVal % 120;
  if (countVal == 1) {
    randomX = random(800)+100;
    randomY = random(800)+100;
  }

  float targetX = randomX;
  float dx = targetX - j;
  j += dx * easing;

  float targetY = randomY;
  float dy = targetY -i;
  i += dy * easing;

  // Intervall für outlines (alle x frames)
  // if (countVal % 2 == 1) {
  //   stroke(0);
  // } else {
  //   stroke(255);
  // }

  if ((keyPressed == true) && (key == 's')) {
    saveFrame("/images/box_circle-######.png");
  }

  if (mousePressed == true) {
    ellipse(i, j, mouseX/10, mouseY/10);
  } else {
    rect(i, j, mouseX/10, mouseY/10);
  }

  // Hintergrund mit Mausklick zurücksetzen
  if (mouseButton == CENTER) {
    background(255);
  }


  // increment
  countVal ++;
}
