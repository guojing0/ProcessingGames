// Jing Guo
// http://guoj.org

class Spaceship {

  PVector location, velocity, acceleration;

  float topspeed, mass;

  Spaceship() { // two players
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 5;
    mass = 1;
  }

  void update() {
  }

  void display() {
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