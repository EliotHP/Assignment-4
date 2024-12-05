class Door {
  PVector DoorPosition;
  Door() {
    DoorPosition = new PVector(1400, 125);
  }
//The door is functionally the same as the bug, except its a rectangle instead of a sprite
//and does not move
  void displayDoor() {
    fill(0);
    rect(1400, 125, 60, 120);
  }
  //Same thing as with bug, checks for Door position and SCB position, if they are the same 
  // then it sets checkCollision to true, which initiates the GameWin boolean in 
  //the main sketch
  boolean checkCollision(PVector superCodeBoyPosition) {
    if (superCodeBoyPosition.x > DoorPosition.x && superCodeBoyPosition.x < DoorPosition.x + 60 &&
      superCodeBoyPosition.y > DoorPosition.y && superCodeBoyPosition.y < DoorPosition.y + 120) {
      return true;
    }
    return false;
  }
}
