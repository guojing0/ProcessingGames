// Jing Guo
// http://guoj.org

class Spaceship {

  PVector location, velocity, acceleration;

  float topspeed, mass;

  Spaceship() { // two players
    location = new PVector(width/3, height/3);
    velocity = new PVector(-1, -1); // test
    acceleration = new PVector(0, 0);
    topspeed = 5;
    mass = 10;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);

    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(120);
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, 20, 20);
    popMatrix();
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void thrust() {
  }

  void isDeath(Blackhole bh) {
    PVector v = PVector.sub(location, bh.location);
    PVector abs_v = new PVector(abs(v.x), abs(v.y));
    PVector h = new PVector(bh.scaleWidth, bh.scaleHeight);
    PVector u = PVector.sub(abs_v, h);

    if (u.x < 0) {
      u.x = 0;
    } else if (u.y < 0) {
      u.y = 0;
    } else if (u.x < 0 && u.y < 0) {
      u.x = u.y = 0;
    }

    if (u.mag() < 10) { // half of the size of the ball
      velocity.mult(0);
      location = new PVector(width/3, height/3);
    }
  }
  
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
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