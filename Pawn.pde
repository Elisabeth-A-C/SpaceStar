class Pawn implements Pan {
  //TODO: restructore, use PVectors, read and use NOC 2.2 and 2.3.
  PVector location,velocity,acceleration;
  
  float w, h, x, y, vx, vy, 
    accelerationX, accelerationY, 
    speedLimit;
  
  //verden variable
  float friction, bounce, gravity;

  boolean isOnGround;
  float jumpForce;

  float halfWidth, halfHeight;
  String collisionSide;

  Pawn() {
    location = new PVector(400,0);
    velocity = new PVector(0,0);
    acceleration = new PVector (0,0);
    w = 100; //140 original str
    h = 65; // 95 original str
    x = 400;
    y = 150;
    vx = 0;
    vy = 0;
    accelerationX = 0;
    accelerationY = 0;
    speedLimit = 5;
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
    println(true);
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
      this.applyForce(new PVector(-1,0));
    } else if (input == 'd' || input == 'D') {
      this.applyForce(new PVector(1,0));
    }
  }

  void display() {
    fill(0, 255, 0, 128);
    rect(x, y, w, h);
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
}
