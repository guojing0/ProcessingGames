// Jing Guo
// http://guoj.org

class Blackhole {

  PVector location;

  float mass, g;
  float scaleWidth, scaleHeight;

  Blackhole() {
    location = new PVector(width/2, height/2);
    mass = 10;
    g = 10;
    scaleWidth = 0.01 * width;
    scaleHeight = 0.01 * height;
  }

  PVector attract(Spaceship ss) {
    PVector force = PVector.sub(location, ss.location);
    float dist = force.mag();
    //dist = constrain(dist, 10, 100);
    float str = (g * mass * ss.mass) / (dist * dist);
    force.normalize();
    force.mult(str);
    return force;
  }

  void display() {
    translate(location.x, location.y);

    rectMode(CENTER);
    noStroke();
    noFill();
    rect(0, 0, scaleWidth*2, scaleHeight*2);

    stroke(0);
    line(scaleWidth, scaleHeight, -scaleWidth, -scaleHeight);
    line(-scaleWidth, scaleHeight, scaleWidth, -scaleHeight);
  }
}