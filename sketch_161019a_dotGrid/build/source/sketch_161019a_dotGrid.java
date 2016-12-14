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

public class sketch_161019a_dotGrid extends PApplet {

// Kreisraster mit Zufallsbewegungen


int increment;
float strokeColor, contour, randomRange, randomSize;

public void setup() {
  
  frameRate(25);

}

public void draw() {
  increment = mouseX/4+50;
  strokeColor = 0;
  randomRange = mouseY/10;
  contour = mouseX/4+30;

  background(255);
  noFill();
  smooth();
  pixelRaster();
}



public void pixelRaster() {
  if (increment > 1) {
    stroke(strokeColor);
    strokeWeight(contour);
    for (int i = 0; i < 1000; i += increment) {
      for (int j = 0; j < 1000; j += increment) {
        point(i+random(-randomRange, randomRange), j+(random(-randomRange, randomRange)));
      }
    }
  }

}
  public void settings() {  size(1000,1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161019a_dotGrid" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
