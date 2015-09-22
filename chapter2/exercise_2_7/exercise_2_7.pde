// 摩擦 Friction
class Mover
{
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

Mover[] movers = new Mover[5];

void setup(){
  size(640, 360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(10), new PVector(random(width), random(height)));
  }

}

/**
 * 物体の位置によって摩擦係数を導出
 */
float getMu(PVector loc){
  float c = 0.01;
  // 低速ゾーン
  if(loc.x > 320 && loc.y < 180){
    c = 0.1;
  }

  // 右下、マイナス摩擦
  if(loc.x > 320 && loc.y > 180){
    c = -0.1;
  }
  return c;
}

void draw(){
  background(255);

  // 低速ゾーン(摩擦大)
  fill(225);
  rect(320, 0, 640, 360/2);

  // 高速ゾーン(摩擦マイナス)
  fill(235, 200, 200);
  rect(640/2, 360/2, 640, 360);


  // 風をシミュレート
  PVector wind = new PVector(0.01, 0);
  // 重力をシミュレート
  PVector gravity = new PVector(0, 0.1);

  for (int i = 0; i < movers.length; i++) {
    // 位置によって 摩擦係数 が変わる
    float c = getMu(movers[i].location);
    // 摩擦力を導出
    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);

    // 摩擦力を追加
    movers[i].applyForce(friction);

    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].checkEdges();
    movers[i].update();
    movers[i].display();
  }
}
