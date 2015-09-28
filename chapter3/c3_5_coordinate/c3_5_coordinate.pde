// デカルト座標と極座標
//
// # デカルト座標
// 原点からx座標、y座標の距離で求められる（ベクトル）点の位置
//
// # 極座標
// 原点からの角度（θ)と半径(r)で表す点の位置
//
// 半径と角度から指定の点の位置を求めたい場合以下の式を利用する
// （極座標からデカルト座標を求める座標変換）
// cos(θ) = x / 半径(r); → x = cos(θ) * r;
// sin(θ) = y / 半径(r); → y = sin(θ) * r;


// 中央を原点としてその周りを回る円
float r = 90;    // 半径
float theta = 0; // 角度

void setup(){
  size(640, 320);
}

void draw(){
  background(255);
  // 極座標からデカルト座標を求める
  float x = r * cos(theta);
  float y = r * sin(theta);

  ellipse(x + width/2, y + height/2, 30, 30);

  theta += 0.05;
}
