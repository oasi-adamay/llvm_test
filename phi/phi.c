//https://ja.wikipedia.org/wiki/%E9%9D%99%E7%9A%84%E5%8D%98%E4%B8%80%E4%BB%A3%E5%85%A5
void func(int* _y,int* _z,int* _w){
  int y,w,z;
  int x = 5;
  x = x -3;
  if(x<3){
    y = x *2;
    w = y;
  }
  else{
    y = x- 3;
  }

  w = x - y;
  z = x + y;

  *_y = y;
  *_w = w;
  *_z = z;
}
