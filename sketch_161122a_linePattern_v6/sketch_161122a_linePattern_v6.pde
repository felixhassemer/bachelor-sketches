// LIBRARIES
import processing.pdf.*;
int pageCount = 0;
int pageMax = 100;
boolean pdfRender = false;

// VARIABELN
int choose = 0;
int x = 0, y = 0;
int xTrans = 20;

// NOISE
float xoff = 0;
float incr = 0.05;

// sineWave
float sineStart = 0;
float sineIncr = 0.3;

// UNITS
float uWmin = 20;
float uWmax = 160;
float uHmin = 20;
float uHmax = 200;
float uWidth = round(random(uWmin, uWmax));
float uHeight = round(random(uHmin, uHmax));

// STYLING
color sColor = color(0),
      fColor = color(0),
      bgndColor = color(255);
int sWeight = 3;

// ----------------------------------------------------------

void settings()
{
  if (pdfRender) {
    size(1200, 1200, PDF, "linepattern#####.pdf");
  } else {
    // size(800, 800);
    fullScreen();
  }
}

// ----------------------------------------------------------

void setup()
{
  background(bgndColor);
  frameRate(25);
}

// ---------------------------------------------------------

void draw()
{
  translate(xTrans, 0);
  // PDF renderer
  if (pdfRender) {
    PGraphicsPDF pdf = (PGraphicsPDF) g;
  }


  choose = round(map(noise(xoff), 0, 1, 0, 100));
  // println(choose);

  // PATTERNS mischen!
  if (choose < 15) {
    cross();
  } else if (choose < 25) {
    horizontLines();
  } else if (choose < 40) {
    shapeDraw();
  } else if(choose < 45) {
    circle();
  } else if(choose < 60) {
    diagLine2();
  } else if(choose < 70) {
    diagLine();
  // } else if(choose < 75) {
  //   dotGrid();
  // } else if(choose < 85) {
  //   space();
  } else if(choose < 100) {
    sineWave();
  }

  // Neue Unitsize
  x += uWidth;
  xoff += incr;
  uWidth = round(random(uWmin, uWmax));


  // Überlauf in nächste Zeile
  if (x + uWidth >= width-xTrans) {
    x = 0;
    // random Unitsize
    y += uHeight;
    uHeight = round(random(uHmin, uHmax));

  }

  // PDF erstellen
  makePDF();

}


// ----------------------------------------------------------

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
  choose = round(random(3));
  if (choose == 0) {
    triangle(x, y, x+uWidth, y, x, y+uHeight);
  } else if (choose == 1) {
    triangle(x+uWidth, y, x+uWidth, y+uHeight, x, y+uHeight);
  } else if (choose == 2) {
    noFill();
    stroke(sColor);
    strokeWeight(sWeight);
    triangle(x, y, x+uWidth, y, x, y+uHeight);
  } else if (choose == 3) {
    noFill();
    stroke(sColor);
    strokeWeight(sWeight);
    triangle(x+uWidth, y, x+uWidth, y+uHeight, x, y+uHeight);
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
      line(x , y+i*uHeight/(lineMax+1), x+uWidth, y+i*uHeight/(lineMax+1));
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

  // float j = map(sin(sineOff), -1, 1, 0, uHeight);
  // line(x, y+j*noise(xoff), x+uWidth, y+j*noise(xoff));
  // sineStart += sineIncr;

  beginShape();
  // float sineOff = sineStart;
  for (int i = 0; i < uWidth; i++) {
    float j = map(sin(sineOff), -1, 1, uHeight/4, uHeight-uHeight/4);
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
    vertex(x + uWidth/3, y + uHeight/3);
    vertex(x + uWidth - uWidth/3, y + uHeight/3);
    vertex(x + uWidth, y + uHeight);
    endShape();
  } else if (choose == 1) {
    beginShape();
    vertex(x+uWidth, y);
    vertex(x+uWidth - uWidth/3, y+uHeight - uHeight/3);
    vertex(x+uWidth/3, y+uHeight - uHeight/3);
    vertex(x, y+uHeight);
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
  line(x+uWidth/5, y+uHeight/5, x+(uWidth-uWidth/5), y+(uHeight-uHeight/5));
  line(x+uWidth/5, y+(uHeight-uHeight/5), x+(uWidth-uWidth/5), y+uHeight/5);
}

void circle() {
  // Perfekten Kreis zeichnen

  // PATTERN
  choose = round(random(1));
  // println(choose);
  float circleSize = random(10, (uWidth + uHeight)/2);
  if (choose == 0) {
    ellipse(x+uWidth/2, y+uHeight/2, circleSize, circleSize);
  } else {
    // Radius auf 90 Grad Winkel beschränken
    // nur halbe Kreise
    float arcStart =  radians(map(int(random(2)), 0, 2, 0, 360));
    float arcEnd =    radians(map(int(random(2)), 0, 2, 0, 360));
    // arcOffset müsste besser organisiert werden
    float arcOffset = radians(map(int(random(4)), 0, 4, 0, 360));
    if (uWidth < uHeight) {
      float rW = random(uWidth/6, uWidth/2);
      arc(x+uWidth/2, y+uHeight/2, circleSize, circleSize, arcStart+arcOffset, arcEnd+arcOffset, PIE);
    } else {
      float rH = random(uHeight/6, uHeight/2);
      arc(x+uWidth/2, y+uHeight/2, rH, rH, arcStart+arcOffset, arcEnd+arcOffset, PIE);
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
      // println(i, j);
      point(x+(i*(uWidth/dotDensity)), y+(j*(uHeight/dotDensity)));
    }
  }
}

void linefigures() {

}

void makePDF() {
  // PDF ERSTELLEN
  if (pdfRender) {
    if (y + uHeight >= height) {
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
    if (y + uHeight >= height) {
      copy(0, 0, width, y, 0, int(-uHeight), width, y);
      fill(bgndColor);
      noStroke();
      rect(0-xTrans, y-uHeight, width, uHmax);
      y = y-int(uHeight);
    }
  }
}
