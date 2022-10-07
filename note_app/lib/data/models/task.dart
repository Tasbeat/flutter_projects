import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2, defaultValue: false)
  bool isDone;
  Task({required this.title, required this.subTitle, this.isDone = false});
}
