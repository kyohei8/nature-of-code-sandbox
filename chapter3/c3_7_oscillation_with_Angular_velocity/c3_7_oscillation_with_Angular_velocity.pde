Oscillation[] o = new Oscillation[100];

void setup(){
  size(640, 340);
  for (int i = 0; i < o.length; i++) {
    o[i] = new Oscillation();
  };

}

void draw(){
  background(255);
  for (int i = 0; i < o.length; i++) {
    o[i].oscillate();
    o[i].display();
  };
}
