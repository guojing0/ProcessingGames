// Jing Guo
// http://guoj.org

class CreateSpacewar {

  PVector location, velocity, acceleration;

  float topspeed;

  CreateSpacewar() { // two players
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 5;
  }

  void update() {
  }

  void display() { // a blackhole in the center
  }

  void thrust() {
  }

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        //
      } else if (keyCode == RIGHT) {
        //
      }
    } else if (key == 'z' || key == 'Z') {
      thrust();
    }
  }
}