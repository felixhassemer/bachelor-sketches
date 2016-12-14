// Variabeln
int choose = 0;
int x = 0, y = 0;
int uWidth = 20;
int uHeight = 50;

void setup() {
  size(400, 800);
  background(255);
  stroke(0);
  strokeWeight(5);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  noFill();
  frameRate(30);
}

void draw() {
  translate(uWidth/2, uHeight/2);
  // background(255);
  // x1 += 20;
  diagline();
  // saveFile();
}

void diagline() {
  choose = round(random(1));
  if (choose == 1) {
      line(x, y, x + uWidth, y + uHeight);
    } else {
      line(x, y + uHeight, x + uWidth, y);
  }
  x += uWidth;
  if (x + uWidth >= width) {
    y += uHeight;
    x = 0;
  }
  if (y + uHeight >= height) {
    y = 0;
    background(255);
  }
}

void saveFile() {
  saveFrame("linePattern-####.png");
}
