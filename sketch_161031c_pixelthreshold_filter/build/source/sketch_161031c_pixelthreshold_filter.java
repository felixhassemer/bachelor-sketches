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

public class sketch_161031c_pixelthreshold_filter extends PApplet {


//Variablen
PImage image;
float dSize;
float grayValue;
int c;
int increment;
int rMod;
int offset = 2;

public void setup() {
  
  background(255);
  frameRate(10);
  noStroke();
  fill(0);
  image = loadImage("kopf.jpg");
  image.resize(0, 800);
}

public void draw() {
  background(255);
  if (mousePressed == true) {
    image(image, 0, 0);
  } else {
    pixVerarbeitung();
  }
}

public void pixVerarbeitung() {
  increment = 3;
  for (int x = 0; x < image.width; x += increment) {
    for (int y = 0; y < image.height; y += increment) {
      rMod = round(random(-offset, offset));
      c = image.get(x, y);
      grayValue = 255-brightness(c);
      ellipse(x+rMod, y+rMod, grayValue/40, grayValue/40);
    }
  }
}
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161031c_pixelthreshold_filter" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
