// Jing Guo
// http://guoj.org

class Spaceship {

  PVector location, velocity, acceleration;

  float topspeed, mass, angle, s; // s is size
  float r, g, b;
  boolean thrusting, shooting;

  Spaceship(float m, float x, float y, float r_, float g_, float b_) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 2;
    mass = m;
    angle = 0;
    s = 12;
    r = r_;
    g = g_;
    b = b_;
    thrusting = false;
    shooting = false;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    //f.div(mass);
    acceleration.add(f);
  }

  void shoot() {

    shooting = true;
  }

  void thrust() {
    float ang = angle - PI/2;
    PVector force = new PVector(cos(ang), sin(ang));
    force.mult(0.1);
    applyForce(force);

    thrusting = true;
  }

  void hyperspace() {
    delay(3000);
    location = new PVector(random(0, width), random(0, height));
  }

  void isDead(Blackhole bh) {
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

    if (u.mag() < s/2) {
      velocity.mult(0);
      location = new PVector(random(0, width), random(0, height));
    }
  }

  void isCollided(Spaceship ss) {
    PVector dist = PVector.sub(location, ss.location);

    if (dist.mag() < s) {
      velocity.mult(0);
      ss.velocity.mult(0);
      location = new PVector(width*0.25, height*0.25);
      ss.location = new PVector(width*0.75, height*0.75);
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

  void controlShip(char left, char right, char sht, char thr, char hs) {
    if (keyPressed) {
      if (key == left) {
        angle -= 0.025;
      } else if (key == right) {
        angle += 0.025;
      } else if (key == sht) {
        shoot();
      } else if (key == thr) {
        thrust();
      } else if (key == hs) {
        hyperspace();
      }
    }
  }

  void update() {
    velocity.limit(topspeed);
    velocity.add(acceleration);
    location.add(velocity);

    acceleration.mult(0);
  }

  void display() {
    stroke(255);
    strokeWeight(1);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    fill(r, g, b);

    if (thrusting) {
      line(0, 15, 0, 25);
    }

    if (shooting) {
      ellipse(0, -15, 5, 5);
    }
    // draw spaceship    
    beginShape();
    vertex(0, -s);
    vertex(-s+2, s);
    vertex(s-2, s);
    endShape(CLOSE);
    popMatrix();

    thrusting = false;
    shooting = false;
  }
}

class Bullet {

  PVector location, velocity;

  Bullet() {
    location = new PVector();
    velocity = new PVector();
  }

  void update() {
    location.add(velocity);
  }

  void display() {
  }

  void isCollideShip() {
  }
}