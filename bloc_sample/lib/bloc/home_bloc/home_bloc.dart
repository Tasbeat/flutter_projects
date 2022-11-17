import 'dart:math';

import 'package:bloc_sample/bloc/home_bloc/home_event.dart';
import 'package:bloc_sample/bloc/home_bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(color: Colors.red)) {
    on<HomeChangeColorEvent>((event, emit) {
      emit(HomeRePaintInprogress(color: Color(Random().nextInt(0xffffffff))));
    });
  }
}
