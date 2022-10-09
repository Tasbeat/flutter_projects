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
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Icon(Icons.delete, size: 50.0),
                        ),
                      ],
                    ),
                  ),
                  direction: DismissDirection.startToEnd,
                  confirmDismiss: (direction) {
                    return _showConfirmDialog(context, task);
                  },
                  onDismissed: (direction) {},
                  child: TaskWidget(task: task),
                );
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

  Future<bool?> _showConfirmDialog(BuildContext context, Task task) {
    return showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('مطمئنید؟'),
          content: const Text('آیا از پاک کردن تسک مطمئن هستید؟'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('خیر'),
            ),
            TextButton(
              onPressed: () {
                task.delete();
                Navigator.of(context).pop();
              },
              child: const Text('بله'),
            ),
          ],
        ),
      ),
    );
  }
}
