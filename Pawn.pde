class Pawn implements Pan {
  PVector location, velocity, acceleration; // location is based on the center of the star
  color paint = color(250, 218, 94);

  float x, y, speedLimit;
  float jumpScalar = 5;

  boolean isOnGround;


  Pawn() {
    location = new PVector(0, 0);
    velocity = new PVector (0, 0);
    acceleration = new PVector (0, 0);
    isOnGround = false;
  }

  Pawn(PVector local) {
    this();
    location = local;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void updateLocal() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    this.x = location.x;
    this.y = location.y;
    location = wrap(location);
  }

  void accDown(Platform[] p) {
    boolean gravityApplied = false;
    if (isStaningOnPlatform(p)) {
      acceleration.mult(0);
      velocity.mult(0);
      isOnGround = true;
    }  
    if (isStaningOnPlatform(p) == false && gravityApplied == false) {
      applyForce(new PVector(0, 0.05));
      gravityApplied = true;
    }
  }

  boolean isStaningOnPlatform(Platform[] inp) {
    for (Platform q : inp) {
      if (q.isStandingOn(this)) {
        return true;
      }
    }
    return false;
  }

  void userInput(boolean up, boolean left, boolean right) {
    if (isOnGround && (up == true)) {
      isOnGround = false;
      this.applyForce(PVector.mult(new PVector(0, -1), jumpScalar));
    } else if (left == true) {
      this.applyForce(new PVector(-0.25, 0));
    } else if (right == true) {
      this.applyForce(new PVector(0.25, 0));
    }
  }



  void setJumpScalar(float input) {
    this.jumpScalar = input;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    fill(paint);
    star(0, 0, 30, 70, 5); 
    popMatrix();
  }

  void render() {
    this.display();
  }

  void move(int yChange) {
    this.move(0, yChange);
  }

  void move(int xChange, int yChange) {
    this.x += xChange ;
    this.y += yChange ;
  }

  //star
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

  PVector wrap(PVector input) {
    if (input.x >= width) {
      input.x = input.x-width;
    } else if (input.x <= 0) {
      input.x = input.x+width;
    }
    if (input.x <= width && input.x >= 0) {
      return input;
    } else {
      return wrap(input);
    }
  }
}
