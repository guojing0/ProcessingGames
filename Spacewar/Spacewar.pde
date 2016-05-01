// Jing Guo
// http://guoj.org

Spaceship sw;
Blackhole bh;

void setup() {
  size(640, 640 );
  sw = new Spaceship();
  bh = new Blackhole();
}

void draw() {
  background(255);
  PVector force = bh.attract(sw);

  sw.keyPressed();
  sw.applyForce(force);
  sw.update();
  sw.checkEdges();
  sw.isDeath(bh);
  sw.display();

  bh.display();
}