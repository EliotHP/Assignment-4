class GameOver {

  void display(PVector playerPosition) {
    noStroke();
    fill(227, 94, 94);
    rect(playerPosition.x - 200, playerPosition.y - 200, 600, 600);

    fill(255);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("GAME OVER", playerPosition.x, playerPosition.y);
    textSize(25);
    textAlign(CENTER, CENTER);
    text("press y to play again", playerPosition.x, playerPosition.y +100);
  }
}
