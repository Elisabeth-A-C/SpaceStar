class Platform implements Pan {
  PVector pos;
  PVector dimensions;
  color paint;

  Platform() {
    this.dimensions = new PVector(150, 50);
    this.pos = new PVector(0, 0);
  }

  Platform(int xPos, int yPos) {
    this();
    this.pos = new PVector(xPos, yPos);
  }

  void move(int yChange) {
    this.move(0, yChange);
  }

  void move(int xChange, int yChange) {
    this.pos.x += xChange ;
    this.pos.y += yChange ;
  }

  void render() {
    fill(paint);
    rect(pos.x, pos.y,dimensions.x, dimensions.y);
  }
  
  
}
