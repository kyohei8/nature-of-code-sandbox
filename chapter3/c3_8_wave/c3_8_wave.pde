float startAngle = 0;
float angleVel = 0.01;

void setup(){
  size(640, 320);
}

void draw(){
  background(255);
  float angle = startAngle;
  startAngle += 0.02;

  for (int x = 0; x < width; x++) {
    float y = map(sin(angle), -1, 1, 0, height);
    fill(0, 50);
    ellipse(x, y, 30, 30);
    angle += angleVel;

  };
}
