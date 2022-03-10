part of 'new_history_bloc.dart';

@immutable
abstract class NewHistoryState {}

class NewHistoryInitial extends NewHistoryState {}

class NewHistoryLoading extends NewHistoryState {}

class NewHistorySuccess extends NewHistoryState {
  final List<NewHistoryModel> list;

  NewHistorySuccess({required this.list});
}

class NewHistoryFailure extends NewHistoryState {
  final String message;

  NewHistoryFailure({required this.message});
}
