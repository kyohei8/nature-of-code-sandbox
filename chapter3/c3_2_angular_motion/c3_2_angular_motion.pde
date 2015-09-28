// 角運動
//
// 角度 = 角度 + 角速度
// 角速度 = 角速度 + 角加速度
//
Mover m;
void setup(){
  size(640, 320);
  m = new Mover();
}

void draw(){
  background(255);
  m.update();
  m.display();
}
