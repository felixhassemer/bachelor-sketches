// Easing!!!
// wichtig

// import gif library
import gifAnimation.*;
GifMaker gif;
int interval = 4;

// Globale Variabeln festlegen
int fr = 24;
float i = 0;
float j = 0;
// easing-Faktor
float easing = 0.08;
// Variabeln für neuen zufälligen Wert
float randomX = 250;
float randomY = 250;

int sCol = 255;
int bgCol = 0;


void setup() {
  size(500, 500);
  i = width/2;
  j = height/2;
  background(bgCol);
  frameRate(fr);
  strokeWeight(1);
  fill(bgCol);
  rectMode(CENTER);
  stroke(sCol);

  // init gif
  noSmooth();
  initGif(20);
}

//-----------------------------------------------------------

void draw() {
  if (frameCount % fr == 0) {
    randomX = random(400)+50;
    randomY = random(400)+50;
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
    background(bgCol);
  }

  // gif functions
  drawGif(interval);
}

void initGif(int quality) {
  gif = new GifMaker(this, "export.gif", quality);
  gif.setRepeat(0);
  gif.setTransparent(bgCol, bgCol, bgCol);
}

void drawGif(int step) {
  if (frameCount % step == 0) {
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
