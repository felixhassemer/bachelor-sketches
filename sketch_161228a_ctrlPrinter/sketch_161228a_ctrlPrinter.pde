
import processing.serial.*;

Serial port;

// String params[] = {"start", "F:\\Downloads\\DOSPrinter\\DOSPrinter.exe", "hello.txt"};
String params[] = {"F:/GitHub/bachelor-sketches/sketch_161228a_ctrlPrinter/DOSprint.bat"};


void setup() {
  // lq850setup();
  // open("DOSprint.bat");
  // exec(params);
  // launch("F:\\GitHub\\bachelor-sketches\\sketch_161228a_ctrlPrinter\\DOSprint.bat");
  File workingDir = new File(sketchPath(""));
  try {
    Process p = Runtime.getRuntime().exec(params, null, workingDir);
    } catch(IOException e) {
      println(e);
    }
}

void draw() {
  noLoop();
  // lq850print("Hello World!");
  // exit();
}

void lq850setup() {
  //PORTS
  println("verfügbare Ports:");
  println(Serial.list());
  port = new Serial(this, Serial.list()[0], 9600);
}

void lq850print(String textstring) {
  port.write(textstring);
}
