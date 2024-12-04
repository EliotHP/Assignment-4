import processing.sound.*;

superCodeBoy SCBObject;
block[] blocks;
Bug bugObject;
SoundFile jump;
Door doorObject;
GameOver overObject;
GameWin winObject;
SoundFile theme;
boolean GameOver = false;
boolean GameWin = false;
boolean GameRun = true;

void setup() {
  size(1600, 400);
  blocks = new block[7];
  blocks[0] = new block(200, 185, 60, 60);
  blocks[1] = new block(400, 80, 400, 60);
  blocks[2] = new block(1100, 205, 200, 40);
  blocks[3] = new block(1140, 165, 160, 40);
  blocks[4] = new block(1180, 125, 120, 40);
  blocks[5] = new block(1220, 85, 80, 40);
  blocks[6] = new block(1260, 45, 40, 40);

  SCBObject = new superCodeBoy(blocks);
  bugObject = new Bug(200, 3);
  doorObject = new Door();
  overObject = new GameOver();
  winObject = new GameWin();
  imageMode(CENTER);

  jump = new SoundFile(this, "jump.mp3");
  theme = new SoundFile(this, "theme.mp3");
}

void draw() {
  background(134, 145, 162);




  float offsetX = constrain(-SCBObject.position.x + width / 2, -1600, 0); 
  float offsetY = 0;


  translate(offsetX, offsetY);

  for (block b : blocks) {
    b.display();
  }
    noStroke();
  fill(205, 210, 216);
  rect(80, 100, 220, 20);
  rect(80, 120, 20, 40);
  rect(280, 120, 20, 40);
  rect(120, 120, 140, 20);
  rect(120, 140, 20, 20);
  rect(240, 140, 20, 20);
  rect(140, 160, 40, 20);
  rect(200, 160, 40, 20);
  rect(240, 80, 40, 20);
  rect(100, 80, 40, 20);
  rect(160, 80, 60, 20);
  rect(120, 60, 140, 20);
  rect(140, 40, 20, 20);
  rect(220, 40, 20, 20);
  rect(120, 20, 20, 20);
  rect(240, 20, 20, 20);
  //Wall Details
  fill(146,158,176);
rect(1500,0,800,400);
rect(320, 0, 60,400);
rect(1000, 0, 60,400);
//desks
fill(88,90,95);
rect(70,205,90,40);
rect(450,205,90,40);
rect(650,205,90,40);
rect(850,205,90,40);
//computers
fill(195,197,201);
rect(85,155,60,40);
rect(465,155,60,40);
rect(665,155,60,40);
rect(865,155,60,40);

fill(173,175,180);
rect(105,195,20,10);
rect(485,195,20,10);
rect(685,195,20,10);
rect(885,195,20,10);

fill(0);
rect(90,160,50,30);
rect(470,160,50,30);
rect(670,160,50,30);
rect(8d70,160,50,30);
//floor
  fill(31,59,106);
rect(0,245,2000,200);



  doorObject.displayDoor();
  SCBObject.move();
  bugObject.bugDisplay();
  bugObject.bugMove();


  if (bugObject.checkCollision(SCBObject.position)) {
    GameOver = true;
  }
  if (doorObject.checkCollision(SCBObject.position)) {
    GameWin = true;
  }
  if (GameOver) {
    overObject.display(SCBObject.position);
    theme.stop();
  }
  if (GameWin) {
    winObject.display(SCBObject.position);
    theme.stop();
  }
  if (GameRun) {
    SCBObject.resetPosition();
    theme.play();
    GameRun = false;
  }
}

void keyPressed() {
  SCBObject.keyPressed();
  if (key == ' ' && !jump.isPlaying()) {
    jump.play();
  }
  if (key == 'y') {
    GameWin = false;
    GameOver = false;
    GameRun= true;
  }
}

void keyReleased() {
  SCBObject.keyReleased();
}
