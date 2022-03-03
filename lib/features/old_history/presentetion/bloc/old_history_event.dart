part of 'old_history_bloc.dart';

@immutable
abstract class OldHistoryEvent {}

class GetOldHistoryEvent extends OldHistoryEvent {
  final int userId;

  GetOldHistoryEvent({required this.userId});
}
