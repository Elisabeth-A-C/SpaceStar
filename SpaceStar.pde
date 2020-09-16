import java.util.ArrayList;
boolean gameRunning;
boolean displayStartScreen = true;
boolean displayHS = false;
HighScore HS;
StarBand SB;


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
  SB = new StarBand(new PVector(0, height+100));
  pannedObjects.add(SB);
  pannedObjects.add(platforms);
  pannedObjects.add(p);
  pannedObjects.add(item);
  platforms.addPlatform(round(0.47*width), round(0.3*height));
  PFont f = createFont("Stencil", 100);
  textFont(f);
  HS = new HighScore();
}

void draw() {
  background(#02043c);
  //p.update();
  p.updateLocal();
  if (frameCount %80 == 0) { // 80 is better.
    platforms.addPlatform(platforms.getNewestPlatform());
  }

  p.accDown(platforms.PlatformList.toArray(new Platform[0]));

  for (Pan q : pannedObjects) {
    q.move(1+floor(1*pow(frameCount/1000, 2)));
    q.render();
  }
  for (int i = 0; i<dots.length; i++) {
    dots[i].outOfScreen();
  }
  deathScreen();
  displayHighScore();

  if (displayStartScreen) {
    launchGame();
  }
  //  HS.render();
  SB.replace();
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
  p.location = new PVector(round(0.5*width), round(0.25*height));
  p.velocity = new PVector(0, 0);
  p.acceleration = new PVector (0, 0);
  platforms.empty();
  Platform startPla = new Platform(round(0.47*width), round(0.3*height));
  Platform secondPla = new Platform(round(0.43*width), round(0.12*height));
  platforms.PlatformList.add(startPla);
  platforms.PlatformList.add(secondPla);
  gameRunning = true;
  frameCount = 0;
}

void launchGame() {
  //gameRunning = true;
  background(#2CDBBE);
  fill(240);
  textSize(width*0.05);
  text("SpaceSTAR", 0.355*width, 0.45*height);
  text("Press any key to Start", 0.20*width, 0.55*height);

  if (keyPressed) {
    displayStartScreen = false;
    restart();
  }
}

void displayHighScore() {
  // TODO


  displayHS = !displayHS;
}

void keyPressed() {
  p.userInput(key);
  if (key == ' ') {
    pause();
  } else if (key == 'r') {
    restart();
  } else if (key == 'h') {
    displayHighScore();
  } else if (key == ESC) {
    exit();
  }

  key ='o'; // control char, that should never be used.
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
  }
}
