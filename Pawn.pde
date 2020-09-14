class Pawn implements Pan {
  //TODO: restructore, use PVectors, read and use NOC 2.2 and 2.3.

  PVector location,velocity,acceleration;
  
  float w, h, x, y,
    speedLimit;
  
  //verden variable
  float friction, bounce, gravity;

  boolean isOnGround;
  float jumpForce;

  float halfWidth, halfHeight;
  String collisionSide;

  Pawn() {
    location = new PVector(400,0);
    velocity = new PVector (0,0);
    acceleration = new PVector (0,0);
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

  //TODO: implement this
  // void update(){
  //   if (left && !right){
  //   accelerationX = -0.2;
  // }
  //  if (right && !left){
  //   accelerationX = 0.2;
  // }
  //  if (!left && !right){
  //   accelerationX = 0;
  //  }
  //   if (up && !down){
  //   accelerationY = -0.2;
  // }
  //  if (down && !up){
  //   accelerationY = 0.2;
  // }
  //  if (!up && !down){
  //   accelerationX = 0;  
  //}
  //vx += accelerationX;
  //vy += accelerationY;

  //////maximum hastigheder
  //if (vx > speedLimit) { 
  //  vx = speedLimit;
  //}
  // if (vx < -speedLimit) { 
  //  vx = -speedLimit;
  //}
  // if (vy > speedLimit) { 
  //  vy = speedLimit;
  //}
  // if (vy < -speedLimit) { 
  //  vy = -speedLimit;
  //}
  //////ryk spilleren
  //x+=vx;
  //y+=vy;
  //}

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

  void accDown(Platform p) {
  if(p.isStandingOn(this)) {
    acceleration.mult(0);
    velocity.mult(0);
    isOnGround = true;
  } else {
    applyForce(new PVector(0,0.05));
  }  
  }
  
  void userInput(char input) {
      if (isOnGround && input == 'w' || input == 'W') {
         isOnGround = false;
      this.applyForce(new PVector(0,-5));
    } else if (input == 'a' || input == 'A') {
      this.applyForce(new PVector(-0.5,0));
    } else if (input == 'd' || input == 'D') {
      this.applyForce(new PVector(0.5,0));
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
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
