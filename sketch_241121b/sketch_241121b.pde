superCodeBoy SCBObject;

void setup() {
  size(400,400);
    SCBObject = new superCodeBoy();
  imageMode(CENTER);
}
  
void draw(){
 background(255);
  SCBObject.move();
}

void keyPressed(){
  SCBObject.keyPressed();
}

void keyReleased(){
  SCBObject.keyReleased();
}
