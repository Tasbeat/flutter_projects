import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/asset.dart';
import 'package:note_app/navigator.dart';
import 'package:note_app/pages/add_task_page.dart';
import 'package:note_app/widgets/widgets.dart';
import '../data/data.dart';
import '../data/models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFabVisible = true;
  var taskBox = Hive.box<Task>('taskBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myWhite,
      body: ValueListenableBuilder(
        valueListenable: taskBox.listenable(),
        builder: (context, value, child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              setState(() {
                if (notification.direction == ScrollDirection.forward) {
                  isFabVisible = true;
                } else if (notification.direction == ScrollDirection.reverse) {
                  isFabVisible = false;
                }
              });
              return true;
            },
            child: ListView.builder(
              itemBuilder: (context, index) {
                var task = taskBox.values.toList()[index];
                return TaskWidget(task: task);
              },
              itemCount: taskBox.values.length,
            ),
          );
        },
      ),
      floatingActionButton: Visibility(
        visible: isFabVisible,
        child: FloatingActionButton(
          backgroundColor: myGreen,
          child: Image.asset(Asset.iconAdd),
          onPressed: (() => navigator(
                context: context,
                destinationPage: AddTaskPage(),
                isPush: true,
              )),
        ),
      ),
    );
  }
}
