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
  float arc = 10;
  int count = 0;
  
  while (radius<450) {
      float x = radius * cos(radian);
      float y = radius * sin(radian);
      float w = random(1, 15);
      color c = color(random(200));

      VisualPoint p = new VisualPoint(x, y, w, c);
      points.add(p);
      
      int n = int(TAU * radius / arc);
      // int n = 30;
      radian += TAU / n;
      if (count==n) {
        radian = 0;
        count = 0;
        radius += 20;
      }
      count++;
  }

  translate(width/2, height/2);
  for (VisualPoint p : points) p.display();
}
