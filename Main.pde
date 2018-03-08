Perceptron brain;
Point[] points = new Point[300]; 

void setup() {
  size(800, 800);

  brain = new Perceptron();

  for (int i =0; i<points.length; i++) {
    points[i] = new Point();
  }
}

void draw() {
  background(255);
  stroke(0);

  line(0, 0, width, height);
  for (Point p : points) {
    p.show();
  }

  // send some points for training
  for (int i = 0; i < 1; i++) {
    int rand = (int) random(0.0, 299.0);
    float[] input = {points[rand].x, points[rand].y};
    int target = points[rand].label;
    brain.train(input, target);
  }

  for (Point pt : points) {
    float[] inputs = {pt.x, pt.y};
    int guess = brain.guess(inputs);
    int target = pt.label;

    if (guess == target) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(pt.x, pt.y, 16, 16);
  }

  println(brain.weights[0] + " " + brain.weights[1] );
}
