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
  VisualPoint[] points = new VisualPoint[1000];
  for (int i=0; i<points.length; i++) {
    float x = random(width);
    float y = random(height);
    float w = random(1, 20);
    color c = color(random(200));
    points[i] = new VisualPoint(x, y, w, c);
  }
  for (VisualPoint p : points) p.display();
}
