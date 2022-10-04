import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/models/car.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var box = Hive.box('testBox');
  var carBox = Hive.box<Car>('carBox');
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () =>
                    carBox.put(2, Car(name: 'benz', model: 2020, price: 10000)),
                child: const Text('Create'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (carBox.get(2) == null) return;

                  var name = carBox.get(2)!.name;
                  print(name);
                },
                child: const Text('Read'),
              ),
              ElevatedButton(
                onPressed: () {
                  carBox.get(2)!.name = 'bmw';
                },
                child: const Text('Update'),
              ),
              ElevatedButton(
                onPressed: () {
                  carBox.delete(2);
                },
                child: const Text('Delete'),
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
                child: const Text('Read From Text Field'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
