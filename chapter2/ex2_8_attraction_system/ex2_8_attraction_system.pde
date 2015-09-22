Mover[] movers =new Mover[10];
Attraction[] attractions = new Attraction[12];

void setup(){
  size(640, 360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(2,5), new PVector( random(width), random(height)));
  };

  for (int i = 0; i < attractions.length; i++) {
    attractions[i] = new Attraction(new PVector(random(width), random(height)));
  };
}

void draw(){
  background(255);

  for (int i = 0; i < attractions.length; i++) {
    Attraction a = attractions[i];

    a.drag();
    a.hover(mouseX,mouseY);
    a.display();

  };
  for (int i = 0; i < movers.length; i++) {
    // 引力を計算し加える
    for (int j = 0; j < attractions.length; j++) {
      Attraction a = attractions[j];
      PVector f = a.attract(movers[i]);
      movers[i].applyForce(f);
    }
    movers[i].update();
    movers[i].display();
  }
}

void mousePressed() {
  for (int i = 0; i < attractions.length; i++) {
    Attraction a = attractions[i];
    a.clicked(mouseX,mouseY);
  }
}

void mouseReleased() {
  for (int i = 0; i < attractions.length; i++) {
    Attraction a = attractions[i];
    a.stopDragging();
  }
}
