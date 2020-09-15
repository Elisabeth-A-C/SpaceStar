import java.util.ArrayList;
boolean gameRunning;
boolean displayStartScreen = true;

Pawn p; // for testing, not final solution  
// Platform pla; // for testing, not final solution
PlatformSystem platforms;

ArrayList<Pan> pannedObjects = new ArrayList<Pan>();

void setup() {
  fullScreen();
  frameRate(60);
  p = new Pawn(new PVector(round(0.25*width), round(0.12*height)));
  platforms = new PlatformSystem();
  pannedObjects.add(platforms);
  pannedObjects.add(p);
  platforms.addPlatform(round(0.2*width), round(0.2*height));
}

void draw() {
  background(255);
  //p.update();
  p.updateLocal();
  if (frameCount %50 == 0) {
    platforms.addPlatform();
  }

  p.accDown(platforms.PlatformList.toArray(new Platform[0]));

  for (Pan q : pannedObjects) {
    q.move(1);
    q.render();
  }
  deathScreen();

  if (displayStartScreen) {
    launchGame();
  }
}

void pause() {
  // Pause is also resume

  if (gameRunning) {
    textSize(70);
    fill(#fc4103);
    text("GAME PAUSED", 200, 100 );
    noLoop();
  } else {
    loop();
  }
  gameRunning = !gameRunning;
}

void restart() {
  loop();
  p.location = new PVector(round(0.25*width), round(0.15*height));
  p.velocity = new PVector(0, 0);
  p.acceleration = new PVector (0, 0);
  platforms.empty();
  platforms.addPlatform(round(0.2*width), round(0.2*height));
  gameRunning = true;
}

void launchGame() {
  // TODO: implement this
  //gameRunning = true;
  background(#0000ff);
  textSize(100);
  fill(240);
  textSize(100);
  text("SpaceSTAR", 0.34*width, 0.45*height);
  text("Press any key to Start", 0.25*width, 0.55*height);

  if (keyPressed) {
    displayStartScreen = false;
    restart();
  }
}

void keyPressed() {
  if (keyPressed) {
    p.userInput(key);
    if (key == ' ') {
      pause();
    } else if (key == 'r') {
      restart();
    }
  }

  key ='o'; // control char, that should never be used.
}

boolean hasDied(Pawn star) {
  return star.y > height;
}

void deathScreen() {
  if (hasDied(p) == true) {
    fill(#ff0000);
    background(0);
    textSize(100);
    text("Tough Luck", 0.34*width, 0.45*height);
    text("You Died", 0.37*width, 0.55*height);
    noLoop();
  }
}
