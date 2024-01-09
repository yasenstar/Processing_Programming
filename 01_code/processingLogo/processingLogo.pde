int u = 60;
boolean showGrid = true;

void setup() {
  String filename = this.getClass().getName();
  size(600, 600);
  draw();
  saveFrame(filename + ".jpg");
}

void draw() {
  background(255);
  if (showGrid) drawGrid();
  strokeCap(SQUARE);
  strokeWeight(1.5 * u);
  
  stroke(5, 100, 255);
  bezier(4 * u, 1 * u, 7 * u, 1 * u, 7 * u, 5 * u, 4 * u, 5 * u);
  
  stroke(30, 50, 170);
  line(1 * u, 6 * u, 5 * u, 2 * u);
  
  stroke(130, 175, 255);
  line(1 * u, 3 * u, 2 * u, 5 * u);
  
}

void drawGrid() {
  strokeWeight(1);
  noFill();
  stroke(200);
  for(int col = 0; col < 11; col++) {
    line(col * u, 0, col * u, 10 * u);
  }
  for(int row = 0; row < 11; row++) {
    line(0, row * u, 10 * u, row * u);
  }
}
