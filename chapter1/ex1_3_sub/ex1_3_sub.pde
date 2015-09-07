void setup(){
  size(640, 360);
}

void draw(){
  background(255);

  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);

  // 中心を左上でなく中央にする
  mouse.sub(center);

  // 半分にする
  mouse.mult(0.5);
  // さらに半分にする
  mouse.div(2);

  // ベクトルの大きさ
  float m = mouse.mag();
  fill(0);
  rect(0,0,m,10);

  // ベクトルの正規化
  mouse.normalize();
  mouse.mult(50);


  translate(width/2, height/2);
  line(0, 0, mouse.x, mouse.y);
}
