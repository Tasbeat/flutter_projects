import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/pages/home_page.dart';

import 'data/models/car.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('testBox');
  Hive.registerAdapter(CarAdapter());
  await Hive.openBox<Car>('carBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
