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

  void addPlatform(Platform next) {
    PlatformList.add(next);
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
}
