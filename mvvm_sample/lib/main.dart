import 'package:flutter/material.dart';
import 'package:mvvm_sample/DI/service_locator.dart';
import 'package:mvvm_sample/views/home_page.dart';

void main() {
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
