class HighScore {
  // skal være: render; save; load; write highscore; determine highscore; username input
  // format is "AAA   000"
  String[] scores = new String[10];

  HighScore() {
    fetch();
  }

  void render() {
    background(0);
    fill(12, 184, 252);
    textSize(40);
    stroke(0);
    text("HighScore", 0.425*width, 0.35*height);
    for (int i = 0; i < scores.length; i++) {
      text(scores[i], 0.475*width, 0.04*i*height+height*0.4);
    }
  } 

  void fetch() {
    scores = loadStrings("highScores.txt");
  }

  void changeListLast(String newStr) {
    scores[scores.length-1] = newStr;
  }

  void sortScoreBoard() {
    scores = sort(scores);
  }

  void keep(String[] output) {
    saveStrings("highScores.txt", output);
  }

  String addZeroes(int input) {
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

  void newScore(String name, int value) {
    changeListLast(addZeroes(value) + "   " + name);
    sortScoreBoard();
  }

  String usernameInput() {
    String temp = new String();
    return temp;
  }

  int extractScore(String input) {
    return Integer.parseInt(input.substring(6,9));
  } 
  
}
