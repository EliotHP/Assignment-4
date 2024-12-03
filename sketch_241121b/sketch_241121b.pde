import processing.sound.*;

superCodeBoy SCBObject;
Bug bugObject;
SoundFile jump;
boolean GameOver = false;

void setup() {
  size(400,400);
    SCBObject = new superCodeBoy();
    bugObject = new Bug(200, 3);
  imageMode(CENTER);
  
  jump = new SoundFile(this,"jump.mp3");
}
  
void draw(){
 background(255);
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
