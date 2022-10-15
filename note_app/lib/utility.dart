import 'package:note_app/asset.dart';
import 'package:note_app/data/models/models.dart';

import 'data/models/task_type_enum.dart';

List<TaskType> getTaskTypeList() {
  List<TaskType> taskTypeList = [
    TaskType(
      taskTypeHeader: Asset.banking,
      taskTypeTitle: 'کار بانکی',
      taskTypeEnum: TaskTypeEnum.banking,
    ),
    TaskType(
      taskTypeHeader: Asset.hardWorking,
      taskTypeTitle: 'کار زیاد',
      taskTypeEnum: TaskTypeEnum.hardWorking,
    ),
    TaskType(
      taskTypeHeader: Asset.meditate,
      taskTypeTitle: 'استراحت',
      taskTypeEnum: TaskTypeEnum.meditate,
    ),
    TaskType(
      taskTypeHeader: Asset.socialFriends,
      taskTypeTitle: 'گپ با دوستان',
      taskTypeEnum: TaskTypeEnum.socialFriends,
    ),
    TaskType(
      taskTypeHeader: Asset.workMeeting,
      taskTypeTitle: 'میتینگ کاری',
      taskTypeEnum: TaskTypeEnum.workMeeting,
    ),
    TaskType(
      taskTypeHeader: Asset.workout,
      taskTypeTitle: 'تمرین',
      taskTypeEnum: TaskTypeEnum.workout,
    ),
  ];
  return taskTypeList;
}
