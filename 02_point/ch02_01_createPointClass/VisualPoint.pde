class VisualPoint extends Point {
  float w;  //大小
  color c;  //颜色
  
  VisualPoint(float x, float y, float w, color c) {
    super(x, y);
    this.w = w;
    this.c = c;
  }
  
  void display() {
    stroke(c);
    strokeWeight(w);
    point(x, y);
  }
}
