part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthNoInternet extends AuthState {}

class AuthError extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess(this.message);
}
