
// Variabeln für Linienkonstrukt
int xTemp, yTemp;
int lnNumber;
int lnNumMin = 5;
int lnNumMax = 7;
int cycle;
int choose;

// Variabeln für Farben
color fCol = color(0);
color bgndCol = color(0);
color sCol = color(255);


// Variabeln Units
int x, y;
int gridOffset = 25;
int uWidth = 50;
int uHeight = 50;

void setup() {
  size(1000, 1000);
  // fullScreen();
  noFill();
  stroke(0);
  strokeWeight(2);
  strokeJoin(ROUND);
  background(bgndCol);
  frameRate(30);
}

void draw() {
  // background(255);
  translate(uWidth/4, uHeight/4);
  drawShapes();
  // saveFrame("linefigures-###.jpg");
}

// ----------------------------------------------------------

void drawShapes() {
  //zeichne das Linienkonstrukt

  lnNumber = int(random(lnNumMin, lnNumMax));
  noStroke();
  fill(fCol);
  rectMode(CENTER);
  rect(x + uWidth/2, y + uHeight/2, uWidth + gridOffset/2, uHeight + gridOffset/2);
  noFill();

  stroke(sCol);
  beginShape();
  for (int i = 0; i < lnNumber; i++) {
    cycle = round(random(0, 1));
    if (cycle == 0) {
      // x = zufällig entweder 0 oder 100
      choose = round(random(0, 1));
      if (choose == 0) {
        xTemp = 0;
      } else {
        xTemp = uWidth; 
      }
      yTemp = round(random(uHeight));
    } else {
      // y = zufällig entweder 0 oder 100
      choose = round(random(0, 1));
      if (choose == 0) {
        yTemp = 0;
      } else {
        yTemp = uHeight;
      }
      xTemp = round(random(uWidth));
    }
    // die Punkte zeichnen
    vertex(x + xTemp , y + yTemp);
  }
  endShape();

  // ----------------------------------------------------------

  // Kreis zeichnen
  int circleSize = round(random(uWidth/6, uWidth - uWidth/3));
  fill(fCol);
  ellipse(x + random(circleSize/2, uWidth - circleSize/2),
          y + random(circleSize/2, uHeight - circleSize/2),
          circleSize, circleSize);
  noFill();

  // ----------------------------------------------------------

  x += uWidth + gridOffset;
  // Überlauf in nächste Unit
  if (x + uWidth > width) {
    y += uHeight + gridOffset;
    x = 0;
  }
  if (y + uHeight > height) {
    y = 0;
    // background(255);
  }

}
