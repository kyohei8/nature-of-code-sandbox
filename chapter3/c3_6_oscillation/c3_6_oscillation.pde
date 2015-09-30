// 振動
// y = sin(x) が-1と1を周期的に振幅するため、その出力を利用して振動を再現する
// これは `単振動` と呼ばれ、振り子やホッピングで跳ねるなどの動作に利用できる。
// 構成要素としては以下の２つ
// * 振幅(Amplitude) 中心からどちらかの端までの距離
// * 周期(Period) 1つの運動サイクルにかかる時間
// sin, cosの場合周期は360度毎となる

// 左右に振動する円
void setup(){
  size(640, 320);
}

void draw(){
  background(255);
  // 周期
  float period = 120;
  // 振幅
  float amplitude = 100;
  // フレーム数を周期で割った新効率を使って振動の移動量を計算
  float x = amplitude * cos(TWO_PI * frameCount / period);
  stroke(0);
  fill(94);
  translate(width/2, height/2);
  line(0, 0, x, 0);
  ellipse(x, 0, 20, 20);
}
