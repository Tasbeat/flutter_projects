import 'package:bloc_sample/bloc/home_bloc.dart';
import 'package:bloc_sample/bloc/home_event.dart';
import 'package:bloc_sample/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          return getScaffold(context, state.color);
        }
        if (state is HomeRePaintInprogress) {
          return getScaffold(context, state.color);
        }
        return Container();
      },
    );
  }

  Scaffold getScaffold(BuildContext context, Color scaffoldBackgroundColor) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<HomeBloc>().add(
                      HomeChangeColorEvent(),
                    );
              },
              child: const Text(
                'Click me to change color!',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
