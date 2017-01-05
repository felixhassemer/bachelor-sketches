// GLOBAL
PImage img;
PImage sorted;
// int i = 0;
// int j = 0;

void setup() {
  size(1000, 1000);
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

void draw () {
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
      color pix = sorted.pixels[j];
      float b = hue(pix);
      if (b > rec) {
        selectedPixel = j;
        rec = b;
      }
    }
    color temp = sorted.pixels[i];
    // sorted.pixels[i] = sorted.pixels[selectedPixel];
    // sorted.pixels[selectedPixel] = temp;

  }
}
