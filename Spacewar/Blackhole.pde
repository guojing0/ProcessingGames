// Jing Guo
// http://guoj.org

class Blackhole {

  PVector location;

  float mass, g;

  Blackhole() {
    location = new PVector(width/2, height/2);
    mass = 1;
    g = 0.5;
  }

  PVector attract(Spaceship ss) {
    PVector force = PVector.sub(location, ss.location);
    float dist = force.mag();
    float str = (g * mass * ss.mass) / (dist * dist);
    force.normalize();
    force.mult(str);
    return force;
  } 

  void display() {
    float scaleWidth = 0.01 * width;
    float scaleHeight = 0.01 * height;

    translate(location.x, location.y);
    line(-scaleWidth, scaleHeight, scaleWidth, -scaleHeight);
    line(scaleWidth, scaleHeight, -scaleWidth, -scaleHeight);
  }
}