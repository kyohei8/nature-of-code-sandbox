loadPixels();

float xoff = 0.0;

// 100x100のピクセル
for(int x = 0; x < width; x++){
  float yoff = 0.0;

  for(int y = 0; y < height; y++){

    // 生成されたnoise(0.0〜1.0)を0〜255に変換する
    float bright = map(noise(xoff, yoff), 0, 1, 0, 255);
    float r = map(x, 0, width, 0, 255);
    float g = map(y, 0, height, 0, 255);
    /* float b = 255; */
    pixels[x+y*width] = color(r, g, b, bright);
    yoff += 0.1;
  }
  xoff += 0.1;
}


updatePixels();

void draw(){
  print(1);
}
