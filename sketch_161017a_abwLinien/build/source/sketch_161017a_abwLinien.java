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

public class sketch_161017a_abwLinien extends PApplet {

// zuf\u00e4llige Linien in abwechselnden Farben
// Modulus-\u00dcbung

public void setup() {
  
  background(0);
  frameRate(60);
  noFill();
  // fill(255);
  // noStroke();
  stroke(255);
  strokeWeight(1);
}

public void draw() {
  int countVal = frameCount % 500; // count to 1000
  if (countVal <= 250) {
    stroke(255);
    line(100*4, random(800)+100, 900, random(800)+100);
  } else {
    stroke(0);
    line(random(800)+100, 100, random(800)+100, 900);
  }
  if (mousePressed == true) {
    save("distressed.jpg");
  }
  // frameCount in Konsole anzeigen
  // println(countVal);
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161017a_abwLinien" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
