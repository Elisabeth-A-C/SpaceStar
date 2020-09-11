import java.util.ArrayList;

Pawn p; // for testing, not final solution  
Platform pla; // for testing, not final solution

ArrayList<Pan> pannedObjects = new ArrayList<Pan>();

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
  
  for(Pan q : pannedObjects){
    q.move(1);
  }
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
