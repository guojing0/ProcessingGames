CreateCar car;

void setup() {
  size(640, 360);
  car = new CreateCar();
}

void draw() {
  background(255);

  car.keyPressed();
  car.update();
  car.checkEdges();
  car.display();
}