void setup() {
}

void draw() {
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
}
