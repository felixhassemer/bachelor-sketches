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


float xstart = 0;
float ystart = 1000;
float xincr = 0.05f;
float yincr = 0.001f;



public void setup() {
  
  background(0);
  frameRate(200);
  strokeWeight(10);
  stroke(255);
  noFill();
  strokeJoin(ROUND);
}

public void draw() {
  background(0);
  float offset = height/2;
  float scaleVal = 35.0f;
  float angleInc = PI/28.0f;
  float xoff = xstart;
  float yoff = ystart;
  float angle = 0;
  beginShape();
  for (int x = 0; x < width; x++) {
    float y = offset + (sin(angle) * scaleVal);
    vertex(x, y);
    angle += angleInc;
  }
  endShape();
  // // noiseDetail(10);
  // background(0);
  //
  // beginShape();
  // for (int x = 0; x<width; x++) {
  //   float scale = map(noise(yoff), 0, 1, 0, 10);
  //   float y = map(sin(xoff), -1, 1, width/scale, width-width/scale);
  //   vertex(x, y);
  //   xoff += xincr;
  //   yoff += yincr;
  // }
  // xstart += xincr;
  // ystart += yincr;
  // endShape();


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
