import processing.sound.*;

superCodeBoy SCBObject;
block[] blocks;
Bug bugObject;
SoundFile jump;
boolean GameOver = false;
boolean GameWin = false;
boolean GameRun = true;

void setup() {
  size(1200,400);
 blocks = new block[3]; 
  blocks[0] = new block(100, 200, 100, 20); 
  blocks[1] = new block(200, 180, 100, 20); 
  blocks[2] = new block(300, 160, 100, 20); 
  
    SCBObject = new superCodeBoy(blocks);
    bugObject = new Bug(200, 3);
  imageMode(CENTER);
  
  jump = new SoundFile(this,"jump.mp3");
}
  
void draw(){
 background(255);
 for (block b : blocks){
   b.display();
 }
  SCBObject.move();
  bugObject.bugDisplay();
  bugObject.bugMove();
  
  if (bugObject.checkCollision(SCBObject.position)) {
    GameOver = true;
}
}

void keyPressed(){
  SCBObject.keyPressed();
  if(key == ' ' && !jump.isPlaying()) {
    jump.play();
  }
}

void keyReleased(){
  SCBObject.keyReleased();
}
