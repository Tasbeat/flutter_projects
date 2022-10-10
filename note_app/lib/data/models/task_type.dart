import 'package:flutter/material.dart';
part 'task_type_enum.dart';

class TaskType {
  final Widget taskTypeHeaderWidget;
  final String taskTypeTitle;
  final TaskTypeEnum taskTypeEnum;

  TaskType(
      {required this.taskTypeHeaderWidget,
      required this.taskTypeTitle,
      required this.taskTypeEnum});
}
