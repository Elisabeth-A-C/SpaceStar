import java.util.ArrayList;
boolean gameRunning;

Pawn p; // for testing, not final solution  
// Platform pla; // for testing, not final solution
PlatformSystem platforms;

ArrayList<Pan> pannedObjects = new ArrayList<Pan>();

void setup() {
  fullScreen();
  frameRate(60);
  p = new Pawn(new PVector(round(0.25*width),round(0.15*height)));
  platforms = new PlatformSystem();
  pannedObjects.add(p);
  pannedObjects.add(platforms);
  platforms.addPlatform(round(0.2*width),round(0.2*height));
}

void draw() {
  background(255);
  //p.update();
  p.updateLocal();
  if(frameCount %50 == 0) {
  platforms.addPlatform();
  }
  
  p.accDown(platforms.PlatformList.toArray(new Platform[0]));

  
  for (Pan q : pannedObjects) {
    q.move(1);
    q.render();
  }
  deathScreen();
}


void pause() {
  // pause is also resume

  if (gameRunning) {
    textSize(70);
    text("GAME PAUSED", 200, 100 );
    noLoop();
  } else {
    loop();
  }
  gameRunning = !gameRunning;
}

void restart() {
  loop();
  p.location = new PVector(round(0.25*width),round(0.15*height));
  p.velocity = new PVector(0,0);
  p.acceleration = new PVector (0,0);
  platforms.empty();
  platforms.addPlatform(round(0.2*width),round(0.2*height));
  gameRunning = true;
}

void launchGame() {
  // TODO: implement this
  gameRunning = true;
}

void keyPressed() {
  if (keyPressed) {
    p.userInput(key);
  if (key == ' ') {
      pause();
    } else if (key == 'r') {
      restart();

      // mellemrum skal være her til pause
      // s til nedad
      // r til restart
      // start ved hver en tast
    }
  }
}

  boolean hasDied(Pawn star) {
    return star.y > height;
  }
  
  void deathScreen() {
  if(hasDied(p) == true) {
  background(255,0,0);
  textSize(100);
  text("Tough Luck",0.34*width,0.45*height);
  text("You Died",0.37*width,0.55*height);
  noLoop();
    }
  }
