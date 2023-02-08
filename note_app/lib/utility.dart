import 'package:note_app/asset.dart';
import 'package:note_app/data/models/models.dart';

import 'data/models/task_type_enum.dart';

List<TaskType> getTaskTypeList() {
  List<TaskType> taskTypeList = [
    TaskType(
      taskTypeHeader: Asset.banking,
      taskTypeTitle: 'Banking',
      taskTypeEnum: TaskTypeEnum.banking,
    ),
    TaskType(
      taskTypeHeader: Asset.hardWorking,
      taskTypeTitle: 'Hard Working',
      taskTypeEnum: TaskTypeEnum.hardWorking,
    ),
    TaskType(
      taskTypeHeader: Asset.meditate,
      taskTypeTitle: 'Resr',
      taskTypeEnum: TaskTypeEnum.meditate,
    ),
    TaskType(
      taskTypeHeader: Asset.socialFriends,
      taskTypeTitle: 'Hangout With Friends',
      taskTypeEnum: TaskTypeEnum.socialFriends,
    ),
    TaskType(
      taskTypeHeader: Asset.workMeeting,
      taskTypeTitle: 'Work Meeting',
      taskTypeEnum: TaskTypeEnum.workMeeting,
    ),
    TaskType(
      taskTypeHeader: Asset.workout,
      taskTypeTitle: 'Workout',
      taskTypeEnum: TaskTypeEnum.workout,
    ),
  ];
  return taskTypeList;
}
