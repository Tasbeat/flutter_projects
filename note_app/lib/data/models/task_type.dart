import 'package:hive/hive.dart';
import 'package:note_app/data/models/task_type_enum.dart';
part 'task_type.g.dart';

@HiveType(typeId: 2)
class TaskType {
  @HiveField(0)
  final String taskTypeHeader;
  @HiveField(1)
  final String taskTypeTitle;
  @HiveField(2)
  final TaskTypeEnum taskTypeEnum;

  TaskType(
      {required this.taskTypeHeader,
      required this.taskTypeTitle,
      required this.taskTypeEnum});
}
