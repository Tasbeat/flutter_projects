abstract class Animal {
  void eat();
  void sleep();
}

abstract class Flayable {
  void fly();
}

class Bird implements Animal, Flayable {
  @override
  void eat() {}

  @override
  void sleep() {}

  @override
  void fly() {
    // TODO: implement fly
  }
}

class Dog implements Animal {
  @override
  void eat() {}

  @override
  void sleep() {}
}
