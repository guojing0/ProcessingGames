// Jing Guo
// http://guoj.org

Spaceship sw, sw2;
Blackhole bh;

void setup() {
  size(640, 640 );
  sw = new Spaceship(20, width*0.25, height*0.25);
  bh = new Blackhole();
}

void draw() {
  background(255);
  PVector force = bh.attract(sw);

  sw.controlShip('a', 'd', 's', 'q');
  sw.applyForce(force);
  sw.update();
  sw.checkEdges();
  sw.isDeath(bh);
  sw.display();

  bh.display();
}