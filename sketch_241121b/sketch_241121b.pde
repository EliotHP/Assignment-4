//import sound library
import processing.sound.*;

// load Objects, Booleans, ArrayList, and SoundFile
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
  size(400, 400);
  //Initalizing objects and ArrayList. These are the blocks that are interactable
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
  
//load SoundFiles
  jump = new SoundFile(this, "jump.mp3");
  theme = new SoundFile(this, "theme.mp3");
}

void draw() {
  background(134, 145, 162);

//has screen follow SCB object. Got this from a YouTube video, still trying to 
//figure it out myself
  float offsetX = constrain(-SCBObject.position.x + width / 2, -1200, 0);
  float offsetY = 0;

  translate(offsetX, offsetY);

//Display all blocks in the array list
  for (block b : blocks) {
    b.display();
  }
  //Drawing background, which is really just a series of rectangles
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
  fill(146, 158, 176);
  rect(1500, 0, 800, 400);
  rect(320, 0, 60, 400);
  rect(1000, 0, 60, 400);
  stroke(0);
  strokeWeight(2.5);
  //desks
  fill(88, 90, 95);
  rect(70, 205, 90, 40);
  rect(450, 205, 90, 40);
  rect(650, 205, 90, 40);
  rect(850, 205, 90, 40);
  //computers
  fill(195, 197, 201);
  rect(85, 155, 60, 40);
  rect(465, 155, 60, 40);
  rect(665, 155, 60, 40);
  rect(865, 155, 60, 40);

  fill(173, 175, 180);
  rect(105, 195, 20, 10);
  rect(485, 195, 20, 10);
  rect(685, 195, 20, 10);
  rect(885, 195, 20, 10);

  fill(0);
  rect(90, 160, 50, 30);
  rect(470, 160, 50, 30);
  rect(670, 160, 50, 30);
  rect(870, 160, 50, 30);
  //floor
  fill(31, 59, 106);
  rect(0, 245, 2000, 200);


//calling object functions

  doorObject.displayDoor();
  SCBObject.move();
  bugObject.bugDisplay();
  bugObject.bugMove();

//set GameOver to true if SCB collides with bug
  if (bugObject.checkCollision(SCBObject.position)) {
    GameOver = true;
  }
  //set GameWin to true if SCB collides with door
  if (doorObject.checkCollision(SCBObject.position)) {
    GameWin = true;
  }
  //if GameOver or GameWin are true, stop the music
  if (GameOver) {
    overObject.display(SCBObject.position);
    theme.stop();
  }
  if (GameWin) {
    winObject.display(SCBObject.position);
    theme.stop();
  }
  //if GameRun is true, call the SCB reset function, play the theme, 
  //and set GameRun to false
  
  if (GameRun) {
    SCBObject.resetPosition();
    theme.play();
    GameRun = false;
  }
}
//Play jump noise when spacebar is pressed
//call SCB keyPressed function
void keyPressed() {
  SCBObject.keyPressed();
  if (key == ' ' && !jump.isPlaying()) {
    jump.play();
  }
  //if 'y' is pressed, set game Win and Over to false, and Run to true, 
  //initaiting restart
  if (key == 'y') {
    GameWin = false;
    GameOver = false;
    GameRun= true;
  }
}
//call SCB keyReleased function
void keyReleased() {
  SCBObject.keyReleased();
}
