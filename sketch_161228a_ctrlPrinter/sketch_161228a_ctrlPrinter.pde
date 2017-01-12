String params[] = {"F:/GitHub/bachelor-sketches/sketch_161228a_ctrlPrinter/DOSprint.bat"};


void setup() {
  // File workingDir = new File(sketchPath(""));
  // try {
  //   Process p = Runtime.getRuntime().exec(params, null, workingDir);
  //   } catch(IOException e) {
  //     println(e);
  //   }
}

void draw() {
  noLoop();
}

public void SetupPrintHandler()
{
    PrintDocument printDoc = new PrintDocument();
    printDoc.PrintPage += new PrintPageEventHandler(OnPrintPage);

    printDoc.Print();
}

private void OnPrintPage(object sender, PrintPageEventArgs args)
{
    using (Image image = Image.FromFile(@"C://file.jpg"))
    {
        Graphics g = args.Graphics;
        g.DrawImage(image, 0, 0);
    }
}
