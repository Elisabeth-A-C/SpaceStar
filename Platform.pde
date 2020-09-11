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
  
  Platform(int xPos, int yPos, color _paint) {
    this(xPos,yPos );
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
    rect(pos.x, pos.y,dimensions.x, dimensions.y);
  }
  
  boolean isStandingOn(Pawn star){
    if(star.x <= this.pos.x + this.dimensions.x-10 && star.x >= this.pos.x + this.dimensions.x+10 ){
      if(star.y <= this.pos.y && star.y >= this.pos.y+this.dimensions.y){
        return true;
      }
      
    }
    
    
    
  return false;
  }
  
}
