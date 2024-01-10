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
    float w = random(1,3);
    color c = color(random(200));
    points[i] = new VisualPoint(x, y, w, c);
  }
  
  for (int time=0; time<100; time++) {
    for (int i=0; i<points.length; i++) {
      int index = (i+1) % points.length;
      points[i].rotate(points[index], 0.01);
      points[i].display();
    }
  }
}
