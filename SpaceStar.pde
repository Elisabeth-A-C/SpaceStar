import java.util.ArrayList;
boolean gameRunning;
boolean displayStartScreen = true;
boolean displayHS = false;
HighScore HS;


Pawn p;
PlatformSystem platforms;
Collectable item;

ArrayList<Pan> pannedObjects = new ArrayList<Pan>();
Background[]dots = new Background[125];

void setup() {
  fullScreen();
  frameRate(60);
  p = new Pawn(new PVector(round(0.25*width), round(0.12*height)));
  platforms = new PlatformSystem();
  for(int i = 0; i<dots.length; i++){
    dots[i] = new Background();
    pannedObjects.add(dots [i]);
  }
  item = new Collectable(new PVector(200, 200));
  pannedObjects.add(platforms);
  pannedObjects.add(p);
  pannedObjects.add(item);
  platforms.addPlatform(round(0.2*width), round(0.2*height));
  PFont f = createFont("Stencil", 100);
  textFont(f);
  HS = new HighScore();
}

void draw() {
  background(#02043c);
  //p.update();
  p.moveAnd();
  p.updateLocal();
  if (frameCount %150 == 0) { // 80 is better.
    platforms.addPlatform(platforms.getNewestPlatform());
    
  }

  p.accDown(platforms.PlatformList.toArray(new Platform[0]));

  for (Pan q : pannedObjects) {
    q.move(1+floor(1*pow(frameCount/1000,2)));
    q.render();
  }
  for(int i = 0; i<dots.length; i++){
  dots[i].outOfScreen();
  }

  displayButton();

  renderScore();

  deathScreen();
  displayHighScore();

  if (displayStartScreen) {
    launchGame();
  }

  SB.replace();
}

void renderScore() {
  textSize(width * 0.035);
  fill(#ff0000);
  text(HS.addZeroes(p.point), width*0.9, height*0.1);
}

void pause() {
  // Pause is also resume

  if (gameRunning) {
    textSize(width*0.05);
    fill(#fc4103);
    text("GAME PAUSED", width*0.05, width*0.08);
    noLoop();
  } else {
    loop();
  }
  gameRunning = !gameRunning;
}

void restart() {
  loop();
  p.location = new PVector(round(0.25*width), round(0.12*height));
  p.velocity = new PVector(0, 0);
  p.acceleration = new PVector (0, 0);
  platforms.empty();
  platforms.addPlatform(round(0.2*width), round(0.2*height));
  gameRunning = true;
  frameCount = 500; // this solves a problem with platforms remaining - with framecount 0 it does not update
  SB.move(-10*height);
}

void launchGame() {
  //gameRunning = true;
  background(#0000ff);
  fill(240);
  textSize(width*0.05);
  text("SpaceSTAR", 0.355*width, 0.45*height);
  text("Press to Start", 0.20*width, 0.55*height);

  if (mousePressed) {
    displayStartScreen = false;
    restart();
  }
}

  void displayHighScore(){
    // TODO
    
    
    displayHS = !displayHS;
  }

void mouseDragged() {
  if (p.isOnGround) {
    if (mouseY>= height/2) {
      PVector temp = direction().normalize();
      p.applyForce(PVector.mult(temp, p.jumpScalar));
      p.isOnGround = false;
    }
  } else {
    PVector temp = direction().normalize();
    temp.y = 0;
    p.applyForce(PVector.mult(temp, p.jumpScalar/33));
    p.isOnGround = false;
  }
}

boolean hasDied(Pawn star) {
  return star.y > height;
}

void deathScreen() {
  if (hasDied(p)) {
    fill(#ff0000);
    background(0);
    textSize(width*0.06);
    text("Tough Luck", 0.31*width, 0.45*height);
    text("You Died", 0.36*width, 0.55*height);
    noLoop();
  }
}
