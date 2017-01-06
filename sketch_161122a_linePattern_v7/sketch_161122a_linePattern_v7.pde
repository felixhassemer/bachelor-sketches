// LIBRARIES
import processing.pdf.*;
int pageCount = 0;
int pageMax = 100;
boolean pdfRender = false;

// VARIABELN
int choose = 0;
boolean foundOne;
int x = 0, y = 0;
int padding = 40;

// ARRAY
FloatDict patterns;
float[] vArray;
String[] kArray;

// NOISE
float xoff = 0;
float yoff = 10000;
float incr = 0.05;

// SINE
float sineStart = 0;
float sineIncr = 0.3;

// UNITS
float uWmin = 10;
float uWmax = 120;
float uHmin = 10;
float uHmax = 140;
float uW = round(random(uWmin, uWmax));
float uH = round(random(uHmin, uHmax));

// STYLING
color sColor = color(0),
      fColor = color(0),
      bgndColor = color(255);
float sWeight = 3;
float sOffset = sWeight/2;

// ----------------------------------------------------------

void settings()
{
  if (pdfRender) {
    size(1200, 1200, PDF, "linepattern#####.pdf");
  } else {
    size(1200, 1000);
    // fullScreen();
  }
}

// ----------------------------------------------------------

void setup()
{
  background(bgndColor);
  frameRate(20);

  // FloatDict init
  patterns = new FloatDict();
  patterns.set("cross", 15);
  patterns.set("horizontLines", 25);
  patterns.set("shapeDraw", 40);
  patterns.set("circle", 45);
  patterns.set("diagLine2", 55);
  patterns.set("diagLine", 65);
  patterns.set("curves", 70);
  patterns.set("space", 80);
  patterns.set("sineWave", 100);
}

// ---------------------------------------------------------

void draw()
{
  translate(padding, 0);
  // PDF renderer
  if (pdfRender) {
    PGraphicsPDF pdf = (PGraphicsPDF) g;
  }

  choose = round(map(noise(xoff), 0, 1, 0, 100));

  // sorting Dictionary
  patterns.sortValues();
  vArray = patterns.valueArray();
  kArray = patterns.keyArray();

  // choose function for keys in array
  chooseFunction();

  // random Unitwidth
  x += uW;
  uW = round(random(uWmin, uWmax));

  // Paragraph Overflow
  if (x + uW >= width-padding) {
    x = 0;
    // random Unitheight
    y += uH;
    uH = round(random(uHmin, uHmax));
  }

  // NOISE increment
  xoff += incr;
  yoff += incr;

  // PDF erstellen
  makePDF();
}

// ----------------------------------------------------------

void chooseFunction() {
  for (int index=0; index < patterns.size(); index++) {
    foundOne = false;
    // search for function
    if (choose < vArray[index]) {
      if (kArray[index] ==        "cross") {
        cross();
        foundOne = true;
      } else if (kArray[index] == "horizontLines") {
        horizontLines();
        foundOne = true;
      } else if (kArray[index] == "shapeDraw") {
        shapeDraw();
        foundOne = true;
      } else if (kArray[index] == "circle") {
        circle();
        foundOne = true;
      } else if (kArray[index] == "diagLine2") {
        diagLine2();
        foundOne = true;
      } else if (kArray[index] == "diagLine") {
        diagLine();
        foundOne = true;
      } else if (kArray[index] == "curves") {
        curves();
        foundOne = true;
      } else if (kArray[index] == "space") {
        space();
        foundOne = true;
      } else if (kArray[index] == "sineWave") {
        sineWave();
        foundOne = true;
      }
    }
    // exit condition
    if (foundOne) {
      break;
    }
  }
}

void diagLine() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(SQUARE);
  strokeJoin(ROUND);
  noFill();

  // PATTERN
  choose = round(random(1));
  if (choose == 0) {
      line(x, y, x + uW, y + uH);
    } else {
      line(x, y + uH, x + uW, y);
  }
}

void shapeDraw() {
  // STYLING
  fill(fColor);
  noStroke();

  // PATTERN
  choose = round(random(1));
  if (choose == 0) {
    triangle(x, y, x+uW, y, x, y+uH);
  } else if (choose == 1) {
    triangle(x+uW, y, x+uW, y+uH, x, y+uH);
  // } else if (choose == 2) {
  //   noFill();
  //   stroke(sColor);
  //   strokeWeight(sWeight);
  //   triangle(x, y, x+uW, y, x, y+uH);
  // } else if (choose == 3) {
  //   noFill();
  //   stroke(sColor);
  //   strokeWeight(sWeight);
  //   triangle(x+uW, y, x+uW, y+uH, x, y+uH);
  }
}

void curves() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(SQUARE);
  strokeJoin(ROUND);
  noFill();

  // PATTERN
  choose = round(random(3));
  if (choose == 0) {
    bezier(x,     y+uH/2,         // point 1 mid-left
          x+uW/2, y+uH/2,         // handle 1
          x+uW/2, y+uH-sOffset,   // handle 2
          x+uW,   y+uH-sOffset);  // point 2 down-right
  } else if (choose == 1) {
    bezier(x+uW,  y+uH/2,         // point 1 mid-right
          x+uW/2, y+uH/2,         // handle 1
          x+uW/2, y+uH-sOffset,   // handle 2
          x,      y+uH-sOffset);  // point 2 down-left
  } else if (choose == 2) {
    bezier(x+uW,  y+uH/2,         // point 1 mid-right
          x+uW/2, y+uH/2,         // handle 1
          x+uW/2, y+sOffset,      // handle 2
          x,      y+sOffset);     // point 2 up-left
  } else if (choose == 3) {
    bezier(x+uW,  y+uH/2,         // point 1 mid-right
          x+uW/2, y+uH/2,         // handle 1
          x+uW/2, y+sOffset,      // handle 2
          x,      y+sOffset);     // point 2 up-left
  }
}

void horizontLines() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(SQUARE);
  strokeJoin(ROUND);
  noFill();
  int lineMax = int(random(3, 6));
  // PATTERN
  choose = 0;
  if (choose == 0) {
    for (int i = 1; i <= lineMax; i++) {
      line(x , y+i*uH/(lineMax+1), x+uW, y+i*uH/(lineMax+1));
    }
  }
}

void sineWave() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(SQUARE);
  strokeJoin(ROUND);
  noFill();

  // PATTERN
  float sineOff = sineStart;

  // float j = map(sin(sineOff), -1, 1, 0, uH);
  // line(x, y+j*noise(xoff), x+uW, y+j*noise(xoff));
  // sineStart += sineIncr;

  beginShape();
  // float sineOff = sineStart;
  for (int i = 0; i < uW; i++) {
    float j = map(sin(sineOff), -1, 1, uH/4, uH-uH/4);
    vertex(x+i, y+j);
    sineOff += sineIncr;
  }
  sineStart += sineIncr;
  endShape();
}

void diagLine2() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(SQUARE);
  strokeJoin(ROUND);
  noFill();

  // PATTERN
  choose = round(random(1));
  if (choose == 0) {
    beginShape();
    vertex(x, y);
    vertex(x + uW/3, y + uH/3);
    vertex(x + uW - uW/3, y + uH/3);
    vertex(x + uW, y + uH);
    endShape();
  } else if (choose == 1) {
    beginShape();
    vertex(x+uW, y);
    vertex(x+uW - uW/3, y+uH - uH/3);
    vertex(x+uW/3, y+uH - uH/3);
    vertex(x, y+uH);
    endShape();
  }
}

void cross() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(SQUARE);
  strokeJoin(ROUND);
  noFill();

  // PATTERN
  line(x+uW/5, y+uH/5, x+(uW-uW/5), y+(uH-uH/5));
  line(x+uW/5, y+(uH-uH/5), x+(uW-uW/5), y+uH/5);
}

void circle() {
  // STYLING
  int sChoose = round(random(1));
  if (sChoose == 0) {
    noStroke();
    fill(fColor);
  } else {
    noFill();
    stroke(sColor);
    strokeWeight(sWeight);
  }
  strokeCap(SQUARE);
  strokeJoin(ROUND);

  // VARIABELN
  float circleSize;

  // PATTERN
  choose = round(random(1));

  if (uW < uH) {
    circleSize = random(uW/8, uW/2);
  } else {
    circleSize = random(uH/8, uH/2);
  }

  if (choose == 0) {
    ellipse(x+uW/2, y+uH/2, circleSize, circleSize);
  } else {
    // Radius auf 180 Grad Winkel beschränken
    // nur halbe Kreise
    float arcStart =  radians(map(int(random(2)), 0, 2, 0, 360));
    float arcEnd =    radians(map(int(random(2)), 0, 2, 0, 360));
    // arcOffset müsste besser organisiert werden
    float arcOffset = radians(map(int(random(4)), 0, 4, 0, 360));
    if (uW < uH) {
      arc(x+uW/2, y+uH/2, circleSize, circleSize, arcStart+arcOffset, arcEnd+arcOffset, PIE);
    } else {
      arc(x+uW/2, y+uH/2, circleSize, circleSize, arcStart+arcOffset, arcEnd+arcOffset, PIE);
    }
  }
}

void space() {
}

void dotGrid() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(SQUARE);
  strokeJoin(ROUND);
  noFill();
  int dotDensity = int(random(3, 10));

  // Punktraster zeichnen
  for (int i = 1; i < dotDensity; i++) {
    for (int j = 1; j < dotDensity; j++) {
      point(x+(i*(uW/dotDensity)), y+(j*(uH/dotDensity)));
    }
  }
}

void linefigures() {
  
}

void makePDF() {
  // PDF ERSTELLEN
  if (pdfRender) {
    if (y + uH >= height) {
      // PDF fertigstellen + neue Seite
      if (pageCount < pageMax) {
        // pdf.nextPage();
        pageCount ++;
        println(pageCount);
        y = 0;
      } else {
        exit();
      }
    }
  } else {
    // Seite scrollen
    // nächste Zeile leeren
    if (y + uH >= height) {
      copy(0, 0, width, y, 0, int(-uH), width, y);
      fill(bgndColor);
      noStroke();
      rect(0-padding, y-uH, width, uHmax);
      y = y-int(uH);
    }
  }
}
