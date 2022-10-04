import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var box = Hive.box('testBox');
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => box.put(1, 'Ali'),
                child: Text('Create'),
              ),
              ElevatedButton(
                onPressed: () {
                  var name = box.get(1);
                  print(name);
                },
                child: Text('Read'),
              ),
              ElevatedButton(
                onPressed: () {
                  box.put(1, 'hello');
                },
                child: Text('Update'),
              ),
              ElevatedButton(
                onPressed: () {
                  box.delete(1);
                },
                child: Text('Delete'),
              ),
              TextField(
                controller: _controller,
              ),
              Text(box.get(2) ?? 'empty'),
              ElevatedButton(
                onPressed: () {
                  box.put(2, _controller.text);
                  setState(() {});
                },
                child: Text('Read From Text Field'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
