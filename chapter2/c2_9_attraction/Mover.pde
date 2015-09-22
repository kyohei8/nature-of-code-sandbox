class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;

  float mass;

  public Mover(float m, PVector loc){
    location = loc;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    // 質量
    mass = m;
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
    // 力(加速度)を元に戻す
    acceleration.mult(0);
  }

  void display(){
    stroke(0);
    fill(175);
    // 質量に応じて大きさを変える
    ellipse(location.x, location.y, mass * 6, mass* 6);
  }

  /**
   * 端に付いたら反対に側に行く
   */
  void checkEdges(){
    float dist;
    PVector left;

    if(location.x > width){
      location.x = width;
      velocity.x *= -1;
    }else if(location.x < 0){
      location.x = 0;
      velocity.x *= -1;
    }

    if(location.y > height){
      location.y = height;
      velocity.y *= -1;
    }

  }
}
