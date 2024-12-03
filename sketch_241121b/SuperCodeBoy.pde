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
Boolean Left = true;
Boolean Right = false;
Boolean JumpL = false;
Boolean JumpR = false;
PVector position;

 superCodeBoy() {
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
  SuperCodeBoyR[0] = loadImage("SuperCodeBoyR1.png");
  SuperCodeBoyR[1] = loadImage("SuperCodeBoyR2.png");
  
  
}
void move() {

if (frameCount % 10 == 0) {
    LeftFrame = (LeftFrame + 1) %  SuperCodeBoyL.length;
    RightFrame = (RightFrame + 1) % SuperCodeBoyR.length;
    WalkLFrame = (WalkLFrame + 1) %  SuperCodeBoyWalkL.length;
    WalkRFrame = (WalkRFrame + 1) % SuperCodeBoyWalkR.length;
}

if (WalkL) {
  image(SuperCodeBoyWalkL[WalkLFrame], 0, 0);
}
if (WalkR) {
  image(SuperCodeBoyWalkR[WalkRFrame], 0, 0);
}
if (Left) {
  image(SuperCodeBoyL[LeftFrame], 0, 0);
}
  if (Right) {
  image(SuperCodeBoyR[RightFrame], 0, 0);
  }
  if (JumpR) {
  image(SuperCodeBoyJumpR1, 0, 0);
  }
    if (JumpL) {
  image(SuperCodeBoyJumpL1, 0, 0);
    }

}

void keyPressed() {
  if(key == 'd'){
    WalkR = true;
  }else if(key == 'a'){
    WalkL = true;
  }else if(key == ' '){
    if(Right == true||WalkR == true) {
      Right = false;
      WalkR = false;
      JumpR = true;
    }else if(Left == true||WalkL == true){
     Left = false;
     WalkL = false;
     JumpL = true;
  }
}
}
void keyReleased() {
  if(key == 'a'){
    WalkL = false;
    Left = true;
  }else if(key == 'd'){
    WalkR = false;
    Right = true;
  }
}
}
