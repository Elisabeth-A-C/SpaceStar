static class HighScore {
  // skal være: render; save; load; write highscore; determine highscore; username input
  static String[] scores = new String[10];
  
  HighScore() {
    fetch();
  }

 static void render() {
    background(0);
    fill(12, 184, 252);
    textSize(40);
    stroke(0);
    text("HighScore", 0.425*width, 0.35*height);
    for (int i = 0; i < scores.length; i++) {
      text(scores[i], 0.475*width, 0.04*i*height+height*0.4);
    }
  } 

  static void fetch() {
    scores = loadStrings("highScores.txt");
  }

  static void changeListLast(String newStr) {
    scores[scores.length-1] = newStr;
  }

  static void sortScoreBoard() {
    scores = sort(scores);
  }

  static void keep(String[] output) {
    saveStrings("highScores.txt", output);
  }

  static String addZeroes(int input) {
    // no numbers above 999
    if (input >= 1000) {
      return "error";
    } else if (input >= 100 && input <= 1000) {
      return Integer.toString(input);
    } else if (input >= 10) {
      return "0" + Integer.toString(input);
    } else if (input >= 0) {
      return "00" + Integer.toString(input);
    } else {
      return "error";
    }
  }

  static void newScore(String name, int value) {
    changeListLast(addZeroes(value) + "   " + name);
    sortScoreBoard();
  }

  static String usernameInput() {
    String temp = new String();
    key = '+';
    if (key != '+') {
    }
    return temp;
  }
}
