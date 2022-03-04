part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SendSMSEvent extends AuthEvent {
  final String sms;

  SendSMSEvent(this.sms);
}
