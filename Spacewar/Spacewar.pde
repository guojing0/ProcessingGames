// Jing Guo
// http://guoj.org

Spaceship sw, sw2;
Blackhole bh;

void setup() {
  size(640, 640);
  sw = new Spaceship(25, width*0.25, height*0.25, 255, 0, 0);
  sw2 = new Spaceship(25, width*0.75, height*0.75, 0, 0, 255);
  bh = new Blackhole();
}

void draw() {
  background(0);
  PVector force = bh.attract(sw);
  PVector force2 = bh.attract(sw2);

  sw.controlShip('a', 'd', 's', 'q');
  sw.applyForce(force);
  sw.update();
  sw.checkEdges();
  sw.isDead(bh);
  sw.display();

  sw2.controlShip('j', 'l', 'k', 'p');
  sw2.applyForce(force2);
  sw2.update();
  sw2.checkEdges();
  sw2.isDead(bh);
  sw2.display();

  bh.display();
}