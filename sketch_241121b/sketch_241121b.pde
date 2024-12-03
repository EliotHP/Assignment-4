superCodeBoy SCBObject;

void setup() {
  size(400,400);
  imageMode(CENTER);
}
  
void draw(){
  
  SCBObject = new superCodeBoy();
  SCBObject.move();
}

void keyPressed(){
  SCBObject.keyPressed();
}

void keyReleased(){
  SCBObject.keyReleased();
}
