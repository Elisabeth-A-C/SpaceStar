import java.util.Random;

class Collectable implements Pan {
  PVector pos; // the center of the collectable
  boolean isAlive;

  Collectable(PVector _pos) {
    this();
    pos = _pos;
  }
  Collectable() {
    isAlive = true;
  }


  void move(int yChange) {
    pos.y += yChange;
  }

  boolean istouching(Pawn star) {
    float radius = 20;
    if (star.location.x <= pos.x + radius && star.location.x >= pos.x -radius && star.location.y <= pos.y + radius && star.location.y >= pos.y -radius) {
      return true;
    }
    return false;
  }

  void collectPower(Pawn star) { // the general action of getting a powerup.
    if (istouching(star)) {
      powerup(star);
      stopExisting();
    }
  }

  void powerup(Pawn star) { // the specific thing that needs to happen.
    //empty on purpose
  }

  void render() {
    //empty on purpose
  }

  void stopExisting() {
    this.isAlive = false;
  }
}

class Coin extends Collectable {
  Coin(PVector _pos) {
    super(_pos);
  }

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

  void render() {
    fill(#FFFF19);
    star(pos.x, pos.y, 5, 12, 5);
  }
  void powerup(Pawn star) {
    star.point = star.point + 1;
  }
}

class Doublejump extends Collectable {

  Doublejump(PVector _pos) {
    super(_pos);
  }
  void render() {
    fill(#FF1919);
    circle(pos.x, pos.y, 10);
  }

  void powerup(Pawn star) {
    star.doubleJump = true;
  }
}

class Changecolor extends Collectable {
  Changecolor(PVector _pos) {
    super(_pos);
  }
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
  Higherjump(PVector _pos) {
    super(_pos);
  }
  void render() {
    fill(#19FFD1);
    circle(pos.x, pos.y, 10);
  }

  void powerup(Pawn star) {
    star.jumpScalar += 2;
  }
}
