// Jing Guo
// http://guoj.org

CreatePong pong;

void setup() {
  size(640, 400);
  noStroke();
  rectMode(RADIUS);
  ellipseMode(RADIUS);
  pong = new CreatePong();
}

void draw() {
  background(255);
  pong.update();
  pong.checkEdges();
  pong.checkCollision(pong.blockLocation);
  pong.checkCollision(pong.AILocation);
  pong.display();
}