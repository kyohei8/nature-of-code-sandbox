Mover[] movers =new Mover[100];
Attraction a;

void setup(){
  size(640, 360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(10), new PVector( random(width), random(height)));
  };
  a = new Attraction();
}

void draw(){
  background(255);
  a.drag();
  a.hover(mouseX,mouseY);
  a.display();
  for (int i = 0; i < movers.length; i++) {
    // 引力を計算し加える
    PVector f = a.attract(movers[i]);
    movers[i].applyForce(f);
    movers[i].update();
    movers[i].display();
  }
}

void mousePressed() {
  a.clicked(mouseX,mouseY);
}

void mouseReleased() {
  a.stopDragging();
}
