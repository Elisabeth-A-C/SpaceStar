class Background extends Platform implements Pan {
  int size;

  void render() {
    fill(255);
    circle(pos.x, pos.y, size);
  }

  Background(PVector _pos, int _size) {
    size = _size;
    pos = _pos;
  }

  Background(PVector _pos) {
    this(_pos, round(random(3, 11)));
  }

  Background() {
    this(new PVector(random(width), random(height)));
  }

  void moveScreen() {
    pos = new PVector(random(width), random(-0.2*height, 0));
  }

  void outOfScreen() {
    if (pos.y >= height) { 
      moveScreen();
    }
  }
}
