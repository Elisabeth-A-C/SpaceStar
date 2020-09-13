class Collectable implements Pan {
  PVector pos; // the center of the collectable

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

  void render() {
    //TODO: implement this
    
  }
}


class Coin extends Collectable {
}
