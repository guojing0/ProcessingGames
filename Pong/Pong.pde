// Jing Guo
// http://guoj.org

class CreatePong {

  PVector blockSpec, blockLocation;
  PVector AILocation;
  PVector ballSpec, ballLocation, ballVelocity;
  
  float blockVelocity = 5;

  CreatePong() {
    blockSpec = new PVector(5, 50);
    blockLocation = new PVector(600, height/2);
    AILocation = new PVector(40, height/2);
    ballSpec = new PVector(10, 10);
    ballLocation = new PVector(width/2, height/2);
    ballVelocity = new PVector(4, 5);
  }

  void update() {
    // move ball
    ballLocation.add(ballVelocity);

    if ((ballLocation.x+ballSpec.x > width) || (ballLocation.x-ballSpec.x < 0)) {
      ballVelocity.x *= -1;
    } else if ((ballLocation.y+ballSpec.y > height) || (ballLocation.y-ballSpec.y < 0)) {
      ballVelocity.y *= -1;
    }

    // move block
    if (keyPressed) {
      blockLocation.y = constrain(blockLocation.y, blockSpec.y, height-blockSpec.y);
      if ((blockLocation.y > 0) && (key == 'w') || (key == 'W')) {
        blockLocation.y -= blockVelocity;
      } else if ((blockLocation.y < height) && (key == 's') || (key == 'S')) {
        blockLocation.y += blockVelocity;
      }
    }
    
    // move AI
    AILocation.y = ballLocation.y;
    AILocation.y = constrain(AILocation.y, blockSpec.y, height-blockSpec.y);
  }

  void checkCollision() {
    PVector v = PVector.sub(blockLocation, ballLocation);
    PVector h = blockSpec;
    PVector u = PVector.sub(v, h);
    
    if (u.x < 0) {
      u.x = 0;
    } else if (u.y < 0) {
      u.y = 0;
    } else if (u.x < 0 && u.y < 0) {
      u.x = u.y = 0;
    }
    
    if (u.mag() < ballSpec.x) {
      ballVelocity.x *= -1;
    }
  }

  void display() {
    fill(100);
    ellipse(ballLocation.x, ballLocation.y, ballSpec.x, ballSpec.y);
    rect(blockLocation.x, blockLocation.y, blockSpec.x, blockSpec.y);
    rect(AILocation.x, AILocation.y, blockSpec.x, blockSpec.y);
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
