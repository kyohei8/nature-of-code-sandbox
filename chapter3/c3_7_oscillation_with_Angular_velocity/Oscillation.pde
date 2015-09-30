class Oscillation
{

  //--------------------------------------
  // 角度、角速度、振幅を持った振幅のクラス
  //--------------------------------------

  PVector angle;
  PVector velocity;
  PVector amp;

  public Oscillation () {
    // 角度
    angle = new PVector();
    velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    amp = new PVector(random(width/2), random(height/2));
  }

  void oscillate(){
    angle.add(velocity);
  }

  void display(){
    float x = sin(angle.x) * amp.x;
    float y = sin(angle.y) * amp.y;
    pushMatrix();
    translate(width/2, height/2);
    stroke(0);
    fill(160);
    line(0,0,x,y);
    ellipse(x, y, 16, 16);
    popMatrix();
  }
}
