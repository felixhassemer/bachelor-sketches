// VARIABELN
int choose = 0;
int x = 0, y = 0;
// UNITS
int uWmin = 15;
int uWmax = 80;
int uHmin = 15;
int uHmax = 150;
int uWidth = round(random(20, 60));
int uHeight = round(random(20, 60));
// STYLING
color sColor = color(0),
      fColor = color(0),
      bgndColor = color(255);
int sWeight = 3;


// ----------------------------------------------------------

void setup() {
  size(1000, 1000);
  background(bgndColor);
  frameRate(30);
}

// ---------------------------------------------------------

void draw() {
  translate(10, 10);
  choose = round(random(2));
  if (choose == 1) {
    shapeDraw();
  } else if (choose == 2) {
    diagLine();
  } else {
    diagLine2();
  }
  x += uWidth;

  // Überlauf in nächste Zeile
  if (x + uWidth >= width) {
    x = 0;
    // random Unitsize
    y += uHeight;
    uWidth = round(random(uWmin, uWmax));
    uHeight = round(random(uHmin, uHmax));
  }
  // Seite zurücksetzen
  if (y + uHeight >= height) {
    y = 0;
    // saveFile();
    background(bgndColor);
  }
}

// ----------------------------------------------------------

void diagLine() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  noFill();

  // PATTERN
  choose = round(random(1));
  if (choose == 1) {
      line(x, y, x + uWidth, y + uHeight);
    } else {
      line(x, y + uHeight, x + uWidth, y);
  }
}

void shapeDraw() {
  // STYLING
  fill(fColor);
  noStroke();

  // PATTERN
  choose = round(random(2));
  if (choose == 1) {
    triangle(x, y, x+uWidth, y, x, y+uHeight);
  } else if (choose == 2) {
    triangle(x+uWidth, y, x+uWidth, y+uHeight, x, y+uHeight);
    // line(x, y + uHeight, x + uWidth, y);
  } else {
    // ellipse(x+uWidth/2, y+uHeight/2, uWidth/2, uWidth/2);
  }
}

void diagLine2() {
  // STYLING
  stroke(0);
  strokeWeight(sWeight);
  strokeCap(SQUARE);
  strokeJoin(MITER);
  noFill();

  // PATTERN
  choose = round(random(2));
  if (choose == 1) {
    beginShape();
    vertex(x, y);
    vertex(x + uWidth/3, y + uHeight/3);
    vertex(x + uWidth - uWidth/3, y + uHeight/3);
    vertex(x + uWidth, y + uHeight);
    endShape();
  } else if (choose == 2) {
    beginShape();
    vertex(x+uWidth, y);
    vertex(x+uWidth - uWidth/3, y+uHeight - uHeight/3);
    vertex(x+uWidth/3, y+uHeight - uHeight/3);
    vertex(x, y+uHeight);
    endShape();
    // line(x, y + uHeight, x + uWidth, y);
  } else {
    if (uWidth < uHeight) {
      ellipse(x+uWidth/2, y+uHeight/2, uWidth/2, uWidth/2);
    } else {
      ellipse(x+uWidth/2, y+uHeight/2, uHeight/2, uHeight/2);
    }
  }
}

void saveFile() {
  saveFrame("linePattern-####.png");
}
