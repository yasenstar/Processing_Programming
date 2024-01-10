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
  VisualPoint[] points = new VisualPoint[200];
  
  for (int i=0; i<points.length; i++) {
    float x = random(width);
    float y = random(height);
    float w = random(1,3);
    color c = color(random(250),random(250),random(250));
    points[i] = new VisualPoint(x, y, w, c);
  }
  
  float maxDistance = 200;
  
  for (int time=0; time<50; time++) {
    
    for (int i=0; i<points.length; i++) {
      points[i].display();
    }
    
    // rotate
    for (int i=0; i<points.length; i++) {
      int index = (i+1) % points.length;
      points[i].rotate(points[index], 0.01);
    }
    
    // distance
    for (int i=0; i<points.length;i++) {
      Point a = points[i];
      for (int j=i+1; j<points.length; j++) {
        Point b = points[j];
        float d = a.distance(b);
        if (d < maxDistance) {
          float alpha = map(d, 0, maxDistance, 255, 0);
          float weight = map(d, 0, maxDistance, 1, 0);
          stroke(0, alpha);
          strokeWeight(weight);
          line(a.x, a.y, b.x, b.y);
        }
      }
    }
  }
}
