// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthResponseInProgress extends AuthState {}

class AuthResponseSuccess extends AuthState {
  final Either<String, String> response;
  AuthResponseSuccess({
    required this.response,
  });
}
