import java.util.Random;

class Collectable implements Pan {
  PVector pos; // the center of the collectable

  Collectable(PVector _pos){
    pos = _pos;
  }
  Collectable(){}


  void move(int yChange) {
    pos.y += yChange;
  }

  boolean istouching(Pawn star) {
    float radius = 20;
    if (star.x <= pos.x + radius && star.x >= pos.x -radius && star.y <= pos.y + radius && star.y >= pos.y -radius) {
      return true;
    }
    return false;
  }

  boolean isappearing() {
    Random random = new Random();
    return random.nextBoolean();
    
  }
  
  void render() {
    if (isappearing()) {
      fill(255);
      circle(pos.x, pos.y, 10);
    }
  }
}

class Coin extends Collectable {
}
