import 'package:bloc_sample/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitial) {
                  return Text('${state.initNumber}');
                }
                if (state is CounterNumUpdateInprogress) {
                  return Text('${state.updatedNumber}');
                }
                return Text('Error!');
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterIncrementPressed());
            },
            child: const Text(
              '+',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterDecrementPressed());
            },
            child: const Text(
              '-',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<CounterBloc>().add(CounterResetPressed());
            },
            child: const Text(
              'Reset',
            ),
          ),
        ],
      ),
    );
  }
}
