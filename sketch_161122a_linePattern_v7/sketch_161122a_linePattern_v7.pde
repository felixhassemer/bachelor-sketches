// LIBRARIES
import processing.pdf.*;
int pageCount = 0;
int pageMax = 100;
boolean pdfRender = false;

// VARIABELN
int choose = 0;
boolean foundOne;
int x = 0, y = 0;
int xTrans = 20;

// ARRAY
FloatDict patterns;


// NOISE
float xoff = 0;
float incr = 0.05;

// SINE
float sineStart = 0;
float sineIncr = 0.3;

// UNITS
float uWmin = 20;
float uWmax = 160;
float uHmin = 20;
float uHmax = 200;
float uW = round(random(uWmin, uWmax));
float uH = round(random(uHmin, uHmax));

// STYLING
color sColor = color(0),
      fColor = color(0),
      bgndColor = color(255);
float sWeight = 3;

// ----------------------------------------------------------

void settings()
{
  if (pdfRender) {
    size(1200, 1200, PDF, "linepattern#####.pdf");
  } else {
    size(1000, 1000);
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
  translate(xTrans, 0);
  // PDF renderer
  if (pdfRender) {
    PGraphicsPDF pdf = (PGraphicsPDF) g;
  }


  choose = round(map(noise(xoff), 0, 1, 0, 100));
  // choose = round(random(0, 100));

  // sorting Dictionary
  patterns.sortValues();
  float[] vArray = patterns.valueArray();
  String[] kArray = patterns.keyArray();
  println(patterns);

  // choose function for keys in array
  for (int index=0; index < patterns.size(); index++) {
    foundOne = false;
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
    if (foundOne == true) {
      break;
    }
  }
  // for (int i=0; i < patterns.size(); i++) {
  //   if (kArray[i] == "cross") {
  //     cross();
  //   } else if (kArray[i] == "horizontLines") {
  //     horizontLines();
  //   } else if (kArray[i] == "shapeDraw") {
  //     shapeDraw();
  //   } else if (kArray[i] == "circle") {
  //     circle();
  //   } else if (kArray[i] == "diagLine2") {
  //     diagLine2();
  //   } else if (kArray[i] == "diagLine") {
  //     diagLine();
  //   } else if (kArray[i] == "curves") {
  //     curves();
  //   } else if (kArray[i] == "space") {
  //     space();
  //   } else if (kArray[i] == "sineWave") {
  //     sineWave();
  //   }
  // }
  //
  // // PATTERNS mischen!
  // if (choose < 15) {
  //   cross();
  // } else if (choose < 25) {
  //   horizontLines();
  // } else if (choose < 40) {
  //   shapeDraw();
  // } else if(choose < 45) {
  //   circle();
  // } else if(choose < 55) {
  //   diagLine2();
  // } else if(choose < 65) {
  //   diagLine();
  // } else if(choose < 70) {
  //   curves();
  // } else if(choose < 80) {
  //   space();
  // } else if(choose < 100){
  //   sineWave();
  // }


  // Neue Unitsize
  x += uW;
  xoff += incr;
  uW = round(random(uWmin, uWmax));


  // Überlauf in nächste Zeile
  if (x + uW >= width-xTrans) {
    x = 0;
    // random Unitsize
    y += uH;
    uH = round(random(uHmin, uHmax));

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
  choose = round(random(1));
  if (choose == 0) {
      bezier(x, y,
            x+uW, y,
            x, y+uH,
            x+uW, y+uH);
    } else {
      bezier(x+uW, y,
            x, y,
            x+uW, y+uH,
            x, y+uH);
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
  // Perfekten Kreis zeichnen
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(SQUARE);
  strokeJoin(ROUND);
  noFill();

  // PATTERN
  choose = round(random(1));
  // println(choose);
  float circleSize = random(10, (uW + uH)/2);
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
      float rW = random(uW/6, uW/2);
      arc(x+uW/2, y+uH/2, circleSize, circleSize, arcStart+arcOffset, arcEnd+arcOffset, PIE);
    } else {
      float rH = random(uH/6, uH/2);
      arc(x+uW/2, y+uH/2, rH, rH, arcStart+arcOffset, arcEnd+arcOffset, PIE);
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
      rect(0-xTrans, y-uH, width, uHmax);
      y = y-int(uH);
    }
  }
}
