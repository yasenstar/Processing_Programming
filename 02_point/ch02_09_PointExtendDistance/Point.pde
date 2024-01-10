class Point {
  float x, y;  // x, y 坐标属性
  
  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  Point() {  // 构造函数重载
    x = 0;
    y = 0;
  }
  
  Point copy() {
    return new Point(x, y);
  }
  
  float distance(Point p) {
    float dx = x - p.x;
    float dy = y - p.y;
    return sqrt(dx*dx+dy*dy);
  }
}
