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
    textSize(height/26);
    stroke(0);
    text("High Score", 0.425*width, 0.35*height);
    for (int i = 0; i < scores.length; i++) {
      text(scores[i], 0.439*width, 0.04*i*height+height*0.4);
    }
  } 

  void fetch() {
    scores = loadStrings("highScores.txt");
  }

  void changeListLast(String newStr) {
    scores[scores.length-1] = newStr;
  }

  void sortScoresNumber() {
    for (int i = 0; i < scores.length-1; i++)
      for (int j = 0; j < scores.length-1; j++)
        if (extractScore(scores[j]) < extractScore(scores[j+1])) {
          String temp = scores[j];
          scores[j] = scores[j+1];
          scores[j+1] = temp;
        }
  }
  
    void sortScores() {
      // expects numbers in start with added zeroes
      scores = sort(scores);
      scores = reverse(scores);
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
    sortScores();
  }

  int extractScore(String input) {
    return Integer.parseInt(input.substring(6, 9));
  } 

  String singleInput() {
    //  TODO: implement this
    return "error";
  }
}
