class Bug {
  PImage Bug1, Bug2;
  PVector BugPosition;
  PVector BugVelocity;
  int direction;
  int bugState = 1;    
int switchDuration = 30; 
int timer = 0;
  


  
  Bug(float y, float speed) {

  Bug1 = loadImage("Bug1.png");
  Bug2 = loadImage("Bug2.png");
    BugPosition = new PVector(0, y);
    BugVelocity = new PVector(speed, 0);
    direction = 1;
  }
  
  void bugDisplay() {
     if (bugState == 1 && random(1) < 0.01) { 
    bugState = 2;
    timer = 0; 
  }


  if (bugState == 1) {
    image(Bug1, BugPosition.x, 200);
  } else if (bugState == 2) {
    image(Bug2, BugPosition.x, 200);
    timer++;


    if (timer >= switchDuration) {
      bugState = 1;
    }
  }
}

void bugMove() {
 BugPosition.add(BugVelocity.mult(direction));
 if ( (BugPosition.x + 50) >= width || BugPosition.x < 0) {
      direction = direction * -1;
    }
}

 boolean checkCollision(PVector superCodeBoyPosition) {
    float distance = dist(superCodeBoyPosition.x, superCodeBoyPosition.y, BugPosition.x, BugPosition.y);
    if (distance < 5) { 
      return true;
    }
    return false;
 }
}
