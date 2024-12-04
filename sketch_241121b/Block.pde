class block {
  PVector position;
  float width, height;

  block(float x, float y, float w, float h) {
    position = new PVector(x, y);
    width = w;
    height = h;
  }

  void display() {
    strokeWeight(2.5);
    fill(151, 151, 151);
    rect(position.x, position.y, width, height);
  }


  boolean checkStanding(PVector playerPosition, float playerHeight) {
    return playerPosition.y + playerHeight >= position.y &&
      playerPosition.x + 10 >= position.x &&
      playerPosition.x - 10 <= position.x + width;
  }
}
