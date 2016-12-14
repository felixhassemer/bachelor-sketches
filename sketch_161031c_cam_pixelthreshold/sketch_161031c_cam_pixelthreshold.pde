import processing.video.*;

//Variablen
color c;
float grayValue;
float dSize;
float rMod;
int offset = 60;
Capture cam;

void setup() {
  size(1280, 1024);
  initCams();
  noStroke();
  background(255);
  frameRate(200);
}

void draw() {
  background(255);
  fill(0);
  readCam();
  pixVerarbeitung();
}

void initCams() {
  // Kamera Setup
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("Keine Kamera gefunden");
    exit();
    } else {
      println("Verfügbare Kameras:");
      for (int i=0; i < cameras.length; i++) {
        println(cameras[i]);
      }
      // Kamera Init
      cam = new Capture(this, cameras[5]);
      cam.start();
    }
}


void readCam(){
  imageMode(CENTER);
  if (cam.available() == true) {
    cam.read();
  }
  // image(cam, width/2, height/2);
}

void pixVerarbeitung() {
  for (int x = 0; x < cam.width; x += 5) {
    for (int y = 0; y < cam.height; y += 5) {
      // Farben auslesen
      // float x = random(width);
      // float y = random(height);
      rMod = round(random(-offset, offset));
      c = cam.get(int(x), int(y));
      grayValue = 255-brightness(c);
      // grauwerte auf Größe mappen
      dSize = map(grayValue, 0, 255, 0, 10);
      // Kondition GrößenThreshold
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
