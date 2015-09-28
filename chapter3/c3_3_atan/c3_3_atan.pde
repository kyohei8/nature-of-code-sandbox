// 正接(tan)
// 速度(２点の距離）が分かっていて角度がわからないときの角度を求める
// 逆正接(atan)を利用して求めることができる
// 式は
//   angle = atan( velocity.y / velocity.x );

// 中央とクリックした箇所の２点から角度を求める
PVector point;
PVector origin;

void setup(){
  size(640, 320);
  origin = new PVector(width/2, height/2);
  point = new PVector(0, 0);
}

void draw(){
  background(255);
  // 2点距離を求める
  PVector dir = PVector.sub(point, origin);
  // atan2 で角度を求める
  float angle = atan2(dir.y, dir.x);
  // or heading関数を利用する
  // float angle = dir.heading();

  // 常にマウスの方向を示す長方形を描画する
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  rect(0, 0, 30, 10);
  popMatrix();
}

void mousePressed(){
  point = new PVector(mouseX, mouseY);
}

