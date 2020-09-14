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
}
