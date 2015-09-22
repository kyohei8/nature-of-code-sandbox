//
// 抗力 drag force
//
// 物体が液体や気体を通りぬけるときに発生する摩擦
// 摩擦とは違い、表面積と流体密度が関連する
//
// 公式は
//   Fd = -0.5 * ρ* (v * v) * A * Cd * v
//
//  * -0.5 は 定数、マイナス方向に力が加わること
//  * ρ(ロー) 流体の密度。今回は定数1とする
//  * v*v は物体が移動する速さ(=速度ベクトルの大きさ)の２乗
//  * A は物体が進む方向の前面の表面積。（今回は球なので一旦無視する)
//  * Cd は抗力係数
//  * v は単位ベクトル
//
// 上記を踏まえ簡略化すると
//   F(drag) = ||v||^2 * Cd * v * -1 となる
//


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

Liquid liquid;
Mover[] movers = new Mover[4];

void setup(){
  size(640, 360);

  liquid = new Liquid(0, height/2, width, height/2, 0.1);

  /*
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(10), new PVector(random(width), random(height)));
  }
  */

  // 小さい(軽い）玉
  movers[0] = new Mover( 3, new PVector( 30, 0));
  // 大きい（重い）玉
  movers[1] = new Mover( 10, new PVector( 160, 0));
  movers[2] = new Mover( 3, new PVector( 230, 100));
  movers[3] = new Mover( 10, new PVector( 330, 100));
}

void draw(){
  background(255);
  liquid.display();
  // 風をシミュレート
  PVector wind = new PVector(0.01, 0);

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
    // 抗力を追加
    if(liquid.constrains(movers[i])){
      PVector dragForce = liquid.drag(movers[i]);
      movers[i].applyForce(dragForce);
    }

    // 重力をシミュレート
    PVector gravity = new PVector(0, 0.1 * movers[i].mass);
    /* movers[i].applyForce(wind); */
    movers[i].applyForce(gravity);
    movers[i].checkEdges();
    movers[i].update();
    movers[i].display();
  }
}
