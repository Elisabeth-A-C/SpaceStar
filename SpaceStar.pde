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
  SB = new StarBand(new PVector(0, -10*height));
  pannedObjects.add(SB);
  pannedObjects.add(platforms);
  pannedObjects.add(p);
  pannedObjects.add(item);
  PFont f = createFont("Stencil", 100);
  textFont(f);
  HS = new HighScore();
  backgroundMusic = new SoundFile(this, "SpaceStarBackgroundMusic.mp3");
}

void draw() {
  background(#02043c);
  p.userInput(up, left, right);
  p.updateLocal(); 

  if (frameCount %150 == 0) { // 80 is better.
    platforms.addPlatform(platforms.getNewestPlatform());
  }

  p.accDown(platforms.PlatformList.toArray(new Platform[0]));

  for (Pan q : pannedObjects) {
    q.move(1+floor(1*(frameCount/8000)));
    q.render();
  }
  for (int i = 0; i<dots.length; i++) {
    dots[i].outOfScreen();
  }

  renderScore();

  deathScreen();

  displayHighScore();

  if (displayStartScreen) {
    launchGame();
  }
  SB.replace();
  // HS.render(); //TODO: DELETE THIS
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
  SB.move(-10*height);
  if (isDead == true) {
    deadBackgroundMusic.stop();
    isDead = false;
  }
  backgroundMusic.loop();
}

void launchGame() {
  //gameRunning = true;
  background(#2CDBBE);
  fill(240);
  textSize(width*0.05);
  text("SpaceSTAR", 0.355*width, 0.45*height);
  text("Press any key to Start", 0.20*width, 0.55*height);
  text("ENTER YOUR NAME: " + name, 0.4*width, 0.9*height);

  //if (keyPressed) {
  //  displayStartScreen = false;
  //  restart();
  //}
}

void displayHighScore() {
  if (displayHS) {
    HS.render();
    noLoop();
  }
}

void keyPressed() {
  if (displayStartScreen == true) {
    if (key == ESC) exit();
    if (key == ENTER && name.length() == 3) {
      displayStartScreen = false;
      restart();
      return;
    }
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
  } else if (key == 'm' || key == 'M') {
    if (backgroundMusic.isPlaying()) {
      backgroundMusic.pause();
    } else backgroundMusic.play(); //TODO: loop'er den stadig?
  }
}

void keyReleased() {
  if (key == 'a' || key == 'A' || key == LEFT || (key == CODED && keyCode == LEFT)) {
    left = false;
  } else if (key == 'd' || key == 'D' || (key == CODED && keyCode == RIGHT)) {
    right = false;
  } else if (key == 'w' || key == 'W' || (key == CODED && keyCode == UP)) {
    up = false;
  }
}

boolean hasDied(Pawn star) {
  return star.y > height;
}

void deathScreen() {
  if (hasDied(p)) {
    p.move(1000);
    fill(#ff0000);
    background(0);
    textSize(width*0.06);
    text("Tough Luck", 0.31*width, 0.45*height);
    text("You Died", 0.36*width, 0.55*height);
    noLoop();
    platforms.empty();
    backgroundMusic.stop();
    isDead = true;
    deadBackgroundMusic = new SoundFile(this, "DeadBackgroundMusic.mp3");
    deadBackgroundMusic.play();
  }
}
