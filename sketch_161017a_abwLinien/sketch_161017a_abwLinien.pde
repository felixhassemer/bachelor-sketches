// zufällige Linien in abwechselnden Farben
// Modulus-Übung
int mouseClicks = 0;

void setup() {
  size(1000, 1000);
  background(0);
  frameRate(60);
  noFill();
  // fill(255);
  // noStroke();
  stroke(255);
  strokeWeight(1);
}

void draw() {
  int countVal = frameCount % 500; // count to 1000
  if (countVal <= 250) {
    stroke(255);
    line(100, random(800)+100, 900, random(800)+100);
    line
  } else {
    stroke(0);
    line(random(800)+100, 100, random(800)+100, 900);
  }
  if (mousePressed == true) {
    mouseClicks++;
    saveFrame("/data/distressed"+mouseClicks+".png");
  }
  // frameCount in Konsole anzeigen
  // println(countVal);
}
