// LIBRARIES
import processing.pdf.*;
int pageCount = 0;
int pageMax = 100;
boolean pdfRender = false;
PGraphicsPDF pdf;

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
float yincr = 0.001;

// SINE
float sineAngle = 0;
float sineInc = PI/28;
float scaleVal = 0;


// UNITS
float uWmin = 10;
float uWmax = 140;
float uHmin = 10;
float uHmax = 160;
float uW = round(random(uWmin, uWmax));
float uH = round(random(uHmin, uHmax));

// STYLING
color sColor = color(0),
      fColor = color(0),
      bgndColor = color(255);
float sWeight = 3;
float sOff = sWeight/2;
int sCap = ROUND;
int sJoin = ROUND;

// ----------------------------------------------------------

void settings()
{
  if (pdfRender) {
    size(1900, 1080, PDF, "linepattern_v7.pdf");
  } else {
    // size(1200, 1000);
    fullScreen();
  }
}

// ----------------------------------------------------------

void setup()
{
  background(bgndColor);

  // Framerate for PDF or normal use
  if (pdfRender) {
    frameRate(3000);
  } else {
    frameRate(20);
  }

  // FloatDict init
  patterns = new FloatDict();
  // patterns.set("cross", 15);
  // patterns.set("horizontLines", 25);
  // patterns.set("triangleDraw", 40);
  // patterns.set("circle", 45);
  // patterns.set("diagLine2", 55);
  // patterns.set("diagLine", 65);
  // patterns.set("curves", 70);
  // patterns.set("space", 80);
  // patterns.set("lineFigures", 90);
  patterns.set("sineWave", 100);
}

// ---------------------------------------------------------

void draw()
{
  translate(padding, 0);
  // PDF renderer
  if (pdfRender) {
    pdf = (PGraphicsPDF) g;
  }

  // RNG for patterns
  // patterns.set("triangleDraw", map(noise(yoff), 0, 1, 0, 100));
  // patterns.set("cross", map(noise(yoff+58637), 0, 1, 0, 100));
  // patterns.set("horizontLines", map(noise(yoff+12354), 0, 1, 0, 100));
  // patterns.set("triangleDraw", map(noise(yoff+1826), 0, 1, 0, 100));
  // patterns.set("circle", map(noise(yoff-3000), 0, 1, 0, 100));
  // patterns.set("diagLine2", map(noise(yoff+5000), 0, 1, 0, 100));
  // patterns.set("diagLine", map(noise(yoff+80000), 0, 1, 0, 100));
  // patterns.set("curves", map(noise(yoff+16358), 0, 1, 0, 100));
  // patterns.set("space", map(noise(yoff+87381), 0, 1, 0, 100));
  // patterns.set("lineFigures", map(noise(yoff+43891), 0, 1, 0, 100));
  // patterns.set("sineWave", map(noise(yoff+9471), 0, 1, 0, 100));



  // sorting Dictionary
  patterns.sortValues();
  vArray = patterns.valueArray();
  kArray = patterns.keyArray();
  // if (frameCount % 60 == 0) {
  //   println(patterns);
  // }

  float chooseMax = max(vArray);
  choose = round(map(noise(xoff), 0, 1, 0, chooseMax));

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
  yoff += yincr;

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
  strokeCap(sCap);
  strokeJoin(sJoin);
  noFill();

  // PATTERN
  choose = round(random(3));
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
  choose = 0;
  if (choose == 0) {
    for (int i = 1; i <= lineMax; i++) {
      line(x+sOff , y+i*uH/(lineMax+1), x+uW-sOff, y+i*uH/(lineMax+1));
    }
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
  float sineOff = sineAngle;

  beginShape();
  // float sineOff = sineAngle;
  for (int i=0; i<uW; i++) {
    float tempY = (sin(angle) * scaleVal);
  }
  for (int i = 0; i < uW; i++) {
    float j = map(sin(sineOff), -1, 1, uH/4, uH-uH/4);
    vertex(x+i, y+j);
    sineOff += sineInc;
  }
  sineAngle += sineInc;
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
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(sCap);
  strokeJoin(sJoin);
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
  strokeCap(sCap);
  strokeJoin(sJoin);

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
