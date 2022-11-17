import 'package:bloc_sample/bloc/counter_bloc.dart';
import 'package:bloc_sample/bloc/home_bloc.dart';
import 'package:bloc_sample/ui/pages/counter_page.dart';
import 'package:bloc_sample/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const CounterPage(),
      ),
    );
  }
}
