// Jing Guo
// http://guoj.org

Pong pong;

void setup() {
  size(640, 400);
  noStroke();
  rectMode(RADIUS);
  ellipseMode(RADIUS);
  pong = new Pong();
}

void draw() {
  background(255);
  pong.update();
  pong.display();
}