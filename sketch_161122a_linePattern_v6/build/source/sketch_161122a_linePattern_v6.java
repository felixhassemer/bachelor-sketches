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

// UNITS
int uWmin = 10;
int uWmax = 150;
int uHmin = 10;
int uHmax = 180;
int uWidth = round(random(20, 60));
int uHeight = round(random(20, 60));

// STYLING
int sColor = color(0),
      fColor = color(0),
      bgndColor = color(255);
int sWeight = 3;

// ----------------------------------------------------------

public void settings()
{
  if (pdfRender) {
    size(800, 800, PDF, "linepattern#####.pdf");
  } else {
    // size(800, 800);
    fullScreen();
  }
}

// ----------------------------------------------------------

public void setup()
{
  background(bgndColor);
  frameRate(30);
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
  // println(choose);

  // PATTERNS mischen!
  if (choose < 15) {
    cross();
  } else if (choose < 40) {
    shapeDraw();
  } else if(choose < 45) {
    circle();
  } else if(choose < 60) {
    diagLine2();
  } else if(choose < 70) {
    diagLine();
  } else if(choose < 75) {
    dotGrid();
  } else if(choose < 80) {
    horizontLines();
  } else if(choose < 100) {
    space();
  }

  // Neue Unitsize
  x += uWidth;
  xoff += incr;
  uWidth = round(random(uWmin, uWmax));

  // \u00dcberlauf in n\u00e4chste Zeile
  if (x + uWidth >= width-xTrans) {
    x = 0;
    // random Unitsize
    y += uHeight;
    // uWidth = round(random(uWmin, uWmax));
    uHeight = round(random(uHmin, uHmax));
  }


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
    // n\u00e4chste Zeile leeren
    if (y + uHeight >= height) {
      copy(0, 0, width, y, 0, -uHeight, width, y);
      fill(bgndColor);
      noStroke();
      rect(0-xTrans, y-uHeight, width, uHmax);
      y = y-uHeight;
    }
  }
}


// ----------------------------------------------------------

public void diagLine() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(ROUND);
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

public void shapeDraw() {
  // STYLING
  fill(fColor);
  noStroke();

  // PATTERN
  choose = round(random(1));
  if (choose == 0) {
    triangle(x, y, x+uWidth, y, x, y+uHeight);
  } else if (choose == 1) {
    triangle(x+uWidth, y, x+uWidth, y+uHeight, x, y+uHeight);
    // line(x, y + uHeight, x + uWidth, y);
  }
}

public void horizontLines() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(SQUARE);
  strokeJoin(ROUND);
  noFill();

  // PATTERN
  choose = round(random(0));
  if (choose == 0) {
    for (int i = 0; i <= 3; i++) {
      line(x , y+i*10, x+uWidth, y+i*10);
    }
  } else if (choose == 1) {

  }
}

public void diagLine2() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  noFill();

  // PATTERN
  choose = round(random(3));
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

public void cross() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  noFill();

  // PATTERN
  line(x+uWidth/5, y+uHeight/5, x+(uWidth-uWidth/5), y+(uHeight-uHeight/5));
  line(x+uWidth/5, y+(uHeight-uHeight/5), x+(uWidth-uWidth/5), y+uHeight/5);
}

public void circle() {
  // Perfekten Kreis zeichnen

  // PATTERN
  choose = round(random(1));
  float circleSize = random(10, (uWidth + uHeight)/2);
  if (choose == 1) {
    ellipse(x+uWidth/2, y+uHeight/2, circleSize/2, circleSize/2);
  } else {
    // Radius auf 90 Grad Winkel beschr\u00e4nken
    // nur halbe Kreise
    float arcStart =  radians(map(PApplet.parseInt(random(2)), 0, 2, 0, 360));
    float arcEnd =    radians(map(PApplet.parseInt(random(2)), 0, 2, 0, 360));
    float arcOffset = radians(map(PApplet.parseInt(random(4)), 0, 4, 0, 360));
    if (uWidth < uHeight) {
      float rW = random(uWidth/6, uWidth/2);
      arc(x+uWidth/2, y+uHeight/2, circleSize, circleSize, arcStart+arcOffset, arcEnd+arcOffset, PIE);
    } else {
      float rH = random(uHeight/6, uHeight/2);
      arc(x+uWidth/2, y+uHeight/2, rH, rH, arcStart+arcOffset, arcEnd+arcOffset, PIE);
    }
  }
}

public void space() {
}

public void dotGrid() {
  // STYLING
  stroke(sColor);
  strokeWeight(sWeight);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  noFill();
  int dotDensity = PApplet.parseInt(random(3, 10));
  // Punktraster zeichnen
  for (int i = 1; i < dotDensity; i++) {
    for (int j = 1; j < dotDensity; j++) {
      // println(i, j);
      point(x+(i*(uWidth/dotDensity)), y+(j*(uHeight/dotDensity)));
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
