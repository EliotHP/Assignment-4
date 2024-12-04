import processing.sound.*;

superCodeBoy SCBObject;
block[] blocks;
Bug bugObject;
SoundFile jump;
boolean GameOver = false;
boolean GameWin = false;
boolean GameRun = true;

void setup() {
  size(1600,400);
 blocks = new block[7]; 
  blocks[0] = new block(200, 185, 60, 60); 
  blocks[1] = new block(400, 80, 400, 60); 
  blocks[2] = new block(1100, 210, 200, 40); 
  blocks[3] = new block(1140, 170, 160, 40);
    blocks[4] = new block(1180, 130, 120, 40); 
       blocks[5] = new block(1220, 90, 80, 40); 
          blocks[6] = new block(1260, 50, 40, 40); 
  
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
