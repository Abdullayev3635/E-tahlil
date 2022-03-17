part of 'not_send_bloc.dart';

@immutable
abstract class NotSendEvent {}

class GetNotSendEvent extends NotSendEvent {}

class SetNotSendEvent extends NotSendEvent {
  final NotSendModel notSendModel;

  SetNotSendEvent({required this.notSendModel});
}
