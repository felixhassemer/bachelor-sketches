int count = 0;
float[] xArray;
float[] yArray;

void setup() {
  size(1000, 1000);
  background(255);
  noStroke();
  fill(0);
  frameRate(5);
}

void draw() {
  if (count % 10 == 1) {
    background(255);
    for (int i = 0; i < 10; i += 1) {
      for (int j = 0; j < 10; j += 1) {
        float x = random(width);
        float y = random(height);
        xArray[i] = x;
        yArray[j] = y;
        ellipse(xArray[i], yArray[j], 100, 100);
      }
    }
  //   for (int i = 0; i < 10; i += 1) {
  //     float x = random(width);
  //     float y = random(height);
  //     ellipse(x, y, 100, 100);
  //   }
  }
  count++;
  // println(count%10);
}
