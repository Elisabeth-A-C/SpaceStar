 class Highscore {
  // skal være: render; save; load; write highscore; determent highscore; username input
  String[] scores;// new String[10];

  void render() {
  } 

  void fetch() {
    scores = loadStrings("highScores.txt");
  }

  void changeListLast(String newStr) {
    scores[scores.length-1] = newStr;
  }

  void sortScore (String[] output) {
  }
  
  void keep(String[] output) {
    saveStrings("highScores.txt", output);
  }
}
