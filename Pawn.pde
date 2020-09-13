class Pawn implements Pan {
  //TODO: restructore, use PVectors, read and use NOC 2.2 and 2.3.
  
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
