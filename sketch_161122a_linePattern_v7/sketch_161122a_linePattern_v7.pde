// LIBRARIES
import processing.pdf.*;
int pageCount = 0;
int pageMax = 99;
boolean pdfRender = true;
PGraphicsPDF pdf;

// VARIABELN
int choose = 0;
float[] rArray;
boolean foundOne;
int x = 0, y = 0;
int padding = 150;

// ARRAY
FloatDict patterns;
float[] vArray;
String[] kArray;

// NOISE
float xoff = 0;
float yoff = 10000;
float incr = 0.05;
float yincr = 0.001;
float sineOff = 0;
float sineOffInc = 0.005;

// SINE
float sineAngle = 0;
float sineInc = PI/14;
float scaleVal = 0;

// UNITS
float uWmin = 30;
float uWmax = 600;
float uHmin = 30;
float uHmax = 600;
float uW = round(random(uWmin, uWmax));
float uH = round(random(uHmin, uHmax));

// STYLING
color sColor = color(0),
      fColor = color(0),
      bgndColor = color(255);
float sWeight = 9;
float sOff = sWeight/2; // used for offsetting strokes
int sCap = ROUND;
int sJoin = ROUND;

// ----------------------------------------------------------
// SETTINGS

void settings() {
  if (pdfRender) {
    size(4961, 7016, PDF, "linepattern_v7_A2.pdf");
  } else {
    // size(1200, 800);
    fullScreen();
  }
}

// ----------------------------------------------------------
// SETUP

void setup() {
  background(bgndColor);

  // Framerate for PDF or normal use
  if (pdfRender) {
    frameRate(3000);
  } else {
    frameRate(25);
  }

  // FloatDict init
  patterns = new FloatDict();
  rArray = new float[100];
  for (int i=0; i<rArray.length; i++) {
    rArray[i] = random(100000);
  }
}

// ---------------------------------------------------------
// DRAW

void draw() {
  // clear sides with background color
  clearSides();

  // PDF renderer
  if (pdfRender) {
    pdf = (PGraphicsPDF) g;
  }

  // RNG for patterns
  setPatternNoise();

  // set UnitWidth to random or until margin
  if (dist(x, y, width-padding*2, y) > uWmax) {
    uW = round(random(uWmin, uWmax));
  } else {
    uW = dist(x, y, width-padding*2, y);
  }

  // sorting Dictionary
  patterns.sortValues();
  vArray = patterns.valueArray();
  kArray = patterns.keyArray();

  // set maximum Range
  float chooseMax = max(vArray);
  // choose Random Number for chooseFunction
  choose = round(map(noise(xoff), 0, 1, 0, chooseMax));

  // choose function for keys in array
  chooseFunction();

  // Paragraph Overflow or move X
  if (x + uW > width-padding*2-1) {
    // random Unitheight
    x = 0;
    y += uH;
    uH = round(random(uHmin, uHmax));
  } else {
    x += uW;
  }

  // NOISE increment
  xoff += incr;
  yoff += yincr;

  // PDF create
  // or scroll screencontent
  if (pdfRender) {
    makePDF();
  } else {
    scrollScreen();
  }
}

// ----------------------------------------------------------
// CORE FUNCTIONS

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
      } else if (kArray[index] == "triangleDraw") {
        triangleDraw();
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
      } else if (kArray[index] == "lineFigures") {
        lineFigures();
        foundOne = true;
      } else if (kArray[index] == "dotGrid") {
        dotGrid();
        foundOne = true;
      }
      // exit condition
      if (foundOne) {
        break;
      }
    }
  }
}

void setPatternNoise() {
  // patterns.set("triangleDraw",  map(noise(yoff+rArray[0]), 0, 1, 0, 100));
  // patterns.set("cross",         map(noise(yoff+rArray[1]), 0, 1, 0, 100));
  // patterns.set("horizontLines", map(noise(yoff+rArray[2]), 0, 1, 0, 100));
  // patterns.set("triangleDraw",  map(noise(yoff+rArray[3]), 0, 1, 0, 100));
  patterns.set("circle",        map(noise(yoff+rArray[4]), 0, 1, 0, 100));
  patterns.set("diagLine2",     map(noise(yoff+rArray[5]), 0, 1, 0, 100));
  patterns.set("diagLine",      map(noise(yoff+rArray[6]), 0, 1, 0, 100));
  patterns.set("curves",        map(noise(yoff+rArray[7]), 0, 1, 0, 100));
  patterns.set("space",         map(noise(yoff+rArray[8]), 0, 1, 0, 100));
  patterns.set("lineFigures",   map(noise(yoff+rArray[9]), 0, 1, 0, 100));
  // patterns.set("sineWave",      map(noise(yoff+rArray[10]), 0, 1, 0, 100));
  // patterns.set("dotGrid",       map(noise(yoff+rArray[11]), 0, 1, 0, 100));
}

void makePDF() {
  // PDF ERSTELLEN
  if (pdfRender) {
    if (y + uH >= height) {
      // PDF fertigstellen + neue Seite
      if (pageCount < pageMax) {
        pdf.nextPage();
        pageCount ++;
        println(pageCount);
        y = 0;
      } else {
        exit();
      }
    }
  }
}

void scrollScreen() {
  if (y + uH >= height) {
    copy(0, 0, width, y, 0, int(-uH), width, y);
    fill(bgndColor);
    noStroke();
    rect(0-padding, y-uH, width, uHmax);
    y = y-int(uH);
  }
}

void clearSides() {
  fill(bgndColor);
  noStroke();
  rect(0, 0, padding, y);
  rect(width-padding, 0, padding, y);
  translate(padding, 0);
}

// ----------------------------------------------------------
// PATTERN FUNCTIONS

void diagLine() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(sCap);
  strokeJoin(sJoin);
  noFill();

  // PATTERN
  choose = round(random(1));
  if (choose == 0) {
      line(x, y+sOff, x+uW, y+uH-sOff);
    } else {
      line(x, y+uH-sOff, x+uW, y+sOff);
  }
}

void triangleDraw() {
  choose = round(random(1));

  // STYLING
  if (choose < 2) {
    fill(fColor);
    noStroke();
  } else {
    noFill();
    stroke(sColor);
    strokeWeight(sWeight);
  }

  // PATTERN
  if (choose == 0) {
    triangle(x, y, x+uW, y, x, y+uH);
  } else if (choose == 1) {
    triangle(x+uW, y, x+uW, y+uH, x, y+uH);
  // } else if (choose == 2) {
  //   unfilled shapes
  //   triangle(x, y, x+uW, y, x, y+uH);
  // } else if (choose == 3) {
  //   triangle(x+uW, y, x+uW, y+uH, x, y+uH);
  }
}

void curves() {
  choose = round(random(7));

  // STYLING
  if (choose < 4) {
    noFill();
    stroke(sColor);
    strokeWeight(sWeight);
    strokeCap(sCap);
    strokeJoin(sJoin);
  } else {
    fill(fColor);
    noStroke();
  }

  // PATTERN
  if (choose == 0) {
    bezier(x,     y+uH/2,       // point 1 mid-left
          x+uW/2, y+uH/2,       // handle 1
          x+uW/2, y+uH-sOff,    // handle 2
          x+uW,   y+uH-sOff);   // point 2 down-right
  } else if (choose == 1) {
    bezier(x+uW,  y+uH/2,       // point 1 mid-right
          x+uW/2, y+uH/2,       // handle 1
          x+uW/2, y+uH-sOff,    // handle 2
          x,      y+uH-sOff);   // point 2 down-left
  } else if (choose == 2) {
    bezier(x+uW,  y+uH/2,       // point 1 mid-right
          x+uW/2, y+uH/2,       // handle 1
          x+uW/2, y+sOff,       // handle 2
          x,      y+sOff);      // point 2 up-left
  } else if (choose == 3) {
    bezier(x+uW,  y+uH/2,       // point 1 mid-right
          x+uW/2, y+uH/2,       // handle 1
          x+uW/2, y+sOff,       // handle 2
          x,      y+sOff);      // point 2 up-left
  } else if (choose == 4) {
    // Filled shapes
    beginShape();
    vertex        (x,       y+uH/2);  // vertex 1 mid-left
    bezierVertex  (x+uW/2,  y+uH/2,   // handle 1
                  x+uW/2,   y+uH,     // handle 2
                  x+uW,     y+uH);    // vertex 2 down-right
    bezierVertex  (x+uW,    y+uH,     // handle 1 (sharp)
                  x,        y+uH,     // handle 2 (sharp)
                  x,        y+uH);    // vertex 3 down-left
    endShape();
  } else if (choose == 5) {
    beginShape();
    vertex        (x+uW,    y+uH/2);  // vertex 1 mid-right
    bezierVertex  (x+uW/2,  y+uH/2,   // handle 1
                  x+uW/2,   y+uH,     // handle 2
                  x,        y+uH);    // vertex 2 down-left
    bezierVertex  (x,       y+uH,     // handle 1 (sharp)
                  x+uW,     y+uH,     // handle 2 (sharp)
                  x+uW,     y+uH);    // vertex 3 down-left
    endShape();
  } else if (choose == 6) {
    beginShape();
    vertex        (x+uW,    y+uH/2);  // vertex 1 mid-right
    bezierVertex  (x+uW/2,  y+uH/2,   // handle 1
                  x+uW/2,   y,        // handle 2
                  x,        y);       // vertex 2 up-left
    bezierVertex  (x,       y,        // handle 1 (sharp)
                  x+uW,     y,        // handle 2 (sharp)
                  x+uW,     y);       // vertex 3 up-right
    endShape();
  } else if (choose == 7) {
    beginShape();
    vertex        (x,       y+uH/2);  // vertex 1 mid-left
    bezierVertex  (x+uW/2,  y+uH/2,   // handle 1
                  x+uW/2,   y,        // handle 2
                  x+uW,     y);       // vertex 2 up-right
    bezierVertex  (x+uW,    y,        // handle 1 (sharp)
                  x,        y,        // handle 2 (sharp)
                  x,        y);       // vertex 3 up-left
    endShape();
  }
}

void horizontLines() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(PROJECT);
  strokeJoin(sJoin);
  noFill();

  int lineMax = int(random(3, 6));
  // PATTERN
  for (int i = 1; i <= lineMax; i++) {
      line(x+sOff , y+i*uH/(lineMax+1), x+uW-sOff, y+i*uH/(lineMax+1));
  }
}

void sineWave() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(sCap);
  strokeJoin(sJoin);
  noFill();

  // PATTERN
  beginShape();
  for (int i=0; i<uW; i++) {
    scaleVal =  map(noise(sineOff+60000), 0, 1, 0, uH/2);
    sineInc =   map(noise(sineOff), 0, 1, PI/180, PI/6);
    float tempY = uH/2 + (sin(sineAngle) * scaleVal);
    vertex(x+i, y+tempY);
    // increment noise for sine
    sineAngle += sineInc;
    sineOff += sineOffInc;
  }
  endShape();
}

void diagLine2() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(sCap);
  strokeJoin(sJoin);
  noFill();

  // PATTERN
  choose = round(random(1));
  if (choose == 0) {
    beginShape();
    vertex(x, y+sOff);
    vertex(x+uW/3, y+uH/3);
    vertex(x+uW-uW/3, y+uH/3);
    vertex(x+uW, y+uH-sOff);
    endShape();
  } else if (choose == 1) {
    beginShape();
    vertex(x+uW, y+sOff);
    vertex(x+uW-uW/3, y+uH-uH/3);
    vertex(x+uW/3, y+uH-uH/3);
    vertex(x, y+uH-sOff);
    endShape();
  }
}

void cross() {
  choose = round(random(1));

  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(sCap);
  strokeJoin(sJoin);
  noFill();

  // PATTERN
  if (choose == 0) {
    line(x+uW/5, y+uH/5, x+(uW-uW/5), y+(uH-uH/5));
    line(x+uW/5, y+(uH-uH/5), x+(uW-uW/5), y+uH/5);
  } else {
    line(x+uW/2, y, x+uW/2, y+uH);
    line(x, y+uH/2, x+uW, y+uH/2);
  }
}

void circle() {
  choose = round(random(1));
  // LOCAL VARIABLES
  float circleSize = 0;

  // STYLING
  int sChoose = round(random(1));
  if (sChoose == 0) {
    noStroke();
    fill(fColor);
  } else {
    noFill();
    stroke(sColor);
    strokeWeight(sWeight);
    strokeCap(sCap);
    strokeJoin(sJoin);
  }

  // PATTERN
  if (choose == 0) {
    if (uW < uH) {
      circleSize = random(uW/8, uW);
    } else {
      circleSize = random(uH/8, uH);
    }
    ellipse(x+uW/2, y+uH/2, circleSize, circleSize);
  } else {
    // set arc to 180 degrees
    float arcStart =  radians(0);
    float arcEnd =    radians(180);
    // Offset rotation
    float arcOffset = radians(map(int(random(8)), 0, 8, 0, 360));
    if (uW < uH) {
      circleSize = random(uW/8, uW);
      arc(x+uW/2, y+uH/2, circleSize, circleSize, arcStart+arcOffset, arcEnd+arcOffset, PIE);
    } else {
      circleSize = random(uH/8, uH);
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
  strokeCap(sCap);
  strokeJoin(sJoin);
  noFill();
  int dotDensity = int(random(3, 10));

  // Punktraster zeichnen
  for (int i = 1; i < dotDensity; i++) {
    for (int j = 1; j < dotDensity; j++) {
      point(x+(i*(uW/dotDensity)), y+(j*(uH/dotDensity)));
    }
  }
}

void lineFigures() {
  // VARIABLES
  int lnNumMin = 3;
  int lnNumMax = 7;
  int lnNumber = int(random(lnNumMin, lnNumMax));
  float xTemp, yTemp;
  // STYLING
  noFill();
  stroke(sColor);
  strokeWeight(sWeight);

  beginShape();
  for (int i = 0; i < lnNumber; i++) {
    int cycle = round(random(0, 1));
    if (cycle == 0) {
      // x = 0 or 100
      choose = round(random(0, 1));
      if (choose == 0) {
        xTemp = uW/6;
      } else {
        xTemp = uW-uW/6;
      }
      yTemp = round(random(uH));
    } else {
      // y = 0 or 100
      choose = round(random(0, 1));
      if (choose == 0) {
        yTemp = uH/6;
      } else {
        yTemp = uH-uH/6;
      }
      xTemp = round(random(uW));
    }
    // draw Points
    vertex(x + xTemp , y + yTemp);
  }
  endShape();
}
