import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/widgets/widgets.dart';
import '../data/data.dart';
import '../data/models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var taskBox = Hive.box<Task>('taskBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myWhite,
      body: ListView.builder(
        itemBuilder: (context, index) {
          var task = taskBox.values.toList()[index];
          return TaskWidget(task: task);
        },
        itemCount: taskBox.values.length,
      ),
    );
  }
}
