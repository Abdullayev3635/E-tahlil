part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class SendLoginEvent extends LoginEvent {
  final String tel;

  SendLoginEvent(this.tel);
}
