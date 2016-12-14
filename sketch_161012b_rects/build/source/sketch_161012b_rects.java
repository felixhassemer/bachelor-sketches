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

public class sketch_161012b_rects extends PApplet {

public void setup() {
  
  background(150);
  fill(255);
  noStroke();
  frameRate(2);
}

public void draw() {
  rectMode(CENTER);
  fill(255);
  rect(random(1000), random(1000), random(600), random(600));
  fill(190, 90, 90);
  rect(random(1000), random(1000), random(400), random(400));
  fill(40);
  rect(random(1000), random(1000), random(600), random(600));
  fill(150, 104);
  // rect(0, 0, 1000, 1000);
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161012b_rects" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
