// Jing Guo
// http://guoj.org

CreateSpacewar sw;

void setup() {
  size(640, 640);
  sw = new CreateSpacewar();
}

void draw() {
  background(255);
  
  sw.keyPressed();
  sw.update();
  sw.display();
}