part of 'new_history_bloc.dart';

@immutable
abstract class NewHistoryEvent {}

class GetNewHistoryEvent extends NewHistoryEvent {
  final int userId;

  GetNewHistoryEvent({required this.userId});
}
