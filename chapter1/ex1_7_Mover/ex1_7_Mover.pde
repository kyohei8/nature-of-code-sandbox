public class Mover
{

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  float time;


  public Mover () {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2, 2), random(-2, 2));
    acceleration = new PVector(-0.001, 0.01);
    topSpeed = 10;
    time = 0;

  }

  void update(){
    time = time + 0.01;

    /* acceleration = PVector.random2D(); */
    /* acceleration.mult(map(noise(time), 0, 1, 0, 0.1)); */

    PVector mouse = new PVector(mouseX, mouseY);
    // マウスポインタまでの距離を求める
    PVector dir = PVector.sub(mouse, location);

    dir.normalize();
    dir.mult(0.5);

    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);
  }

  void display(){
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }

  void checkEdges(){
    if(location.x > width){
      location.x = 0;
    }else if(location.x < 0){
      location.x = width;
    }

    if(location.y > height){
      location.y = 0;
    }else if (location.y < 0){
      location.y = height;
    }
  }

  void speedUp(){
    acceleration.add(0.001, 0.01);
  }

  void speedDown(){
    acceleration.sub(0.001, 0.01);
  }
}


Mover[] movers = new Mover[100];

void setup(){
  size(640, 360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw(){
  background(255);

  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}

void keyPressed(){
  if(keyCode == UP){
  }
  if(keyCode == DOWN){
  }
}

