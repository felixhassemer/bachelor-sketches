import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.pdf.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_161122a_linePattern_v6 extends PApplet {

// LIBRARIES

int pageCount = 0;
int pageMax = 100;
boolean pdfRender = false;

// VARIABELN
int choose = 0;
int x = 0, y = 0;
int xTrans = 20;

// NOISE
float xoff = 0;
float incr = 0.05f;

// SINE
float sineStart = 0;
float sineIncr = 0.3f;

// UNITS
float uWmin = 20;
float uWmax = 160;
float uHmin = 20;
float uHmax = 200;
float uW = round(random(uWmin, uWmax));
float uH = round(random(uHmin, uHmax));

// STYLING
int sColor = color(0),
      fColor = color(0),
      bgndColor = color(255);
float sWeight = 3;

// ----------------------------------------------------------

public void settings()
{
  if (pdfRender) {
    size(1200, 1200, PDF, "linepattern#####.pdf");
  } else {
    // size(800, 800);
    fullScreen();
  }
}

// ----------------------------------------------------------

public void setup()
{
  background(bgndColor);
  frameRate(20);
}

// ---------------------------------------------------------

public void draw()
{
  translate(xTrans, 0);
  // PDF renderer
  if (pdfRender) {
    PGraphicsPDF pdf = (PGraphicsPDF) g;
  }


  choose = round(map(noise(xoff), 0, 1, 0, 100));
  // choose = round(random(0, 100));

  // PATTERNS mischen!
  if (choose < 15) {
    cross();
  } else if (choose < 25) {
    horizontLines();
  } else if (choose < 40) {
    shapeDraw();
  } else if(choose < 45) {
    circle();
  } else if(choose < 55) {
    diagLine2();
  } else if(choose < 65) {
    diagLine();
  } else if(choose < 75) {
    curves();
  } else if(choose < 80) {
    space();
  } else if(choose < 100){
    sineWave();
  }


  // Neue Unitsize
  x += uW;
  xoff += incr;
  uW = round(random(uWmin, uWmax));


  // \u00dcberlauf in n\u00e4chste Zeile
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

public void diagLine() {
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

public void shapeDraw() {
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

public void curves() {
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

public void horizontLines() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(SQUARE);
  strokeJoin(ROUND);
  noFill();
  int lineMax = PApplet.parseInt(random(3, 6));
  // PATTERN
  choose = 0;
  if (choose == 0) {
    for (int i = 1; i <= lineMax; i++) {
      line(x , y+i*uH/(lineMax+1), x+uW, y+i*uH/(lineMax+1));
    }
  }
}

public void sineWave() {
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

public void diagLine2() {
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

public void cross() {
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

public void circle() {
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
    // Radius auf 180 Grad Winkel beschr\u00e4nken
    // nur halbe Kreise
    float arcStart =  radians(map(PApplet.parseInt(random(2)), 0, 2, 0, 360));
    float arcEnd =    radians(map(PApplet.parseInt(random(2)), 0, 2, 0, 360));
    // arcOffset m\u00fcsste besser organisiert werden
    float arcOffset = radians(map(PApplet.parseInt(random(4)), 0, 4, 0, 360));
    if (uW < uH) {
      float rW = random(uW/6, uW/2);
      arc(x+uW/2, y+uH/2, circleSize, circleSize, arcStart+arcOffset, arcEnd+arcOffset, PIE);
    } else {
      float rH = random(uH/6, uH/2);
      arc(x+uW/2, y+uH/2, rH, rH, arcStart+arcOffset, arcEnd+arcOffset, PIE);
    }
  }
}

public void space() {
}

public void dotGrid() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(SQUARE);
  strokeJoin(ROUND);
  noFill();
  int dotDensity = PApplet.parseInt(random(3, 10));

  // Punktraster zeichnen
  for (int i = 1; i < dotDensity; i++) {
    for (int j = 1; j < dotDensity; j++) {
      point(x+(i*(uW/dotDensity)), y+(j*(uH/dotDensity)));
    }
  }
}

public void linefigures() {

}

public void makePDF() {
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
    // n\u00e4chste Zeile leeren
    if (y + uH >= height) {
      copy(0, 0, width, y, 0, PApplet.parseInt(-uH), width, y);
      fill(bgndColor);
      noStroke();
      rect(0-xTrans, y-uH, width, uHmax);
      y = y-PApplet.parseInt(uH);
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161122a_linePattern_v6" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
