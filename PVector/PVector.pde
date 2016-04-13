class PVector {
  
  float x, y;
  
  PVector(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  void add(PVector v) {
    x += v.x;
    y += v.y;
  }
  
  void sub(PVector v) {
    x -= v.x;
    y -= v.y;
  }
  
  void mult(float n) {
    x *= n;
    y *= n;
  }
  
  void div(float n) {
    x /= n;
    y /= n;
  }
  
  float mag() {
    return sqrt(x*x + y*y);
  }
  
  void normalize() {
    float m = mag();
    if (m != 0) {
      div(m);
    }
  }
  
  void limit(float max) {
    if (mag() > max) {
      normalize();
      mult(max);
    }
  }
}