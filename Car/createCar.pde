class CreateCar {

  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float topspeed;

  CreateCar() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, -2.5);
    acceleration = new PVector(0, 0);
    topspeed = 4;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(100);
    pushMatrix();
    translate(location.x, location.y);
    rectMode(CENTER);
    rect(0, 0, 10, 30);
    popMatrix();
  }

  void keyPressed() {
    if (key == CODED && keyCode == LEFT) {
      acceleration.x -= 0.1;
    } else if (key == CODED && keyCode == RIGHT) {
      acceleration.x += 0.1;
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