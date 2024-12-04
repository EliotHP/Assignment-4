class superCodeBoy {
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
  Boolean WalkR = false;
  Boolean WalkL = false;
  Boolean Left = false;
  Boolean Right = true;
  Boolean JumpL = false;
  Boolean JumpR = false;
  PVector position;
  float speed = 2;
  float gravity = 2;
  float groundY = 200;
  float velocityY = 0;
  block[] blocks;


  superCodeBoy(block[] passedBlocks) {
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

    position = new PVector(100, groundY);
    blocks = passedBlocks;
  }
  void move() {


    if (frameCount % 10 == 0) {
      LeftFrame = (LeftFrame + 1) %  SuperCodeBoyL.length;
      RightFrame = (RightFrame + 1) % SuperCodeBoyR.length;
      WalkLFrame = (WalkLFrame + 1) %  SuperCodeBoyWalkL.length;
      WalkRFrame = (WalkRFrame + 1) % SuperCodeBoyWalkR.length;
    }
    velocityY += gravity;
    position.y += velocityY;

    for (block b : blocks) {
      if (position.y + 40 > b.position.y && position.y + 40 <= b.position.y + b.height &&
        position.x + 10 > b.position.x && position.x - 10 < b.position.x + b.width) {
        position.y = b.position.y - 40;
        velocityY = 0;
      }
    }
    if (position.y > groundY) {
      position.y = groundY;
      velocityY = 0;
    }
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
      image(SuperCodeBoyJumpR1, position.x, position.y);
    } else if (JumpL) {
      image(SuperCodeBoyJumpL1, position.x, position.y);
    }
  }
  void resetPosition() {
    position.set(100, 200);
  }
  void keyPressed() {
    if (key == 'd') {
      WalkR = true;
      Left = false;
    } else if (key == 'a') {
      WalkL = true;
      Right = false;
    } else if (key == ' ') {
      velocityY = -30;
      if (Right == true||WalkR == true) {
        Right = false;
        JumpL = false;
        JumpR = true;
      }
    } else if (Left == true||WalkL == true) {
      Left = false;
      JumpR = false;
      JumpL = true;
    }
  }
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
