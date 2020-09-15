interface Pan {
  void move(int yChange);
  // this requires everything that implements Pan to have a move function. This allows us to move everything down the screen in unison

  void render();
}
