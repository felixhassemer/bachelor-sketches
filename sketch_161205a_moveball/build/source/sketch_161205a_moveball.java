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

public class sketch_161205a_moveball extends PApplet {

float x, y;
float xspeed, yspeed;
PVector loc;
PVector vel;

public void setup() {
  
  background(255);
  noStroke();
  fill(0);
  frameRate(60);
  loc = new PVector(random(width),random(height));
  vel = new PVector(random(1,3),random(1,3));
}

public void draw() {
  if (mousePressed == true) {
    loc = new PVector(random(width),random(height));
    vel = new PVector(random(1,3),random(1,3));
  }

  loc.add(vel);
  if ((loc.x>=width) || (loc.x<=0)) {
    vel.x = vel.x * -1;
  }
  if ((loc.y>=height) || (loc.y<=0)) {
    vel.y = vel.y * -1;
  }
  ellipse(loc.x, loc.y, 2, 2);
}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161205a_moveball" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
