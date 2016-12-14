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

public class sketch_161013b_moiree extends PApplet {

public void setup() {
  
  background(0);
  frameRate(2);
}

int j = 1;

public void draw() {
  background(0);

  // lade das Pixelarray
  loadPixels();
  if (j < 100) {
    j = j + 1;
    for (int i=0; i<1000*1000; i += j) {
      pixels[i] = color(255);
    }
  }
  updatePixels();
}

// // Farbe eines einzelnen Pixels definieren
// for (int i=0; i<1000*1000; i+=5) {
//   if (i<1000*1000/2) {
//     pixels[i] = color(random(255), 0, 0);
//   } else {
//     pixels[i] = color(0, 0, random(255));
//   }
// }
// pixels[1000*1000/2] = color(255, 255, 255);
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161013b_moiree" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
