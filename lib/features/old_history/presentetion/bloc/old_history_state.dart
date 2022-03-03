part of 'old_history_bloc.dart';

@immutable
abstract class OldHistoryState {}

class OldHistoryInitial extends OldHistoryState {}

class OldHistoryLoading extends OldHistoryState {}

class OldHistorySuccess extends OldHistoryState {
  final List<OldHistoryModel> list;

  OldHistorySuccess({required this.list});
}

class OldHistoryNoInternet extends OldHistoryState {}

class OldHistoryFailure extends OldHistoryState {
  final String message;

  OldHistoryFailure({required this.message});
}
