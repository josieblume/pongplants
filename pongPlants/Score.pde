class Score {
  int score;

  Score() {
    score = 0;
  }

  void update() {
    score ++;
  }
  int getScore() {
    return score;
  }
  void display() {
    fill(255);
    textSize(20);
    text(score, width/2, height-50);
  }
}
