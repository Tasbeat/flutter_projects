// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {
  final int initNumber;
  CounterInitial({
    required this.initNumber,
  });
}

class CounterNumUpdateInprogress extends CounterState {
  final int updatedNumber;
  CounterNumUpdateInprogress({
    required this.updatedNumber,
  });
}
