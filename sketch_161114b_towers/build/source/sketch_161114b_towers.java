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

public class sketch_161114b_towers extends PApplet {

// VARIABELN
int x, y;


public void setup() {
  
  background(255);
  stroke(0);
  strokeWeight(3);
}

public void draw() {
  background(255);
  x = PApplet.parseInt(random(width));
  y = PApplet.parseInt(random(height));
  ellipse(x, y, 100, 100);
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161114b_towers" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
