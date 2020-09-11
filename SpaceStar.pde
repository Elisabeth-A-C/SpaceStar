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
  p.display();
  pla.render();

  for (Pan q : pannedObjects) {
    q.move(1);
  }
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
    if (key == 'w' || key == 'W') {
      p.move(0, -height/300);
    } else if (key == 'a' || key == 'A') {
      p.move(-height/300, 0);
    } else if (key == 'd' || key == 'D') {
      p.move(height/300, 0);
    } else if (key == ' ') {
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
