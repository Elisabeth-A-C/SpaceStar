class Background extends Platform implements Pan {
  int size;

  void render() {
    fill(255);
    circle(pos.x, pos.y, size);
  }

  //TODO: make constructors refrence each other.

  Background(PVector _pos, int _size) {
    size = _size;
    pos = _pos;
  }

  Background(PVector _pos) {
    pos = _pos;
    size = round(random(3, 11));
  }

  Background() {
    pos = new PVector(random (width), random(height));
    size = round(random(3, 11));
  }

  void moveScreen() {
    pos = new PVector(random ( width), random(-0.2*height, 0));
  }

  void outOfScreen() {
    if (pos.y >= height) moveScreen();
  }
}
