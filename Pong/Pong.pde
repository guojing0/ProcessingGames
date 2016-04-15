// Jing Guo
// http://guoj.org

class CreatePong {

  PVector blockSpec, blockLocation;
  PVector AILocation;
  PVector ballSpec, ballLocation, ballVelocity;

  float blockSpeed = 6;
  int AIWin = 0, playerWin = 0;

  CreatePong() {
    blockSpec = new PVector(5, 35);
    blockLocation = new PVector(600, height/2);
    AILocation = new PVector(40, height/2);
    ballSpec = new PVector(10, 10);
    ballLocation = new PVector(width/2, height/2);
    ballVelocity = new PVector(5, 7);
  }

  void update() {
    // move ball
    ballLocation.add(ballVelocity);

    // move AI
    AILocation.y = constrain(AILocation.y, blockSpec.y, height-blockSpec.y);
    if (AILocation.y > ballLocation.y) {
      AILocation.y -= blockSpeed;
    } else if (AILocation.y < ballLocation.y) {
      AILocation.y += blockSpeed;
    }

    // move block
    if (keyPressed) {
      blockLocation.y = constrain(blockLocation.y, blockSpec.y, height-blockSpec.y);
      if ((blockLocation.y > 0) && (key == 'w') || (key == 'W')) {
        blockLocation.y -= blockSpeed;
      } else if ((blockLocation.y < height) && (key == 's') || (key == 'S')) {
        blockLocation.y += blockSpeed;
      }
    }
  }

  void checkEdges() {
    if ((ballLocation.y+ballSpec.y > height) || (ballLocation.y-ballSpec.y < 0)) {
      ballVelocity.y *= -1;
    }

    if (ballLocation.x+ballSpec.x > width) {
      AIWin += 1;
      ballLocation = new PVector(width/2, random(height));
      ballVelocity.mult(-1);
    } else if (ballLocation.x-ballSpec.x < 0) {
      playerWin += 1;
      ballLocation = new PVector(width/2, random(height));
      ballVelocity.mult(-1);
    }
  }

  void checkCollision(PVector paddleLoc) {
    PVector v = PVector.sub(ballLocation, paddleLoc);
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

    textSize(12);
    fill(0);
    text("Created by Jing Guo", width-130, height-20);
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
  pong.checkEdges();
  pong.checkCollision(pong.blockLocation);
  pong.checkCollision(pong.AILocation);
  pong.display();
}