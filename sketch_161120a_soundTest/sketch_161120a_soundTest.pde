import processing.sound.*;
SoundFile file;
Amplitude amp;

// Variabeln
float i = 0.0;

void setup() {
  size(1000, 1000);
  background(255);
  stroke(0);
  strokeWeight(2);
  frameRate(60);
  amp = new Amplitude(this);
  file = new SoundFile(this, "everythingbefore.mp3");
  file.play();
  amp.input(file);
}

void draw(){
  rectMode(CENTER);
  float m = map(amp.analyze(), 0, 0.5, 0, 400);
  float c = map(amp.analyze(), 0, 0.5, 0, 255);
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
