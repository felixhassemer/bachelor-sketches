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

public class sketch_161019b_readColor extends PApplet {

// Programm zur \u00dcbersetzung von Grauwerten in einzelne Objekte
//---------------------------------------------
// Variabeln definieren
PImage photo;
int c1, colorThresh;
int sizeVar = 60;
float redValue,
      greenValue,
      blueValue;
float mouseDist;

//---------------------------------------------

public void setup() {
  
  photo = loadImage("landscape.jpg");
  rectMode(CENTER);
  frameRate(5);
  // stroke(0);
  noStroke();
}

//---------------------------------------------

public void draw() {
  background(0);
  if (mousePressed == true) {
    image(photo, 0, 0);
    photo.resize(1000, 1000);
  } else {
    // translateColor();
    pixelate();
  }
  // pixelate();
}

//---------------------------------------------

public void translateColor() {
  // image(photo, 0, 0);
  photo.resize(1000, 1000);
  loadPixels();
  // fill(255);
  strokeWeight(10);
  for (int i = 0; i < 1000; i+=10) {
    for (int j = 0; j < 1000; j+=10) {
      mouseDist = dist(i, j, mouseX, mouseY);
      // Daten von Pixelwerten
      colorThresh = photo.get(i, j);
      // Isolierung der Farbwerte
      redValue = red(colorThresh);
      greenValue = green(colorThresh);
      blueValue = blue(colorThresh);
      // Distanz von Mauszeiger
      stroke(redValue - mouseDist/6);
      // Ellipse zeichnen
      point(i, j);
    }
  }
}

public void pixelate() {
  image(photo, 0, 0);
  photo.resize(1200, 0);
  loadPixels();
  if (keyPressed == true && key == '-') {
    sizeVar -= 1;
  } else if (keyPressed == true && key == '+'){
    sizeVar += 1;
  }

  int distVar = mouseX/6;
  if (distVar > 0){
    for (int i = 0; i < 1000; i += distVar) {
      for (int j = 0; j < 1000; j += distVar) {
        c1 = photo.get(i, j);
        fill(c1);
        ellipse(i, j, sizeVar, sizeVar);
      }
    }
  }
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161019b_readColor" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
