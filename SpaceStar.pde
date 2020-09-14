import java.util.ArrayList;
boolean gameRunning;

Pawn p; // for testing, not final solution  
Platform pla; // for testing, not final solution

ArrayList<Pan> pannedObjects = new ArrayList<Pan>();

void setup() {
  fullScreen();
  frameRate(60);
  p = new Pawn();
  pla = new Platform();
  pla.move(400, 200);
  pannedObjects.add(p);
  pannedObjects.add(pla);
}

void draw() {
  background(255);
  //p.update();
  p.updateLocal();
  p.accDown(pla);
  pla.render();
  p.display();
  
  for (Pan q : pannedObjects) {
    q.move(1);
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
  // TODO: implement this
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
  text("Tought Luck.",0.34*width,0.45*height);
  text("You Died.",0.38*width,0.55*height);
  noLoop();
    }
  }
