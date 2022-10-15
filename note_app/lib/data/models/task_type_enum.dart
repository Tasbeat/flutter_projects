import 'package:hive/hive.dart';

part 'task_type_enum.g.dart';

@HiveType(typeId: 3)
enum TaskTypeEnum {
  @HiveField(0)
  banking,
  @HiveField(1)
  hardWorking,
  @HiveField(2)
  meditate,
  @HiveField(3)
  socialFriends,
  @HiveField(4)
  workMeeting,
  @HiveField(5)
  workout
}
