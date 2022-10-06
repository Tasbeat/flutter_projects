import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/data/models/task.dart';
import 'package:note_app/pages/add_task_page.dart';
import 'package:note_app/pages/home_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('testBox');
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('taskBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SM'),
      debugShowCheckedModeBanner: false,
      home: AddTaskPage(),
    );
  }
}
