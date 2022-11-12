class Rectangle {
  final double width;
  final double height;
  const Rectangle(this.width, this.height);
}

class Circle {
  final double radius;
  const Circle(this.radius);

  double get PI => 3.1415;
}

class AreaCalculator {
  double calculate(Object shape) {
    if (shape is Rectangle) {
      return shape.width * shape.height;
    } else {
      final c = shape as Circle;
      return c.radius * c.radius * c.PI;
    }
  }
}
