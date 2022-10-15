import 'package:flutter/material.dart';

import 'package:note_app/data/data.dart';
import 'package:note_app/data/models/models.dart';

class TaskTypeItem extends StatelessWidget {
  final TaskType taskType;
  final int index;
  final int currentTaskTypeIndex;
  final Task? currentTask;
  TaskTypeItem({
    Key? key,
    required this.taskType,
    required this.index,
    required this.currentTaskTypeIndex,
    this.currentTask,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 150.0,
      decoration: BoxDecoration(
        color: currentTask == null
            ? (currentTaskTypeIndex == index ? myGreen : Colors.white)
            : (currentTaskTypeIndex == index ? myGreen : Colors.white),
        border: Border.all(
          width: currentTaskTypeIndex == index ? 3 : 2,
          color: currentTask == null
              ? (currentTaskTypeIndex == index ? myGreen : Colors.grey)
              : (currentTaskTypeIndex == index
                  ? myGreen
                  : Colors.grey.withOpacity(0.5)),
        ),
      ),
      child: Column(
        children: [
          Image.asset(taskType.taskTypeHeader),
          Text(
            taskType.taskTypeTitle,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: currentTask == null
                  ? (currentTaskTypeIndex == index
                      ? Colors.white
                      : Colors.black)
                  : (currentTaskTypeIndex == index
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  getColor(Task? currentTask) {
    if (currentTask == null) {
      currentTaskTypeIndex == index ? myGreen : Colors.grey;
    } else {
      taskType.taskTypeEnum == currentTask.taskType!.taskTypeEnum;
    }
  }
}
