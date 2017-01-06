FloatDict patterns;


void setup() {
  frameRate(1);

  patterns = new FloatDict();
  patterns.set("circles", 80);
  patterns.set("crosses", 100);
  patterns.set("diagLines", 65);
  patterns.set("horizontLines", 50);
  patterns.set("shapeDraw", 30);
  patterns.set("diagLine2", 20);
  // println(patterns.get("shapeDraw"));
}

void draw() {
  float r1 = random(0, 100);
  float r2 = random(0, 100);
  patterns.set("horizontLines", r1);
  patterns.set("shapeDraw", r2);
  patterns.sortKeys();

  println(patterns);
  for (int i=0; i < patterns.size(); i++) {

  }
}
