Mover[] movers =new Mover[100];

void setup(){
  size(640, 360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(10), new PVector( random(width), random(height)));
  };
}

void draw(){
  background(255);

  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if(j == i){
        continue;
      }
      // 引力を計算し加える
      PVector f = movers[j].attract(movers[i]);
      f.mult(-1);
      movers[i].applyForce(f);
    }

    // マウスに引きつけられる
    PVector mouseF = attract(movers[i]);
    movers[i].applyForce(mouseF);

    movers[i].update();
    movers[i].display();

  }
}

PVector attract(Mover m){
  float G = 0.4;
  float mass = 20;

  // ２つの物体の距離
  PVector mouseLoc = new PVector(mouseX, mouseY);
  PVector force = PVector.sub(mouseLoc, m.location);
  float distance = force.mag();

  distance = constrain(distance, 5, 10);
  // 力の強さ
  float strength = ( G * mass * m.mass ) / (distance * distance);
  force.normalize();
  force.mult(strength);
  return force;
}

