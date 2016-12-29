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

public class sketch_161122a_linePattern extends PApplet {

// Variabeln
int choose = 0;
int x = 0, y = 0;
int uWidth = 20;
int uHeight = 60;

public void setup() {
  
  background(255);
  stroke(0);
  strokeWeight(5);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  noFill();
  frameRate(15);
}

public void draw() {
  translate(uWidth/2, uHeight/2);
  // background(255);
  // x1 += 20;
  diagline();
  // saveFile();
}

public void diagline() {
  choose = round(random(1));
  if (choose == 1) {
      line(x, y, x + uWidth, y + uHeight);
      // ellipse(x+uWidth/2, y+uHeight/2, 30, 30);
    } else {
      // ellipse(x+uWidth/2, y+uHeight/2, 15, 15);

      line(x, y + uHeight, x + uWidth, y);
  }
  x += uWidth;
  if (x + uWidth >= width) {
    y += uHeight;
    x = 0;
  }
  if (y + uHeight >= height) {
    y = 0;
    background(255);
  }
}

public void saveFile() {
  saveFrame("linePattern-####.png");
}
  public void settings() {  size(400, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161122a_linePattern" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
