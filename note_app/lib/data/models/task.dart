import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  Task({
    required this.title,
    required this.subTitle,
  });
}
