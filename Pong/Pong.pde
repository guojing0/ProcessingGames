// Jing Guo
// http://guoj.org

class CreatePong {

  PVector blockSpec, blockLocation;
  PVector AILocation;
  PVector ballSpec, ballLocation, ballVelocity;
  
  float blockVelocity = 5;
  int AIWin = 0;
  int playerWin = 0;

  CreatePong() {
    blockSpec = new PVector(5, 40);
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
    
    if (ballLocation.x+ballSpec.x > width) {
      AIWin += 1;
    } else if (ballLocation.x-ballSpec.x < 0) {
      playerWin += 1;
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

  void checkCollision(PVector paddleLoc) {
    PVector v = PVector.sub(paddleLoc, ballLocation);
    PVector abs_v = new PVector(abs(v.x), abs(v.y));
    PVector h = blockSpec;
    PVector u = PVector.sub(abs_v, h);
    
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
    
    textSize(25);
    text(AIWin, width/3, height/2);
    text(playerWin, width/3*2, height/2);
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
  pong.checkCollision(pong.blockLocation);
  pong.checkCollision(pong.AILocation);
  pong.display();
}
