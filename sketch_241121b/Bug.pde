class Bug {
  PImage Bug1;
  PImage Bug2;
  PVector BugPosition;
  PVector BugVelocity;
  int direction;
  int bugState = 1;
  int switchDuration = 30;
  int timer = 0;


  Bug(float y, float speed) {

    Bug1 = loadImage("Bug1.png");
    Bug2 = loadImage("Bug2.png");
    BugPosition = new PVector(260, y);
    BugVelocity = new PVector(speed, 0);
    direction = 1;
  }

  void bugDisplay() {
    //changing "bugState" randomly
    if (bugState == 1 && random(1) < 0.01) {
      bugState = 2;
      timer = 0;
    }

//if Bug state is 1, which it is most of the time, it will display normal bug
//if Bug state is 2, it will display glitched bug. It also adds to timer
    if (bugState == 1) {
      image(Bug1, BugPosition.x, 200);
    } else if (bugState == 2) {
      image(Bug2, BugPosition.x, 200);
      timer++;

//if timer is greater than switchDuration (30), then bugState is 1, 
//which reinstates the cycle back on line 23
      if (timer >= switchDuration) {
        bugState = 1;
      }
    }
  }

  void bugMove() {
    //This is the code from the train, just constrained to 260-1100.
    //Just makes the bug move back and forth across the screen
    BugPosition.add(BugVelocity.mult(direction));
    if ((BugPosition.x + 50) >= 1100 || BugPosition.x < 260) {
      direction = direction * -1;
    }
  }
//Checks for position of SuperCodeBoy and Bug, if they are within 5 pixels of each other, 
// it changes the checkCollision boolean to true, which is used back on the 
//main sketch to initate the GameOver boolean
  boolean checkCollision(PVector superCodeBoyPosition) {
    float distance = dist(superCodeBoyPosition.x, superCodeBoyPosition.y, BugPosition.x, BugPosition.y);
    if (distance < 5) {
      return true;
    }
    return false;
  }
}
