import 'package:flutter/cupertino.dart';
import 'package:note_app/asset.dart';
import 'package:note_app/data/models/models.dart';

List<TaskType> getTaskTypeList() {
  List<TaskType> taskTypeList = [
    TaskType(
      taskTypeHeaderWidget: Image.asset(Asset.banking),
      taskTypeTitle: 'کار بانکی',
      taskTypeEnum: TaskTypeEnum.banking,
    ),
    TaskType(
      taskTypeHeaderWidget: Image.asset(Asset.hardWorking),
      taskTypeTitle: 'کار زیاد',
      taskTypeEnum: TaskTypeEnum.hardWorking,
    ),
    TaskType(
      taskTypeHeaderWidget: Image.asset(Asset.meditate),
      taskTypeTitle: 'استراحت',
      taskTypeEnum: TaskTypeEnum.meditate,
    ),
    TaskType(
      taskTypeHeaderWidget: Image.asset(Asset.socialFriends),
      taskTypeTitle: 'گپ با دوستان',
      taskTypeEnum: TaskTypeEnum.socialFriends,
    ),
    TaskType(
      taskTypeHeaderWidget: Image.asset(Asset.workMeeting),
      taskTypeTitle: 'میتینگ کاری',
      taskTypeEnum: TaskTypeEnum.workMeeting,
    ),
    TaskType(
      taskTypeHeaderWidget: Image.asset(Asset.workout),
      taskTypeTitle: 'تمرین',
      taskTypeEnum: TaskTypeEnum.workout,
    ),
  ];
  return taskTypeList;
}
