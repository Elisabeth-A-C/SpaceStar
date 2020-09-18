import java.util.ArrayList;
boolean gameRunning;
boolean displayStartScreen = true;
boolean displayHS = false;
boolean up, left, right;
boolean isDead = false;
HighScore HS;
StarBand SB;
String name = "";

import processing.sound.*;
SoundFile backgroundMusic;
SoundFile deadBackgroundMusic;

Pawn p;
PlatformSystem platforms;
Collectable item;
CollectableSystem itemSystem;

ArrayList<Pan> pannedObjects = new ArrayList<Pan>();
Background[]dots = new Background[125];

void setup() {
  fullScreen();
  frameRate(60);  
  p = new Pawn(new PVector(round(0.5*width), round(0.25*height)));
  platforms = new PlatformSystem();
  for (int i = 0; i<dots.length; i++) {
    dots[i] = new Background();
    pannedObjects.add(dots [i]);
  }
  item = new Collectable(new PVector(200, 200));
  SB = new StarBand(new PVector(0, -5*height));
  pannedObjects.add(SB);
  pannedObjects.add(platforms);
  pannedObjects.add(p);
  pannedObjects.add(item);
  PFont f = createFont("Stencil", 100);
  textFont(f);
  HS = new HighScore();
}

void draw() {
  background(#02043c);
  p.userInput(up, left, right);
  p.updateLocal(); 

  if (frameCount %150 == 0) { // 80 is better.
    platforms.addPlatform(platforms.getNewestPlatform());
    //itemSystem.addCol(platforms.getNewestPlatform());
  }

  p.accDown(platforms.PlatformList.toArray(new Platform[0]));

  for (Pan q : pannedObjects) {
    //q.move(1+floor(1*(frameCount/8000)));
    q.move(1+floor(p.point/25));
    q.render();
  }
  for (int i = 0; i<dots.length; i++) {
    dots[i].outOfScreen();
  }

  displayButton();

  renderScore();

  deathScreen();

  displayHighScore();

  launchGame();

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
    textSize(width * 0.035);
    fill(#fc4103);
    text("GAME PAUSED", width*0.04, width*0.06);
    noLoop();
  } else {
    loop();
  }
  gameRunning = !gameRunning;
}

void restart() {
  loop();
  p.location = new PVector(round(0.51*width), round(0.2*height));
  p.velocity = new PVector(0, 0);
  p.acceleration = new PVector (0, 0);
  platforms.empty();
  platforms.addPlatform(round(0.47*width), round(0.3*height));
  platforms.addPlatform(round(0.40*width), round(0.1*height));
  gameRunning = true;
  frameCount = 500; // this solves a problem with platforms remaining
  SB.location.y = -5*height;
  p.point = 0;
  }
  //HS.scoreAdded = false;


void launchGame() {
  if (displayStartScreen) {

    background(#1DABAB);
    fill(240);
    textSize(width*0.03);
    text("SpaceSTAR", 0.4*width, 0.45*height);
    text("pressto start", 0.20*width, 0.55*height);
    textSize(width*0.02);
  }
  if(mousePressed){
  displayStartScreen = false; 
  restart();
  }
}

void displayHighScore() {
  if (displayHS) {
    HS.render();
    noLoop();
  }
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

  if (name.length() < 3 && (key >= 'A' && key <= 'Z')) {
    name = name + key;
  }
  if (key == ' ') {
    pause();
  } else if (key == 'r') {
    restart();
  } else if (key == 'h') {
    displayHS = !displayHS;
    loop();
  } else if (key == ESC) {
    exit();
  }

  if (key == 'a' || key == 'A' || (key == CODED && keyCode == LEFT)) {
    left = true;
  } else if (key == 'd' || key == 'D' || (key == CODED && keyCode == RIGHT)) {
    right = true;
  } else if (key == 'w' || key == 'W' || (key == CODED && keyCode == UP)) {
    up = true;
  }
}

boolean hasDied(Pawn star) {
  return star.location.y > height;
}

void deathScreen() {
  if (hasDied(p)) {
    p.move(1000);
    fill(#ff0000);
    background(0);
    textSize(width*0.06);
    text("Tough Luck", 0.31*width, 0.45*height);
    text("You Died", 0.36*width, 0.55*height);
    text("Score: " + HS.addZeroes(p.point), 0.335*width, 0.65*height); // TODO: center on screen
    textSize(width*0.02);
    text("r = restart", 0.1*width, 0.75*height);  
    text("h = highscore", 0.1*width, 0.79*height);
    text("esc = end game", 0.1*width, 0.83*height);

    noLoop();
    platforms.empty();
    isDead = true;
    
    if(HS.scoreAdded == false){
      HS.newScore(name, p.point);
      HS.scoreAdded = true;
    }
  }
}
