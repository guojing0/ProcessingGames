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
  
  sw.keyPressed();
  sw.update();
  sw.display();
  
  bh.display();
}