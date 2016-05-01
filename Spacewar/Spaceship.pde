// Jing Guo
// http://guoj.org

class Spaceship {

  PVector location, velocity, acceleration;

  float topspeed, mass, angle;

  Spaceship(float m, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 5;
    mass = m;
    angle = 0;
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
    rotate(angle);
    rect(0, 0, mass, mass);
    popMatrix();
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void thrust() {
    
  }
  
  void hyperspace() {
    delay(3000);
    location = new PVector(random(0, width), random(0, height));
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

    if (u.mag() < 10) { // 10 is half of the size of the ball
      velocity.mult(0);
      location = new PVector(random(0, width), random(0, height));
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

  void controlShip(char left, char right, char thr, char hs) { // shoot undefined
    if (keyPressed) {
      if (key == left) {
        angle -= 0.025;
      } else if (key == right) {
        angle += 0.025;
      } else if (key == thr) {
        thrust();
      } else if (key == hs) {
        hyperspace();
      }
    }
  }
}