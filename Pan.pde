interface Pan{
  void move(int yChange);
  // this requres everything that implements Pan to have a move functioin. This allows us to move everything down the screen in unison 
}
