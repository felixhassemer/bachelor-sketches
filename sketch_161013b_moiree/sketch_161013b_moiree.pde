void setup() {
  size(1000, 1000);
  background(0);
  frameRate(2);
}

int j = 1;

void draw() {
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
