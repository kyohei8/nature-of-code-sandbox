class Mover
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  // 角度に関する設定値
  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = 0.01;

  public Mover () {
    location = new PVector(random(width), random(height));
    mass = random(10);
    velocity = new PVector(0, 0);
    acceleration = new PVector(random(190), 0);
  }

  /**
   * 力を加える
   * @param force 力のベクトル
   */
  void applyForce(PVector force){
    // 力を質量で割る
    PVector f = PVector.div(force, mass);
    // 力を加速度に積算する
    acceleration.add(f);
  }

  void update(){
    // 力を加え
    velocity.add(acceleration);
    location.add(velocity);

    // 角度運動を加える
    aAcceleration = acceleration.x / 10.0;
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity, -0.1, 0.1);
    angle += aVelocity;

    // 力(加速度)を元に戻す
    acceleration.mult(0);
  }

  void display(){
    stroke(0);
    fill(175);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);

    // 質量に応じて大きさを変える
    rect(0, 0, mass * 6, mass* 6);
    popMatrix();
  }
}
