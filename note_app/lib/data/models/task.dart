// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:note_app/data/models/models.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2, defaultValue: false)
  bool isDone;
  @HiveField(3, defaultValue: null)
  DateTime? dateTime;
  @HiveField(4, defaultValue: null)
  TaskType? taskType;

  Task({
    required this.title,
    required this.subTitle,
    this.isDone = false,
    DateTime? dateTime,
    this.taskType,
  }) : this.dateTime = dateTime;
}
