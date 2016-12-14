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

public class sketch_161017b_autoDrawing extends PApplet {

// Easing!!!
// wichtig

PGraphics pg;

public void setup() {
  
  background(255);
  frameRate(100);
  strokeWeight(1);
  fill(255);
  rectMode(CENTER);
}

//-----------------------------------------------------------

// Globale Variabeln festlegen
float i = 0;
float j = 0;
// easing-Faktor
float easing = 0.01f;
// Variabeln f\u00fcr neuen zuf\u00e4lligen Wert
float randomX = 500;
float randomY = 500;
int countVal = 1;

//-----------------------------------------------------------

public void draw() {
  countVal = countVal % 120;
  if (countVal == 1) {
    randomX = random(800)+100;
    randomY = random(800)+100;
  }

  float targetX = randomX;
  float dx = targetX - j;
  j += dx * easing;

  float targetY = randomY;
  float dy = targetY -i;
  i += dy * easing;

  // Intervall f\u00fcr outlines (alle x frames)
  // if (countVal % 2 == 1) {
  //   stroke(0);
  // } else {
  //   stroke(255);
  // }

  if ((keyPressed == true) && (key == 's')) {
    saveFrame("box_circle-#####.png");
  }

  if (mousePressed == true) {
    ellipse(i, j, mouseX/10, mouseY/10);
  } else {
    rect(i, j, mouseX/10, mouseY/10);
  }

  // Hintergrund mit Mausklick zur\u00fccksetzen
  if (mouseButton == CENTER) {
    background(255);
  }


  // increment
  countVal ++;
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161017b_autoDrawing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
