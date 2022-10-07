// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

import 'package:note_app/data/data.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../asset.dart';
import '../data/models/task.dart';

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
              _getTaskItemButton()
            ],
          ),
        )
      ],
    );
  }

  Padding _getTaskItemButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
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
          SizedBox(
            width: 10.0,
          ),
          Container(
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
                    '10:00',
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
      child: Image.asset(Asset.workout),
    );
  }
}
