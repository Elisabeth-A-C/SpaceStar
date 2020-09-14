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
