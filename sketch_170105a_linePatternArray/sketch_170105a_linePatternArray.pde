FloatDict patterns;


void setup() {
  frameRate(1);

  // FloatDict init
  patterns = new FloatDict();
  patterns.set("cross", 15);
  patterns.set("horizontLines", 25);
  patterns.set("shapeDraw", 40);
  patterns.set("circle", 45);
  patterns.set("diagLine2", 55);
  patterns.set("diagLine", 65);
  patterns.set("curves", 70);
  patterns.set("space", 80);
  patterns.set("sineWave", 100);
  println(patterns);
}

void draw() {
  // sorting Dictionary
  patterns.sortValues();
  float[] vArray = patterns.valueArray();
  String[] kArray = patterns.keyArray();

  // choose function for keys in Array
  for (int i = 0; i < patterns.size(); i++) {
    if (kArray[i] == "cross") {
      cross();
    } else if (kArray[i] == "horizontLines") {
      horizontLines();
    } else if (kArray[i] == "shapeDraw") {
      shapeDraw();
    } else if (kArray[i] == "circle") {
      circle();
    } else if (kArray[i] == "diagLine2") {
      diagLine2();
    } else if (kArray[i] == "diagLine") {
      diagLine();
    } else if (kArray[i] == "curves") {
      curves();
    } else if (kArray[i] == "space") {
      space();
    } else if (kArray[i] == "sineWave") {
      sineWave();
    }
  }
}
