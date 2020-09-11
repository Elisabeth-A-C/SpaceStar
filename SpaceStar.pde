Pawn p;
Platform pla;

void setup() {
  fullScreen();
  frameRate(60);
  p = new Pawn();
  pla = new Platform();
  
}

void draw() {
  background(255);
  //p.update();
  p.display();
  pla.render();
}


void pause() {
  // TODO: implement this
}

void restart() {
  // TODO: implement this
}

void launchGame() {
  // TODO: implement this
}

void keyPressed() {
  // TODO: implement this
}
