import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_161122a_linePattern_v2 extends PApplet {

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
int sColor = color(0),
      fColor = color(0),
      bgndColor = color(255);
int sWeight = 3;


// ----------------------------------------------------------

public void setup() {
  
  background(bgndColor);
  frameRate(30);
}

// ---------------------------------------------------------

public void draw() {
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

  // \u00dcberlauf in n\u00e4chste Zeile
  if (x + uWidth >= width) {
    x = 0;
    // random Unitsize
    y += uHeight;
    uWidth = round(random(uWmin, uWmax));
    uHeight = round(random(uHmin, uHmax));
    println(uWidth, uHeight);
  }
  // Seite zur\u00fccksetzen
  if (y + uHeight >= height) {
    y = 0;
    saveFile();
    background(bgndColor);
  }

  // saveFile();
}

// ----------------------------------------------------------

public void diagLine() {
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

public void shapeDraw() {
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

public void diagLine2() {
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

public void saveFile() {
  saveFrame("linePattern-####.png");
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161122a_linePattern_v2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
