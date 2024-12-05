class block {
  PVector position;
  float width, height;

//Set block "position". Basically makes it so block 
//position can be whatever its set to in main sketch
  block(float x, float y, float w, float h) {
    position = new PVector(x, y);
    width = w;
    height = h;
  }
//displays block
  void display() {
    stroke(0);
    strokeWeight(2.5);
    fill(151, 151, 151);
    rect(position.x, position.y, width, height);
  }
//what was here was a remnant of something I tried and forgot to remove
//it served no purpose
}
