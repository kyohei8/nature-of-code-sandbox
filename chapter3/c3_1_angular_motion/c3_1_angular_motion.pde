// 角運動
//
// 角度 = 角度 + 角速度
// 角速度 = 角速度 + 角加速度
//


float count = 0;
float angle = 0;
float aVelocity = 1;
float aAcceleration = 0.1;

void display(){
  translate(width/2, height/2);
  rotate(radians(angle));
  line(-50, 0, 50, 0);
  ellipse(50, 0, 20, 20);
  ellipse(-50, 0, 20, 20);

}

void setup(){
  size(640, 320);
}

void draw(){
  background(255);
  aVelocity += aAcceleration;
  count += aVelocity;
  angle = radians(count);

  display();
}
