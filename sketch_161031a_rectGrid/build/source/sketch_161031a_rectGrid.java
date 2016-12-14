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

public class sketch_161031a_rectGrid extends PApplet {

float sizeModifier;
public void setup() {
  
  background(255);
  noFill();
  stroke(0);
}

public void draw() {
  background(255);
  sizeModifier = mouseX;
  rectPattern();
  // lineDrawing();
}

public void rectPattern() {
  rectMode(CENTER);
  for (int y = 9; y < height; y += 20) {
    for (int x = 9; x < width; x += 20) {
      for (int d = 18; d > 0; d -= 4) {
        rect (x, y, d, d);
      }
    }
  }
}

public void lineDrawing() {
  for(int y = 200; y <= 800; y *= 1.02f) {
    for (int x = 200; x <= 800; x +=15) {
      if((x % 10) == 0) {
        line(x, y, x-10, y-10);
        } else {
          line(x, y, x-10, y+10);
        }
      }
    }
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161031a_rectGrid" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
