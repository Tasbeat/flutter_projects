// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/animation.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {
  final Color color;
  HomeInitial({
    required this.color,
  });
}

class HomeRePaintInprogress extends HomeState {
  final Color color;
  HomeRePaintInprogress({
    required this.color,
  });
}
