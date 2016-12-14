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

public class sketch_161124a_map extends PApplet {

int c;

public void setup() {
  
}

public void draw() {
  c = round(random(0, 1));
  // println(map(mouseX, 0, width, 0, 255));
  // c = map(mouseX, 0, width, 0, 255);
  println(c);
  background(c, 0, 0);
}
  public void settings() {  size(1000,1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161124a_map" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
