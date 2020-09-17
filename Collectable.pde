import java.util.Random;

class Collectable implements Pan {
  PVector pos; // the center of the collectable

  Collectable(PVector _pos) {
    pos = _pos;
  }
  Collectable() {
  }


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


  void powerup() {
    //empty on purpose
  }

  void render() {
    //empty on purpose
  }

  void collectPower(Pawn star) {
    // empty on purpose
  }


  class Coin extends Collectable {
    void star(float x, float y, float radius1, float radius2, int npoints) {
      float angle = TWO_PI / npoints;
      float halfAngle = angle/2;
      beginShape();
      for (float a = 0.966644; a < TWO_PI; a += angle) {
        float sx = x + cos(a) * radius2;
        float sy = y + sin(a) * radius2;
        vertex(sx, sy);
        sx = x + cos(a+halfAngle) * radius1;
        sy = y + sin(a+halfAngle) * radius1;
        vertex(sx, sy);
      }
      endShape(CLOSE);
    }
  }

  void stopExisting() {
    //TODO implement this
  }

  //void applyPowerup(Pawn star) {
  //  if (istouching) {
  //    powerup(star);
  //    stopExisting();
  //  }
  //}
}

//void render() {
//  fill(#FFFF19);
//  star(pos.x, pos.y, 5, 12, 5);
//}

void powerup(Pawn star) {
  star.point = star.point + 1;
}

class Doublejump extends Collectable {
  void render() {
    fill(#FF1919);
    circle(pos.x, pos.y, 10);
  }

  void powerup(Pawn star) {
    //TODO implement this
    //Man skal få et doppelthop når stjernen får denne collectable
  }
}


class Changecolor extends Collectable {
  void render() {
    fill(#EF19FF);
    circle(pos.x, pos.y, 10);
  }

  void powerup(Pawn star) {
    color[] list = {color(#E95BD6), color(#9BF766), color(#66CCF7), color(#FA4185), color(#F9F9F1), color(#FADA5E), color(#FF9933), color(#C310F0)};
    star.paint = list[floor(random(list.length))];
  }
}


class Higherjump extends Collectable {
  void render() {
    fill(#19FFD1);
    circle(pos.x, pos.y, 10);
  }

  void powerup(Pawn star) {
    star.jumpScalar = 7;
  }
}
