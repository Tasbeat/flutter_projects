part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthRequest extends AuthEvent {
  final String username;
  final String password;

  AuthRequest(this.username, this.password);
}
