// Jing Guo
// http://guoj.org

class CreatePong {

  PVector blockSpec, blockLocation;
  PVector ballSpec, ballLocation, ballVelocity;

  CreatePong() {
    blockSpec = new PVector(5, 50);
    blockLocation = new PVector(600, height/2);
    ballSpec = new PVector(10, 10);
    ballLocation = new PVector(width/2, height/2);
    ballVelocity = new PVector(4, 5);
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
    float distance = dist(ballLocation.x, ballLocation.y, blockLocation.x, blockLocation.y);
    
    if (distance < sqrt(blockSpec.x*blockSpec.x + blockSpec.y*blockSpec.y) && distance > blockSpec.x+ballSpec.x) {
      ballVelocity.x *= -1;
    }
  }

  void display() {
    fill(100);
    ellipse(ballLocation.x, ballLocation.y, ballSpec.x, ballSpec.y);
    rect(blockLocation.x, blockLocation.y, blockSpec.x, blockSpec.y);
  }
  
}

CreatePong pong;

void setup() {
  size(640, 400);
  noStroke();
  rectMode(RADIUS);
  ellipseMode(RADIUS);
  pong = new CreatePong();
}

void draw() {
  background(255);
  pong.update();
  pong.checkCollision();
  pong.display();
}