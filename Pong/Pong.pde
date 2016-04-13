// Pong

class Pong {

  PVector blockSpec, blockLocation;
  PVector ballSpec, ballLocation, ballVelocity;

  Pong() {
    blockSpec = new PVector(5, 50);
    blockLocation = new PVector(600, height/2);
    ballSpec = new PVector(10, 10);
    ballLocation = new PVector(width/2, height/2);
    ballVelocity = new PVector(2, 3);
  }

  void update() {
    // move ball
    ballLocation.add(ballVelocity);

    if ((ballLocation.x > width) || (ballLocation.x < 0)) {
      ballVelocity.x *= -1;
    } else if ((ballLocation.y > height) || (ballLocation.y < 0)) {
      ballVelocity.y *= -1;
    }

    // move block
    if (keyPressed) {
      float blockY = constrain(blockLocation.y, blockSpec.y, height-blockSpec.y); //???
      if ((blockY > 0) && (key == 'w') || (key == 'W')) {
        blockLocation.y -= 5;
      } else if ((blockY < height) && (key == 's') || (key == 'S')) {
        blockLocation.y += 5;
      }
    }
  }
  
  void checkCollision() {
    
  }

  void display() {
    fill(100);
    ellipse(ballLocation.x, ballLocation.y, ballSpec.x, ballSpec.y);
    rect(blockLocation.x, blockLocation.y, blockSpec.x, blockSpec.y);
  }
}

Pong pong;

void setup() {
  size(640, 400);
  noStroke();
  rectMode(RADIUS);
  ellipseMode(RADIUS);
  pong = new Pong();
}

void draw() {
  background(255);
  pong.update();
  pong.display();
}