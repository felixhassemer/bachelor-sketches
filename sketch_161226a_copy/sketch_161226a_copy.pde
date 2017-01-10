PImage img;
int x = 500;
int count = 0;

void setup() {
  size(1000, 1000);
  background(255);
  img = loadImage("https://scontent.xx.fbcdn.net/v/t31.0-8/13235304_10208995367218887_2285805214878991151_o.jpg?oh=4002e99bb9648fb23e0dfb7ddadf966e&oe=58EC650F");
  image(img, 0, 0, width, height);
  frameRate(30);
}

void draw() {
  // copy(x, 0, width/2, height, x+1, 0, width/2, height);
  if (count < 120) {
    copy(int(random(width)),int(random(height)), 20, 40, int(random(width)), int(random(height)), 20, 40);
    count ++;
  }
}
