// map()を使ってばねをシミュレート
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
  float y = amplitude * cos(TWO_PI * frameCount / period);
  // 画面からはみ出ないようにmapで調整
  y = map(y, -100, 100, 0, 320);
  stroke(0);
  fill(94);
  translate(width/2, 0);
  line(0, 0, 0, y);
  ellipse(0, y, 20, 20);
}
