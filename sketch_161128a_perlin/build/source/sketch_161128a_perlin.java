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

public class sketch_161128a_perlin extends PApplet {


float start = 0;
float incr = 0.001f;

public void setup() {
  
  background(0);
  frameRate(60);
  strokeWeight(3);
  stroke(255);
  noFill();
}

public void draw() {
  float xoff = start;
  noiseDetail(10);
  background(0);

  beginShape();
  for (int x = 0; x<width; x++) {
    float y = map(noise(xoff), 0, 1, 0, width);
    vertex(x, y);
    xoff += incr;
  }
  start += incr;

  endShape();

  // fill(0, 5);
  // rect(0, 0, width, height);
  // println(xoff, n);
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161128a_perlin" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
