/**
 * 液体をシミュレートするクラス
 */
class Liquid
{
  float x, y, w, h;
  float c; //流体密度(抗力)

  public Liquid (float _x, float _y, float _w, float _h, float _c) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c = _c;
  }

  void display() {
    noStroke();
    fill(30, 0, 0);
    rect(x,y,w,h);
  }

  // Liquid内にmoverが存在するかどうか
  boolean constrains(Mover m) {
    PVector loc = m.location;
    return loc.x > x && loc.x < x + w && loc.y > y && loc.y < y + h;
  }

  PVector drag(Mover m){
    // 速度ベクトル
    float speed = m.velocity.mag();
    // 速度ベクトルの２乗と抗力をかける -> 力の大きさ
    float dragMagnitude = c * speed * speed;

    PVector dragForce = m.velocity.get();
    dragForce.mult(-1); // ベクトルの向き

    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }

}

