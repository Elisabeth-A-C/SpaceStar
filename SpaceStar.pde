<<<<<<< HEAD
void setup() {
}

void draw() {
=======
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
>>>>>>> 5e99420c43ec7cdfc37c59f3116684206d509137
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
<<<<<<< HEAD
      if (keyPressed) {
        if (key == 'w' || key == 'W') {
          move(0,-height/300);
      }
        else if (key == 'a' || key == 'A') {
          move(-height/300,0);
      }
        else if (key == 'd' || key == 'D') {
          move(height/300,0);
      } 
      
        else if (key == ' ') {
          pause();
          
        else if (key == 'r') {
          restart();
          
      // mellemrum skal være her til pause
      // s til nedad
      // r til restart
      // start ved hver en tast
      }
    }
=======
  // TODO: implement this
>>>>>>> 5e99420c43ec7cdfc37c59f3116684206d509137
}
