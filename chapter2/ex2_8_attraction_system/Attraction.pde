/**
 * 引力を持つ物体
 */
class Attraction {
  PVector location;
  float mass;
  float G;
  boolean dragging = false;
  boolean rollover = false;
  PVector dragOffset;

  public Attraction (PVector loc) {
    location = loc; //new PVector(width/2, height/2);
    mass = 20;
    G = 0.4;
    dragOffset = new PVector(0.0,0.0);
  }

  void display(){
    noStroke();
    fill(233, 120, 128);
    ellipse(location.x, location.y, mass*2, mass*2);
  }

  PVector attract(Mover m){
    // ２つの物体の距離
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();

    distance = constrain(distance, 5, 10);
    // 力の強さ
    float strength = ( G * mass * m.mass ) / (distance * distance);
    force.normalize();
    force.mult(strength);
    return force;
  }

  // The methods below are for mouse interaction
  void clicked(int mx, int my) {
    float d = dist(mx,my,location.x,location.y);
    if (d < mass) {
      dragging = true;
      dragOffset.x = location.x-mx;
      dragOffset.y = location.y-my;
    }
  }

  void hover(int mx, int my) {
    float d = dist(mx,my,location.x,location.y);
    if (d < mass) {
      rollover = true;
    } else {
      rollover = false;
    }
  }

  void stopDragging() {
    dragging = false;
  }



  void drag() {
    if (dragging) {
      location.x = mouseX + dragOffset.x;
      location.y = mouseY + dragOffset.y;
    }
  }
}
