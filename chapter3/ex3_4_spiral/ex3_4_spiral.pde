// 中央を原点としてその周りを回る渦巻き
float r = 0;    // 半径
float theta = 0; // 角度

void setup(){
  size(640, 320);
  background(255);
}

void draw(){
  // 極座標からデカルト座標を求める
  float x = r * cos(theta);
  float y = r * sin(theta);

  fill(0);
  ellipse(x + width/2, y + height/2, 16, 16);

  theta += 0.02;
  r += 0.1;
}
