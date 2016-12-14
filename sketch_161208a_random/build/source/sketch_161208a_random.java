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

public class sketch_161208a_random extends PApplet {

float x = 0;
float y;

public void setup() {
  
  background(0);
  frameRate(60);
  strokeWeight(3);
  stroke(255);
  noFill();
}

public void draw() {
  y = random(height);
  stroke(255);
  point(x, y);
  if (x < width){
    x++;
  } else {
    copy(0, 0, width, height, -1, 0, width, height);
    fill(0);
    noStroke();
    rect(width-1, 0, 10, height);
    x = width-1;
  }
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161208a_random" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
