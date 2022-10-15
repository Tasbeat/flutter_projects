import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/data/models/models.dart';

import '../data/data.dart';
import '../data/models/task.dart';
import '../data/models/task_type_enum.dart';
import '../utility.dart';
import '../widgets/task_item_widget.dart';

class EditTaskPage extends StatefulWidget {
  final Task currentTask;
  const EditTaskPage({super.key, required this.currentTask});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  late TextEditingController _taskTitleController;
  late TextEditingController _taskSubTitleController;
  var taskBox = Hive.box<Task>('taskBox');
  FocusNode taskSubTitleFocusNode = FocusNode();
  FocusNode taskTitleFocusNode = FocusNode();
  late Task currentTask;
  int newTaskHour = 0;
  int newTaskMinute = 0;
  int _currentTaskTypeIndex = 0;

  @override
  void initState() {
    currentTask = widget.currentTask;
    _taskTitleController = TextEditingController(text: currentTask.title);
    _taskSubTitleController = TextEditingController(text: currentTask.subTitle);
    taskSubTitleFocusNode.addListener(() {
      setState(() {});
    });
    taskTitleFocusNode.addListener(() {
      setState(() {});
    });
    setState(() {
      if (currentTask.taskType == null) {
        currentTask.taskType = getTaskTypeList()[0];
      }
      _currentTaskTypeIndex =
          getCurrentTaskTypeIndex(currentTask.taskType!.taskTypeEnum);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 600.0,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 20.0,
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: _getTextField(
                        controller: _taskTitleController,
                        hintText: 'عنوان تسک',
                        inputType: TextInputType.emailAddress,
                        labelText: 'عنوان تسک',
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: _getTextField(
                        controller: _taskSubTitleController,
                        hintText: 'توضیحات',
                        inputType: TextInputType.visiblePassword,
                        labelText: 'توضیحات',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: myGreen,
                        minimumSize: Size(200.0, 60.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          showPicker(
                            buttonsSpacing: 120,
                            displayHeader: true,
                            focusMinutePicker: false,
                            accentColor: myGreen,
                            borderRadius: 20,
                            blurredBackground: true,
                            cancelText: 'بازگشت',
                            okText: 'ذخیره',
                            okStyle: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'SM',
                            ),
                            cancelStyle: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'SM',
                            ),
                            context: context,
                            value: TimeOfDay.now(),
                            onChange: (p0) {
                              newTaskHour = p0.hour;
                              newTaskMinute = p0.minute;
                            },
                          ),
                        );
                      },
                      child: Text(
                        "زمان تسک رو انتخاب کن",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    height: 200.0,
                    child: _getTaskTypeList(),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: myGreen),
                      onPressed: () {
                        currentTask.title = _taskTitleController.text;
                        currentTask.subTitle = _taskSubTitleController.text;
                        currentTask.dateTime = DateTime(
                          DateTime.now().year,
                          DateTime.now().month,
                          DateTime.now().day,
                          newTaskHour,
                          newTaskMinute,
                        );
                        currentTask.taskType =
                            getTaskTypeList()[_currentTaskTypeIndex];
                        print(currentTask.taskType!.taskTypeTitle);
                        currentTask.save();
                        Navigator.pop(context);
                      },
                      child: Text('ویرایش تسک'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    taskSubTitleFocusNode.dispose();
    taskTitleFocusNode.dispose();
    super.dispose();
  }

  Widget _getTextField(
      {required TextInputType inputType,
      required String hintText,
      required String labelText,
      required TextEditingController controller}) {
    return TextField(
      controller: controller,
      focusNode:
          labelText == 'عنوان تسک' ? taskTitleFocusNode : taskSubTitleFocusNode,
      autofocus: false,
      keyboardType: inputType,
      cursorColor: myWhite,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      maxLines: labelText == 'عنوان تسک' ? 1 : 2,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
          borderSide: BorderSide(
            color: myGreen,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey.shade400,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: myWhite.withOpacity(0.7),
          fontSize: 12,
        ),
        labelText: '$labelText',
        labelStyle: TextStyle(
          color: labelText == 'عنوان تسک'
              ? (taskTitleFocusNode.hasFocus ? myGreen : Colors.grey)
              : (taskSubTitleFocusNode.hasFocus ? myGreen : Colors.grey),
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
          borderSide: BorderSide(
            width: 3,
            color: myGreen,
          ),
        ),
      ),
    );
  }

  ListView _getTaskTypeList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var taskType = getTaskTypeList()[index];

        return InkWell(
          onTap: () {
            setState(() {
              _currentTaskTypeIndex = index;
            });
          },
          child: TaskTypeItem(
            currentTask: currentTask,
            taskType: taskType,
            currentTaskTypeIndex: _currentTaskTypeIndex,
            index: index,
          ),
        );
      },
      itemCount: getTaskTypeList().length,
    );
  }

  int getCurrentTaskTypeIndex(TaskTypeEnum taskTypeEnum) {
    switch (taskTypeEnum) {
      case TaskTypeEnum.banking:
        return 0;
      case TaskTypeEnum.hardWorking:
        return 1;
      case TaskTypeEnum.meditate:
        return 2;
      case TaskTypeEnum.socialFriends:
        return 3;
      case TaskTypeEnum.workMeeting:
        return 4;
      case TaskTypeEnum.workout:
        return 5;

      default:
        return 0;
    }
  }
}
