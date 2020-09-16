class PlatformSystem implements Pan {
  ArrayList<Platform>PlatformList = new ArrayList<Platform>();
  void move(int yChange) {
    for (Platform Q : PlatformList) {
      Q.move(yChange);
    }
  }
  void render() {
    for (Platform Q : PlatformList) {
      Q.render();
    }
  }
  void addPlatform() {
    PlatformList.add(new Platform(round(random(width)), 0));
  }

  void addPlatform(Platform previous) {
    Platform temp;
    PVector pos = wrap(new PVector(round(random(-0.25 * width + previous.pos.x, 0.25 * width+ previous.pos.x)), 0));
    temp = new Platform(pos);
    PlatformList.add(temp);
  }

  Platform getNewestPlatform() {
    return PlatformList.get(PlatformList.size()-1);
  }

  void addPlatform(int x, int y) {
    PlatformList.add(new Platform(x, y));
  }
  void empty() {
    PlatformList.clear();
  }

  void clearing() {
    for (int i = PlatformList.size()-1; i>=0; i--) {
      Platform p = (Platform) PlatformList.get(i);
      if (p.pos.y > height) {
        PlatformList.remove(i);
      }
    }
  }

  PVector wrap(PVector input) {
    if (input.x >= width) {
      input.x = input.x-width;
    } else if (input.x <= 0) {
      input.x = input.x+width;
    }
    if (input.x <= width && input.x >= 0) {
      return input;
    } else {
      return wrap(input);
    }
  }
}
