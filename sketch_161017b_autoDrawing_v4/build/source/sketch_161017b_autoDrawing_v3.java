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

public class sketch_161017b_autoDrawing_v3 extends PApplet {

// Easing!!!
// wichtig


// Globale Variabeln festlegen
float i = 0;
float j = 0;
float objSize;
// easing-Faktor
float easing = 0.15f;
// Variabeln f\u00fcr neuen zuf\u00e4lligen Wert
float randomX = 500;
float randomY = 500;
int countVal = 1;
// Sound Variabeln
SoundFile file;
Amplitude amp;
// Farbe
int hsbMod = 1;
float satMod = 0;


//-----------------------------------------------------------

public void setup() {
  
  background(0, 0, 0);
  frameRate(100);

  strokeWeight(2);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);

  // Sound initialisieren
  amp = new Amplitude(this);
  file = new SoundFile(this, "everythingbefore.mp3");
  file.play();
  amp.input(file);
}

//-----------------------------------------------------------

public void draw() {
  // Farben definieren
  int fillColor = color(0, 0, 0),
        bgndColor = color(0, 0, 0);

  fill(fillColor);
  satMod = map(amp.analyze(), 0, 0.5f, 0, 100);
  stroke(hsbMod, satMod, satMod);


  // Farbwechsel
  if (countVal % 6 == 1) {
    hsbMod += 1;
  }
  // Farbloop
  if (hsbMod == 361) {
    hsbMod = 1;
  }

  // ZIELPUNKT generieren
  if (countVal % 40 == 1) {
    randomX = random(width - 300) + 150;
    randomY = random(height - 300) + 150;
  }
  // println(randomX, randomY);

  // EASING
  float targetX = randomX;
  float dx = targetX - j;
  j += dx * easing;

  float targetY = randomY;
  float dy = targetY -i;
  i += dy * easing;

  // Wei\u00dfer Hintergrund alle x frames
  if (countVal % 360 == 1) {
    background(bgndColor);
  }

  // Intervall f\u00fcr outlines (alle x frames)
  // if (countVal % 2 == 1) {
  //   stroke(0);
  // } else {
  //   stroke(255);
  // }

  if ((keyPressed == true) && (key == 's')) {
    saveFrame("box_circle-#####.png");
  }

  // Sound einf\u00fcgen
  float sizeEasing = 0.25f;
  float soundTarget = map(amp.analyze(), 0, 0.5f, 0, 300);
  float dSound = soundTarget - objSize;
  objSize += dSound * sizeEasing;
  // println(objSize);

  if (objSize < 55) {
    objSize = 6;
    noStroke();
    fill(hsbMod, 100, 100);
  }

  if (objSize < 200) {
    ellipse(i, j, objSize, objSize);
  } else {
    rect(i, j, objSize, objSize);
  }

  // Hintergrund mit Mausklick zur\u00fccksetzen
  if (mouseButton == CENTER) {
    background(bgndColor);
  }
  // rectMode(CORNER);
  // fill(255, 1);
  // rect(0, 0, width, height);

  // increment
  countVal ++;
}
  public void settings() {  size(1000, 1000, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161017b_autoDrawing_v3" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
