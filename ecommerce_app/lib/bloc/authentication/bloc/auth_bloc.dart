import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:ecommerce_app/data/repository/authentication_repository.dart';
import 'package:ecommerce_app/di/di.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = locator.get();
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthRequest) {
        emit(AuthResponseInProgres());
        var response =
            await _authRepository.login(event.username, event.password);
        emit(AuthResponseSuccess(response: response));
      }
    });
  }
}
