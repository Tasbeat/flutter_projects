abstract class Shape {
  double Area();
}

class Squre extends Shape {
  int side = 0;

  @override
  double Area() {
    // TODO: implement Area
    throw side * side;
  }
}

class Circle extends Shape {
  @override
  double Area() {
    // TODO: implement Area
    throw UnimplementedError();
  }
}

class Rectangle extends Shape {
  @override
  double Area() {
    // TODO: implement Area
    throw UnimplementedError();
  }
}

class ShpaesOnline {
  List<String> cache = [];

  // GET requests
  String? wikiArticle(String figure) {
    /* ... */
  }

  void _cacheElements(String text) {
    /* ... */
  }
}

class ShapePrinter {
  void drawShape(Shape shape) {
    shape.Area();
  }
}
