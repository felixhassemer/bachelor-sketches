import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_161120a_soundRike extends PApplet {


SoundFile file;
Amplitude amp;

// Variabeln
float i = 0.0f;

public void setup() {
  
  background(255);
  stroke(0);
  strokeWeight(2);
  frameRate(60);
  amp = new Amplitude(this);
  file = new SoundFile(this, "everythingbefore.mp3");
  file.play();
  amp.input(file);
}

public void draw(){
  rectMode(CENTER);
  float m = map(amp.analyze(), 0, 0.5f, 0, 400);
  float c = map(amp.analyze(), 0, 0.5f, 0, 255);
  println(m);
  stroke(c, 255-c, c*2);
  for (int x = 50; x < 1000; x += 200) {
    for (int y = 50; y < 1000; y += 200) {
      if(m < 300) {
          ellipse(x, y, m, m);
        } else {
          rect(x, y, m, m);
      }
    }
  }
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161120a_soundRike" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
