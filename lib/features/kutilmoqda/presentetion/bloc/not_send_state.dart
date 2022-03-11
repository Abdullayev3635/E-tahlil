part of 'not_send_bloc.dart';

@immutable
abstract class NotSendState {}

class NotSendInitial extends NotSendState {}

class NotSendLoading extends NotSendState {}

class NotSendFailure extends NotSendState {
  final String message;

  NotSendFailure({required this.message});
}

class NotSendSuccess extends NotSendState {
  final List<NotSendModel> list;

  NotSendSuccess({required this.list});
}
