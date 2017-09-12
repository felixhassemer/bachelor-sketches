// Easing!!!
// wichtig

// import gif library
import gifAnimation.*;
GifMaker gif;

// Globale Variabeln festlegen
float i = 0;
float j = 0;
// easing-Faktor
float easing = 0.01;
// Variabeln für neuen zufälligen Wert
float randomX = 500;
float randomY = 500;


void setup() {
  size(400, 400);
  i = width/2;
  j = height/2;
  background(255);
  frameRate(60);
  strokeWeight(1);
  fill(255);
  rectMode(CENTER);

  // init gif
  gif = new GifMaker(this, "export.gif", 5);
  gif.setRepeat(0);
  gif.setTransparent(255, 255, 255);
}

//-----------------------------------------------------------

void draw() {
  if (frameCount % 60 == 0) {
    randomX = random(300)+50;
    randomY = random(300)+50;
  }

  float targetX = randomX;
  float dx = targetX - j;
  j += dx * easing;

  float targetY = randomY;
  float dy = targetY -i;
  i += dy * easing;


  if (mousePressed == true) {
    ellipse(i, j, mouseX/10, mouseY/10);
  } else {
    rect(i, j, mouseX/10, mouseY/10);
  }

  // Hintergrund mit Mausklick zurücksetzen
  if (mouseButton == CENTER) {
    background(255);
  }

  // gif functions
  if (frameCount % 12 == 0) {
    gif.setDelay(1);
    gif.addFrame();
  }
}


void keyPressed() {
  if (key == 's') {
    saveFrame("/images/box_circle-######.png");
  } else if (key == 'g') {
    gif.finish();
    println("gif saved!");
  }
}
