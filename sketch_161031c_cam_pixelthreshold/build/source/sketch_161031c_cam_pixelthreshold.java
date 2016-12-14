import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_161031c_cam_pixelthreshold extends PApplet {



//Variablen
int c;
float grayValue;
float dSize;
float rMod;
int offset = 60;
Capture cam;

public void setup() {
  
  initCams();
  noStroke();
  background(255);
  frameRate(200);
}

public void draw() {
  background(255);
  fill(0);
  readCam();
  pixVerarbeitung();
}

public void initCams() {
  // Kamera Setup
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("Keine Kamera gefunden");
    exit();
    } else {
      println("Verf\u00fcgbare Kameras:");
      for (int i=0; i < cameras.length; i++) {
        println(cameras[i]);
      }
      // Kamera Init
      cam = new Capture(this, cameras[5]);
      cam.start();
    }
}


public void readCam(){
  imageMode(CENTER);
  if (cam.available() == true) {
    cam.read();
  }
  // image(cam, width/2, height/2);
}

public void pixVerarbeitung() {
  for (int x = 0; x < cam.width; x += 5) {
    for (int y = 0; y < cam.height; y += 5) {
      // Farben auslesen
      // float x = random(width);
      // float y = random(height);
      rMod = round(random(-offset, offset));
      c = cam.get(PApplet.parseInt(x), PApplet.parseInt(y));
      grayValue = 255-brightness(c);
      // grauwerte auf Gr\u00f6\u00dfe mappen
      dSize = map(grayValue, 0, 255, 0, 10);
      // Kondition Gr\u00f6\u00dfenThreshold
      // if (grayValue < 150) {
      //   // noFill();
      //   fill(255);
      // } else {
      //   fill(0);
      // }
      ellipse(x+rMod, y+rMod, dSize, dSize);
    }
  }
}
  public void settings() {  size(1280, 1024); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161031c_cam_pixelthreshold" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
