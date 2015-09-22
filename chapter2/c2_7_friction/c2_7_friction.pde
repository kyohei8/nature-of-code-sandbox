// 摩擦 Friction
// 摩擦とは運動などによるエネルギーが熱エネルギーに
// 変換されることによりそのエネルギーが減少していくこと（これを散逸力という)。
//
// 公式は
// Friction = -1 * μ* N * v
// 公式の '-1' と 'v' は物が動く方向とは逆に向かう単位ベクトルを表す
// 'μ(ミュー)'は摩擦係数を表す。摩擦係数は特定の表面における摩擦係数力の強さを決定する。
// 'N'は垂直抗力(normal force)を表す。垂直抗力は表面上を動く物体に直角に接する力
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

Mover[] movers = new Mover[1];

void setup(){
  size(640, 360);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(10), new PVector(random(width), random(height)));
  }

}

void draw(){
  background(255);
  // 風をシミュレート
  PVector wind = new PVector(0.01, 0);
  // 重力をシミュレート
  PVector gravity = new PVector(0, 0.1);

  for (int i = 0; i < movers.length; i++) {
    // 摩擦係数
    float c = -0.01;
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
