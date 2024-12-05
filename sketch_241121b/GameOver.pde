class GameOver {

  //Summons on player X-position (player used to just be able 
  //to walk past it so it now follows player)
  
  void display(PVector playerPosition) {
    noStroke();
    fill(227, 94, 94);
    rect(playerPosition.x - 400, 0, 800, 800);

    fill(255);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("GAME OVER", playerPosition.x, 200);
    textSize(25);
    textAlign(CENTER, CENTER);
    text("press y to play again", playerPosition.x, 300);
  }
}
