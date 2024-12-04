class GameWin {

  void display(PVector playerPosition) {
    noStroke();
    fill(94, 227, 94);
    rect(playerPosition.x - 200, playerPosition.y - 200, 800, 800);

    fill(255);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("YOU WIN", playerPosition.x, playerPosition.y);
    textSize(25);
    textAlign(CENTER, CENTER);
    text("press y to play again", playerPosition.x, playerPosition.y +100);
  }
}
