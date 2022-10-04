import 'package:hive/hive.dart';

part 'car.g.dart';

@HiveType(typeId: 1)
class Car {
  Car({
    required this.name,
    required this.model,
    required this.price,
  });
  @HiveField(0)
  String name;
  @HiveField(1)
  int model;
  @HiveField(2)
  double price;
}
