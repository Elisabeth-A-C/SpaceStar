class Platform implements Pan {
  PVector pos;
  PVector dimensions;
  color paint;
  boolean containsPoint = true;
  
  Platform() {
    this.dimensions = new PVector(150, 25);
    this.pos = new PVector(0, 0);
    paint = color(230);
  }

  Platform(int xPos, int yPos) {
    this();
    this.pos = new PVector(xPos, yPos);
  }
  
  Platform(PVector _pos){
    this();
    this.pos = _pos;
  }

  Platform(int xPos, int yPos, color _paint) {
    this(xPos, yPos );
    this.paint = _paint;
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
    rect(pos.x, pos.y, dimensions.x, dimensions.y, 8);
  }

  boolean isStandingOn(Pawn star) {
    return isStandingOn(round(star.x), round(star.y), 50);
  }

  boolean isStandingOn(int centerX, int centerY, int radius) {
    if (centerX + radius/2 >= this.pos.x && centerX<= this.pos.x + this.dimensions.x + radius/2) {
      if (centerY + radius >= this.pos.y - 10 && centerY + radius <= this.pos.y + 10 ) {
        return true;
      }
    }
    return false;
  }
}
