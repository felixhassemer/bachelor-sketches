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

int count = 0;
float[] xArray;
float[] yArray;

public void setup() {
  
  background(255);
  noStroke();
  fill(0);
  frameRate(5);
}

public void draw() {
  if (count % 10 == 1) {
    background(255);
    for (int i = 0; i < 10; i += 1) {
      for (int j = 0; j < 10; j += 1) {
        float x = random(width);
        float y = random(height);
        xArray[i] = x;
        yArray[j] = y;
        ellipse(xArray[i], yArray[j], 100, 100);
      }
    }
  //   for (int i = 0; i < 10; i += 1) {
  //     float x = random(width);
  //     float y = random(height);
  //     ellipse(x, y, 100, 100);
  //   }
  }
  count++;
  // println(count%10);
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
