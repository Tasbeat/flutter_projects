import 'package:flutter/material.dart';
import 'package:note_app/data/data.dart';

import '../data/models/task_type.dart';

class TaskTypeItem extends StatelessWidget {
  final TaskType taskType;
  final int index;
  final int currentTaskBarIndex;
  TaskTypeItem({
    Key? key,
    required this.taskType,
    required this.index,
    required this.currentTaskBarIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 150.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: currentTaskBarIndex == index ? 3 : 2,
          color: currentTaskBarIndex == index
              ? myGreen
              : Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Column(
        children: [
          taskType.taskTypeHeaderWidget,
          Text(taskType.taskTypeTitle),
        ],
      ),
    );
  }
}
