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

public class sketch_170105a_linePatternArray extends PApplet {

FloatDict patterns;


public void setup() {
  frameRate(1);

  patterns = new FloatDict();
  patterns.set("circles", 80);
  patterns.set("crosses", 100);
  patterns.set("diagLines", 65);
  patterns.set("horizontLines", 50);
  patterns.set("shapeDraw", 30);
  patterns.set("diagLine2", 20);
  // println(patterns.get("shapeDraw"));
}

public void draw() {
  float r1 = random(0, 100);
  float r2 = random(0, 100);
  patterns.set("horizontLines", r1);
  patterns.set("shapeDraw", r2);
  patterns.sortValues();

  println(patterns);
  for (int i=0; i < patterns.size(); i++) {

  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_170105a_linePatternArray" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
