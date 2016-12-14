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

public class sketch_161013a extends PApplet {

public void setup() {
  
  background(153, 37, 68);
  frameRate(60);
  colorMode(RGB);
  noFill();
  stroke(59, 181, 155);
  strokeWeight(3);
}

public void draw() {
  background(153, 37, 68);
  for (int i = 100; i < 1000; i += 100) {
    for (int j = 100; j < 1000; j += 100){
      arc(i, j, 130, 130, radians(mouseX), radians(mouseY), OPEN);
    }
  }
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161013a" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
