class StarBand implements Pan {
  PVector location;

  StarBand(PVector local) {
    location = local;
  }

  void move(int yChange) {
    location.y += yChange;
  }

  void render() {
    strokeWeight(height/75);
    color[] list = {#663dc7, #7d42ea, #9165e2, #ba79f6, #c975e6, #d271ca, #df6d9c};
    for (int i = 0; i<7; i++) {
      stroke(list[i]);
      line(location.x, location.y+i*15, width, location.y+0.5*height+i*15);
    }
    strokeWeight(1);
    stroke(0);
  }

  void replace() {
    if (location.y > height) {
      move(-10*height);
    }
  }
}
