class Pawn implements Pan {
  //TODO: restructore, use PVectors, read and use NOC 2.2 and 2.3.

  PVector location, velocity, acceleration;
  color paint = color(250,218,94);

  float w, h, x, y, 
    speedLimit;

  //verden variable
  float friction, bounce, gravity;

  boolean isOnGround;
  float jumpForce;

  float halfWidth, halfHeight;
  String collisionSide;

  Pawn() {
    location = new PVector(400, 0);
    velocity = new PVector (0, 0);
    acceleration = new PVector (0, 0);
    w = 100; //140 original str
    h = 65; // 95 original str
    x = 400;
    y = 150;
    isOnGround = false;
    jumpForce = -10;

    // verden værdier
    friction = 0.96;
    bounce = -0.7;
    gravity = 3;

    halfWidth = w/2;
    halfHeight = h/2;

    //collisionSide;
  }
   Pawn(PVector local) {
   this();
   location = local;
   }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void updateLocal() {
    velocity.limit(5);
    acceleration.limit(5);
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    this.x = location.x;
    this.y = location.y;
  }

  //void accDown(Platform p) {
  //  // TODO: Make a array variant
  //}
  
  void accDown(Platform[] p) {
    boolean gravityApplied = false;
    if (isStaningOnPlatform(p)) {
      acceleration.mult(0);
      velocity.mult(0);
      isOnGround = true;
    }  
    if ( isStaningOnPlatform(p) == false && gravityApplied == false) {
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


  void userInput(char input) {
    if (isOnGround && input == 'w' || input == 'W') {
      isOnGround = false;
      this.applyForce(new PVector(0, -5));
    } else if (input == 'a' || input == 'A') {
      this.applyForce(new PVector(-0.5, 0));
    } else if (input == 'd' || input == 'D') {
      this.applyForce(new PVector(0.5, 0));
    }
  }

  void setJumpScalar(float input) {
    this.jumpScalar = input;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    fill(paint);//fill(240,240,0);
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

  void jump() {
    // TODO: implement this
  }

  void star(float x, float y, float radius1, float radius2, int npoints) {
    float angle = TWO_PI / npoints;
    float halfAngle = angle/2.0;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
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
