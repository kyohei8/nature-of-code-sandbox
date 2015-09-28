float count = 0;

void display(){
  stroke(32);
  fill(128);
  ellipse(width/2, height/2, 20, 20);

  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(count));
  line(0, 0, 50, 0);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(count));
  translate(50, 0);
  rotate(radians(count));
  ellipse(0, 0, 20, 20);
  popMatrix();

}

void setup(){
  size(640, 320);
}

void draw(){
  background(255);
  count = count + 1.0;
  display();
}
