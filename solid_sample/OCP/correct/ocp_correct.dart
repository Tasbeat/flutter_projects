import 'dart:math';

abstract class Shape {
  double calacluteArea();
}

class Rectangle extends Shape {
  final double width;
  final double height;
  Rectangle(this.width, this.height);

  @override
  double calacluteArea() {
    return width * height;
  }
}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);

  double get PI => 3.1415;

  @override
  double calacluteArea() {
    return radius * radius * pi;
  }
}

class Traingle extends Shape {
  final double radius;
  Traingle(this.radius);

  double get PI => 3.1415;

  @override
  double calacluteArea() {
    return radius * radius * pi;
  }
}

class AreaCalculator {
  double calculate(Shape shape) {
    return shape.calacluteArea();
  }
}
