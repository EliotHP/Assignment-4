class Door {
PVector DoorPosition;
  Door() {
    DoorPosition = new PVector(1400,140);
  }

  void displayDoor() {
    fill(0);
    rect(1400, 135, 60, 120);
  }
    boolean checkCollision(PVector superCodeBoyPosition) {
      float distance = dist(superCodeBoyPosition.x, superCodeBoyPosition.y, DoorPosition.x, DoorPosition.y);
      if (distance < 5) {
        return true;
      }
      return false;
    }
}
