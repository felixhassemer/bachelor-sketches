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

public class sketch_161226a_copy extends PApplet {

PImage img;
int x = 500;

public void setup() {
  
  background(255);
  img = loadImage("https://scontent.xx.fbcdn.net/v/t31.0-8/13235304_10208995367218887_2285805214878991151_o.jpg?oh=4002e99bb9648fb23e0dfb7ddadf966e&oe=58EC650F");
  image(img, 0, 0, width, height);
}

public void draw() {
  // copy(int(random(width)),int(random(height)), 100, 100, int(random(width)), int(random(height)), 100, 100);
  copy(x, 0, width/2, height, x+1, 0, width/2, height);
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161226a_copy" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
