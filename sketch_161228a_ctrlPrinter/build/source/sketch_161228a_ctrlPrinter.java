import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_161228a_ctrlPrinter extends PApplet {




Serial port;

// String params[] = {"start", "F:\\Downloads\\DOSPrinter\\DOSPrinter.exe", "hello.txt"};
String params[] = {"F:/GitHub/bachelor-sketches/sketch_161228a_ctrlPrinter/DOSprint.bat"};


public void setup() {
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

public void draw() {
  noLoop();
  // lq850print("Hello World!");
  // exit();
}

public void lq850setup() {
  //PORTS
  println("verf\u00fcgbare Ports:");
  println(Serial.list());
  port = new Serial(this, Serial.list()[0], 9600);
}

public void lq850print(String textstring) {
  port.write(textstring);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_161228a_ctrlPrinter" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
