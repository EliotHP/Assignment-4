class superCodeBoy {
  //Loading PImages for sprite animation
  PImage SuperCodeBoyR[];
  PImage SuperCodeBoyL[];
  int LeftFrame;
  int RightFrame;
  PImage SuperCodeBoyWalkR[];
  PImage SuperCodeBoyWalkL[];
  int WalkLFrame;
  int WalkRFrame;
  PImage SuperCodeBoyJumpL1;
  PImage SuperCodeBoyJumpR1;
  //Booleans to say when to use which sprites
  Boolean WalkR = false;
  Boolean WalkL = false;
  Boolean Left = false;
  Boolean Right = true;
  Boolean JumpL = false;
  Boolean JumpR = false;
  Boolean inJump = false;
  //PVector + Speed and Gravity for character movement
  PVector position;
  float speed = 2;
  float gravity = 2;
  float ground = 200;
  float velocity = 0;
  //calling block array
  block[] blocks;


  superCodeBoy(block[] passedBlocks) {
    //loading images for sprites. PImages with [2] hold two images inside
    //which will be loaded into animations shortly
    SuperCodeBoyJumpL1 = loadImage("SuperCodeBoyJumpL1.png");
    SuperCodeBoyJumpR1 = loadImage("SuperCodeBoyJumpR1.png");

    SuperCodeBoyWalkL = new PImage[2];
    SuperCodeBoyWalkL[0] = loadImage("SuperCodeBoyWalkL1.png");
    SuperCodeBoyWalkL[1] = loadImage("SuperCodeBoyWalkL2.png");

    SuperCodeBoyWalkR = new PImage[2];
    SuperCodeBoyWalkR[0] = loadImage("SuperCodeBoyWalkR1.png");
    SuperCodeBoyWalkR[1] = loadImage("SuperCodeBoyWalkR2.png");

    SuperCodeBoyL = new PImage[2];
    SuperCodeBoyL[0] = loadImage("SuperCodeBoyL1.png");
    SuperCodeBoyL[1] = loadImage("SuperCodeBoyL2.png");


    SuperCodeBoyR = new PImage[2];
    SuperCodeBoyR[0] = loadImage("SuperCodeBoyR3.png");
    SuperCodeBoyR[1] = loadImage("SuperCodeBoyR4.png");

    //setting PVector starting position
    position = new PVector(100, ground);
    //passing Blocks from main sketch to here so that it may use the code for collision purposes
    blocks = passedBlocks;
  }

  void move() {
    //setting animation so sprites change every 10 frames
    if (frameCount % 10 == 0) {
      LeftFrame = (LeftFrame + 1) %  SuperCodeBoyL.length;
      RightFrame = (RightFrame + 1) % SuperCodeBoyR.length;
      WalkLFrame = (WalkLFrame + 1) %  SuperCodeBoyWalkL.length;
      WalkRFrame = (WalkRFrame + 1) % SuperCodeBoyWalkR.length;
    }
    //Adding gravity to velocity
    velocity += gravity;
    //Adding velocity to Y position
    position.y += velocity;

    //collision with blocks.
    //in simple terms, it checks if SCB position is about 40 pixels above or next to the
    //position of the blocks, then it sets velocity to constant zero,
    //so SuperCodeBoy can stand on it
    for (block b : blocks) {
      if (position.y + 40 > b.position.y && position.y + 40 <= b.position.y + b.height &&
        position.x + 10 > b.position.x && position.x - 10 < b.position.x + b.width) {
        position.y = b.position.y - 40;
        velocity = 0;
        inJump = false;
      }
    }
    //Added "collision" with the ground so that SuperCodeBoy doesn't fall out of the screen
    if (position.y > ground) {
      position.y = ground;
      velocity = 0;
      inJump = false;
      //if JumpL or R is true when SCB is on ground, then set JumpL/R to false, 
      //and Left/Right to true
      if(JumpL){
        JumpL = false;
        Left = true;
    }
    else if(JumpR){
      JumpR = false;
      Right = true;
    }
    }
      
    //Setting purposes of Booleans. If Walk Left is true, then move x position to the left
    //and run left walking animation. If Walk Right is true, move right with right walking animation
    //etc
    if (WalkL) {
      position.x -= speed;
      image(SuperCodeBoyWalkL[WalkLFrame], position.x, position.y);
    } else if (WalkR) {
      position.x += speed;
      image(SuperCodeBoyWalkR[WalkRFrame], position.x, position.y);
    } else if (Left) {
      image(SuperCodeBoyL[LeftFrame], position.x, position.y);
    } else if (Right) {
      image(SuperCodeBoyR[RightFrame], position.x, position.y);
    } else if (JumpR) {
      // Jump does not change position as that was just done when spacebar was pressed so it could be shortened
      //rather than having it appear here twice
      image(SuperCodeBoyJumpR1, position.x, position.y);
    } else if (JumpL) {
      image(SuperCodeBoyJumpL1, position.x, position.y);
    }
  }
  //Reset position for when game is lost or won. This sets SCB back to starting position
  void resetPosition() {
    position.set(100, 200);
  }
  //simple keyPressed commands for changing booleans to true and false.
  //this enables movement as some of the booleans change position when true, but also
  // removes any accidental sprite overlay.
  void keyPressed() {
    if (key == 'd') {
      WalkR = true;
      Left = false;
    } else if (key == 'a') {
      WalkL = true;
      Right = false;
    } else if (!inJump) {
      if (key == ' ') {
        velocity = -30;
        if (Right == true||WalkR == true) {
          Right = false;
          JumpL = false;
          JumpR = true;
          inJump = true;
        }
      } else if (Left == true||WalkL == true) {
        Left = false;
        JumpR = false;
        JumpL = true;
      }
    }
  }
  //The keyReleased was used for the sole reason of needing to know what direction
  //SuperCodeBoy was moving before he stopped, so the correct idle animation can play
  //this assumes that if they released the 'a' button, they were walking left and so it
  //plays the left animation
  void keyReleased() {
    if (key == 'a') {
      WalkL = false;
      Right = false;
      Left = true;
    } else if (key == 'd') {
      WalkR = false;
      Left = false;
      Right = true;
    }
  }
}
