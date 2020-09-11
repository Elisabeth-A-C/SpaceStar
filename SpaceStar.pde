Pawn p; // for testing, not final solution  
Platform pla; // for testing, not final solution  

void setup() {
  fullScreen();
  frameRate(60);
  p = new Pawn();
  pla = new Platform();
  pla.move(400, 200);
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
