import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:note_app/data/data.dart';
import 'package:note_app/navigator.dart';
import 'package:note_app/pages/pages.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import '../asset.dart';
import '../data/models/task.dart';
import '../utility.dart';

class TaskWidget extends StatefulWidget {
  final Task task;
  const TaskWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  late Task task;
  @override
  void initState() {
    task = widget.task;
    if (task.taskType == null) {
      task.taskType = getTaskTypeList()[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getTaskItem(context);
  }

  Center _getTaskItem(BuildContext context) {
    return Center(
      child: Container(
        height: 132.0,
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: _getTaskItemContent(),
        ),
      ),
    );
  }

  Row _getTaskItemContent() {
    return Row(
      children: [
        _getTaskItemImage(),
        Expanded(
          child: Column(
            children: [
              _getTaskExplainsAndCheckbox(),
              Spacer(),
              _getTaskItemButtons()
            ],
          ),
        )
      ],
    );
  }

  Padding _getTaskItemButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              navigator(
                context: context,
                destinationPage: EditTaskPage(currentTask: task),
                isPush: true,
              );
            },
            child: Container(
              width: 85.0,
              height: 28.0,
              decoration: BoxDecoration(
                color: myWhite,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 5.0,
                      left: 10.0,
                    ),
                    child: Image.asset(Asset.iconEdit),
                  ),
                  Text(
                    'ویرایش',
                    style: TextStyle(
                      color: myGreen,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                showPicker(
                  buttonsSpacing: 120,
                  displayHeader: false,
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
                    setState(() {
                      task.dateTime = DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        p0.hour,
                        p0.minute,
                      );
                      task.save();
                    });
                  },
                ),
              );
            },
            child: Container(
              width: 85.0,
              height: 28.0,
              decoration: BoxDecoration(
                color: myGreen,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 5.0,
                    ),
                    child: Image.asset(
                      Asset.iconTime,
                      width: 15.0,
                      height: 15.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                      task.dateTime == null ||
                              task.dateTime!.hour == 0 ||
                              task.dateTime!.minute == 0
                          ? 'نامشخص'
                          : '${task.dateTime!.hour}:${task.dateTime!.minute} ',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _getTaskExplainsAndCheckbox() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: _getTitleAndSubtitle(),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: _getRoundCheckBox(),
        ),
      ],
    );
  }

  RoundCheckBox _getRoundCheckBox() {
    return RoundCheckBox(
      borderColor: Colors.grey,
      size: 30.0,
      isChecked: task.isDone,
      checkedColor: myGreen,
      uncheckedWidget: Icon(
        Icons.clear,
        color: Colors.red,
      ),
      onTap: (selected) {
        setState(() {
          task.isDone = !task.isDone;
          task.save();
        });
      },
    );
  }

  Column _getTitleAndSubtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          task.subTitle,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Padding _getTaskItemImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 12.0,
      ),
      child: Image.asset(task.taskType!.taskTypeHeader),
    );
  }
}
