class Door {
PVector DoorPosition;
  Door() {
    DoorPosition = new PVector(1400,125);
  }

  void displayDoor() {
    fill(0);
    rect(1400, 125, 60, 120);
  }
    boolean checkCollision(PVector superCodeBoyPosition) {
      if (superCodeBoyPosition.x > DoorPosition.x && superCodeBoyPosition.x < DoorPosition.x + 60 &&
      superCodeBoyPosition.y > DoorPosition.y && superCodeBoyPosition.y < DoorPosition.y + 120) {
    return true;
  }
  return false;
    }
}
