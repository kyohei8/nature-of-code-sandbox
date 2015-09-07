PVector loc;

class Walker{
  Walker(){
    loc = new PVector(width/2, height/2);
  }

  void display(){
    stroke(0);
    point(loc.x, loc.y);
  }

  void step(){
    int stepx = int(random(3))-1;
    int stepy = int(random(3))-1;
    loc.x += stepx;
    loc.y += stepy;
  }
}

Walker w;

void setup(){
  size(640, 360);
  w = new Walker();
  background(255);
}

void draw(){
  w.step();
  w.display();
}
