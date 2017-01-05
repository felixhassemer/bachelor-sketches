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

public class sketch_170105a_pixelSort extends PApplet {

// GLOBAL
PImage img;
PImage sorted;
// int i = 0;
// int j = 0;

public void setup() {
  
  noFill();
  noStroke();
  img = loadImage("kdm_burger-tiny.png");
  sorted = createImage(img.width, img.height, RGB);
  img.loadPixels();
  sorted = img.get();
  sorted.loadPixels();
  image(img, 0, 0, 300, 300);
  image(sorted, 300, 0, 300, 300);
}

public void draw () {
  // if (i < sorted.pixels.length) {
  //   float rec = -1;
  //   float selectedPixel = i;
  //   j = i;
  //   i++;
  //   if (j < sorted.pixels.length) {
  //     color pix = sorted.pixels[j];
  //     float b = hue(pix);
  //     if (b > rec) {
  //       selectedPixel = j;
  //       rec = b;
  //     }
  //     j++;
  //   }
  //   color temp = sorted.pixels[i];
  //   sorted.pixels[i] = sorted.pixels[selectedPixel];
  //   sorted.pixels[selectedPixel] = temp;
  // }



  for (int i = 0; i < sorted.pixels.length; i++) {
    float rec = -1;
    float selectedPixel = i;
    for (int j = i; j < sorted.pixels.length; j++) {
      int pix = sorted.pixels[j];
      float b = hue(pix);
      if (b > rec) {
        selectedPixel = j;
        rec = b;
      }
    }
    int temp = sorted.pixels[i];
    sorted.pixels[i] = sorted.pixels[selectedPixel];
    sorted.pixels[selectedPixel] = temp;

  }
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_170105a_pixelSort" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
