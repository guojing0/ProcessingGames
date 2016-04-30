class CreateCar {

  PVector location;
  PVector velocity;
  PVector acceleration;

  float topspeed;

  CreateCar() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 5;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    float angle = velocity.heading();
    stroke(0);
    strokeWeight(1);
    fill(100);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rectMode(CENTER);
    rect(0, 0, 30, 10);
    popMatrix();
  }

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        acceleration.y -= 30;
      } else if (keyCode == DOWN) {
        acceleration.y += 30;
      } else if (keyCode == LEFT) {
        acceleration.x -= 30;
      } else if (keyCode == RIGHT) {
        acceleration.x += 30;
      }
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
}