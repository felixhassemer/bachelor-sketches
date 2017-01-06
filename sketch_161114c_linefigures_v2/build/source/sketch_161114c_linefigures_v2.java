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

public class sketch_161114c_linefigures_v2 extends PApplet {


// Variabeln f\u00fcr Linienkonstrukt
int xTemp, yTemp;
int lnNumber;
int lnNumMin = 5;
int lnNumMax = 7;
int cycle;
int choose;

// Variabeln Units
int x, y;
int gridOffset = 25;
int uWidth = 50;
int uHeight = 50;

public void setup() {
  
  noFill();
  stroke(0);
  strokeWeight(2);
  strokeJoin(ROUND);
  background(255);
  frameRate(30);
}

public void draw() {
  // background(255);
  translate(uWidth/4, uHeight/4);
  drawShapes();
  // saveFrame("linefigures-###.jpg");
}

// ----------------------------------------------------------

public void drawShapes() {
  //zeichne das Linienkonstrukt

  lnNumber = PApplet.parseInt(random(lnNumMin, lnNumMax));
  noStroke();
  fill(255);
  rectMode(CENTER);
  rect(x + uWidth/2, y + uHeight/2, uWidth + gridOffset/2, uHeight + gridOffset/2);
  noFill();

  stroke(0);
  beginShape();
  for (int i = 0; i < lnNumber; i++) {
    cycle = round(random(0, 1));
    if (cycle == 0) {
      // x = zuf\u00e4llig entweder 0 oder 100
      choose = round(random(0, 1));
      if (choose == 0) {
        xTemp = 0;
      } else {
        xTemp = uWidth;
      }
      yTemp = round(random(uHeight));
    } else {
      // y = zuf\u00e4llig entweder 0 oder 100
      choose = round(random(0, 1));
      if (choose == 0) {
        yTemp = 0;
      } else {
        yTemp = uHeight;
      }
      xTemp = round(random(uWidth));
    }
    // die Punkte zeichnen
    vertex(x + xTemp , y + yTemp);
  }
  endShape();

  // ----------------------------------------------------------

  // Kreis zeichnen
  // int circleSize = round(random(uWidth/6, uWidth - uWidth/3));
  // fill(255);
  // ellipse(x + random(circleSize/2, uWidth - circleSize/2),
  //         y + random(circleSize/2, uHeight - circleSize/2),
  //         circleSize, circleSize);
  // noFill();

  // ----------------------------------------------------------

  x += uWidth + gridOffset;
  // \u00dcberlauf in n\u00e4chste Unit
  if (x + uWidth > width) {
    y += uHeight + gridOffset;
    x = 0;
  }
  if (y + uHeight > height) {
    y = 0;
    // background(255);
  }

}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161114c_linefigures_v2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
