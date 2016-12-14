float x, y;
float xspeed, yspeed;
PVector loc;
PVector vel;

void setup() {
  size(400, 400);
  background(255);
  noStroke();
  fill(0);
  frameRate(60);
  loc = new PVector(random(width),random(height));
  vel = new PVector(random(1,3),random(1,3));
}

void draw() {
  if (mousePressed == true) {
    loc = new PVector(random(width),random(height));
    vel = new PVector(random(1,3),random(1,3));
  }

  loc.add(vel);
  if ((loc.x>=width) || (loc.x<=0)) {
    vel.x = vel.x * -1;
  }
  if ((loc.y>=height) || (loc.y<=0)) {
    vel.y = vel.y * -1;
  }
  ellipse(loc.x, loc.y, 2, 2);
}
