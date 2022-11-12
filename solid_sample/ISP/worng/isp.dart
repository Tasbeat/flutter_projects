abstract class Animal {
  void eat();
  void sleep();
  void fly();
}

class Bird implements Animal {
  @override
  void eat() {}

  @override
  void sleep() {}

  @override
  void fly() {}
}

class Dog implements Animal {
  @override
  void eat() {}

  @override
  void sleep() {}

  @override
  void fly() => throw Exception('Dogs cannot fly!');
}
