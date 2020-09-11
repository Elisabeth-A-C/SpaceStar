
Pawn p;

void setup() {
fullScreen();
frameRate(60);
p = new pawn();
}

void draw() {
  background(255);
  p.update();
  p.display();
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
