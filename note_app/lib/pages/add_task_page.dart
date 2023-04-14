// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/utility.dart';
import 'package:note_app/widgets/widgets.dart';
import '../data/data.dart';
import '../data/models/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _taskSubTitleController = TextEditingController();
  var taskBox = Hive.box<Task>('taskBox');
  FocusNode taskSubTitleFocusNode = FocusNode();
  FocusNode taskTitleFocusNode = FocusNode();
  int taskHour = 0;
  int taskMinute = 0;
  int _currentTaskTypeIndex = 0;
  @override
  void initState() {
    taskSubTitleFocusNode.addListener(() {
      setState(() {});
    });
    taskTitleFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            height: 600.0,
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
                        hintText: 'Task Title',
                        inputType: TextInputType.emailAddress,
                        labelText: 'Task Title',
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
                        hintText: 'Description',
                        inputType: TextInputType.visiblePassword,
                        labelText: 'Description',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: getChooseTaskTimeButton(context),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    height: 200.0,
                    child: _getTaskTypeList(),
                  ),
                  Spacer(),
                  _getAddTaskButton(context)
                ],
              ),
            ),
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
            taskType: taskType,
            currentTaskTypeIndex: _currentTaskTypeIndex,
            index: index,
          ),
        );
      },
      itemCount: getTaskTypeList().length,
    );
  }

  ElevatedButton _getAddTaskButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: myGreen),
      onPressed: () {
        taskBox.add(
          Task(
            title: _taskTitleController.text,
            subTitle: _taskSubTitleController.text,
            dateTime: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              taskHour,
              taskMinute,
            ),
            taskType: getTaskTypeList()[_currentTaskTypeIndex],
          ),
        );
        print(getTaskTypeList()[_currentTaskTypeIndex].taskTypeTitle);
        Navigator.pop(context);
      },
      child: Text('Add Task'),
    );
  }

  ElevatedButton getChooseTaskTimeButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: myGreen,
        minimumSize: Size(200.0, 60.0),
      ),
      onPressed: () {
        Navigator.of(context).push(
          _showTimePicker(context),
        );
      },
      child: Text(
        'Choose Task Time',
      ),
    );
  }

  PageRouteBuilder<dynamic> _showTimePicker(BuildContext context) {
    return showPicker(
      buttonsSpacing: 120,
      displayHeader: true,
      focusMinutePicker: false,
      accentColor: myGreen,
      borderRadius: 20,
      blurredBackground: true,
      cancelText: 'Back',
      okText: 'Save',
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
      value: Time(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute),
      onChange: (p0) {
        taskHour = p0.hour;
        taskMinute = p0.minute;
      },
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
      focusNode: labelText == 'Task Title'
          ? taskTitleFocusNode
          : taskSubTitleFocusNode,
      autofocus: false,
      keyboardType: inputType,
      cursorColor: myWhite,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      maxLines: labelText == 'Task Title' ? 1 : 2,
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
          color: labelText == 'Task Title'
              ? (taskTitleFocusNode.hasFocus ? myGreen : myWhite)
              : (taskSubTitleFocusNode.hasFocus ? myGreen : myWhite),
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
}
