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

public class sketch_161114c_linefigures extends PApplet {

// Variabeln
int lnNumber;
float x, y;
int cycle;
int choose;
int gridSize = 200;

public void setup() {
  
  noFill();
  stroke(0);
  strokeWeight(6);
  strokeJoin(ROUND);
  background(255);
  frameRate(1);
}

public void draw() {
  background(255);
  translate(gridSize/4, gridSize/4);

  // println(x, y);

  //zeichne das Linienkonstrukt
  lnNumber = PApplet.parseInt(random(5, 7));
  for (int gridX = 0; gridX < width; gridX += gridSize) {
    for (int gridY = 0; gridY < height; gridY += gridSize) {
      int circleSize = round(random(15, 50));
      beginShape();
      for (int i = 0; i < lnNumber; i++) {
        cycle = round(random(0, 1));
        if (cycle == 0) {
          // x = zuf\u00e4llig entweder 0 oder 100
          choose = round(random(0, 1));
          if (choose == 0) {
            x = 0;
            } else {
              x = 100;
            }
          y = round(random(100));
        } else {
          // y = zuf\u00e4llig entweder 0 oder 100
          choose = round(random(0, 1));
          if (choose == 0) {
            y = 0;
          } else {
            y = 100;
          }
          x = round(random(100));
        }
        // die Punkte zeichnen
        vertex(gridX + x, gridY + y);
      }
      endShape();
      // Kreis zeichnen
      fill(255);
      ellipse(gridX + random(25,75), gridY + random(25, 75), circleSize, circleSize);
      noFill();
    }
  }
  // saveFrame("linefigures-###.jpg");

  // translate(25,25);
  // // Definition Linienanzahl
  // // Grid
  // for (int x = 0; x < width; x += 100) {
  //   for (int y = 0; y < height; y += 100) {
  //     beginShape();
  //     for (int i = 0; i < lnNumber; i ++) {
  //       // einzelne Punke zeichnen
  //       vertex(x+random(50), y+random(50));
  //     }
  //     endShape();
  //   }
  // }
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161114c_linefigures" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
