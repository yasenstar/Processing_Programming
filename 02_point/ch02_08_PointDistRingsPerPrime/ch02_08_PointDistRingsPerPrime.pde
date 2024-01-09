import processing.pdf.*;

void setup() {
  String filename = this.getClass().getName();
  beginRecord(PDF, filename + ".pdf");
    size(1000,1000);
    // ellipseMode(RADIUS);
    // rectMode(CORNERS);
    background(255);
    // stroke(0);
    noFill();
    render();
  endRecord();
  saveFrame(filename + ".jpg");
}

void render() {
  ArrayList<VisualPoint> points = new ArrayList<VisualPoint>();
  
  float radius = 10;
  float radian = 0;
  float arc = 20;
  int count = 0;
  
 for (int i=2; i<=1500; i++) {
      float x = radius * cos(radian);
      float y = radius * sin(radian);
      float w = 5;
      color c = color(150);
      
      if (prime(i)) {
        w = 10;
        c = color(0);
      }

      VisualPoint p = new VisualPoint(x, y, w, c);
      points.add(p);
      
      int n = int(TAU * radius / arc);
      radian += TAU / n;
      count++;
      if (count==n) {
        radian = 0;
        count = 0;
        radius += 20;
      }
  }

  translate(width/2, height/2);
  for (VisualPoint p : points) p.display();
}

boolean prime(int number) {
  boolean result = true;
  for (int i=2; i < number/2+1; i++) {
    if (number % i == 0) {
      result = false;
      break;
    }
  }
  return result;
}
